export class DamageEngineGlobals {
    /**
     * DAMAGE ENGINE GLOBALS
     *  - these are global variables used by the damage engine and damage event triggers
     */
    public DamageEventTrigger: trigger | undefined = undefined;

    public DamageEventOverride: boolean = false;
    public NextDamageType: number = 0;
    public DamageEventType: number = 0;
    public DamageTypeCode: number = 0;
    public IsDamageCode: boolean = false;
    public IsDamageSpell: boolean = false;
    public IsDamageMelee: boolean = false;
    public IsDamageRanged: boolean = false;
    public IsDamageAttack: boolean = false;

    public DamageEventSource: unit | undefined = undefined;
    public DamageEventTarget: unit | undefined = undefined;

    public DamageEventAOE: number = 0;
    public DamageEventAOEGroup: group | undefined = undefined;
    public AOEDamageSource: unit | undefined = undefined;
    public DamageEventLevel: number = 0;
    public EnhancedDamageTarget: unit | undefined = undefined;

    public DamageEventAmount: number = 0;
    public DamageEventPrevAmt: number = 0;
    public LethalDamageHP: number = 0;
    public DamageEventArmorPierced: number = 0;
    public DamageScalingWC3: number = 0;
    public DamageScalingUser: number = 0;

    public DamageEventAttackT: number = 0;
    public DamageEventDamageT: number = 0;
    public DamageEventWeaponT: number = 0;
    public DamageEventArmorT: number = 0;
    public DamageEventDefenseT: number = 0;
}
