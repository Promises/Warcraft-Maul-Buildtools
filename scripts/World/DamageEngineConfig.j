

library DamageEngineConfig initializer Init
    function Trig_Damage_Engine_Config_Actions takes nothing returns nothing
        // -
        // You can add extra classifications here if you want to differentiate between your triggered damage
        // Use DamageTypeExplosive (or any negative value damage type) if you want a unit killed by that damage to explode
        // -
        set udg_DamageTypeExplosive = -1
        set udg_DamageTypeCriticalStrike = 1
        set udg_DamageTypeHeal = 2
        set udg_DamageTypeReduced = 3
        set udg_DamageTypeBlocked = 4
        // -
        // Added 25 July 2017 to allow detection of things like Bash or Pulverize or AOE spread
        // -
        set udg_DamageEventAOE = 1
        set udg_DamageEventLevel = 1
        // -
        // In-game World Editor doesn't allow Attack Type and Damage Type comparisons. Therefore I need to code them as integers into GUI
        // -
        set udg_ATTACK_TYPE_SPELLS = 0
        set udg_ATTACK_TYPE_NORMAL = 1
        set udg_ATTACK_TYPE_PIERCE = 2
        set udg_ATTACK_TYPE_SIEGE = 3
        set udg_ATTACK_TYPE_MAGIC = 4
        set udg_ATTACK_TYPE_CHAOS = 5
        set udg_ATTACK_TYPE_HERO = 6
        // -
        set udg_DAMAGE_TYPE_UNKNOWN = 0
        set udg_DAMAGE_TYPE_NORMAL = 4
        set udg_DAMAGE_TYPE_ENHANCED = 5
        set udg_DAMAGE_TYPE_FIRE = 8
        set udg_DAMAGE_TYPE_COLD = 9
        set udg_DAMAGE_TYPE_LIGHTNING = 10
        set udg_DAMAGE_TYPE_POISON = 11
        set udg_DAMAGE_TYPE_DISEASE = 12
        set udg_DAMAGE_TYPE_DIVINE = 13
        set udg_DAMAGE_TYPE_MAGIC = 14
        set udg_DAMAGE_TYPE_SONIC = 15
        set udg_DAMAGE_TYPE_ACID = 16
        set udg_DAMAGE_TYPE_FORCE = 17
        set udg_DAMAGE_TYPE_DEATH = 18
        set udg_DAMAGE_TYPE_MIND = 19
        set udg_DAMAGE_TYPE_PLANT = 20
        set udg_DAMAGE_TYPE_DEFENSIVE = 21
        set udg_DAMAGE_TYPE_DEMOLITION = 22
        set udg_DAMAGE_TYPE_SLOW_POISON = 23
        set udg_DAMAGE_TYPE_SPIRIT_LINK = 24
        set udg_DAMAGE_TYPE_SHADOW_STRIKE = 25
        set udg_DAMAGE_TYPE_UNIVERSAL = 26
        // -
        // The below variables don't affect damage amount, but do affect the sound played
        // They also give important information about the type of attack used.
        // They can differentiate between ranged and melee for units who are both
        // -
        set udg_WEAPON_TYPE_NONE = 0
        // Metal Light/Medium/Heavy
        set udg_WEAPON_TYPE_ML_CHOP = 1
        set udg_WEAPON_TYPE_MM_CHOP = 2
        set udg_WEAPON_TYPE_MH_CHOP = 3
        set udg_WEAPON_TYPE_ML_SLICE = 4
        set udg_WEAPON_TYPE_MM_SLICE = 5
        set udg_WEAPON_TYPE_MH_SLICE = 6
        set udg_WEAPON_TYPE_MM_BASH = 7
        set udg_WEAPON_TYPE_MH_BASH = 8
        set udg_WEAPON_TYPE_MM_STAB = 9
        set udg_WEAPON_TYPE_MH_STAB = 10
        // Wood Light/Medium/Heavy
        set udg_WEAPON_TYPE_WL_SLICE = 11
        set udg_WEAPON_TYPE_WM_SLICE = 12
        set udg_WEAPON_TYPE_WH_SLICE = 13
        set udg_WEAPON_TYPE_WL_BASH = 14
        set udg_WEAPON_TYPE_WM_BASH = 15
        set udg_WEAPON_TYPE_WH_BASH = 16
        set udg_WEAPON_TYPE_WL_STAB = 17
        set udg_WEAPON_TYPE_WM_STAB = 18
        // Claw Light/Medium/Heavy
        set udg_WEAPON_TYPE_CL_SLICE = 19
        set udg_WEAPON_TYPE_CM_SLICE = 20
        set udg_WEAPON_TYPE_CH_SLICE = 21
        // Axe Medium
        set udg_WEAPON_TYPE_AM_CHOP = 22
        // Rock Heavy
        set udg_WEAPON_TYPE_RH_BASH = 23
        // -
        call DamageEngine_DebugStr()
    endfunction

    //===========================================================================
    private function Init takes nothing returns nothing
        set gg_trg_Damage_Engine_Config = CreateTrigger(  )
        call TriggerAddAction( gg_trg_Damage_Engine_Config, function Trig_Damage_Engine_Config_Actions )
    endfunction



endlibrary