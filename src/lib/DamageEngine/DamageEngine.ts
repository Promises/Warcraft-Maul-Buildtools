import { DamageEngineGlobals } from './DamageEngineGlobals';
import { DamageEvent } from './DamageEvent';
import { Trigger } from '../../JassOverrides/Trigger';
import { Timer } from '../../JassOverrides/Timer';
import { TimerUtils } from '../TimerUtils';
import * as settings from '../../World/GlobalSettings';

interface Damage {
    type: number;
    source: unit;
    target: unit;
    amount: number;
    attack: attacktype;
    damage: damagetype;
    weapon: weapontype;
    trig: number;
}

interface Previous {
    type: number;
    amount: number;
    preAmt: number;
    pierce: number;
    armor: number;
    preArm: number;
    defense: number;
    preDef: number;
    code: boolean;
}

/**
 * Damage Engine 5.4.2.3
 */
export class DamageEngine {
    private static inception: boolean = false;

    /**
     * Damage Event Arrays
     */
    private initialDamageEvents: DamageEvent[] = [];
    private zeroDamageEvents: DamageEvent[] = [];
    private damageEventAOEEvents: DamageEvent[] = [];
    private damageEventLethalEvents: DamageEvent[] = [];
    private initialDamageModificationEvents: DamageEvent[] = [];
    private multiplicativeDamageModificationEvents: DamageEvent[] = [];
    private preFinalDamageModificationEvents: DamageEvent[] = [];
    private finalDamageModificationEvents: DamageEvent[] = [];
    private afterDamageEvents: DamageEvent[] = [];

    /**
     * Damage Engine Variables
     */
    private readonly alarm: Timer;
    private alarmSet: boolean = false;
    private canKick: boolean = true;
    private totem: boolean = false;
    private armorType: number = 0;
    private defenseType: number = 0;
    private eventsRun: boolean = false;
    private kicking: boolean = false;
    private eventTrig: number = 0;
    private dreaming: boolean = false;
    private sleepLevel: number = 0;

    private readonly stack: Damage[] = [];
    private readonly levelsDeep: number[] = [];
    private readonly trigFrozen: boolean[] = [];
    private readonly fischerMorrow: any = {}; // TODO: Should not be any!
    private readonly inceptionTrig: boolean[] = [];
    private readonly proclusGlobal: any = {}; // TODO: Should not be any!
    private readonly prev: Previous = {} as Previous;
    private readonly LIMBO: number = 16;
    private readonly t1: Trigger = new Trigger();
    private readonly t2: Trigger = new Trigger();
    private readonly timerUtils: TimerUtils;
    private readonly damageEngineGlobals: DamageEngineGlobals;

    constructor(timerUtils: TimerUtils, damageEngineGlobals: DamageEngineGlobals) {
        this.timerUtils = timerUtils;
        this.damageEngineGlobals = damageEngineGlobals;
        this.alarm = this.timerUtils.newTimer();

        this.t1.registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_DAMAGING);
        this.t1.addCondition(() => this.t1Condition());

