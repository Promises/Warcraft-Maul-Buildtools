import { Trigger } from '../../JassOverrides/Trigger';
import { DamageEngineGlobals } from './DamageEngineGlobals';
import { AttackActionTower } from '../Entity/Tower/Specs/AttackActionTower';
import { DamageModificationBuff } from '../Entity/Buff/Specs/DamageModificationBuff';
import { AttackActionBuff } from '../Entity/Buff/Specs/AttackActionBuff';
import * as settings from '../GlobalSettings';
import { InitialDamageModificationTower } from '../Entity/Tower/Specs/InitialDamageModificationTower';
import { FinalDamageModificationCreepAbility } from '../Entity/CreepAbilities/specs/FinalDamageModificationCreepAbility';
import { AttackActionCreepAbility } from '../Entity/CreepAbilities/specs/AttackActionCreepAbility';
import { Log } from '../../lib/Serilog/Serilog';
import { KillingActionTower } from '../Entity/Tower/Specs/KillingActionTower';

/**
 * Damage Engine 5.3.0.1
 */
export class DamageEngine {
    /**
     * Damage Event Arrays
     */
    private initialDamageEvent: (() => void)[] = [];
    public initialDamageEventTowers: Map<number, AttackActionTower> = new Map<number, AttackActionTower>();
    public initialDamageModificationEventTowers: Map<number, InitialDamageModificationTower> =
        new Map<number, InitialDamageModificationTower>();
    public initialDamageEventBuffs: AttackActionBuff[] = [];
    public initialDamageEventAbilities: AttackActionAbility[] = [];
    public initialDamageEventCreepAbilities: AttackActionCreepAbility[] = [];
    public multiplicativeDamageModificationEventBuff: DamageModificationBuff[] = [];

    private zeroDamageEvent: (() => void)[] = [];
    private damageEventAOEActions: (() => void)[] = [];
    private damageEventLethalActions: (() => void)[] = [];
    private initialDamageModificationEvent: (() => void)[] = [];
    private multiplicativeDamageModificationEvent: (() => void)[] = [];
    private preFinalDamageModificationEvent: (() => void)[] = [];
    private finalDamageModificationEvent: (() => void)[] = [];
    private finalDamageModificationCreepAbilities: FinalDamageModificationCreepAbility[] = [];
    private afterDamageEvent: (() => void)[] = [];

    /**
     * Damage Engine Variables
     */
    private started: boolean = false;
    private finished: boolean = false;
    private recursion: number = -1;
    private recursive: boolean = false;
    private purge: boolean = false;
    private preDamage: boolean = false;
    private holdClear: boolean = false;
    private ticker: timer = CreateTimer();
    private trig: Trigger = new Trigger();
    private otrg: Trigger = new Trigger();

    private previousAmount: number = 0.00;  // Added to track the original modified damage pre-spirit Link
    private previousValue: number = 0.00;   // Added to track the original pure damage amount of Spirit Link
    private previousType: number = 0;       // Track the type
    private previousCode: boolean = false;  // Was it caused by a trigger/script?
    private previousPierce: number = 0.00;
    private armorType: number = 0;
    private previousArmor: number = 0;
    private prevPreArmor: number = 0;
    private defenseType: number = 0;
    private previousDefense: number = 0;
    private prevPreDefense: number = 0;

    private lastSource: unit[] = [];
    private lastTarget: unit[] = [];
    private lastAmount: number[] = [];
    private lastAttackT: attacktype[] = [];
    private lastDamageT: damagetype[] = [];
    private lastWeaponT: weapontype[] = [];
    private lastTrig: trigger[] = [];
    private lastType: number[] = [];

    private damageEngineGlobals: DamageEngineGlobals;

    constructor(damageEngineGlobals: DamageEngineGlobals) {
        this.damageEngineGlobals = damageEngineGlobals;
        this.otrg.registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_DAMAGED);
        this.otrg.addFilterFuncCondition(Filter(() => this.OnDamage()));

