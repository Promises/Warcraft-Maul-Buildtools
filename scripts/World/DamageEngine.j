//===========================================================================
// Damage Engine lets you detect, amplify, block or nullify damage. It even
// lets you detect if the damage was physical or from a spell. Just reference
// DamageEventAmount/Source/Target or the boolean IsDamageSpell, to get the
// necessary damage event data.
//
// - Detect damage (after it's been dealt to the unit): use the event "DamageEvent Equal to 1.00"
// - To change damage before it's dealt: use the event "DamageModifierEvent Equal to 1.00"
// - Detect spell damage: use the condition "IsDamageSpell Equal to True"
// - Detect zero-damage: use the event "DamageEvent Equal to 2.00" (an AfterDamageEvent will not fire for this)
//
// You can specify the DamageEventType before dealing triggered damage, then run the trigger "ClearDamageEvent (Checking Conditions)" after dealing triggered damage from within a damage event:
// - Set NextDamageType = DamageTypeWhatever
// - Unit - Cause...
// - Trigger - Run ClearDamageEvent (Checking Conditions)
//
// You can modify the DamageEventAmount and the DamageEventType from a "DamageModifierEvent Equal to 1.00" trigger.
// - If the amount is modified to negative, it will count as a heal.
// - If the amount is set to 0, no damage will be dealt.
//
// If you need to reference the original in-game damage, use the variable "DamageEventPrevAmt".
//
//===========================================================================
library DamageEngine initializer Init

    globals
        private boolean started = false
        private boolean queued = false
        private integer recursion = 0
        private timer ticker = CreateTimer()
        
        private integer array lastPrevATyp    
        private integer array lastPrevDTyp    
        private integer array lastPrevWTyp    
        private boolean array lastOverride    
        private boolean array lastMelee
        private boolean array lastRanged
        private boolean array lastSpell    
        private integer array lastType    
        private real array lastAmount    
        private real array lastPrevAmount    
        private real array lastPureAmount    
        private unit array lastSource    
        private unit array lastTarget    
        
        private real lifeTrack = 0.00
    endglobals

    //GUI Vars:
    /*
        boolean udg_NextDamageOverride
        boolean udg_DamageEventOverride
        boolean udg_NextDamageType
        boolean udg_DamageEventType
        trigger udg_ClearDamageEvent
        boolean udg_IsDamageSpell
        boolean udg_IsDamageMelee           //New in 5.0
        boolean udg_IsDamageRanged          //New in 5.0
        
        unit udg_DamageEventSource
        unit udg_DamageEventTarget
        
        real    udg_AOEDamageEvent
        integer udg_DamageEventAOE
        group   udg_DamageEventAOEGroup
        unit    udg_AOEDamageSource         //New in 5.0
        integer udg_DamageEventLevel
        unit    udg_EnhancedDamageTarget
        
        real udg_DamageEvent
        real udg_DamageModifierEvent
        real udg_LethalDamageEvent          //New in 5.0
        
        real udg_DamageEventAmount
        real udg_DamageEventPrevAmt
        real udg_DamageEventPureAmt         //New in 5.0
        real udg_LethalDamageHP             //New in 5.0
        
        integer udg_DamageEventAttackT      //New in 5.0
        integer udg_DamageEventDamageT      //New in 5.0
        integer udg_DamageEventWeaponT      //New in 5.0
    */

    private function Error takes nothing returns nothing
        local string s = "WARNING: Recursion error when dealing damage! Make sure when you deal damage from within a DamageEvent trigger, do it like this:\n"
        set s = s + "Trigger - Turn off (This Trigger)\n"
        set s = s + "Unit - Cause...\n"
        set s = s + "Trigger - Run ClearDamageEvent (Checking Conditions)\n"
        set s = s + "Trigger - Turn on (This Trigger)"
    
        //Delete the next couple of lines to disable the in-game recursion crash warnings
        call ClearTextMessages()
        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0.00, 0.00, 999.00, s)
    endfunction

    function ClearDamageEvent takes boolean clear returns nothing
        local integer i = recursion - 1
        if clear then
            set udg_NextDamageOverride = false
            set udg_NextDamageType = 0
        endif
        if queued then
            //The 0-second timer has expired, or there had been multiple sequential damage events running in parallel.        
            set queued = false
            
            if udg_DamageEventAmount < 0.00 then
                call SetWidgetLife(udg_DamageEventTarget, GetWidgetLife(udg_DamageEventTarget) - udg_DamageEventAmount)
            endif
            
            //call BJDebugMsg(R2S(GetWidgetLife(udg_DamageEventTarget)))
            
            set udg_DamageEvent = 0.00
            set udg_DamageEvent = 1.00  //AfterDamageEvent is no longer used. I've moved the original event to this point to replace it.
            
            //call BJDebugMsg("Decreasing recursion to " + (I2S(i)))
            set recursion = i
            set udg_DamageEventAmount   = lastAmount[i]
            set udg_DamageEventAttackT  = lastPrevATyp[i]
            set udg_DamageEventDamageT  = lastPrevDTyp[i]
            set udg_DamageEventWeaponT  = lastPrevWTyp[i]
            set udg_IsDamageMelee       = lastMelee[i]
            set udg_IsDamageRanged      = lastRanged[i]
            set udg_IsDamageSpell       = lastSpell[i]
            set udg_DamageEventType     = lastType[i]
            set udg_DamageEventOverride = lastOverride[i]
            set udg_DamageEventPrevAmt  = lastPrevAmount[i]
            set udg_DamageEventPureAmt  = lastPureAmount[i]
            set udg_DamageEventSource   = lastSource[i]
            set udg_DamageEventTarget   = lastTarget[i]
        endif
    endfunction

    private function OnAOEEnd takes nothing returns nothing
        if udg_DamageEventAOE > 1 then
            set udg_AOEDamageEvent      = 0.00
            set udg_AOEDamageEvent      = 1.00
            set udg_DamageEventAOE      = 1
        endif
        set udg_DamageEventLevel        = 1
        set udg_EnhancedDamageTarget    = null
        call GroupClear(udg_DamageEventAOEGroup)
    endfunction
        
    private function OnExpire takes nothing returns nothing
        set started = false //The timer has expired. Flag off to allow it to be restarted when needed.
        call ClearDamageEvent(true) //Check for any lingering damage
        
        //Reset things so they don't perpetuate for AoE/Level target detection
        call OnAOEEnd()
    endfunction

    function StoreDamageEventVars takes nothing returns boolean
        local integer i = recursion
        
        call ClearDamageEvent(false) //in case the 0.00 second timer hasn't yet expired
        
        if i > 16 then
            call Error()
            return false
        endif
        
        set lastAmount[i]       = udg_DamageEventAmount
        set lastPrevATyp[i]     = udg_DamageEventAttackT
        set lastPrevDTyp[i]     = udg_DamageEventDamageT
        set lastPrevWTyp[i]     = udg_DamageEventWeaponT
        set lastMelee[i]        = udg_IsDamageMelee
        set lastRanged[i]       = udg_IsDamageRanged
        set lastSpell[i]        = udg_IsDamageSpell
        set lastType[i]         = udg_DamageEventType
        set lastOverride[i]     = udg_DamageEventOverride
        set lastPrevAmount[i]   = udg_DamageEventPrevAmt
        set lastPureAmount[i]   = udg_DamageEventPureAmt
        set lastSource[i]       = udg_DamageEventSource
        set lastTarget[i]       = udg_DamageEventTarget
        set recursion           = i + 1
        //call BJDebugMsg("Increasing recursion to " + (I2S(i + 1)))
        
        return true
    endfunction

    private function OnPreDamage takes nothing returns boolean
        if not StoreDamageEventVars() then
            return false
        endif

        
        //Get event responses
        set udg_DamageEventAmount   = GetEventDamage() //Is initially the DamageEventOriDmg, then is stored into DamageEventPrevAmt, then set to the processed damage
        set udg_DamageEventAttackT  = GetHandleId(BlzGetEventAttackType())
        set udg_DamageEventDamageT  = GetHandleId(BlzGetEventDamageType())
        set udg_DamageEventWeaponT  = GetHandleId(BlzGetEventWeaponType())
        set udg_DamageEventSource   = GetEventDamageSource()
        set udg_DamageEventTarget   = BlzGetEventDamageTarget()
        
        //Set custom Damage Engine data
        set udg_IsDamageMelee           = false
        set udg_IsDamageRanged          = false
        if udg_DamageEventAttackT == 0 then //In 1.31, one can just use this simple comparison to assess if the damage type is a spell.
            set udg_IsDamageSpell       = true 
        elseif udg_DamageEventDamageT == udg_DAMAGE_TYPE_NORMAL then //This damage type is the only one that can get reduced by armor.
            set udg_IsDamageMelee       = IsUnitType(udg_DamageEventSource, UNIT_TYPE_MELEE_ATTACKER)
            set udg_IsDamageRanged      = IsUnitType(udg_DamageEventSource, UNIT_TYPE_RANGED_ATTACKER)
            if udg_IsDamageMelee and udg_IsDamageRanged then
                set udg_IsDamageMelee   = udg_DamageEventWeaponT > 0//Melee units play a sound when damaging
                set udg_IsDamageRanged  = not udg_IsDamageMelee     //In the case where a unit is both ranged and melee, the ranged attack plays no sound.
            endif                                                   //The Huntress has a melee sound for her ranged projectile, however it is only an issue
        endif                                                       //if she also had a melee attack, because by default she is only UNIT_TYPE_RANGED_ATTACKER.
        
        set udg_DamageEventPureAmt  = udg_DamageEventAmount
        set udg_DamageEventPrevAmt  = udg_DamageEventAmount
        set udg_DamageEventType     = udg_NextDamageType
        set udg_NextDamageType      = 0
        set udg_DamageEventOverride = udg_NextDamageOverride
        set udg_NextDamageOverride  = false
        
        //call BJDebugMsg(GetUnitName(udg_DamageEventSource) + " dealt " + I2S(R2I(udg_DamageEventAmount)) + " to " + GetUnitName(udg_DamageEventTarget))
        
        //Added 25 July 2017 to detect AOE damage or multiple single-target damage
        if recursion == 1 and udg_DamageEventType == 0 then
            if started then
                if udg_DamageEventSource == udg_AOEDamageSource then //Source has damaged more than once
                    
                    if IsUnitInGroup(udg_DamageEventTarget, udg_DamageEventAOEGroup) then
                        //Added 5 August 2017 to improve tracking of enhanced damage against, say, Pulverize
                        set udg_DamageEventLevel = udg_DamageEventLevel + 1
                        set udg_EnhancedDamageTarget = udg_DamageEventTarget
                    else
                        //Multiple targets hit by this source - flag as AOE
                        set udg_DamageEventAOE = udg_DamageEventAOE + 1
                    endif
                else
                    //New damage source - unflag everything
                    call OnAOEEnd()
                endif
            endif
            set udg_AOEDamageSource = udg_DamageEventSource
            call GroupAddUnit(udg_DamageEventAOEGroup, udg_DamageEventTarget)
        endif
        
        //Debug only - show source unit's different attack data
        //call BJDebugMsg(BlzGetUnitWeaponStringField(udg_DamageEventSource, UNIT_WEAPON_SF_ATTACK_PROJECTILE_ART, 1))
        //call BJDebugMsg(BlzGetUnitWeaponStringField(udg_DamageEventSource, UNIT_WEAPON_SF_ATTACK_PROJECTILE_ART, 2))
        //call BJDebugMsg(R2S(BlzGetUnitWeaponRealField(udg_DamageEventSource, UNIT_WEAPON_RF_ATTACK_RANGE, 1))) //always returns 0.00
        //call BJDebugMsg(R2S(BlzGetUnitWeaponRealField(udg_DamageEventSource, UNIT_WEAPON_RF_ATTACK_RANGE, 2))) //always returns 0.00
        
        if udg_DamageEventAmount == 0.00 then
            set udg_DamageEvent = 0.00
            set udg_DamageEvent = 2.00              //This is the zero-damage event and should only run on Enhanced effects or Faerie Fire.
        else
            set udg_DamageModifierEvent = 0.00
            set udg_DamageModifierEvent = 1.00      //I recommend using this for changing damage types or using percentage-based scaling for damage modification
            if not udg_DamageEventOverride then
                set udg_DamageModifierEvent = 2.00  //Extra event in case you need to make final adjustments before in-game modifications are calculated.
            endif
            
            //All events have run and the damage amount is finalized.
            call BlzSetEventAttackType(ConvertAttackType(udg_DamageEventAttackT))
            call BlzSetEventDamageType(ConvertDamageType(udg_DamageEventDamageT))
            call BlzSetEventWeaponType(ConvertWeaponType(udg_DamageEventWeaponT))
            call BlzSetEventDamage(RMaxBJ(udg_DamageEventAmount, 0.00)) //Healing causes issues here as the negative damage is not always counted as a heal. 
        endif                                               //I therefore run a separate heal process from the "After Damage" moment which works for all units. 
        
        //call BJDebugMsg(R2S(GetWidgetLife(udg_DamageEventTarget)))
        
        if not started then
            set started = true
            call TimerStart(ticker, 0.00, false, function OnExpire)
        endif
        
        set queued = true //I set this variable to True just in case the classic damage event doesn't fire.

        return false
    endfunction

    private function RunLethal takes nothing returns real
        local real r = udg_LethalDamageHP   //exists only for recurion
        set udg_LethalDamageHP = 0.00
        
        set udg_LethalDamageEvent = 0.00    //New - added 10 May 2019 to detect and potentially prevent lethal damage. Instead of
        set udg_LethalDamageEvent = 1.00    //modifying the damage, you need to modify LethalDamageHP instead (the final HP of the unit).
        
        if udg_LethalDamageHP > 0.405 then
            //Instead of modifying the DamageEventAmount variable, just ensure the unit survives.
            return GetWidgetLife(udg_DamageEventTarget) - udg_LethalDamageHP
        elseif udg_DamageEventType < 0 then
            call SetUnitExploded(udg_DamageEventTarget, true)   //Explosive damage types should blow up the target.
        endif
        
        set udg_LethalDamageHP = r //exists only for recurion
        return udg_DamageEventAmount
    endfunction

    private function OnDamage takes nothing returns boolean
        set queued = false
        
        //call BJDebugMsg(R2S(GetWidgetLife(udg_DamageEventTarget)))
        //call BJDebugMsg("Regular damage event running")
        
        set udg_DamageEventPrevAmt  = udg_DamageEventAmount
        set udg_DamageEventAmount   = GetEventDamage()  //Damage may have been further adjusted (ie. unit armor or armor type reduction)
        
        //call BJDebugMsg(GetUnitName(udg_DamageEventSource) + " dealt " + I2S(R2I(udg_DamageEventAmount)) + " to " + GetUnitName(udg_DamageEventTarget))
        
        if not udg_DamageEventOverride then
            set udg_DamageModifierEvent = 3.00      //One final modifier to run before shields but after armor & attacks were calculated.
        endif
        if udg_DamageEventAmount > 0.00 then
            set udg_DamageModifierEvent = 4.00      //This event is used for custom shields which have a limited hit point value
        endif
        
        if GetWidgetLife(udg_DamageEventTarget) - udg_DamageEventAmount <= 0.405 then
            call BlzSetEventDamage(RunLethal())
        else
            call BlzSetEventDamage(udg_DamageEventAmount)    //Apply the final damage amount.
        endif
        
        set queued = true
        return false
    endfunction

    //===========================================================================
    private function PreClear takes nothing returns boolean
        call ClearDamageEvent(true)
        return false
    endfunction

    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_DAMAGING)
        call TriggerAddCondition(t, Filter(function OnPreDamage))
        set t = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_DAMAGED)
        call TriggerAddCondition(t, Filter(function OnDamage))

        //Create GUI-friendly trigger for cleaning up after UnitDamageTarget.
        set udg_ClearDamageEvent = CreateTrigger()
        call TriggerAddCondition(udg_ClearDamageEvent, Filter(function PreClear))
    endfunction

    public function DebugStr takes nothing returns nothing
        set udg_AttackTypeDebugStr[0] = "SPELLS"
        set udg_AttackTypeDebugStr[1] = "NORMAL" 
        set udg_AttackTypeDebugStr[2] = "PIERCE"
        set udg_AttackTypeDebugStr[3] = "SIEGE" 
        set udg_AttackTypeDebugStr[4] = "MAGIC" 
        set udg_AttackTypeDebugStr[5] = "CHAOS" 
        set udg_AttackTypeDebugStr[6] = "HERO" 
        
        set udg_DamageTypeDebugStr[0]  = "UNKNOWN"
        set udg_DamageTypeDebugStr[4]  = "NORMAL"
        set udg_DamageTypeDebugStr[5]  = "ENHANCED"
        set udg_DamageTypeDebugStr[8]  = "FIRE"
        set udg_DamageTypeDebugStr[9]  = "COLD"
        set udg_DamageTypeDebugStr[10] = "LIGHTNING"
        set udg_DamageTypeDebugStr[11] = "POISON"
        set udg_DamageTypeDebugStr[12] = "DISEASE"
        set udg_DamageTypeDebugStr[13] = "DIVINE"
        set udg_DamageTypeDebugStr[14] = "MAGIC"
        set udg_DamageTypeDebugStr[15] = "SONIC"
        set udg_DamageTypeDebugStr[16] = "ACID"
        set udg_DamageTypeDebugStr[17] = "FORCE"
        set udg_DamageTypeDebugStr[18] = "DEATH"
        set udg_DamageTypeDebugStr[19] = "MIND"
        set udg_DamageTypeDebugStr[20] = "PLANT"
        set udg_DamageTypeDebugStr[21] = "DEFENSIVE"
        set udg_DamageTypeDebugStr[22] = "DEMOLITION"
        set udg_DamageTypeDebugStr[23] = "SLOW_POISON"
        set udg_DamageTypeDebugStr[24] = "SPIRIT_LINK"
        set udg_DamageTypeDebugStr[25] = "SHADOW_STRIKE"
        set udg_DamageTypeDebugStr[26] = "UNIVERSAL"
        
        set udg_WeaponTypeDebugStr[0]  = "NONE"
        set udg_WeaponTypeDebugStr[1]  = "METAL_LIGHT_CHOP"
        set udg_WeaponTypeDebugStr[2]  = "METAL_MEDIUM_CHOP"
        set udg_WeaponTypeDebugStr[3]  = "METAL_HEAVY_CHOP"
        set udg_WeaponTypeDebugStr[4]  = "METAL_LIGHT_SLICE"
        set udg_WeaponTypeDebugStr[5]  = "METAL_MEDIUM_SLICE"
        set udg_WeaponTypeDebugStr[6]  = "METAL_HEAVY_SLICE"
        set udg_WeaponTypeDebugStr[7]  = "METAL_MEDIUM_BASH"
        set udg_WeaponTypeDebugStr[8]  = "METAL_HEAVY_BASH"
        set udg_WeaponTypeDebugStr[9]  = "METAL_MEDIUM_STAB"
        set udg_WeaponTypeDebugStr[10] = "METAL_HEAVY_STAB"
        set udg_WeaponTypeDebugStr[11] = "WOOD_LIGHT_SLICE"
        set udg_WeaponTypeDebugStr[12] = "WOOD_MEDIUM_SLICE"
        set udg_WeaponTypeDebugStr[13] = "WOOD_HEAVY_SLICE"
        set udg_WeaponTypeDebugStr[14] = "WOOD_LIGHT_BASH"
        set udg_WeaponTypeDebugStr[15] = "WOOD_MEDIUM_BASH"
        set udg_WeaponTypeDebugStr[16] = "WOOD_HEAVY_BASH"
        set udg_WeaponTypeDebugStr[17] = "WOOD_LIGHT_STAB"
        set udg_WeaponTypeDebugStr[18] = "WOOD_MEDIUM_STAB"
        set udg_WeaponTypeDebugStr[19] = "CLAW_LIGHT_SLICE"
        set udg_WeaponTypeDebugStr[20] = "CLAW_MEDIUM_SLICE"
        set udg_WeaponTypeDebugStr[21] = "CLAW_HEAVY_SLICE"
        set udg_WeaponTypeDebugStr[22] = "AXE_MEDIUM_CHOP"
        set udg_WeaponTypeDebugStr[23] = "ROCK_HEAVY_BASH"
    endfunction

endlibrary 