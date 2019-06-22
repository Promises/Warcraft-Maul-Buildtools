import { Trigger } from '../../JassOverrides/Trigger';
import { DamageEngineGlobals } from './DamageEngineGlobals';

export class DamageEngine {
    /**
     * Damage Event Arrays
     */
    private initialDamageEvent: (() => void)[] = [];
    private zeroDamageEvent: (() => void)[] = [];
    private damageEventAOEActions: (() => void)[] = [];
    private damageEventLethalActions: (() => void)[] = [];
    private initialDamageModificationEvent: (() => void)[] = [];
    private multiplicativeDamageModificationEvent: (() => void)[] = [];
    private preFinalDamageModificationEvent: (() => void)[] = [];
    private finalDamageModificationEvent: (() => void)[] = [];

    /**
     * Damage Engine Variables
     */
    private started: boolean = false;
    private paused: boolean = false;
    private recursion: number = -1;
    private recursive: boolean = false;
    private clearable: boolean = false;
    private purge: boolean = false;
    private cleaner: () => void = this.DoCleanup;
    private ticker: timer = CreateTimer();
    private trig: Trigger = new Trigger();
    private otrg: Trigger = new Trigger();

    private previousValue: number = 0.00;   // Added to track the original pure damage amount of Spirit Link
    private previousType: number = 0;       // Track the type
    private previousCode: boolean = false;  // Was it caused by a trigger/script?

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
        this.otrg.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_DAMAGED);
        this.otrg.AddFilterFuncCondition(Filter(() => this.OnDamage()));

        this.trig.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_DAMAGING);
        this.trig.AddFilterFuncCondition(Filter(() => this.OnPreDamage()));
    }

    /**
     * Adds an event that triggers right before a unit takes damage
     *  - Do not change the damage in any way during these events!
     */
    public AddInitialDamageEvent(event: () => void) {
        this.initialDamageEvent.push(event);
    }

    /**
     * Adds an event that triggers right after a unit has taken 0 damage
     */
    public AddZeroDamageEvent(event: () => void) {
        this.zeroDamageEvent.push(event);
    }

    /**
     * Add an event that adds or subtracts damage before it has been applied
     */
    public AddInitialDamageModificationEvent(event: () => void) {
        this.initialDamageModificationEvent.push(event);
    }

    /**
     * Add an event that multiplies or subtracts damage before it has been applied
     */
    public AddMultiplicativeDamageModificationEvent(event: () => void) {
        this.multiplicativeDamageModificationEvent.push(event);
    }

    /**
     * Adds an event that triggers right before armor and resistance has been factored in
     */
    public AddPreFinalDamageModificationEvent(event: () => void) {
        this.preFinalDamageModificationEvent.push(event);
    }

    /**
     * Adds an event that triggers right before a unit takes lethal damage
     */
    public AddLethalDamageEvent(event: () => void) {
        this.damageEventLethalActions.push(event);
    }

    /**
     * Adds an event that triggers immediately once more than 1 unit has taken
     * damage from the same source
     */
    public AddAOEDamageEvent(event: () => void) {
        this.damageEventAOEActions.push(event);
    }

    /**
     * Adds an event that triggers after all other damage modifiers
     * have been factored in (even armor and resistance)
     */
    public AddFinalDamageModificationEvent(event: () => void) {
        this.finalDamageModificationEvent.push(event);
    }

    private InitialDamageEvent() {
        this.initialDamageEvent.forEach(action => action());
    }

    private ZeroDamageEvent() {
        this.zeroDamageEvent.forEach(action => action());
    }

    private DamageEventAOE() {
        this.damageEventAOEActions.forEach(action => action());
    }

    private DamageEventLethal() {
        this.damageEventLethalActions.forEach(action => action());
    }

    private InitialDamageModificationEvent() {
        this.initialDamageModificationEvent.forEach(action => action());
    }

    private MultiplicativeDamageModificationEvent() {
        this.multiplicativeDamageModificationEvent.forEach(action => action());
    }

    private PreFinalDamageModificationEvent() {
        this.preFinalDamageModificationEvent.forEach(action => action());
    }

    private FinalDamageModificationEvent() {
        this.finalDamageModificationEvent.forEach(action => action());
    }

    private Error() {
        let s: string = 'WARNING: Recursion error when dealing damage! Prior to dealing damage from within a DamageEvent response trigger, do this:\n';
        s += 'Set DamageEventTrigger = (This Trigger)\n';
        s += 'Unit - Cause <Source> to damage <Target>...\n\n';
        s += 'Alternatively, just use the UNKNOWN damage type. It will skip recursive damage on its own without needing the "Set" line:/n';
        s += 'Unit - Cause <Source> to damage <Target>, dealing <Amount> damage of attack type <Attack Type> and damage type Unknown';

        ClearTextMessages();
        DisplayTimedTextToPlayer(GetLocalPlayer(), 0.00, 0.00, 999.00, s);
    }

    private ClearDamageEvent() {
        if (!IsTriggerEnabled(this.trig.nativeTrigger)) {
            EnableTrigger(this.trig.nativeTrigger);
        }

        if (this.clearable) {
            this.clearable = false;
        }

        if (this.recursion > -1 && !this.purge) {
            this.purge = true;
            // @ts-ignore
            ForForce(bj_FORCE_PLAYER[0], () => this.cleaner());
            this.purge = false;
            this.recursive = false;
        }
    }

    private OnAOEEnd() {
        if (this.damageEngineGlobals.udg_DamageEventAOE > 1) {
            this.DamageEventAOE();
            this.damageEngineGlobals.udg_DamageEventAOE = 1;
        }

        this.damageEngineGlobals.udg_DamageEventLevel = 1;
        this.damageEngineGlobals.udg_EnhancedDamageTarget = undefined;
        this.damageEngineGlobals.udg_AOEDamageSource = undefined;
        GroupClear(<group>this.damageEngineGlobals.udg_DamageEventAOEGroup);
    }

    private OnExpire() {
        this.started = false;
        this.ClearDamageEvent();
        this.OnAOEEnd();
    }

    private SetVars(src: unit, tgt: unit, amt: number, at: attacktype, dt: damagetype, wt: weapontype, ph: number): boolean {
        const i: number = this.recursion + 1;
        const rec: boolean = this.recursive;

        this.ClearDamageEvent();

        if (ph < 2 && this.damageEngineGlobals.udg_NextDamageType === 0 && (this.damageEngineGlobals.udg_DamageEventTrigger !== undefined || rec)) {
            this.damageEngineGlobals.udg_NextDamageType = this.damageEngineGlobals.udg_DamageTypeCode;
        }
        if (rec && ph === 1) {
            this.recursion = i;
            if (i < 16) {
                this.lastAmount[i] = amt;
                if (amt !== 0.00) {
                    this.lastSource[i] = src;
                    this.lastTarget[i] = tgt;
                    this.lastAttackT[i] = at;
                    this.lastDamageT[i] = dt;
                    this.lastWeaponT[i] = wt;

                    if (this.damageEngineGlobals.udg_NextDamageType !== 0) {
                        this.lastTrig[i] = <trigger>this.damageEngineGlobals.udg_DamageEventTrigger;
                        this.lastType[i] = this.damageEngineGlobals.udg_NextDamageType;
                    }
                }
            } else {
                this.Error();
            }

            this.damageEngineGlobals.udg_NextDamageType = 0;
            this.damageEngineGlobals.udg_DamageEventTrigger = undefined;
            return false;
        }
        if (ph === 1) {
            if (this.started) {
                if (src !== this.damageEngineGlobals.udg_AOEDamageSource) {
                    this.OnAOEEnd();
                    this.damageEngineGlobals.udg_AOEDamageSource = src;
                } else if (tgt === this.damageEngineGlobals.udg_EnhancedDamageTarget) {
                    this.damageEngineGlobals.udg_DamageEventLevel = this.damageEngineGlobals.udg_DamageEventLevel + 1;
                } else if (!IsUnitInGroup(tgt, <group>this.damageEngineGlobals.udg_DamageEventAOEGroup)) {
                    this.damageEngineGlobals.udg_DamageEventAOE = this.damageEngineGlobals.udg_DamageEventAOE + 1;
                }
                if ((dt === DAMAGE_TYPE_SPIRIT_LINK && this.damageEngineGlobals.udg_DamageEventAOE + this.damageEngineGlobals.udg_DamageEventLevel === 3) || dt === DAMAGE_TYPE_DEFENSIVE || dt === DAMAGE_TYPE_PLANT) {
                    this.previousValue = this.damageEngineGlobals.udg_DamageEventPrevAmt;
                    this.previousType = this.damageEngineGlobals.udg_DamageEventType;
                    this.previousCode = this.damageEngineGlobals.udg_IsDamageCode;
                }
            } else {
                this.started = true;
                this.damageEngineGlobals.udg_AOEDamageSource = src;
                this.damageEngineGlobals.udg_EnhancedDamageTarget = tgt;
                TimerStart(this.ticker, 0.00, false, () => this.OnExpire());
            }
            GroupAddUnit(<group>this.damageEngineGlobals.udg_DamageEventAOEGroup, tgt);
        }
        if (ph === 2) {
            this.damageEngineGlobals.udg_DamageEventPrevAmt = this.previousValue;
            this.damageEngineGlobals.udg_DamageEventType = this.previousType;
            this.damageEngineGlobals.udg_IsDamageCode = this.previousCode;
        } else {
            this.damageEngineGlobals.udg_DamageEventType = this.damageEngineGlobals.udg_NextDamageType;
            if (this.damageEngineGlobals.udg_NextDamageType !== 0) {
                this.damageEngineGlobals.udg_DamageEventType = this.damageEngineGlobals.udg_NextDamageType;
                this.damageEngineGlobals.udg_NextDamageType = 0;
                this.damageEngineGlobals.udg_IsDamageCode = true;

                this.damageEngineGlobals.udg_DamageEventTrigger = undefined;
            }
            this.damageEngineGlobals.udg_DamageEventOverride = dt === undefined || amt === 0.00 || this.damageEngineGlobals.udg_DamageEventType * this.damageEngineGlobals.udg_DamageEventType === 4;
            this.damageEngineGlobals.udg_DamageEventPrevAmt = amt;
        }
        this.damageEngineGlobals.udg_DamageEventSource = src;
        this.damageEngineGlobals.udg_DamageEventTarget = tgt;
        this.damageEngineGlobals.udg_DamageEventAmount = amt;
        this.damageEngineGlobals.udg_DamageEventAttackT = GetHandleId(at);
        this.damageEngineGlobals.udg_DamageEventDamageT = GetHandleId(dt);
        this.damageEngineGlobals.udg_DamageEventWeaponT = GetHandleId(wt);

        this.damageEngineGlobals.udg_IsDamageMelee = false;
        this.damageEngineGlobals.udg_IsDamageRanged = false;
        this.damageEngineGlobals.udg_IsDamageSpell = at === undefined;

        if (dt === DAMAGE_TYPE_NORMAL && !this.damageEngineGlobals.udg_IsDamageSpell && !this.damageEngineGlobals.udg_IsDamageCode) {
            this.damageEngineGlobals.udg_IsDamageMelee = IsUnitType(src, UNIT_TYPE_MELEE_ATTACKER);
            this.damageEngineGlobals.udg_IsDamageRanged = IsUnitType(src, UNIT_TYPE_RANGED_ATTACKER);
            if (this.damageEngineGlobals.udg_IsDamageMelee && this.damageEngineGlobals.udg_IsDamageRanged) {
                this.damageEngineGlobals.udg_IsDamageMelee = wt !== undefined;
                this.damageEngineGlobals.udg_IsDamageRanged = !this.damageEngineGlobals.udg_IsDamageMelee;
            }
        }

        if (ph < 2 && !this.damageEngineGlobals.udg_DamageEventOverride) {
            this.recursive = true;
            DisableTrigger(this.otrg.nativeTrigger);

            this.InitialDamageModificationEvent();

            this.damageEngineGlobals.udg_DamageEventOverride = this.damageEngineGlobals.udg_DamageEventOverride || this.damageEngineGlobals.udg_DamageEventType * this.damageEngineGlobals.udg_DamageEventType === 4;
            if (!this.damageEngineGlobals.udg_DamageEventOverride) {
                this.MultiplicativeDamageModificationEvent();
                this.PreFinalDamageModificationEvent();
            }
            EnableTrigger(this.otrg.nativeTrigger);
            this.recursive = false;
        }

        return true;
    }

    private OnPreDamage(): boolean {
        if (this.SetVars(GetEventDamageSource(), BlzGetEventDamageTarget(), GetEventDamage(), BlzGetEventAttackType(), BlzGetEventDamageType(), BlzGetEventWeaponType(), 1)) {
            BlzSetEventAttackType(ConvertAttackType(this.damageEngineGlobals.udg_DamageEventAttackT));
            BlzSetEventDamageType(ConvertDamageType(this.damageEngineGlobals.udg_DamageEventDamageT));
            BlzSetEventWeaponType(ConvertWeaponType(this.damageEngineGlobals.udg_DamageEventWeaponT));
            if (this.damageEngineGlobals.udg_DamageEventAmount > 0.00) {
                BlzSetEventDamage(this.damageEngineGlobals.udg_DamageEventAmount);
                return false;
            }
        }
        BlzSetEventDamage(0.00);
        return false;
    }

    private UDTX(src: unit, tgt: unit, amt: number, a: boolean, r: boolean, at: attacktype, dt: damagetype, wt: weapontype, ph: number): boolean {
        if (this.SetVars(src, tgt, amt, at, dt, wt, ph)) {
            DisableTrigger(this.trig.nativeTrigger);
            UnitDamageTarget(<unit>this.damageEngineGlobals.udg_DamageEventSource, <unit>this.damageEngineGlobals.udg_DamageEventTarget, this.damageEngineGlobals.udg_DamageEventAmount, a, r, ConvertAttackType(this.damageEngineGlobals.udg_DamageEventAttackT), ConvertDamageType(this.damageEngineGlobals.udg_DamageEventDamageT), ConvertWeaponType(this.damageEngineGlobals.udg_DamageEventWeaponT));
            this.ClearDamageEvent();
            return true;
        }
        return false;
    }

    private DoCleanup() {
        let i = -1;
        for (; i >= this.recursion; i++) {
            if (this.lastAmount[i] != 0.00) {
                this.damageEngineGlobals.udg_NextDamageType = this.lastType[i];
                if (this.lastTrig[i] !== undefined) {
                    DisableTrigger(this.lastTrig[i]);
                }
                this.UDTX(this.lastSource[i], this.lastTarget[i], this.lastAmount[i], true, false, this.lastAttackT[i], this.lastDamageT[i], this.lastWeaponT[i], -1);
            }
        }
        for (; i <= -1;) {
            if (this.lastTrig[i] !== undefined) {
                EnableTrigger(this.lastTrig[i]);
            }
            i--;
        }
        this.recursion = -1;
    }

    private OnDamage(): boolean {
        const r: number = GetEventDamage();
        const dt: damagetype = BlzGetEventDamageType();
        const rec: boolean = this.recursive;
        this.ClearDamageEvent();

        DisableTrigger(this.otrg.nativeTrigger);
        if (this.damageEngineGlobals.udg_DamageEventPrevAmt === 0.00) {
            this.recursive = true;
            this.ZeroDamageEvent();
        } else {
            if (GetHandleId(dt) !== this.damageEngineGlobals.udg_DamageEventDamageT) {
                this.SetVars(GetEventDamageSource(), BlzGetEventDamageTarget(), r, BlzGetEventAttackType(), dt, BlzGetEventWeaponType(), 2);
            }

            if ((this.damageEngineGlobals.udg_DamageEventAmount > 0.00 || r < 0.00) && !this.damageEngineGlobals.udg_DamageEventOverride) {
                this.damageEngineGlobals.udg_DamageEventAmount = r;
            }

            this.recursive = true;
            if (this.damageEngineGlobals.udg_DamageEventAmount > 0.00) {
                this.FinalDamageModificationEvent();

                this.damageEngineGlobals.udg_LethalDamageHP = GetWidgetLife(<unit>this.damageEngineGlobals.udg_DamageEventTarget) - this.damageEngineGlobals.udg_DamageEventAmount;
                if (this.damageEngineGlobals.udg_LethalDamageHP <= 0.405) {
                    this.DamageEventLethal();

                    this.damageEngineGlobals.udg_DamageEventAmount = GetWidgetLife(<unit>this.damageEngineGlobals.udg_DamageEventTarget) - this.damageEngineGlobals.udg_LethalDamageHP;
                    if (this.damageEngineGlobals.udg_DamageEventType < 0 && this.damageEngineGlobals.udg_LethalDamageHP <= 0.405) {
                        SetUnitExploded(<unit>this.damageEngineGlobals.udg_DamageEventTarget, true);
                    }
                }
            }

            if (this.damageEngineGlobals.udg_DamageEventAmount < 0.00) {
                SetWidgetLife(<unit>this.damageEngineGlobals.udg_DamageEventTarget, GetWidgetLife(<unit>this.damageEngineGlobals.udg_DamageEventTarget) - this.damageEngineGlobals.udg_DamageEventAmount);
                BlzSetEventDamage(0);
            } else {
                BlzSetEventDamage(this.damageEngineGlobals.udg_DamageEventAmount);
            }

            if (dt !== DAMAGE_TYPE_UNKNOWN) {
                this.InitialDamageEvent();
            }
        }

        EnableTrigger(this.otrg.nativeTrigger);
        this.recursive = false;
        this.clearable = true;
        return false;
    }

    public UnitDamageTargetEx(src: unit, tgt: unit, amt: number, a: boolean, r: boolean, at: attacktype, dt: damagetype, wt: weapontype): boolean {
        if (this.damageEngineGlobals.udg_DamageEventTrigger === undefined) {
            this.damageEngineGlobals.udg_DamageEventTrigger = GetTriggeringTrigger();
        }
        if (this.damageEngineGlobals.udg_NextDamageType === 0) {
            this.damageEngineGlobals.udg_NextDamageType = this.damageEngineGlobals.udg_DamageTypeCode;
        }
        return this.UDTX(src, tgt, amt, a, r, at, dt, wt, 1);
    }
}