        this.trig.registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_DAMAGING);
        this.trig.addFilterFuncCondition(Filter(() => this.OnPreDamage()));
    }

    /**
     * Adds an event that triggers right before a unit takes damage
     *  - Do not change the damage in any way during these events!
     */
    public AddInitialDamageEvent(event: () => void): void {
        this.initialDamageEvent.push(event);
    }

    /**
     * Adds an event that triggers right before a unit takes damage
     *  - Do not change the damage in any way during these events!
     */
    public AddInitialDamageEventTower(handleId: number, tower: AttackActionTower): void {
        this.initialDamageEventTowers.set(handleId, tower);
    }

    public AddInitialDamageEventBuff(buff: AttackActionBuff): void {
        this.initialDamageEventBuffs.push(buff);
    }

    public AddInitialDamageEventAbility(ability: AttackActionAbility): void {
        this.initialDamageEventAbilities.push(ability);
    }

    public AddInitialDamageEventCreepAbility(ability: AttackActionCreepAbility): void {
        this.initialDamageEventCreepAbilities.push(ability);
    }

    /**
     * Adds an event that triggers right after a unit has taken 0 damage
     */
    public AddZeroDamageEvent(event: () => void): void {
        this.zeroDamageEvent.push(event);
    }

    /**
     * Add an event that adds or subtracts damage before it has been applied
     */
    public AddInitialDamageModificationEvent(event: () => void): void {
        this.initialDamageModificationEvent.push(event);
    }

    public AddInitialDamageModificationEventTower(handleId: number, tower: InitialDamageModificationTower): void {
        this.initialDamageModificationEventTowers.set(handleId, tower);

    }

    /**
     * Add an event that multiplies or subtracts damage before it has been applied
     */
    public AddMultiplicativeDamageModificationEvent(event: () => void): void {
        this.multiplicativeDamageModificationEvent.push(event);
    }

    public AddMultiplicativeDamageModificationEventBuff(buff: DamageModificationBuff): void {
        this.multiplicativeDamageModificationEventBuff.push(buff);
    }

    /**
     * Adds an event that triggers right before armor and resistance has been factored in
     */
    public AddPreFinalDamageModificationEvent(event: () => void): void {
        this.preFinalDamageModificationEvent.push(event);
    }

    /**
     * Adds an event that triggers right before a unit takes lethal damage
     */
    public AddLethalDamageEvent(event: () => void): void {
        this.damageEventLethalActions.push(event);
    }

    /**
     * Adds an event that triggers immediately once more than 1 unit has taken
     * damage from the same source
     */
    public AddAOEDamageEvent(event: () => void): void {
        this.damageEventAOEActions.push(event);
    }

    /**
     * Adds an event that triggers after all other damage modifiers
     * have been factored in (even armor and resistance)
     */
    public AddFinalDamageModificationEvent(event: () => void): void {
        this.finalDamageModificationEvent.push(event);
    }

    public AddFinalDamageModificationCreepAbility(ObjectExtendsAbility: FinalDamageModificationCreepAbility): void {
        this.finalDamageModificationCreepAbilities.push(ObjectExtendsAbility);
    }

    /**
     * Adds an event that triggers after damage has been applied
     * to the target
     */
    public AddAfterDamageEvent(event: () => void): void {
        this.afterDamageEvent.push(event);
    }

    private InitialDamageEvent(): void {
        // this.initialDamageEvent.forEach(action => action());
        if (this.damageEngineGlobals.udg_DamageEventSource) {
            const handleId: number = GetHandleId(this.damageEngineGlobals.udg_DamageEventSource);
            const damagingUnit: AttackActionTower | undefined = this.initialDamageEventTowers.get(handleId);
            if (damagingUnit) {
                damagingUnit.AttackAction();
            }

        }
        // this.initialDamageEventTowers.forEach(tower => tower.AttackAction());

        this.initialDamageEventBuffs.forEach(buff => buff.AttackAction());

        this.initialDamageEventAbilities.forEach(ability => ability.AttackAction());

        this.initialDamageEventCreepAbilities.forEach(ability => ability.AttackAction());
    }

    private ZeroDamageEvent(): void {
        this.zeroDamageEvent.forEach(action => action());
    }

    private DamageEventAOE(): void {
        this.damageEventAOEActions.forEach(action => action());
    }

    private DamageEventLethal(): void {
        this.damageEventLethalActions.forEach(action => action());
    }

    private InitialDamageModificationEvent(): void {

        if (this.damageEngineGlobals.udg_DamageEventSource) {
            const handleId: number = GetHandleId(this.damageEngineGlobals.udg_DamageEventSource);
            const damagingUnit: InitialDamageModificationTower | undefined = this.initialDamageModificationEventTowers.get(handleId);
            if (damagingUnit) {
                damagingUnit.InitialDamageModification();
            }

        }

        // this.initialDamageModificationEvent.forEach(action => action());
    }

    private MultiplicativeDamageModificationEvent(): void {
        this.multiplicativeDamageModificationEvent.forEach(action => action());
        this.multiplicativeDamageModificationEventBuff.forEach(buff => buff.ModifyDamage());
    }

    private PreFinalDamageModificationEvent(): void {
        this.preFinalDamageModificationEvent.forEach(action => action());
    }

    private FinalDamageModificationEvent(): void {
        this.finalDamageModificationEvent.forEach(action => action());
        this.finalDamageModificationCreepAbilities.forEach(ability => ability.ModifyFinalDamage());
    }

    private AfterDamageEvent(): void {
        this.afterDamageEvent.forEach(action => action());
    }

    private Error(): void {
        let s: string = 'WARNING: Recursion error when dealing damage! ';
        s += 'Prior to dealing damage from within a DamageEvent response trigger, do this:\n';
        s += 'Set DamageEventTrigger = (This Trigger)\n';
        s += 'Unit - Cause <Source> to damage <Target>...\n\n';
        s += 'Alternatively, just use the UNKNOWN damage type. It will skip recursive damage on its own without needing the "Set" line:/n';
        s += 'Unit - Cause <Source> to damage <Target>, dealing <Amount> damage of attack type <Attack Type> and damage type Unknown';

        ClearTextMessages();
        Log.Fatal(s);
        // DisplayTimedTextToPlayer(GetLocalPlayer(), 0.00, 0.00, 999.00, s);
    }

    private OnAOEEnd(): void {
        if (this.damageEngineGlobals.udg_DamageEventAOE > 1) {
            this.DamageEventAOE();
            this.damageEngineGlobals.udg_DamageEventAOE = 1;
        }

        this.damageEngineGlobals.udg_DamageEventLevel = 1;
        this.damageEngineGlobals.udg_EnhancedDamageTarget = undefined;
        this.damageEngineGlobals.udg_AOEDamageSource = undefined;
        GroupClear(<group>this.damageEngineGlobals.udg_DamageEventAOEGroup);
    }

    private Finish(): void {
        let i: number = -1;
        if (this.finished) {
            this.finished = false;
            if (this.damageEngineGlobals.udg_DamageEventPrevAmt !== 0.00
                && this.damageEngineGlobals.udg_DamageEventDamageT !== settings.DAMAGE_TYPE_UNKNOWN) {
                this.recursive = true;
                this.AfterDamageEvent();
                this.recursive = false;
            }

            if (this.recursion > -1 && !this.holdClear && !this.purge) {
                this.purge = true;
                for (; i >= this.recursion;) {
                    i = i + 1;

                    this.damageEngineGlobals.udg_NextDamageType = this.lastType[i];
                    if (this.lastTrig[i] !== undefined) {
                        DisableTrigger(this.lastTrig[i]);
                    }

                    UnitDamageTarget(this.lastSource[i], this.lastTarget[i], this.lastAmount[i],
                                     true, false, this.lastAttackT[i], this.lastDamageT[i], this.lastWeaponT[i]);
                    this.Finish();
                }
                for (; i <= -1; i--) {
                    if (this.lastTrig[i] !== undefined) {
                        EnableTrigger(this.lastTrig[i]);
                    }
                }

                this.recursion = -1;
                this.purge = false;
            }
        }
    }

    private OnExpire(): void {
        this.started = false;
        this.Finish();
        this.OnAOEEnd();
    }

    private CalibrateMR(): void {
        this.damageEngineGlobals.udg_IsDamageMelee = false;
        this.damageEngineGlobals.udg_IsDamageRanged = false;
        this.damageEngineGlobals.udg_IsDamageSpell = this.damageEngineGlobals.udg_DamageEventAttackT === 0;
        if (this.damageEngineGlobals.udg_DamageEventDamageT === settings.DAMAGE_TYPE_NORMAL &&
            !this.damageEngineGlobals.udg_IsDamageSpell) {
            this.damageEngineGlobals.udg_IsDamageMelee = IsUnitType(
                <unit>this.damageEngineGlobals.udg_DamageEventSource, UNIT_TYPE_MELEE_ATTACKER);
            this.damageEngineGlobals.udg_IsDamageRanged = IsUnitType(
                <unit>this.damageEngineGlobals.udg_DamageEventSource, UNIT_TYPE_RANGED_ATTACKER);
            if (this.damageEngineGlobals.udg_IsDamageMelee && this.damageEngineGlobals.udg_IsDamageRanged) {
                this.damageEngineGlobals.udg_IsDamageMelee = this.damageEngineGlobals.udg_DamageEventWeaponT > 0;
                this.damageEngineGlobals.udg_IsDamageRanged = !this.damageEngineGlobals.udg_IsDamageMelee;
            }
        }
    }

    private OnPreDamage(): boolean {
        const src: unit = GetEventDamageSource();
        const tgt: unit = BlzGetEventDamageTarget();
        const amt: number = GetEventDamage();
        const at: attacktype = BlzGetEventAttackType();
        const dt: damagetype = BlzGetEventDamageType();
        const wt: weapontype = BlzGetEventWeaponType();
        this.Finish();
        if (this.damageEngineGlobals.udg_NextDamageType === 0 &&
            (this.damageEngineGlobals.udg_DamageEventTrigger !== undefined || this.recursive)) {
            this.damageEngineGlobals.udg_NextDamageType = this.damageEngineGlobals.udg_DamageTypeCode;
        }

        if (this.recursive) {
            if (amt !== 0.00) {
                if (this.recursion < 512) {
                    this.recursion = this.recursion + 1;

                    this.lastAmount[this.recursion] = amt;
                    this.lastSource[this.recursion] = src;
                    this.lastTarget[this.recursion] = tgt;
                    this.lastAttackT[this.recursion] = at;
                    this.lastDamageT[this.recursion] = dt;
                    this.lastWeaponT[this.recursion] = wt;
                    this.lastTrig[this.recursion] = <trigger>this.damageEngineGlobals.udg_DamageEventTrigger;
                    this.lastType[this.recursion] = this.damageEngineGlobals.udg_NextDamageType;
                } else {
                    this.Error();
                }
            }
            this.damageEngineGlobals.udg_NextDamageType = 0;
            this.damageEngineGlobals.udg_DamageEventTrigger = undefined;
            BlzSetEventDamage(0.00);
        } else {
            if (!this.purge) {
                if (this.started) {
                    if (src !== this.damageEngineGlobals.udg_AOEDamageSource) {
                        this.OnAOEEnd();
                        this.damageEngineGlobals.udg_AOEDamageSource = src;
                    } else if (tgt === this.damageEngineGlobals.udg_EnhancedDamageTarget) {
                        this.damageEngineGlobals.udg_DamageEventLevel = this.damageEngineGlobals.udg_DamageEventLevel + 1;
                    } else if (!IsUnitInGroup(tgt, <group>this.damageEngineGlobals.udg_DamageEventAOEGroup)) {
                        this.damageEngineGlobals.udg_DamageEventAOE = this.damageEngineGlobals.udg_DamageEventAOE + 1;
                    }

                    if (this.preDamage) {
                        this.preDamage = false;
                        this.previousAmount = this.damageEngineGlobals.udg_DamageEventAmount;
                        this.previousValue = this.damageEngineGlobals.udg_DamageEventPrevAmt;
                        this.previousType = this.damageEngineGlobals.udg_DamageEventType;
                        this.previousCode = this.damageEngineGlobals.udg_IsDamageCode;
                        this.previousArmor = this.armorType;
                        this.previousDefense = this.damageEngineGlobals.udg_DamageEventDefenseT;
                        this.prevPreDefense = this.defenseType;
                        this.previousPierce = this.damageEngineGlobals.udg_DamageEventArmorPierced;
                        this.holdClear = true;
                    }
                } else {
                    TimerStart(this.ticker, 0.00, false, () => this.OnExpire());
                    this.started = true;
                    this.damageEngineGlobals.udg_AOEDamageSource = src;
                    this.damageEngineGlobals.udg_EnhancedDamageTarget = tgt;
                }

                GroupAddUnit(<group>this.damageEngineGlobals.udg_DamageEventAOEGroup, tgt);
            }
            this.damageEngineGlobals.udg_DamageEventType = this.damageEngineGlobals.udg_NextDamageType;
            if (this.damageEngineGlobals.udg_NextDamageType !== 0) {
                this.damageEngineGlobals.udg_DamageEventType = this.damageEngineGlobals.udg_NextDamageType;
                this.damageEngineGlobals.udg_NextDamageType = 0;
                this.damageEngineGlobals.udg_IsDamageCode = true;
                this.damageEngineGlobals.udg_DamageEventTrigger = undefined;
            }
            this.damageEngineGlobals.udg_DamageEventOverride = dt === undefined ||
                amt === 0.00 || this.damageEngineGlobals.udg_DamageEventType * this.damageEngineGlobals.udg_DamageEventType === 4;
            this.damageEngineGlobals.udg_DamageEventPrevAmt = amt;
            this.damageEngineGlobals.udg_DamageEventSource = src;
            this.damageEngineGlobals.udg_DamageEventTarget = tgt;
            this.damageEngineGlobals.udg_DamageEventAmount = amt;
            this.damageEngineGlobals.udg_DamageEventAttackT = GetHandleId(at);
            this.damageEngineGlobals.udg_DamageEventDamageT = GetHandleId(dt);
            this.damageEngineGlobals.udg_DamageEventWeaponT = GetHandleId(wt);
            this.CalibrateMR();
            this.damageEngineGlobals.udg_DamageEventArmorT = BlzGetUnitIntegerField(this.damageEngineGlobals.udg_DamageEventTarget,
                                                                                    UNIT_IF_ARMOR_TYPE);
            this.damageEngineGlobals.udg_DamageEventDefenseT = BlzGetUnitIntegerField(this.damageEngineGlobals.udg_DamageEventTarget,
                                                                                      UNIT_IF_DEFENSE_TYPE);
            this.armorType = this.damageEngineGlobals.udg_DamageEventArmorT;
            this.defenseType = this.damageEngineGlobals.udg_DamageEventDefenseT;
            this.damageEngineGlobals.udg_DamageEventArmorPierced = 0.00;
            if (!this.damageEngineGlobals.udg_DamageEventOverride) {
                this.recursive = true;
                this.InitialDamageModificationEvent(); // udg_DamageModifierEvent 1.00
                this.damageEngineGlobals.udg_DamageEventOverride = this.damageEngineGlobals.udg_DamageEventOverride ||
                    this.damageEngineGlobals.udg_DamageEventType * this.damageEngineGlobals.udg_DamageEventType === 4;
                if (!this.damageEngineGlobals.udg_DamageEventOverride) {
                    this.MultiplicativeDamageModificationEvent();
                    this.PreFinalDamageModificationEvent();
                }
                this.recursive = false;

                BlzSetEventAttackType(ConvertAttackType(this.damageEngineGlobals.udg_DamageEventAttackT));
                BlzSetEventDamageType(ConvertDamageType(this.damageEngineGlobals.udg_DamageEventDamageT));
                BlzSetEventWeaponType(ConvertWeaponType(this.damageEngineGlobals.udg_DamageEventWeaponT));
                if (this.damageEngineGlobals.udg_DamageEventArmorPierced !== 0.00) {
                    BlzSetUnitArmor(this.damageEngineGlobals.udg_DamageEventTarget,
                                    BlzGetUnitArmor(this.damageEngineGlobals.udg_DamageEventTarget) -
                                        this.damageEngineGlobals.udg_DamageEventArmorPierced);
                }
                if (this.armorType !== this.damageEngineGlobals.udg_DamageEventArmorT) {
                    BlzSetUnitIntegerField(this.damageEngineGlobals.udg_DamageEventTarget,
                                           UNIT_IF_ARMOR_TYPE, this.damageEngineGlobals.udg_DamageEventArmorT);
                }
                if (this.defenseType !== this.damageEngineGlobals.udg_DamageEventDefenseT) {
                    BlzSetUnitIntegerField(this.damageEngineGlobals.udg_DamageEventTarget,
                                           UNIT_IF_DEFENSE_TYPE, this.damageEngineGlobals.udg_DamageEventDefenseT);
                }

                BlzSetEventDamage(this.damageEngineGlobals.udg_DamageEventAmount);
            }

            this.preDamage = true;
        }

        return false;
    }

    private OnDamage(): boolean {
        if (this.recursive) {
            return false;
        }


        if (this.preDamage) {
            this.preDamage = false;
        } else {
            this.Finish();
            this.holdClear = false;
            this.damageEngineGlobals.udg_DamageEventAmount = this.previousAmount;
            this.damageEngineGlobals.udg_DamageEventPrevAmt = this.previousValue;
            this.damageEngineGlobals.udg_DamageEventType = this.previousType;
            this.damageEngineGlobals.udg_IsDamageCode = this.previousCode;
            this.damageEngineGlobals.udg_DamageEventSource = GetEventDamageSource();
            this.damageEngineGlobals.udg_DamageEventTarget = BlzGetEventDamageTarget();
            this.damageEngineGlobals.udg_DamageEventAttackT = GetHandleId(BlzGetEventAttackType());
            this.damageEngineGlobals.udg_DamageEventDamageT = GetHandleId(BlzGetEventDamageType());
            this.damageEngineGlobals.udg_DamageEventWeaponT = GetHandleId(BlzGetEventWeaponType());
            this.damageEngineGlobals.udg_DamageEventArmorT = this.previousArmor;
            this.damageEngineGlobals.udg_DamageEventDefenseT = this.previousDefense;
            this.damageEngineGlobals.udg_DamageEventArmorPierced = this.previousPierce;
            this.armorType = this.prevPreArmor;
            this.defenseType = this.prevPreDefense;
            this.CalibrateMR();
        }

        if (this.damageEngineGlobals.udg_DamageEventArmorPierced !== 0.00) {
            BlzSetUnitArmor(<unit>this.damageEngineGlobals.udg_DamageEventTarget,
                            BlzGetUnitArmor(<unit>this.damageEngineGlobals.udg_DamageEventTarget) +
                                this.damageEngineGlobals.udg_DamageEventArmorPierced);
        }

        if (this.armorType !== this.damageEngineGlobals.udg_DamageEventArmorT) {
            BlzSetUnitIntegerField(<unit>this.damageEngineGlobals.udg_DamageEventTarget, UNIT_IF_ARMOR_TYPE, this.armorType);
        }

        if (this.defenseType !== this.damageEngineGlobals.udg_DamageEventDefenseT) {
            BlzSetUnitIntegerField(<unit>this.damageEngineGlobals.udg_DamageEventTarget, UNIT_IF_DEFENSE_TYPE, this.defenseType);
        }

        let r: number = GetEventDamage();
        this.recursive = true;
        if (this.damageEngineGlobals.udg_DamageEventPrevAmt === 0.00) {
            this.ZeroDamageEvent();
        } else {
            if (this.damageEngineGlobals.udg_DamageEventAmount !== 0.00 && r !== 0.00) {
                this.damageEngineGlobals.udg_DamageScalingWC3 = r / this.damageEngineGlobals.udg_DamageEventAmount;
            } else if (this.damageEngineGlobals.udg_DamageEventAmount > 0.00) {
                this.damageEngineGlobals.udg_DamageScalingWC3 = 0.00;
            } else {
                this.damageEngineGlobals.udg_DamageScalingWC3 = 1.00;
            }
            r = this.damageEngineGlobals.udg_DamageEventAmount;
            this.damageEngineGlobals.udg_DamageScalingUser = r / this.damageEngineGlobals.udg_DamageEventPrevAmt;
            this.damageEngineGlobals.udg_DamageEventAmount = r * this.damageEngineGlobals.udg_DamageScalingWC3;

            if (this.damageEngineGlobals.udg_DamageEventAmount > 0.00) {
                this.FinalDamageModificationEvent(); // event 4.00

                this.damageEngineGlobals.udg_LethalDamageHP = GetWidgetLife(<unit>this.damageEngineGlobals.udg_DamageEventTarget) -
                    this.damageEngineGlobals.udg_DamageEventAmount;
                if (this.damageEngineGlobals.udg_LethalDamageHP <= 0.405) {
                    this.DamageEventLethal();

                    this.damageEngineGlobals.udg_DamageEventAmount = GetWidgetLife(<unit>this.damageEngineGlobals.udg_DamageEventTarget) -
                        this.damageEngineGlobals.udg_LethalDamageHP;
                    if (this.damageEngineGlobals.udg_DamageEventType < 0 && this.damageEngineGlobals.udg_LethalDamageHP <= 0.405) {
                        SetUnitExploded(<unit>this.damageEngineGlobals.udg_DamageEventTarget, true);
                    }
                }
                this.damageEngineGlobals.udg_DamageScalingUser = this.damageEngineGlobals.udg_DamageEventAmount /
                    (this.damageEngineGlobals.udg_DamageEventPrevAmt * this.damageEngineGlobals.udg_DamageScalingWC3);
            }
            BlzSetEventDamage(this.damageEngineGlobals.udg_DamageEventAmount);
            if (this.damageEngineGlobals.udg_DamageEventDamageT !== settings.DAMAGE_TYPE_UNKNOWN) {
                this.InitialDamageEvent(); // event 1.00
            }
        }

        this.recursive = false;
        this.finished = true;
        if (this.damageEngineGlobals.udg_DamageEventAmount <= 0.00) {
            this.Finish();
        }
        return false;
    }


}