        this.t2.registerAnyUnitEventBJ(EVENT_PLAYER_UNIT_DAMAGED);
        this.t2.addCondition(() => this.t2Condition());
    }

    /**
     * Adds an event that triggers right before a unit takes damage
     *  - Do not change the damage in any way during these events!
     */
    public addInitialDamageEvent(event: DamageEvent): void {
        this.initialDamageEvents.push(event);
    }

    /**
     * Adds an event that triggers right after a unit has taken 0 damage
     */
    public addZeroDamageEvent(event: DamageEvent): void {
        this.zeroDamageEvents.push(event);
    }

    /**
     * Add an event that adds or subtracts damage before it has been applied
     */
    public addInitialDamageModificationEvent(event: DamageEvent): void {
        this.initialDamageModificationEvents.push(event);
    }

    /**
     * Add an event that multiplies or subtracts damage before it has been applied
     */
    public addMultiplicativeDamageModificationEvent(event: DamageEvent): void {
        this.multiplicativeDamageModificationEvents.push(event);
    }

    /**
     * Adds an event that triggers right before armor and resistance has been factored in
     */
    public addPreFinalDamageModificationEvent(event: DamageEvent): void {
        this.preFinalDamageModificationEvents.push(event);
    }

    /**
     * Adds an event that triggers right before a unit takes lethal damage
     */
    public addLethalDamageEvent(event: DamageEvent): void {
        this.damageEventLethalEvents.push(event);
    }

    /**
     * Adds an event that triggers immediately once more than 1 unit has taken
     * damage from the same source
     */
    public addAOEDamageEvent(event: DamageEvent): void {
        this.damageEventAOEEvents.push(event);
    }

    /**
     * Adds an event that triggers after all other damage modifiers
     * have been factored in (even armor and resistance)
     */
    public addFinalDamageModificationEvent(event: DamageEvent): void {
        this.finalDamageModificationEvents.push(event);
    }

    /**
     * Adds an event that triggers after damage has been applied
     * to the target
     */
    public addAfterDamageEvent(event: DamageEvent): void {
        this.afterDamageEvents.push(event);
    }

    private initialDamageEvent(): void {
        this.initialDamageEvents.forEach((damageEvent) => damageEvent.event(this.damageEngineGlobals));
    }

    private zeroDamageEvent(): void {
        this.zeroDamageEvents.forEach((damageEvent) => damageEvent.event(this.damageEngineGlobals));
    }

    private damageEventAOE(): void {
        this.damageEventAOEEvents.forEach((damageEvent) => damageEvent.event(this.damageEngineGlobals));
    }

    private damageEventLethal(): void {
        this.damageEventLethalEvents.forEach((damageEvent) => damageEvent.event(this.damageEngineGlobals));
    }

    private initialDamageModificationEvent(): void {
        this.initialDamageModificationEvents.forEach((damageEvent) => damageEvent.event(this.damageEngineGlobals));
    }

    private multiplicativeDamageModificationEvent(): void {
        this.multiplicativeDamageModificationEvents.forEach((damageEvent) => damageEvent.event(this.damageEngineGlobals));
    }

    private preFinalDamageModificationEvent(): void {
        this.preFinalDamageModificationEvents.forEach((damageEvent) => damageEvent.event(this.damageEngineGlobals));
    }

    private finalDamageModificationEvent(): void {
        this.finalDamageModificationEvents.forEach((damageEvent) => damageEvent.event(this.damageEngineGlobals));
    }

    private afterDamageEvent(): void {
        this.afterDamageEvents.forEach((damageEvent) => damageEvent.event(this.damageEngineGlobals));
    }

    private onAOEEnd(): void {
        if (this.damageEngineGlobals.DamageEventAOE > 1) {
            this.damageEventAOE();
            this.damageEngineGlobals.DamageEventAOE = 1;
        }
        this.damageEngineGlobals.DamageEventLevel = 1;
        this.damageEngineGlobals.EnhancedDamageTarget = undefined;
        this.damageEngineGlobals.AOEDamageSource = undefined;
        GroupClear(this.damageEngineGlobals.DamageEventAOEGroup as group);
    }

    private afterDamage(): void {
        if (
            this.damageEngineGlobals.DamageEventPrevAmt !== 0.0 &&
            this.damageEngineGlobals.DamageEventDamageT !== settings.DAMAGE_TYPE_UNKNOWN
        ) {
            this.afterDamageEvent();
        }
    }

    private finish(): void {
        if (this.eventsRun) {
            this.eventsRun = false;
            this.afterDamage();
        }

        if (this.canKick && !this.kicking) {
            let n: number = this.stack.length;
            if (n > 0) {
                this.kicking = true;
                let i: number = 0;
                let open: any;
                do {
                    this.sleepLevel++;
                    do {
                        open = this.stack[i];
                        this.damageEngineGlobals.NextDamageType = open.type;
                        this.UnitDamageTarget(open.source, open.target, open.amount, true, false, open.attack, open.damage, open.weapon);
                        this.afterDamage();
                        i++;
                    } while (i === n);
                    n = this.stack.length;
                } while (i === n);

                this.sleepLevel = 0;

                do {
                    i--;
                    open = this.stack[i].trig;
                    this.stack.splice(i, 1);
                    this.proclusGlobal[open] = undefined;
                    this.fischerMorrow[open] = undefined;
                    this.trigFrozen[open] = false;
                    this.levelsDeep[open] = 0;
                } while (i === 0);
                this.kicking = false;
            }
        }
    }

    private UnitDamageTarget(
        src: unit,
        tgt: unit,
        amt: number,
        a: boolean,
        r: boolean,
        at: attacktype,
        dt: damagetype,
        wt: weapontype,
    ): boolean {
        if (this.damageEngineGlobals.NextDamageType === 0) {
            this.damageEngineGlobals.NextDamageType = settings.DamageTypeCode;
        }
        let b: boolean = false;
        if (this.dreaming) {
            if (amt !== 0.0) {
                this.stack.push({
                    type: this.damageEngineGlobals.NextDamageType,
                    source: src,
                    target: tgt,
                    amount: amt,
                    attack: at,
                    damage: dt,
                    weapon: wt,
                    trig: this.eventTrig,
                });

                DamageEngine.inception = DamageEngine.inception || this.inceptionTrig[this.eventTrig];

                let sg: any = this.proclusGlobal[this.eventTrig];
                if (!sg) {
                    sg = {};
                    this.proclusGlobal[this.eventTrig] = sg;
                }
                sg[GetHandleId(this.damageEngineGlobals.DamageEventSource as unit)] = true;

                let tg: any = this.fischerMorrow[this.eventTrig];
                if (!tg) {
                    tg = {};
                    this.fischerMorrow[this.eventTrig] = tg;
                }
                tg[GetHandleId(this.damageEngineGlobals.DamageEventTarget as unit)] = true;

                if (this.kicking && sg[GetHandleId(src)] && tg[GetHandleId(tgt)]) {
                    if (DamageEngine.inception && !this.trigFrozen[this.eventTrig]) {
                        this.inceptionTrig[this.eventTrig] = true;
                        if (this.levelsDeep[this.eventTrig] < this.sleepLevel) {
                            this.levelsDeep[this.eventTrig]++;
                            if (this.levelsDeep[this.eventTrig] >= this.LIMBO) {
                                this.trigFrozen[this.eventTrig] = true;
                            }
                        }
                    } else {
                        this.trigFrozen[this.eventTrig] = true;
                    }
                }
            }
        } else {
            b = this.UnitDamageTarget(src, tgt, amt, a, r, at, dt, wt);
        }

        DamageEngine.inception = false;
        this.damageEngineGlobals.NextDamageType = 0;
        if (b && !this.dreaming) {
            this.finish();
        }

        return b;
    }

    private t1Condition(): boolean {
        const src: unit = GetEventDamageSource();
        const tgt: unit = BlzGetEventDamageTarget();
        const amt: number = GetEventDamage();
        const at: attacktype = BlzGetEventAttackType();
        const dt: damagetype = BlzGetEventDamageType();
        const wt: weapontype = BlzGetEventWeaponType();

        if (!this.kicking) {
            if (this.alarmSet) {
                if (this.totem) {
                    if (dt !== DAMAGE_TYPE_SPIRIT_LINK && dt !== DAMAGE_TYPE_DEFENSIVE && dt !== DAMAGE_TYPE_PLANT) {
                        this.failsafeClear();
                    } else {
                        this.totem = false;
                        this.canKick = false;
                        this.prev.type = this.damageEngineGlobals.DamageEventType;
                        this.prev.amount = this.damageEngineGlobals.DamageEventAmount;
                        this.prev.preAmt = this.damageEngineGlobals.DamageEventPrevAmt;
                        this.prev.pierce = this.damageEngineGlobals.DamageEventArmorPierced;
                        this.prev.armor = this.damageEngineGlobals.DamageEventArmorT;
                        this.prev.preArm = this.armorType;
                        this.prev.defense = this.damageEngineGlobals.DamageEventDefenseT;
                        this.prev.preDef = this.defenseType;
                        this.prev.code = this.damageEngineGlobals.IsDamageCode;
                    }
                }
                if (src !== this.damageEngineGlobals.AOEDamageSource) {
                    this.onAOEEnd();
                } else if (tgt === this.damageEngineGlobals.EnhancedDamageTarget) {
                    this.damageEngineGlobals.DamageEventLevel++;
                } else if (!IsUnitInGroup(tgt, this.damageEngineGlobals.DamageEventAOEGroup as group)) {
                    this.damageEngineGlobals.DamageEventAOE++;
                }
            } else {
                this.alarm.start(0.0, false, () => {
                    this.alarmSet = false;
                    this.finish();
                    this.onAOEEnd();
                });
                this.alarmSet = true;
                this.damageEngineGlobals.AOEDamageSource = src;
                this.damageEngineGlobals.EnhancedDamageTarget = tgt;
            }
            GroupAddUnit(this.damageEngineGlobals.DamageEventAOEGroup as group, tgt);
        }
        this.damageEngineGlobals.DamageEventType = this.damageEngineGlobals.NextDamageType;
        this.damageEngineGlobals.IsDamageCode = this.damageEngineGlobals.NextDamageType !== 0;
        this.damageEngineGlobals.DamageEventOverride = dt === undefined;
        this.damageEngineGlobals.DamageEventPrevAmt = amt;
        this.damageEngineGlobals.DamageEventSource = src;
        this.damageEngineGlobals.DamageEventTarget = tgt;
        this.damageEngineGlobals.DamageEventAmount = amt;
        this.damageEngineGlobals.DamageEventAttackT = GetHandleId(at);
        this.damageEngineGlobals.DamageEventDamageT = GetHandleId(dt);
        this.damageEngineGlobals.DamageEventWeaponT = GetHandleId(wt);

        this.calibrateMR();

        this.damageEngineGlobals.DamageEventArmorT = BlzGetUnitIntegerField(
            this.damageEngineGlobals.DamageEventTarget as unit,
            UNIT_IF_ARMOR_TYPE,
        );
        this.damageEngineGlobals.DamageEventDefenseT = BlzGetUnitIntegerField(
            this.damageEngineGlobals.DamageEventTarget as unit,
            UNIT_IF_DEFENSE_TYPE,
        );
        this.armorType = this.damageEngineGlobals.DamageEventArmorT;
        this.defenseType = this.damageEngineGlobals.DamageEventDefenseT;
        this.damageEngineGlobals.DamageEventArmorPierced = 0.0;
        this.damageEngineGlobals.DamageScalingUser = 1.0;
        this.damageEngineGlobals.DamageScalingWC3 = 1.0;

        if (amt !== 0.0) {
            if (!this.damageEngineGlobals.DamageEventOverride) {
                this.initialDamageModificationEvent();
                this.multiplicativeDamageModificationEvent();
                this.preFinalDamageModificationEvent();

                BlzSetEventAttackType(ConvertAttackType(this.damageEngineGlobals.DamageEventAttackT));
                BlzSetEventDamageType(ConvertDamageType(this.damageEngineGlobals.DamageEventDamageT));
                BlzSetEventWeaponType(ConvertWeaponType(this.damageEngineGlobals.DamageEventWeaponT));
                if (this.damageEngineGlobals.DamageEventArmorPierced !== 0.0) {
                    BlzSetUnitArmor(
                        this.damageEngineGlobals.DamageEventTarget as unit,
                        BlzGetUnitArmor(this.damageEngineGlobals.DamageEventTarget as unit) -
                        this.damageEngineGlobals.DamageEventArmorPierced,
                    );
                }
                if (this.armorType !== this.damageEngineGlobals.DamageEventArmorT) {
                    BlzSetUnitIntegerField(
                        this.damageEngineGlobals.DamageEventTarget as unit,
                        UNIT_IF_ARMOR_TYPE,
                        this.damageEngineGlobals.DamageEventArmorT,
                    );
                }
                if (this.defenseType !== this.damageEngineGlobals.DamageEventDefenseT) {
                    BlzSetUnitIntegerField(
                        this.damageEngineGlobals.DamageEventTarget as unit,
                        UNIT_IF_DEFENSE_TYPE,
                        this.damageEngineGlobals.DamageEventDefenseT,
                    );
                }

                BlzSetEventDamage(this.damageEngineGlobals.DamageEventAmount);
            }

            this.totem = true;
        } else {
            this.zeroDamageEvent();
            this.canKick = true;
            this.finish();
        }

        return false;
    }

    private t2Condition(): boolean {
        if (this.damageEngineGlobals.DamageEventPrevAmt === 0.0) {
            return false;
        }

        if (this.totem) {
            this.totem = false;
        } else {
            this.afterDamage();
            this.canKick = true;

            this.damageEngineGlobals.DamageEventSource = GetEventDamageSource();
            this.damageEngineGlobals.DamageEventTarget = GetTriggerUnit();
            this.damageEngineGlobals.DamageEventAmount = this.prev.amount;
            this.damageEngineGlobals.DamageEventPrevAmt = this.prev.preAmt;
            this.damageEngineGlobals.DamageEventAttackT = GetHandleId(BlzGetEventAttackType());
            this.damageEngineGlobals.DamageEventDamageT = GetHandleId(BlzGetEventDamageType());
            this.damageEngineGlobals.DamageEventWeaponT = GetHandleId(BlzGetEventWeaponType());
            this.damageEngineGlobals.DamageEventType = this.prev.type;
            this.damageEngineGlobals.IsDamageCode = this.prev.code;
            this.damageEngineGlobals.DamageEventArmorT = this.prev.armor;
            this.damageEngineGlobals.DamageEventDefenseT = this.prev.defense;
            this.damageEngineGlobals.DamageEventArmorPierced = this.prev.pierce;
            this.armorType = this.prev.preArm;
            this.defenseType = this.prev.preDef;
            this.calibrateMR();
        }
        this.resetArmor();
        const r: number = GetEventDamage();
        if (this.damageEngineGlobals.DamageEventAmount !== 0.0 && r !== 0.0) {
            this.damageEngineGlobals.DamageScalingWC3 = r / this.damageEngineGlobals.DamageEventAmount;
        } else {
            if (this.damageEngineGlobals.DamageEventAmount > 0.0) {
                this.damageEngineGlobals.DamageScalingWC3 = 0.0;
            } else {
                this.damageEngineGlobals.DamageScalingWC3 = 1.0;
            }
            this.damageEngineGlobals.DamageScalingUser =
                this.damageEngineGlobals.DamageEventAmount / this.damageEngineGlobals.DamageEventPrevAmt;
        }
        this.damageEngineGlobals.DamageEventAmount = this.damageEngineGlobals.DamageEventAmount * this.damageEngineGlobals.DamageScalingWC3;

        if (this.damageEngineGlobals.DamageEventAmount > 0.0) {
            this.finalDamageModificationEvent();
            this.damageEngineGlobals.LethalDamageHP =
                GetWidgetLife(this.damageEngineGlobals.DamageEventTarget as unit) - this.damageEngineGlobals.DamageEventAmount;
            if (this.damageEngineGlobals.LethalDamageHP <= 0.405) {
                this.damageEventLethal();

                this.damageEngineGlobals.DamageEventAmount =
                    GetWidgetLife(this.damageEngineGlobals.DamageEventTarget as unit) - this.damageEngineGlobals.LethalDamageHP;
                if (this.damageEngineGlobals.DamageEventType < 0 && this.damageEngineGlobals.LethalDamageHP <= 0.405) {
                    SetUnitExploded(this.damageEngineGlobals.DamageEventTarget as unit, true);
                }
            }
            this.damageEngineGlobals.DamageScalingUser =
                this.damageEngineGlobals.DamageEventAmount /
                this.damageEngineGlobals.DamageEventPrevAmt /
                this.damageEngineGlobals.DamageScalingWC3;
        }
        BlzSetEventDamage(this.damageEngineGlobals.DamageEventAmount);
        if (this.damageEngineGlobals.DamageEventDamageT !== settings.DAMAGE_TYPE_UNKNOWN) {
            this.initialDamageEvent();
        }
        this.eventsRun = true;
        if (this.damageEngineGlobals.DamageEventAmount === 0.0) {
            this.finish();
        }
        return false;
    }

    private resetArmor(): void {
        if (this.damageEngineGlobals.DamageEventArmorPierced !== 0.0) {
            BlzSetUnitArmor(
                this.damageEngineGlobals.DamageEventTarget as unit,
                BlzGetUnitArmor(this.damageEngineGlobals.DamageEventTarget as unit) + this.damageEngineGlobals.DamageEventArmorPierced,
            );
        }
        if (this.armorType !== this.damageEngineGlobals.DamageEventArmorT) {
            BlzSetUnitIntegerField(this.damageEngineGlobals.DamageEventTarget as unit, UNIT_IF_ARMOR_TYPE, this.armorType);
        }
        if (this.defenseType !== this.damageEngineGlobals.DamageEventDefenseT) {
            BlzSetUnitIntegerField(this.damageEngineGlobals.DamageEventTarget as unit, UNIT_IF_DEFENSE_TYPE, this.defenseType);
        }
    }

    private failsafeClear(): void {
        this.resetArmor();
        this.canKick = true;
        this.totem = false;
        this.damageEngineGlobals.DamageEventAmount = 0.0;
        this.damageEngineGlobals.DamageScalingWC3 = 0.0;
        if (this.damageEngineGlobals.DamageEventDamageT !== settings.DAMAGE_TYPE_UNKNOWN) {
            this.initialDamageEvent();
            this.eventsRun = true;
        }
        this.finish();
    }

    private calibrateMR(): void {
        this.damageEngineGlobals.IsDamageMelee = false;
        this.damageEngineGlobals.IsDamageRanged = false;
        this.damageEngineGlobals.IsDamageSpell = this.damageEngineGlobals.DamageEventAttackT === 0;
        if (this.damageEngineGlobals.DamageEventDamageT === settings.DAMAGE_TYPE_NORMAL && !this.damageEngineGlobals.IsDamageSpell) {
            this.damageEngineGlobals.IsDamageMelee = IsUnitType(
                this.damageEngineGlobals.DamageEventSource as unit,
                UNIT_TYPE_MELEE_ATTACKER,
            );
            this.damageEngineGlobals.IsDamageRanged = IsUnitType(
                this.damageEngineGlobals.DamageEventSource as unit,
                UNIT_TYPE_RANGED_ATTACKER,
            );
            if (this.damageEngineGlobals.IsDamageMelee && this.damageEngineGlobals.IsDamageRanged) {
                this.damageEngineGlobals.IsDamageMelee = this.damageEngineGlobals.DamageEventWeaponT > 0;
                this.damageEngineGlobals.IsDamageRanged = !this.damageEngineGlobals.IsDamageMelee;
            }
        }
    }
}
