export class DamageEngineGlobals {
    /**
     * DAMAGE ENGINE GLOBALS
     *  - these are global variables used by the damage engine and damage event triggers
     */
    public udg_DamageEventTrigger: trigger | undefined = undefined;

    public udg_DamageEventOverride: boolean = false;
    public udg_NextDamageType: number = 0;
    public udg_DamageEventType: number = 0;
    public udg_DamageTypeCode: number = 0;
    public udg_IsDamageCode: boolean = false;
    public udg_IsDamageSpell: boolean = false;
    public udg_IsDamageMelee: boolean = false;
    public udg_IsDamageRanged: boolean = false;

    public udg_DamageEventSource: unit | undefined = undefined;
    public udg_DamageEventTarget: unit | undefined = undefined;

    public udg_DamageEventAOE: number = 0;
    public udg_DamageEventAOEGroup: group | undefined = undefined;
    public udg_AOEDamageSource: unit | undefined = undefined;
    public udg_DamageEventLevel: number = 0;
    public udg_EnhancedDamageTarget: unit | undefined = undefined;

    public udg_DamageEventAmount: number = 0;
    public udg_DamageEventPrevAmt: number = 0;
    public udg_LethalDamageHP: number = 0;

    public udg_DamageEventAttackT: number = 0;
    public udg_DamageEventDamageT: number = 0;
    public udg_DamageEventWeaponT: number = 0;
}