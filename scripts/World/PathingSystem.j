library PathingSystem initializer Init

    private function MoveEnteringUnitBackToHisOwnSpawn takes nothing returns nothing
        local real x = GetRectCenterX(udg_PlayerRestrictionArea[GetPlayerId(GetOwningPlayer(GetEnteringUnit()))])
        local real y = GetRectCenterY(udg_PlayerRestrictionArea[GetPlayerId(GetOwningPlayer(GetEnteringUnit()))])
        call SetUnitPosition(GetEnteringUnit(), x, y)
    endfunction

    private function IsCreepTest takes nothing returns boolean
        if GetOwningPlayer(GetEnteringUnit()) == Player(13) then
            return true
        endif

        if GetOwningPlayer(GetEnteringUnit()) == Player(14) then
            return true
        endif

        if GetOwningPlayer(GetEnteringUnit()) == Player(15) then
            return true
        endif

        if GetOwningPlayer(GetEnteringUnit()) == Player(16) then
            return true
        endif

        return false
    endfunction

    private function AirWave takes nothing returns boolean
        if(udg_CreepLevel == 5)then
            return true
        endif
        if(udg_CreepLevel == 15)then
            return true
        endif
        if(udg_CreepLevel == 20)then
            return true
        endif
        if(udg_CreepLevel == 25)then
            return true
        endif
        if(udg_CreepLevel == 30)then
            return true
        endif
        return false
    endfunction

    private function HasteEnteringUnit takes nothing returns nothing
        local unit dummy = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'u008', 0.0, -5300.0, bj_UNIT_FACING)
        call UnitAddAbilityBJ('A068', dummy)
        call IssueTargetOrderBJ(dummy, "bloodlust", GetEnteringUnit())
        call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummy)

        set dummy=null
    endfunction

    private function PlayerRestrictionActions takes integer playerid returns nothing
        if WarcraftMaulLibrary_EnteringUnitIsCreep() then
            if (udg_IsSpawnOpen[playerid] == 0) then
                if not(UnitHasBuffBJ(GetEnteringUnit(), 'Bblo')) then
                    call HasteEnteringUnit()
                endif
            else
                call UnitRemoveBuffBJ('Bblo', GetEnteringUnit())
            endif
        elseif(IsUnitType(GetEnteringUnit(), UNIT_TYPE_SUMMONED))then
            if (GetUnitTypeId(GetTriggerUnit()) != 'u008') then
                if(GetOwningPlayer(GetEnteringUnit()) != Player(playerid)) then
                    call MoveEnteringUnitBackToHisOwnSpawn()
                endif
            endif
        elseif(IsUnitType(GetEnteringUnit(), UNIT_TYPE_STRUCTURE))then
            if(udg_PlayerRestrictions[13 * playerid + GetPlayerId(GetOwningPlayer(GetEnteringUnit()))])then
                if(not(IsUnitType(GetEnteringUnit(), UNIT_TYPE_TOWNHALL)))then
                    call SetUnitOwner( GetEnteringUnit(), Player(playerid), true )
                endif
            endif
        elseif(udg_PlayerRestrictions[13 * playerid + GetPlayerId(GetOwningPlayer(GetEnteringUnit()))])then
            call MoveEnteringUnitBackToHisOwnSpawn()
        endif
    endfunction

    private function Player1RestrictionAction takes nothing returns nothing
        call PlayerRestrictionActions(0)
    endfunction

    private function Player2RestrictionAction takes nothing returns nothing
        call PlayerRestrictionActions(1)
    endfunction

    private function Player3RestrictionAction takes nothing returns nothing
        call PlayerRestrictionActions(2)
    endfunction

    private function Player4RestrictionAction takes nothing returns nothing
        call PlayerRestrictionActions(3)
    endfunction

    private function Player5RestrictionAction takes nothing returns nothing
        call PlayerRestrictionActions(4)
    endfunction

    private function Player6RestrictionAction takes nothing returns nothing
        call PlayerRestrictionActions(5)
    endfunction

    private function Player7RestrictionAction takes nothing returns nothing
        call PlayerRestrictionActions(6)
    endfunction

    private function Player8RestrictionAction takes nothing returns nothing
        call PlayerRestrictionActions(7)
    endfunction

    private function Player9RestrictionAction takes nothing returns nothing
        if(WarcraftMaulLibrary_EnteringUnitIsCreep())then
            call UnitRemoveBuffBJ('Bblo', GetEnteringUnit())
        elseif(IsUnitType(GetEnteringUnit(), UNIT_TYPE_SUMMONED))then
            if(GetOwningPlayer(GetEnteringUnit()) != Player(8)) then
                call MoveEnteringUnitBackToHisOwnSpawn()
            endif
        elseif(udg_PlayerRestrictions[13 * 8 + GetPlayerId(GetOwningPlayer(GetEnteringUnit()))])then
            if(IsUnitType(GetEnteringUnit(), UNIT_TYPE_STRUCTURE))then
                if(not(IsUnitType(GetEnteringUnit(), UNIT_TYPE_TOWNHALL)))then
                    call SetUnitOwner( GetEnteringUnit(), Player(8), true )
                endif
            else
                call MoveEnteringUnitBackToHisOwnSpawn()
            endif
        endif
    endfunction

    private function Player10RestrictionAction takes nothing returns nothing
        call PlayerRestrictionActions(9)
    endfunction

    private function Player11RestrictionAction takes nothing returns nothing
        call PlayerRestrictionActions(10)
    endfunction

    private function Player12RestrictionAction takes nothing returns nothing
        call PlayerRestrictionActions(11)
    endfunction

    private function Player13RestrictionAction takes nothing returns nothing
        call PlayerRestrictionActions(12)
    endfunction

    private function CheckpointBetweenBlueAndYellowCondition takes nothing returns boolean
        if WarcraftMaulLibrary_EnteringUnitIsCreep() then
            if (LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 51) then
                return true
            endif

            if (LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 52) then
                return true
            endif
        endif

        return false
    endfunction

    private function CheckpointBetweenBrownAndOrangeCondition takes nothing returns boolean
        if WarcraftMaulLibrary_EnteringUnitIsCreep() then
            if (LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 53) then
                return true
            endif
        endif

        return false
    endfunction

    private function CheckpointBetweenMaroonAndPurpleCondition takes nothing returns boolean
        if WarcraftMaulLibrary_EnteringUnitIsCreep() then
            if (LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 54) then
                return true
            endif
        endif

        return false
    endfunction

    private function EnteringUnitIsCreepAndHasNoCheckpoint takes nothing returns boolean
        if not(WarcraftMaulLibrary_EnteringUnitIsCreep()) then
            return false
        endif

        if not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 0) then
            return false
        endif

        return true
    endfunction

    private function RemoveUnitIfNotShip takes nothing returns nothing
        if GetUnitTypeId(GetEnumUnit()) == 'n05G' then
            call KillUnit(GetEnumUnit())
        else
            call RemoveUnit(GetEnumUnit())
        endif
    endfunction

    private function RemoveEveryUnit takes nothing returns nothing
        local group grp = GetUnitsInRectAll(GetPlayableMapRect())
        call ForGroupBJ(grp,function RemoveUnitIfNotShip)
        
        call DestroyGroup(grp)
        set grp=null
    endfunction

    private function GameOver takes nothing returns nothing
        set udg_GameEndTimer = 600
        set udg_HasGameEnded = true
        call PlaySoundBJ(udg_DefeatSound)
        call DisplayTextToForce( GetPlayersAll(), "|cFFFF0000GAME OVER|r")
        call RemoveEveryUnit()
    endfunction

    private function LoseALife takes nothing returns nothing
        if(not(udg_HasGameEnded))then
            if(GetUnitTypeId(GetEnteringUnit()) == 'uC72')then
                set udg_TotalLives=0
                call DisplayTextToForce( GetPlayersAll(), "Archimonde has boarded the ship! |cFFFF0000YOU LOSE!|r")
            else
                set udg_TotalLives=(udg_TotalLives-1)
                set udg_LivesLost=(udg_LivesLost+1)
                call DisplayTextToForce( GetPlayersAll(), "|c00ff0000A unit has boarded the ship! |r" + I2S(udg_TotalLives) + " |c00ff0000chances left|r")
            endif

            call SaveIntegerBJ(0, GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable )
            call RemoveUnit(GetEnteringUnit())
            call PlaySoundBJ(udg_LoseALifeSound)

            // Update scoreboard
            call MultiboardSetItemValueBJ( udg_Scoreboard, 2, 4, I2S(udg_TotalLives) )

            if(udg_TotalLives <= 0)then
                call GameOver()
            endif
        endif
    endfunction

    private function SetCreepAbilities takes nothing returns nothing
        local real totalchance = udg_Difficulty - 100.0
        local real chance
        local integer array nums
        local integer i = 0
        local integer creepabilitiescount = udg_CreepAbilitiesSize - 1
        local integer currentability
        
        loop
            exitwhen i > udg_CreepAbilitiesSize
            set nums[i] = i
            set i = i + 1
        endloop
        
        set i = 0
        set udg_CurrentCreepAbilitiesSize = 0
        
        loop
            exitwhen i > 0
            if(totalchance > 0.0)then
                set chance = RMinBJ(totalchance, 100.00)
                if(GetRandomInt(1, 100) <= chance)then
                    set currentability = GetRandomInt(0, creepabilitiescount)
                    set udg_CurrentCreepAbilities[udg_CurrentCreepAbilitiesSize] = udg_CreepAbilities[nums[currentability]]
                    // call DisplayTextToForce( GetPlayersAll(), "Setting Ability(" + GetAbilityName(udg_CreepAbilities[nums[currentability]]) + "... " + I2S(nums[currentability]) )
                    if nums[currentability] == 8 then
                        call EnableTrigger(gg_trg_WalkItOff)
                    elseif nums[currentability] == 7 then
                        // call DisplayTextToForce(GetPlayersAll(), "Divine Shield")
                        if ( AirWave() == false ) then
                            call EnableTrigger(gg_trg_DivineShield)
                        endif
                    elseif nums[currentability] == 3 then
                        call EnableTrigger(gg_trg_CrippleAura)
                    elseif nums[currentability] == 6 then
                        call EnableTrigger(gg_trg_VampiricAura)
                    endif
                    set udg_CurrentCreepAbilitiesSize = udg_CurrentCreepAbilitiesSize + 1
                    set nums[creepabilitiescount] = nums[creepabilitiescount] + nums[currentability]
                    set nums[currentability] = nums[creepabilitiescount] - nums[currentability]
                    set nums[creepabilitiescount] = nums[creepabilitiescount] - nums[currentability]
                    set creepabilitiescount = creepabilitiescount - 1
                endif
                set totalchance = totalchance - 100.0
            else
                set i = 1
            endif
        endloop
    endfunction

    private function SetLifeToMax takes nothing returns nothing
        call SetUnitLifePercentBJ(GetEnumUnit(),100)
    endfunction

    private function HealEverythingOnMap takes nothing returns nothing
        local group grp = GetUnitsInRectAll(GetPlayableMapRect())
        call ForGroupBJ(grp,function SetLifeToMax)
        
        call DestroyGroup(grp)
        set grp=null
    endfunction

    private function GiveWaveGoldReward takes nothing returns nothing
        local integer i = 0
        local string msg = "|c0000cdf9You recieved|r " + I2S(udg_FinishWaveGoldReward) + " |c0000cdf9extra gold for completing level|r " + I2S(udg_CreepLevel - 1)
        local string msgGrey = "|c0000cdf9You recieved|r " + I2S(2 * udg_FinishWaveGoldReward) + "|c0000cdf9 extra gold for completing level as the last defender|r " + I2S(udg_CreepLevel - 1)
        loop
            exitwhen i > 12
            
            if udg_CreepLevel == 15 then
                call AdjustPlayerStateBJ( 1, Player(i), PLAYER_STATE_RESOURCE_LUMBER )
            endif

            if i == 8 then
                call AdjustPlayerStateBJ( 2 * udg_FinishWaveGoldReward, Player(i), PLAYER_STATE_RESOURCE_GOLD )
                call WarcraftMaulLibrary_DisplayMessageToPlayer(msgGrey, i)
            else
                call AdjustPlayerStateBJ( udg_FinishWaveGoldReward, Player(i), PLAYER_STATE_RESOURCE_GOLD )
                call WarcraftMaulLibrary_DisplayMessageToPlayer(msg, i)
            endif

            set i = i + 1
        endloop
        set msg=null
        set msgGrey=null
    endfunction

    private function CreepFoodConditions takes nothing returns boolean
        if not (GetPlayerState(Player(13), PLAYER_STATE_RESOURCE_FOOD_USED) == 0) then
            return false
        endif
        if not (GetPlayerState(Player(14), PLAYER_STATE_RESOURCE_FOOD_USED) == 0) then
            return false
        endif
        if not (GetPlayerState(Player(15), PLAYER_STATE_RESOURCE_FOOD_USED) == 0) then
            return false
        endif
        if not (GetPlayerState(Player(16), PLAYER_STATE_RESOURCE_FOOD_USED) == 0) then
            return false
        endif
        return true
    endfunction

    private function SpamEffects takes nothing returns nothing
        local integer x = GetRandomInt(0, 10000) - 5000
        local integer y = GetRandomInt(0, 10000) - 5000
        local location loc = Location(x, y)
        call DestroyEffect(AddSpecialEffectLocBJ( loc, "Abilities\\Spells\\Human\\DispelMagic\\DispelMagicTarget.mdl" ))
        call RemoveLocation(loc)
        set loc=null
    endfunction

    private function GameWinEffects takes nothing returns nothing
        local timer t=CreateTimer()
        call TimerStart(t, 0.10, true, function SpamEffects)
        set t=null
    endfunction

    private function GameWin takes nothing returns nothing
        if(udg_TotalLives > 0)then
            call PlaySoundBJ(udg_VictorySound)
            call DisplayTimedTextToForce( GetPlayersAll(), 30, "|cFFF48C42YOU HAVE WON!|r" )
            call DisplayTimedTextToForce( GetPlayersAll(), 15, "You can either leave the game or stay for bonus rounds" )
            call GameWinEffects()
        endif
    endfunction

    private function SpamBonusEffects takes nothing returns nothing
        local integer x = GetRandomInt(0, 10000) - 5000
        local integer y = GetRandomInt(0, 10000) - 5000
        local location loc = Location(x, y)
        call DestroyEffect(AddSpecialEffectLocBJ( loc, "Abilities\\Spells\\Human\\Flare\\FlareCaster.mdl" ))
        call RemoveLocation(loc)
        set loc=null
    endfunction

    private function BonusRoundEffects takes nothing returns nothing
        local timer t=CreateTimer()
        call TimerStart(t, 0.03, true, function SpamBonusEffects)
        set t=null
    endfunction

    private function BonusRoundsOver takes nothing returns nothing
        call DisplayTextToForce( GetPlayersAll(), "|cFFF48C42That's all the bonus levels, well done!|r" )
        set udg_IsWaveInProgress = false
        set udg_GameEndTimer = 600
        set udg_HasGameEnded = true
        call IssuePointOrder(udg_Ship, "move", GetRectCenterX(udg_ShipDestination), GetRectCenterY(udg_ShipDestination))
        call BonusRoundEffects()
    endfunction

    private function ReplaceEnumUnitAndAddToEndOfTurn takes integer uid returns nothing
        local unit replaced = ReplaceUnitBJ(GetEnumUnit(), uid, bj_UNIT_STATE_METHOD_DEFAULTS)
        call WarcraftMaulLibrary_AddToEndOfTurnArray(replaced)

        set replaced = null
    endfunction

    private function EndOfTurnTower takes nothing returns nothing
        if (GetUnitAbilityLevel(GetEnumUnit(), 'A09Q') > 0) then
            call BlzSetUnitBaseDamage(GetEnumUnit(), 0, 0)
        endif
        if (GetUnitAbilityLevel(GetEnumUnit(), 'A09S') > 0) then
            call BlzSetUnitBaseDamage(GetEnumUnit(), 4, 0)
        endif
        if (GetUnitAbilityLevel(GetEnumUnit(), 'A09T') > 0) then
            call BlzSetUnitBaseDamage(GetEnumUnit(), 9, 0)
        endif
        if (GetUnitAbilityLevel(GetEnumUnit(), 'A09U') > 0) then
            call BlzSetUnitBaseDamage(GetEnumUnit(), 19, 0)
        endif
        if (GetUnitAbilityLevel(GetEnumUnit(), 'A09V') > 0) then
            call BlzSetUnitBaseDamage(GetEnumUnit(), 39, 0)
        endif

        if (GetUnitTypeId(GetEnumUnit()) == 'n026') then
            call BlzSetUnitBaseDamage(GetEnumUnit(), BlzGetUnitBaseDamage(GetEnumUnit(), 0) + 5, 0)
        elseif (GetUnitTypeId(GetEnumUnit()) == 'u038') then
            call BlzSetUnitBaseDamage(GetEnumUnit(), BlzGetUnitBaseDamage(GetEnumUnit(), 0) + 15, 0)
        elseif (GetUnitTypeId(GetEnumUnit()) == 'u01D') then
            call SetUnitManaBJ(GetEnumUnit(), GetUnitStateSwap(UNIT_STATE_MANA, GetEnumUnit()) + 1.00)
        elseif (GetUnitTypeId(GetEnumUnit()) == 'u01F') then
            if (GetUnitStateSwap(UNIT_STATE_MANA, GetEnumUnit()) == 2) then
                call WarcraftMaulLibrary_RemoveFromEndOfTurnArray(GetEnumUnit())
                call ReplaceEnumUnitAndAddToEndOfTurn('u029')
            else
                call SetUnitManaBJ(GetEnumUnit(), GetUnitStateSwap(UNIT_STATE_MANA, GetEnumUnit()) + 1.00)
            endif
        elseif (GetUnitTypeId(GetEnumUnit()) == 'u029') then
            call WarcraftMaulLibrary_RemoveFromEndOfTurnArray(GetEnumUnit())
            call ReplaceEnumUnitAndAddToEndOfTurn('u01F')
        elseif (GetUnitTypeId(GetEnumUnit()) == 'u021') then
            if (GetUnitStateSwap(UNIT_STATE_MANA, GetEnumUnit()) == 5) then
                call WarcraftMaulLibrary_RemoveFromEndOfTurnArray(GetEnumUnit())
                call ReplaceEnumUnitAndAddToEndOfTurn('u036')
            else
                call SetUnitManaBJ(GetEnumUnit(), GetUnitStateSwap(UNIT_STATE_MANA, GetEnumUnit()) + 1.00)
            endif
        elseif (GetUnitTypeId(GetEnumUnit()) == 'u022') then
            if (GetUnitAbilityLevel(GetEnumUnit(), 'A0E0') > 0) then
                call UnitRemoveAbility(GetEnumUnit(), 'A0E0')
                call UnitAddAbility(GetEnumUnit(), 'A0E1')
                call UnitAddAbility(GetEnumUnit(), 'A0E2')
            else
                call UnitRemoveAbility(GetEnumUnit(), 'A0E1')
                call UnitRemoveAbility(GetEnumUnit(), 'A0E2')
                call UnitAddAbility(GetEnumUnit(), 'A0E0')
            endif
        elseif (GetUnitTypeId(GetEnumUnit()) == 'u026') then
            if BlzGetUnitBaseDamage(GetEnumUnit(), 1) == 4 then
                call ReplaceUnitBJ(GetEnumUnit(), 'n027', bj_UNIT_STATE_METHOD_DEFAULTS)
            else
                call BlzSetUnitBaseDamage(GetEnumUnit(), BlzGetUnitBaseDamage(GetEnumUnit(), 0) - 5, 0)
            endif
        elseif (GetUnitTypeId(GetEnumUnit()) == 'u027') then
            call ReplaceUnitBJ(GetEnumUnit(), 'n027', bj_UNIT_STATE_METHOD_DEFAULTS)
        endif
    endfunction

    private function RoundEnd takes nothing returns nothing
        //call FlushParentHashtableBJ( udg_UnitToCheckpointTable )

        call DisableTrigger(gg_trg_WalkItOff)
        call DisableTrigger(gg_trg_DivineShield)
        call DisableTrigger(gg_trg_CrippleAura)
        call DisableTrigger(gg_trg_VampiricAura)

        if(udg_CreepLevel == 36) then
            call BonusRoundsOver()
        else
            call SetCreepAbilities()
            // Increase creep level
            set udg_CreepLevel = udg_CreepLevel + 1
            set udg_FinishWaveGoldReward = udg_FinishWaveGoldReward + 2

            // Update Scoreboard
            call MultiboardSetItemValueBJ( udg_Scoreboard, 2, 2, I2S(udg_CreepLevel) )

            // Display lives lost
            if(udg_LivesLost == 0)then
                call DisplayTimedTextToForce( GetPlayersAll(), 5, "|cFFF44242Co|r|cFFF47442ng|r|cFFF4A742ra|r|cFFEBF442tu|r|cFFC5F442la|r|cFF8FF442ti|r|cFF62F442on|r|cFF42F477s n|r|cFF42F4E5o l|r|cFF42A7F4iv|r|cFF425FF4es|r|cFF7A42F4 lo|r|cFFC542F4st!|r")
            else
                call DisplayTextToForce(GetPlayersAll(), (I2S(udg_LivesLost)+" |cFFED0000Chances have been lost|r"))
            endif

            // Reward players for finishing the wave
            call GiveWaveGoldReward()

            // Start new timers
            set udg_IsWaveInProgress = false
            set udg_StartWaveTimer = true

            // Heal every unit on the map (mostly for towers)
            call HealEverythingOnMap()

            if(udg_CreepLevel == 35) then
                call PauseUnitBJ( false, udg_ArchimondeDummy )
                call IssueTargetDestructableOrder(udg_ArchimondeDummy, "attack", gg_dest_B000_0160)
            endif

            if(udg_CreepLevel == 36) then
                call GameWin()
            endif
        endif

        call ForGroupBJ(udg_TowerEndOfTurnGroup, function EndOfTurnTower)
    endfunction

    private function IsRedSpawnOpen takes nothing returns boolean
        if(not(udg_IsSpawnOpen[0]==1))then
            return false
        endif
        return true
    endfunction

    private function IsBlueSpawnOpen takes nothing returns boolean
        if(not(udg_IsSpawnOpen[1]==1))then
            return false
        endif
        return true
    endfunction

    private function IsTealSpawnOpen takes nothing returns boolean
        if(not(udg_IsSpawnOpen[2]==1))then
            return false
        endif
        return true
    endfunction

    private function IsPurpleSpawnOpen takes nothing returns boolean
        if(not(udg_IsSpawnOpen[3]==1))then
            return false
        endif
        return true
    endfunction

    private function IsYellowSpawnOpen takes nothing returns boolean
        if(not(udg_IsSpawnOpen[4]==1))then
            return false
        endif
        return true
    endfunction

    private function IsOrangeSpawnOpen takes nothing returns boolean
        if(not(udg_IsSpawnOpen[5]==1))then
            return false
        endif
        return true
    endfunction

    private function IsGreenSpawnOpen takes nothing returns boolean
        if(not(udg_IsSpawnOpen[6]==1))then
            return false
        endif
        return true
    endfunction

    private function IsPinkSpawnOpen takes nothing returns boolean
        if(not(udg_IsSpawnOpen[7]==1))then
            return false
        endif
        return true
    endfunction

    private function IsGreySpawnOpen takes nothing returns boolean
        if(not(udg_IsSpawnOpen[8]==1))then
            return false
        endif
        return true
    endfunction

    private function IsLightblueSpawnOpen takes nothing returns boolean
        if(not(udg_IsSpawnOpen[9]==1))then
            return false
        endif
        return true
    endfunction

    private function IsDarkgreenSpawnOpen takes nothing returns boolean
        if(not(udg_IsSpawnOpen[10]==1))then
            return false
        endif
        return true
    endfunction

    private function IsBrownSpawnOpen takes nothing returns boolean
        if(not(udg_IsSpawnOpen[11]==1))then
            return false
        endif
        return true
    endfunction

    private function IsMaroonSpawnOpen takes nothing returns boolean
        if(not(udg_IsSpawnOpen[12]==1))then
            return false
        endif
        return true
    endfunction



    private function MinibossWave takes nothing returns boolean
        if(udg_CreepLevel == 9)then
            return true
        endif
        if(udg_CreepLevel == 14)then
            return true
        endif
        if(udg_CreepLevel == 19)then
            return true
        endif
        if(udg_CreepLevel == 24)then
            return true
        endif
        if(udg_CreepLevel == 29)then
            return true
        endif
        if(udg_CreepLevel == 31)then
            return true
        endif
        return false
    endfunction

    private function BossWave takes nothing returns boolean
        if(udg_CreepLevel == 35)then
            return true
        endif
        if(udg_CreepLevel == 36)then
            return true
        endif
        return false
    endfunction

    private function StartSpawningAir takes nothing returns nothing
        local location red = GetRectCenter(udg_Redspawn)
        local location red2 = GetRectCenter(udg_Redspawn2)
        local location blue = GetRectCenter(udg_Bluespawn)
        local location blue2 = GetRectCenter(udg_Bluespawn2)
        local location teal = GetRectCenter(udg_Tealspawn)
        local location teal2 = GetRectCenter(udg_Tealspawn2)
        local location purple = GetRectCenter(udg_Purplespawn)
        local location purple2 = GetRectCenter(udg_Purplespawn2)
        local location orange = GetRectCenter(udg_Orangespawn)
        local location orange2 = GetRectCenter(udg_Orangespawn2)
        local location pink = GetRectCenter(udg_Pinkspawn)
        local location pink2 = GetRectCenter(udg_Pinkspawn2)
        local location green = GetRectCenter(udg_Greenspawn)
        local location green2 = GetRectCenter(udg_Greenspawn2)
        local location yellow = GetRectCenter(udg_Yellowspawn)
        local location yellow2 = GetRectCenter(udg_Yellowspawn2)
        local location grey = GetRectCenter(udg_Greyspawn)
        local location brown = GetRectCenter(udg_Brownspawn)
        local location brown2 = GetRectCenter(udg_Brownspawn2)
        local location maroon = GetRectCenter(udg_Maroonspawn)
        local location maroon2 = GetRectCenter(udg_Maroonspawn2)
        local location lightblue = GetRectCenter(udg_Lightbluespawn)
        local location lightblue2 = GetRectCenter(udg_Lightbluespawn2)
        local location darkgreen = GetRectCenter(udg_Darkgreenspawn)
        local location darkgreen2 = GetRectCenter(udg_Darkgreenspawn2)

        if(IsRedSpawnOpen())then // Red
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(13), red, 180.0))
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(13), red2, 180.0))
        endif
        if(IsBlueSpawnOpen())then // Blue
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(14), blue, 270.0))
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(14), blue2, 270.0))
        endif
        if(IsTealSpawnOpen())then // Teal
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(15), teal, 0.0))
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(15), teal2, 0.0))
        endif
        if(IsPurpleSpawnOpen())then // Purple
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(16), purple, 270.0))
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(16), purple2, 270.0))
        endif
        if(IsYellowSpawnOpen())then // Yellow
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(14), yellow, 270.0))
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(14), yellow2, 270.0))
        endif
        if(IsOrangeSpawnOpen())then // Orange
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(13), orange, 270.0))
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(13), orange2, 270.0))
        else
        endif
        if(IsGreenSpawnOpen())then // Green
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(15), green, 0.0))
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(15), green2, 0.0))
        endif
        if(IsPinkSpawnOpen())then // Pink
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(15), pink, 180.0))
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(15), pink2, 180.0))
        endif
        if(IsGreySpawnOpen())then // Grey
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(16), grey, 270.0))
        endif
        if(IsLightblueSpawnOpen())then // Lightblue
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(14), lightblue, 90.0))
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(14), lightblue2, 90.0))
        endif
        if(IsDarkgreenSpawnOpen())then // Darkgreen
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(15), darkgreen, 90.0))
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(15), darkgreen2, 90.0))
        endif
        if(IsBrownSpawnOpen())then // Brown
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(16), brown, 270.0))
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(16), brown2, 270.0))
        endif
        if(IsMaroonSpawnOpen())then // Maroon
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(16), maroon, 270.0))
            call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(16), maroon2, 270.0))
        endif

        call RemoveLocation(red)
        call RemoveLocation(red2)
        call RemoveLocation(blue)
        call RemoveLocation(blue2)
        call RemoveLocation(teal)
        call RemoveLocation(teal2)
        call RemoveLocation(purple)
        call RemoveLocation(purple2)
        call RemoveLocation(orange)
        call RemoveLocation(orange2)
        call RemoveLocation(pink)
        call RemoveLocation(pink2)
        call RemoveLocation(green)
        call RemoveLocation(green2)
        call RemoveLocation(yellow)
        call RemoveLocation(yellow2)
        call RemoveLocation(grey)
        call RemoveLocation(brown)
        call RemoveLocation(brown2)
        call RemoveLocation(maroon)
        call RemoveLocation(maroon2)
        call RemoveLocation(lightblue)
        call RemoveLocation(lightblue2)
        call RemoveLocation(darkgreen)
        call RemoveLocation(darkgreen2)

        set red = null
        set red2 = null
        set blue = null
        set blue2 = null
        set teal = null
        set teal2 = null
        set purple = null
        set purple2 = null
        set orange = null
        set orange2 = null
        set pink = null
        set pink2 = null
        set green = null
        set green2 = null
        set yellow = null
        set yellow2 = null
        set grey = null
        set brown = null
        set brown2 = null
        set maroon = null
        set maroon2 = null
        set lightblue = null
        set lightblue2 = null
        set darkgreen = null
        set darkgreen2 = null
    endfunction

    private function StartSpawning takes nothing returns nothing
        local integer i = 1
        loop
            exitwhen i > udg_Spawnamount
            if(IsRedSpawnOpen())then // Red
                call CreateUnit(Player(13), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Redspawn), GetRectCenterY(udg_Redspawn), 180.00)
                call CreateUnit(Player(13), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Redspawn2), GetRectCenterY(udg_Redspawn2), 180.00)
            endif
            if(IsBlueSpawnOpen())then // Blue
                call CreateUnit(Player(14), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Bluespawn), GetRectCenterY(udg_Bluespawn), 270.00)
                call CreateUnit(Player(14), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Bluespawn2), GetRectCenterY(udg_Bluespawn2), 270.00)
            endif
            if(IsTealSpawnOpen())then // Teal
                call CreateUnit(Player(15), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Tealspawn), GetRectCenterY(udg_Tealspawn), 0.00)
                call CreateUnit(Player(15), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Tealspawn2), GetRectCenterY(udg_Tealspawn2), 0.00)
            endif
            if(IsPurpleSpawnOpen())then // Purple
                call CreateUnit(Player(16), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Purplespawn), GetRectCenterY(udg_Purplespawn), 270.00)
                call CreateUnit(Player(16), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Purplespawn2), GetRectCenterY(udg_Purplespawn2), 270.00)
            endif
            if(IsYellowSpawnOpen())then // Yellow
                call CreateUnit(Player(14), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Yellowspawn), GetRectCenterY(udg_Yellowspawn), 270.00)
                call CreateUnit(Player(14), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Yellowspawn2), GetRectCenterY(udg_Yellowspawn2), 270.00)
            endif
            if(IsOrangeSpawnOpen())then // Orange
                call CreateUnit(Player(13), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Orangespawn), GetRectCenterY(udg_Orangespawn), 270.00)
                call CreateUnit(Player(13), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Orangespawn2), GetRectCenterY(udg_Orangespawn2), 270.00)
            else
            endif
            if(IsGreenSpawnOpen())then // Green
                call CreateUnit(Player(15), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Greenspawn), GetRectCenterY(udg_Greenspawn), 0.00)
                call CreateUnit(Player(15), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Greenspawn2), GetRectCenterY(udg_Greenspawn2), 0.00)
            endif
            if(IsPinkSpawnOpen())then // Pink
                call CreateUnit(Player(15), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Pinkspawn), GetRectCenterY(udg_Pinkspawn), 180.00)
                call CreateUnit(Player(15), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Pinkspawn2), GetRectCenterY(udg_Pinkspawn2), 180.00)
            endif
            if(IsGreySpawnOpen())then // Grey
                call CreateUnit(Player(16), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Greyspawn), GetRectCenterY(udg_Greyspawn), 270.00)
            endif
            if(IsLightblueSpawnOpen())then // Lightblue
                call CreateUnit(Player(14), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Lightbluespawn), GetRectCenterY(udg_Lightbluespawn), 90.00)
                call CreateUnit(Player(14), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Lightbluespawn2), GetRectCenterY(udg_Lightbluespawn2), 90.00)
            endif
            if(IsDarkgreenSpawnOpen())then // Darkgreen
                call CreateUnit(Player(15), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Darkgreenspawn), GetRectCenterY(udg_Darkgreenspawn), 90.00)
                call CreateUnit(Player(15), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Darkgreenspawn2), GetRectCenterY(udg_Darkgreenspawn2), 90.00)
            endif
            if(IsBrownSpawnOpen())then // Brown
                call CreateUnit(Player(16), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Brownspawn), GetRectCenterY(udg_Brownspawn), 270.00)
                call CreateUnit(Player(16), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Brownspawn2), GetRectCenterY(udg_Brownspawn2), 270.00)
            endif
            if(IsMaroonSpawnOpen())then // Maroon
                call CreateUnit(Player(16), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Maroonspawn), GetRectCenterY(udg_Maroonspawn), 270.00)
                call CreateUnit(Player(16), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Maroonspawn2), GetRectCenterY(udg_Maroonspawn2), 270.00)
            endif
            call TriggerSleepAction( 0.50 )
            set i = i + 1
        endloop
    endfunction

    private function SpawnCreeps takes nothing returns nothing
        local boolean IsAirWave = AirWave()

        call DisplayTextToForce(GetPlayersAll(), "Level " + I2S(udg_CreepLevel) + " - " + udg_CreepNames[udg_CreepLevel])

        if(IsAirWave)then
            set udg_Spawnamount = 10 // Was 15
        elseif(MinibossWave())then
            set udg_Spawnamount = 4
        elseif(BossWave())then
            set udg_Spawnamount = 1
        else
            set udg_Spawnamount = 10 // Was 20
        endif

        if(udg_CreepLevel == 35)then
            call SetTimeOfDay(0.00)
            call SetWaterBaseColorBJ(100, 33.00, 33.00, 0)
        endif
        

        call StartSpawning()
    endfunction

    private function AddCreepAbilities takes nothing returns nothing
        local integer i = 0
        loop
            exitwhen i > udg_CurrentCreepAbilitiesSize
            call UnitAddAbilityBJ(udg_CurrentCreepAbilities[i], GetEnteringUnit())
            call SetUnitAbilityLevelSwapped(udg_CurrentCreepAbilities[i], GetEnteringUnit(), udg_CreepLevel )
            set i = i + 1 
        endloop
    endfunction

    private function SpawnAction takes integer checkpoint returns nothing
        call SaveIntegerBJ(checkpoint, GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable)
        call IssuePointOrder(GetEnteringUnit(), "move", GetRectCenterX(udg_Checkpoints[checkpoint]), GetRectCenterY(udg_Checkpoints[checkpoint]))
        call AddCreepAbilities()
    endfunction

    private function RedSpawnAction takes nothing returns nothing
        call SpawnAction(1)
    endfunction

    private function BrownSpawnAction takes nothing returns nothing
        call SpawnAction(27)
    endfunction

    private function MaroonSpawnAction takes nothing returns nothing
        call SpawnAction(29)
    endfunction

    private function BlueSpawnAction takes nothing returns nothing
        call SpawnAction(3)
    endfunction

    private function YellowSpawnAction takes nothing returns nothing
        call SpawnAction(11)
    endfunction

    private function BlueSpawnAction2 takes nothing returns nothing
        call SpawnAction(4)
    endfunction

    private function YellowSpawnAction2 takes nothing returns nothing
        call SpawnAction(12)
    endfunction

    private function TealSpawnAction takes nothing returns nothing
        call SpawnAction(7)
    endfunction

    private function OrangeSpawnAction takes nothing returns nothing
        call SpawnAction(15)
    endfunction

    private function PurpleSpawnAction takes nothing returns nothing
        call SpawnAction(9)
    endfunction


    private function LightblueSpawnAction takes nothing returns nothing
        call SpawnAction(23)
    endfunction

    private function DarkgreenSpawnAction takes nothing returns nothing
        call SpawnAction(25)
    endfunction

    private function GreenSpawnAction takes nothing returns nothing
        call SpawnAction(17)
    endfunction

    private function GreySpawnAction takes nothing returns nothing
        call SpawnAction(21)
    endfunction

    private function PinkSpawnAction takes nothing returns nothing
        call SpawnAction(19)
    endfunction

    private function YellowCheckpointCondition takes nothing returns boolean
        if(WarcraftMaulLibrary_EnteringUnitIsCreep())then
            if(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 11 )then
                return true
            endif
            if(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 12 )then
                return true
            endif
        endif
        
        return false
    endfunction

    private function CheckpointBetweenBlueAndYellowAction takes nothing returns nothing
        if(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 51)then
            call SpawnAction(11)
        else
            call SpawnAction(12)
        endif
    endfunction

    private function CheckpointBetweenBrownAndOrangeAction takes nothing returns nothing
        call SpawnAction(15)
    endfunction

    private function CheckpointBetweenMaroonAndPurpleAction takes nothing returns nothing
        call SpawnAction(9)
    endfunction

    private function YellowCheckpointAction takes nothing returns nothing
        if(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 11)then
            call SpawnAction(13)
        else
            call SpawnAction(14)
        endif
    endfunction

    private function Yellow2CheckpointCondition takes nothing returns boolean
        if(WarcraftMaulLibrary_EnteringUnitIsCreep())then
            if(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 13 )then
                return true
            endif
            if(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 14 )then
                return true
            endif
        endif
        
        return false
    endfunction

    private function Yellow2CheckpointAction takes nothing returns nothing
        if(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 13)then
            call SpawnAction(43)
        else
            call SaveIntegerBJ(50, GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable)
            call IssuePointOrder(GetEnteringUnit(), "move", GetRectCenterX(udg_Checkpoints[43]), GetRectCenterY(udg_Checkpoints[43]))
            call AddCreepAbilities()
        endif
    endfunction

    private function YellowTeleportCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif

        if(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 43)then
            return true
        endif

        if(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 50)then
            return true
        endif

        return false
    endfunction

    private function LightblueTeleportCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 46))then
            return false
        endif
        return true
    endfunction

    private function DarkgreenTeleportCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 48))then
            return false
        endif
        return true
    endfunction

    private function RedTeleportCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not (LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 36))then
            return false
        endif

        return true
    endfunction

    private function TeleportEnteringUnit takes integer checkpoint, real facing returns nothing
        local real x = GetRectCenterX(udg_Checkpoints[checkpoint])
        local real y = GetRectCenterY(udg_Checkpoints[checkpoint])

        call SaveIntegerBJ(checkpoint, GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable)
        call SetUnitPosition(GetEnteringUnit(), x, y)
        call SetUnitFacing(GetEnteringUnit(), facing)
        call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportCaster.mdl", x, y))
    endfunction

    private function RedTeleportAction takes nothing returns nothing
        call TeleportEnteringUnit(35, 270.00)
    endfunction

    private function YellowRightTeleportAction takes nothing returns nothing
        call TeleportEnteringUnit(45, 90.00)
    endfunction

    private function LightblueTeleportAction takes nothing returns nothing
        call TeleportEnteringUnit(47, 270.0)
    endfunction

    private function DarkgreenTeleportAction takes nothing returns nothing
        call TeleportEnteringUnit(49, 270.00)
    endfunction

    private function YellowLeftTeleportAction takes nothing returns nothing
        call TeleportEnteringUnit(44, 90.00)
    endfunction

    private function YellowTeleportAction takes nothing returns nothing
        if(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 43)then
            call YellowLeftTeleportAction()
        else
            call YellowRightTeleportAction()
        endif
    endfunction

    private function OrangeTeleportAction takes nothing returns nothing
        call TeleportEnteringUnit(38, 0.00)
    endfunction

    private function TealTeleportAction takes nothing returns nothing
        call TeleportEnteringUnit(40, 270.00)
    endfunction

    private function PurpleTeleportAction takes nothing returns nothing
        call TeleportEnteringUnit(42, 180.00)
    endfunction

    private function RedCheckpointCondition takes nothing returns boolean
        if not(WarcraftMaulLibrary_EnteringUnitIsCreep()) then
            return false
        endif
        if not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 1 ) then
            return false
        endif
        return true
    endfunction

    private function MorningPerson takes nothing returns nothing
        call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl", GetUnitX(GetEnteringUnit()), GetUnitY(GetEnteringUnit())))
        call SetUnitLifePercentBJ(GetEnteringUnit(), GetUnitLifePercent(GetEnteringUnit()) + 0.50 * udg_CreepLevel)
    endfunction

    private function CheckpointAction takes integer destinationid returns nothing
        call SaveIntegerBJ(destinationid, GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable)
        call IssuePointOrder(GetEnteringUnit(), "move", GetRectCenterX(udg_Checkpoints[destinationid]), GetRectCenterY(udg_Checkpoints[destinationid]))
        if(UnitHasBuffBJ(GetEnteringUnit(), 'B028')) then
            call MorningPerson()
        endif
    endfunction

    private function RedCheckpointAction takes nothing returns nothing
        call CheckpointAction(2)
    endfunction

    private function Red2CheckpointCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 2 ))then
            return false
        endif
        return true
    endfunction

    private function Red2CheckpointAction takes nothing returns nothing
        call CheckpointAction(36)
    endfunction

    private function TealTeleportCondition takes nothing returns boolean
        if not(WarcraftMaulLibrary_EnteringUnitIsCreep()) then
            return false
        endif

        if not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 39) then
            return false
        endif

        return true
    endfunction

    private function PurpleTeleportCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 41 ))then
            return false
        endif
        return true
    endfunction

    private function OrangeTeleportCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 37 ))then
            return false
        endif
        return true
    endfunction

    private function OrangeCheckpointCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 15 ))then
            return false
        endif
        return true
    endfunction

    private function OrangeCheckpointAction takes nothing returns nothing
        call CheckpointAction(16)
    endfunction

    private function Orange2CheckpointCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 16 ))then
            return false
        endif
        return true
    endfunction

    private function Orange2CheckpointAction takes nothing returns nothing
        call CheckpointAction(37)
    endfunction

    private function BlueCheckpointCondition takes nothing returns boolean
        if(WarcraftMaulLibrary_EnteringUnitIsCreep())then
            if(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 3)then
                return true
            endif
            if(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 4)then
                return true
            endif
        endif

        return false
    endfunction

    private function BlueCheckpointAction takes nothing returns nothing
        if(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 3)then
            call CheckpointAction(5)
        else
            call CheckpointAction(6)
        endif
    endfunction

    private function Blue2CheckpointCondition takes nothing returns boolean
        if(WarcraftMaulLibrary_EnteringUnitIsCreep())then
            if(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 5)then
                return true
            endif
            if(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 6)then
                return true
            endif
        endif

        return false
    endfunction

    private function Blue2CheckpointAction takes nothing returns nothing
        if(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 5)then
            call CheckpointAction(50)
        else
            call CheckpointAction(51)
        endif
    endfunction

    private function TealCheckpointCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 7 ))then
            return false
        endif
        return true
    endfunction

    private function TealCheckpointAction takes nothing returns nothing
        call CheckpointAction(8)
    endfunction

    private function Teal2CheckpointCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 8 ))then
            return false
        endif
        return true
    endfunction

    private function Teal2CheckpointAction takes nothing returns nothing
        call CheckpointAction(39)
    endfunction

    private function TeleportDestinationAction takes integer checkpoint returns nothing
        call SaveIntegerBJ(checkpoint, GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable )
        call IssuePointOrder(GetEnteringUnit(), "move", GetRectCenterX(udg_Checkpoints[checkpoint]), GetRectCenterY(udg_Checkpoints[checkpoint]))
    endfunction

    private function OrangeTeleportDestAction takes nothing returns nothing
        call TeleportDestinationAction(17)
    endfunction

    private function TealTeleportDestAction takes nothing returns nothing
        call TeleportDestinationAction(29)
    endfunction

    private function PurpleTeleportDestAction takes nothing returns nothing
        call TeleportDestinationAction(19)
    endfunction

    private function GreenCheckpointCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 17 ))then
            return false
        endif
        return true
    endfunction

    private function DarkgreenTeleportDestAction takes nothing returns nothing
        call TeleportDestinationAction(9)
    endfunction

    private function LightblueTeleportDestAction takes nothing returns nothing
        call TeleportDestinationAction(15)
    endfunction

    private function YellowTeleportDestAction takes nothing returns nothing
        call TeleportDestinationAction(23)
    endfunction

    private function Yellow2TeleportDestAction takes nothing returns nothing
        call TeleportDestinationAction(25)
    endfunction

    private function RedTeleportDestAction takes nothing returns nothing
        call TeleportDestinationAction(27)
    endfunction

    private function GreyTeleportAction takes nothing returns nothing
        call TeleportDestinationAction(21)
    endfunction

    private function GreenCheckpointAction takes nothing returns nothing
        call CheckpointAction(18)
    endfunction

    private function TealTeleportDestCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 40 ))then
            return false
        endif
        return true
    endfunction

    private function PurpleTeleportDestCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 42 ))then
            return false
        endif
        return true
    endfunction

    private function OrangeTeleportDestCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 38 ))then
            return false
        endif
        return true
    endfunction

    private function LightblueTeleportDestCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 47 ))then
            return false
        endif
        return true
    endfunction

    private function DarkgreenTeleportDestCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 49 ))then
            return false
        endif
        return true
    endfunction

    private function YellowTeleportDestCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 44 ))then
            return false
        endif
        return true
    endfunction

    private function Yellow2TeleportDestCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 45 ))then
            return false
        endif
        return true
    endfunction

    private function RedTeleportDestCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 35 ))then
            return false
        endif
        return true
    endfunction

    private function GreyTeleportCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 34 ))then
            return false
        endif
        return true
    endfunction

    private function GreenTeleportCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 32 ))then
            return false
        endif
        return true
    endfunction

    private function Green2CheckpointCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 18 ))then
            return false
        endif
        return true
    endfunction

    private function GreenTeleportAction takes nothing returns nothing
        call TeleportEnteringUnit(34, 270.00)
    endfunction

    private function Green2CheckpointAction takes nothing returns nothing
        call CheckpointAction(32)
    endfunction

    private function BrownCheckpointCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 27))then
            return false
        endif
        return true
    endfunction

    private function BrownCheckpointAction takes nothing returns nothing
        call CheckpointAction(28)
    endfunction

    private function Brown2CheckpointCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 28))then
            return false
        endif
        return true
    endfunction

    private function Brown2CheckpointAction takes nothing returns nothing
        call CheckpointAction(15)
    endfunction

    private function MaroonCheckpointCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 29))then
            return false
        endif
        return true
    endfunction

    private function MaroonCheckpointAction takes nothing returns nothing
        call CheckpointAction(30)
    endfunction

    private function Maroon2CheckpointCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 30))then
            return false
        endif
        return true
    endfunction

    private function Maroon2CheckpointAction takes nothing returns nothing
        call CheckpointAction(9)
    endfunction

    private function PurpleCheckpointCondition takes nothing returns boolean
        if not(WarcraftMaulLibrary_EnteringUnitIsCreep()) then
            return false
        endif

        if not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 9) then
            return false
        endif

        return true
    endfunction

    private function PurpleCheckpointAction takes nothing returns nothing
        call CheckpointAction(10)
    endfunction

    private function Purple2CheckpointCondition takes nothing returns boolean
        if not(WarcraftMaulLibrary_EnteringUnitIsCreep()) then
            return false
        endif

        if not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 10) then
            return false
        endif

        return true
    endfunction

    private function Purple2CheckpointAction takes nothing returns nothing
        call CheckpointAction(41)
    endfunction

    private function Darkgreen2CheckpointCondition takes nothing returns boolean
        if not(WarcraftMaulLibrary_EnteringUnitIsCreep()) then
            return false
        endif

        if(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 26)then
            return true
        endif

        return false
    endfunction

    private function Darkgreen2CheckpointAction takes nothing returns nothing
        call CheckpointAction(48)
    endfunction

    private function GreyCheckpointCondition takes nothing returns boolean
        if not(WarcraftMaulLibrary_EnteringUnitIsCreep()) then
            return false
        endif
        if not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 21 ) then
            return false
        endif
        return true
    endfunction

    private function GreyCheckpointAction takes nothing returns nothing
        call CheckpointAction(22)
    endfunction

    private function Grey2CheckpointCondition takes nothing returns boolean
        if not(WarcraftMaulLibrary_EnteringUnitIsCreep()) then
            return false
        endif
        if not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 22 ) then
            return false
        endif
        return true
    endfunction

    private function Grey2CheckpointAction takes nothing returns nothing
        call CheckpointAction(31)
    endfunction

    private function LightblueCheckpointCondition takes nothing returns boolean
        if not(WarcraftMaulLibrary_EnteringUnitIsCreep()) then
            return false
        endif
        if not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 23 ) then
            return false
        endif
        return true
    endfunction

    private function LightblueCheckpointAction takes nothing returns nothing
        call CheckpointAction(24)
    endfunction

    private function Lightblue2CheckpointCondition takes nothing returns boolean
        if not(WarcraftMaulLibrary_EnteringUnitIsCreep()) then
            return false
        endif
        if not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 24 ) then
            return false
        endif
        return true
    endfunction

    private function Lightblue2CheckpointAction takes nothing returns nothing
        call CheckpointAction(46)
    endfunction

    private function DarkgreenCheckpointCondition takes nothing returns boolean
        if not(WarcraftMaulLibrary_EnteringUnitIsCreep()) then
            return false
        endif
        if not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 25) then
            return false
        endif
        return true
    endfunction

    private function DarkgreenCheckpointAction takes nothing returns nothing
        call CheckpointAction(26)
    endfunction

    private function PinkCheckpointCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 19))then
            return false
        endif
        return true
    endfunction

    private function PinkCheckpointAction takes nothing returns nothing
        call CheckpointAction(20)
    endfunction

    private function PinkTeleportCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 33))then
            return false
        endif
        return true
    endfunction

    private function Pink2CheckpointCondition takes nothing returns boolean
        if(not(WarcraftMaulLibrary_EnteringUnitIsCreep()))then
            return false
        endif
        if(not(LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 20))then
            return false
        endif
        return true
    endfunction

    private function Pink2CheckpointAction takes nothing returns nothing
        call CheckpointAction(33)
    endfunction

    private function PinkTeleportAction takes nothing returns nothing
        call TeleportEnteringUnit(34, 270.00)
    endfunction

    private function PrettifyGameTime takes integer time returns string
        local integer secs = ModuloInteger(time, 60)
        local integer mins = ModuloInteger(time / 60, 60)
        local integer hrs = time / 3600
        local string secsStr = I2S(secs)
        local string minsStr = I2S(mins)
        local string hrsStr = I2S(hrs)
        if(mins < 10)then
            set minsStr = "0" + minsStr
        endif
        if(hrs < 10)then
            set hrsStr = "0" + hrsStr
        endif
        if(secs < 10)then
            set secsStr = "0" + secsStr
        endif

        return "|cFF999999" + hrsStr + ":" + minsStr + ":" + secsStr + "|r"
    endfunction

    private function UnarmoredWave takes nothing returns boolean
        if(udg_CreepLevel == 1)then
            return true
        endif
        if(udg_CreepLevel == 6)then
            return true
        endif
        if(udg_CreepLevel == 9)then
            return true
        endif
        if(udg_CreepLevel == 14)then
            return true
        endif
        if(udg_CreepLevel == 21)then
            return true
        endif
        if(udg_CreepLevel == 29)then
            return true
        endif
        if(udg_CreepLevel == 34)then
            return true
        endif
        return false
    endfunction

    private function LightWave takes nothing returns boolean
        if(udg_CreepLevel == 4)then
            return true
        endif
        if(udg_CreepLevel == 8)then
            return true
        endif
        if(udg_CreepLevel == 11)then
            return true
        endif
        if(udg_CreepLevel == 16)then
            return true
        endif
        if(udg_CreepLevel == 19)then
            return true
        endif
        if(udg_CreepLevel == 23)then
            return true
        endif
        if(udg_CreepLevel == 27)then
            return true
        endif
        if(udg_CreepLevel == 32)then
            return true
        endif
        return false
    endfunction

    private function MediumWave takes nothing returns boolean
        if(udg_CreepLevel == 3)then
            return true
        endif
        if(udg_CreepLevel == 7)then
            return true
        endif
        if(udg_CreepLevel == 12)then
            return true
        endif
        if(udg_CreepLevel == 17)then
            return true
        endif
        if(udg_CreepLevel == 24)then
            return true
        endif
        if(udg_CreepLevel == 28)then
            return true
        endif
        if(udg_CreepLevel == 33)then
            return true
        endif
        return false
    endfunction

    private function HeavyWave takes nothing returns boolean
        if(udg_CreepLevel == 2)then
            return true
        endif
        if(udg_CreepLevel == 5)then
            return true
        endif
        if(udg_CreepLevel == 13)then
            return true
        endif
        if(udg_CreepLevel == 15)then
            return true
        endif
        if(udg_CreepLevel == 20)then
            return true
        endif
        if(udg_CreepLevel == 25)then
            return true
        endif
        if(udg_CreepLevel == 30)then
            return true
        endif
        if(udg_CreepLevel == 32)then
            return true
        endif
        if(udg_CreepLevel == 35)then
            return true
        endif
        return false
    endfunction

    private function FortifiedWave takes nothing returns boolean
        if(udg_CreepLevel == 10)then
            return true
        endif
        if(udg_CreepLevel == 18)then
            return true
        endif
        if(udg_CreepLevel == 22)then
            return true
        endif
        if(udg_CreepLevel == 26)then
            return true
        endif
        if(udg_CreepLevel == 31)then
            return true
        endif
        return false
    endfunction

    private function HeroWave takes nothing returns boolean
        if(udg_CreepLevel == 36)then
            return true
        endif
        return false
    endfunction

    private function UpdateScoreboardForWave takes nothing returns nothing
        call MultiboardSetItemValueBJ( udg_Scoreboard, 1, 1, "Starting in" )

        if(UnarmoredWave())then
            call MultiboardSetItemValueBJ( udg_Scoreboard, 2, 5, udg_CreepTypes[0] )
        elseif(LightWave())then
            call MultiboardSetItemValueBJ( udg_Scoreboard, 2, 5, udg_CreepTypes[1] )
        elseif(MediumWave())then
            call MultiboardSetItemValueBJ( udg_Scoreboard, 2, 5, udg_CreepTypes[2] )
        elseif(HeavyWave())then
            call MultiboardSetItemValueBJ( udg_Scoreboard, 2, 5, udg_CreepTypes[3] )
        elseif(FortifiedWave())then
            call MultiboardSetItemValueBJ( udg_Scoreboard, 2, 5, udg_CreepTypes[4] )
        elseif(HeroWave())then
            call MultiboardSetItemValueBJ( udg_Scoreboard, 2, 5, udg_CreepTypes[5] )
        else
            call MultiboardSetItemValueBJ( udg_Scoreboard, 2, 5, "" )
        endif

        if(AirWave())then
            call MultiboardSetItemValueBJ( udg_Scoreboard, 2, 6, udg_CreepTypes[6] )
        elseif(MinibossWave())then
            call MultiboardSetItemValueBJ( udg_Scoreboard, 2, 6, udg_CreepTypes[7] )
        elseif(BossWave())then
            call MultiboardSetItemValueBJ( udg_Scoreboard, 2, 6, udg_CreepTypes[8] )
        else
            call MultiboardSetItemValueBJ( udg_Scoreboard, 2, 6, "" )
        endif
    endfunction

    private function DefeatAllPlayers takes nothing returns nothing
        local integer i = 0
        loop
            exitwhen i > 12
            call CustomDefeatBJ(Player(i), "Defeat!")
            set i = i + 1
        endloop
    endfunction

    private function ShipEntersDestination takes nothing returns boolean
        if(GetUnitTypeId(GetEnteringUnit()) == 'n05G')then
            return true
        endif

        return false
    endfunction

    private function ShipEntersDestinationAction takes nothing returns nothing
        call RemoveUnit(GetEnteringUnit())
    endfunction

    private function UpdateGameTime takes nothing returns nothing
        if(udg_HasGameEnded)then
            set udg_GameEndTimer = udg_GameEndTimer - 1
            call MultiboardSetItemValueBJ( udg_Scoreboard, 1, 1, "End Time" )
            call MultiboardSetItemValueBJ( udg_Scoreboard, 2, 1, PrettifyGameTime(udg_GameEndTimer) )

            if(udg_GameEndTimer <= 0)then
                call DefeatAllPlayers()
            endif
        else
            set udg_GameTime = udg_GameTime + 1
            if(udg_StartWaveTimer)then
                set udg_StartWaveTimer = false
                set udg_WaveTimer = udg_CreepWaveWaitTime + 1
                call UpdateScoreboardForWave()
            endif
            if(udg_IsWaveInProgress)then
                call MultiboardSetItemValueBJ( udg_Scoreboard, 2, 1, PrettifyGameTime(udg_GameTime) )
            else
                set udg_WaveTimer = udg_WaveTimer - 1
                call MultiboardSetItemValueBJ( udg_Scoreboard, 2, 1, "|cFF999999" + I2S(udg_WaveTimer) + "|r")
            endif
            if(GetBooleanAnd(udg_WaveTimer == 0, not(udg_IsWaveInProgress)))then
                set udg_IsWaveInProgress = true
                call MultiboardSetItemValueBJ( udg_Scoreboard, 1, 1, "Game Time" )
                call SpawnCreeps()
            endif
        endif
    endfunction

    //===========================================================================
    private function Init takes nothing returns nothing
        call MapInit_InitializeVariables()

        set udg_trigger04=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger04,udg_Checkpoints[1])
        call TriggerAddCondition(udg_trigger04,Condition(function RedCheckpointCondition))s
        call TriggerAddAction(udg_trigger04,function RedCheckpointAction)
        set udg_trigger05=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger05,udg_Checkpoints[3])
        call TriggerAddCondition(udg_trigger05,Condition(function BlueCheckpointCondition))
        call TriggerAddAction(udg_trigger05,function BlueCheckpointAction)
        set udg_trigger06=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger06,udg_Checkpoints[7])
        call TriggerAddCondition(udg_trigger06,Condition(function TealCheckpointCondition))
        call TriggerAddAction(udg_trigger06,function TealCheckpointAction)
        set udg_trigger07=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger07,udg_Checkpoints[9])
        call TriggerAddCondition(udg_trigger07,Condition(function PurpleCheckpointCondition))
        call TriggerAddAction(udg_trigger07,function PurpleCheckpointAction)
        set udg_trigger08=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger08,udg_Checkpoints[11])
        call TriggerAddCondition(udg_trigger08,Condition(function YellowCheckpointCondition))
        call TriggerAddAction(udg_trigger08,function YellowCheckpointAction)
        set udg_trigger09=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger09,udg_Checkpoints[15])
        call TriggerAddCondition(udg_trigger09,Condition(function OrangeCheckpointCondition))
        call TriggerAddAction(udg_trigger09,function OrangeCheckpointAction)
        set udg_trigger10=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger10,udg_Checkpoints[17])
        call TriggerAddCondition(udg_trigger10,Condition(function GreenCheckpointCondition))
        call TriggerAddAction(udg_trigger10,function GreenCheckpointAction)
        set udg_trigger11=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger11,udg_Checkpoints[19])
        call TriggerAddCondition(udg_trigger11,Condition(function PinkCheckpointCondition))
        call TriggerAddAction(udg_trigger11,function PinkCheckpointAction)
        set udg_trigger12=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger12,udg_Checkpoints[21])
        call TriggerAddCondition(udg_trigger12,Condition(function GreyCheckpointCondition))
        call TriggerAddAction(udg_trigger12,function GreyCheckpointAction)
        set udg_trigger13=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger13,udg_Checkpoints[23])
        call TriggerAddCondition(udg_trigger13,Condition(function LightblueCheckpointCondition))
        call TriggerAddAction(udg_trigger13,function LightblueCheckpointAction)
        set udg_trigger14=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger14,udg_Checkpoints[25])
        call TriggerAddCondition(udg_trigger14,Condition(function DarkgreenCheckpointCondition))
        call TriggerAddAction(udg_trigger14,function DarkgreenCheckpointAction)
        set udg_trigger15=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger15,udg_Checkpoints[26])
        call TriggerAddCondition(udg_trigger15,Condition(function Darkgreen2CheckpointCondition))
        call TriggerAddAction(udg_trigger15,function Darkgreen2CheckpointAction)
        set udg_trigger16=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger16,udg_Checkpoints[13])
        call TriggerAddCondition(udg_trigger16,Condition(function Yellow2CheckpointCondition))
        call TriggerAddAction(udg_trigger16,function Yellow2CheckpointAction)
        set udg_trigger17=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger17,udg_Checkpoints[24])
        call TriggerAddCondition(udg_trigger17,Condition(function Lightblue2CheckpointCondition))
        call TriggerAddAction(udg_trigger17,function Lightblue2CheckpointAction)
        set udg_trigger18=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger18,udg_Checkpoints[18])
        call TriggerAddCondition(udg_trigger18,Condition(function Green2CheckpointCondition))
        call TriggerAddAction(udg_trigger18,function Green2CheckpointAction)
        set udg_trigger54=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger54,udg_Checkpoints[32])
        call TriggerAddCondition(udg_trigger54,Condition(function GreenTeleportCondition))
        call TriggerAddAction(udg_trigger54,function GreenTeleportAction)
        set udg_trigger78=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger78,udg_Checkpoints[34])
        call TriggerAddCondition(udg_trigger78,Condition(function GreyTeleportCondition))
        call TriggerAddAction(udg_trigger78,function GreyTeleportAction)
        set udg_trigger80=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger80,udg_Checkpoints[35])
        call TriggerAddCondition(udg_trigger80,Condition(function RedTeleportDestCondition))
        call TriggerAddAction(udg_trigger80,function RedTeleportDestAction)
        set udg_trigger81=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger81,udg_Checkpoints[37])
        call TriggerAddCondition(udg_trigger81,Condition(function OrangeTeleportCondition))
        call TriggerAddAction(udg_trigger81,function OrangeTeleportAction)
        set udg_trigger85=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger85,udg_Checkpoints[39])
        call TriggerAddCondition(udg_trigger85,Condition(function TealTeleportCondition))
        call TriggerAddAction(udg_trigger85,function TealTeleportAction)
        set udg_trigger86=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger86,udg_Checkpoints[41])
        call TriggerAddCondition(udg_trigger86,Condition(function PurpleTeleportCondition))
        call TriggerAddAction(udg_trigger86,function PurpleTeleportAction)
        set udg_trigger87=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger87,udg_Checkpoints[43])
        call TriggerAddCondition(udg_trigger87,Condition(function YellowTeleportCondition))
        call TriggerAddAction(udg_trigger87,function YellowTeleportAction)
        set udg_trigger88=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger88,udg_Checkpoints[46])
        call TriggerAddCondition(udg_trigger88,Condition(function LightblueTeleportCondition))
        call TriggerAddAction(udg_trigger88,function LightblueTeleportAction)
        set udg_trigger89=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger89,udg_Checkpoints[48])
        call TriggerAddCondition(udg_trigger89,Condition(function DarkgreenTeleportCondition))
        call TriggerAddAction(udg_trigger89,function DarkgreenTeleportAction)
        set udg_trigger90=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger90,udg_Checkpoints[44])
        call TriggerAddCondition(udg_trigger90,Condition(function YellowTeleportDestCondition))
        call TriggerAddAction(udg_trigger90,function YellowTeleportDestAction)
        set udg_trigger91=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger91,udg_Checkpoints[45])
        call TriggerAddCondition(udg_trigger91,Condition(function Yellow2TeleportDestCondition))
        call TriggerAddAction(udg_trigger91,function Yellow2TeleportDestAction)
        set udg_trigger92=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger92,udg_Checkpoints[49])
        call TriggerAddCondition(udg_trigger92,Condition(function DarkgreenTeleportDestCondition))
        call TriggerAddAction(udg_trigger92,function DarkgreenTeleportDestAction)
        set udg_trigger93=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger93,udg_Checkpoints[47])
        call TriggerAddCondition(udg_trigger93,Condition(function LightblueTeleportDestCondition))
        call TriggerAddAction(udg_trigger93,function LightblueTeleportDestAction)
        set udg_trigger82=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger82,udg_Checkpoints[38])
        call TriggerAddCondition(udg_trigger82,Condition(function OrangeTeleportDestCondition))
        call TriggerAddAction(udg_trigger82,function OrangeTeleportDestAction)
        set udg_trigger83=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger83,udg_Checkpoints[42])
        call TriggerAddCondition(udg_trigger83,Condition(function PurpleTeleportDestCondition))
        call TriggerAddAction(udg_trigger83,function PurpleTeleportDestAction)
        set udg_trigger84=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger84,udg_Checkpoints[40])
        call TriggerAddCondition(udg_trigger84,Condition(function TealTeleportDestCondition))
        call TriggerAddAction(udg_trigger84,function TealTeleportDestAction)
        set udg_trigger19=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger19,udg_Checkpoints[20])
        call TriggerAddCondition(udg_trigger19,Condition(function Pink2CheckpointCondition))
        call TriggerAddAction(udg_trigger19,function Pink2CheckpointAction)
        set udg_trigger77=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger77,udg_Checkpoints[33])
        call TriggerAddCondition(udg_trigger77,Condition(function PinkTeleportCondition))
        call TriggerAddAction(udg_trigger77,function PinkTeleportAction)
        set udg_trigger79=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger79,udg_Checkpoints[36])
        call TriggerAddCondition(udg_trigger79,Condition(function RedTeleportCondition))
        call TriggerAddAction(udg_trigger79,function RedTeleportAction)
        set udg_trigger20=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger20,udg_Checkpoints[22])
        call TriggerAddCondition(udg_trigger20,Condition(function Grey2CheckpointCondition))
        call TriggerAddAction(udg_trigger20,function Grey2CheckpointAction)
        set udg_trigger21=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger21,udg_Checkpoints[28])
        call TriggerAddCondition(udg_trigger21,Condition(function Brown2CheckpointCondition))
        call TriggerAddAction(udg_trigger21,function Brown2CheckpointAction)
        set udg_trigger22=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger22,udg_Checkpoints[27])
        call TriggerAddCondition(udg_trigger22,Condition(function BrownCheckpointCondition))
        call TriggerAddAction(udg_trigger22,function BrownCheckpointAction)
        set udg_trigger23=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger23,udg_Checkpoints[29])
        call TriggerAddCondition(udg_trigger23,Condition(function MaroonCheckpointCondition))
        call TriggerAddAction(udg_trigger23,function MaroonCheckpointAction)
        set udg_trigger53=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger53,udg_Checkpoints[10])
        call TriggerAddCondition(udg_trigger53,Condition(function Purple2CheckpointCondition))
        call TriggerAddAction(udg_trigger53,function Purple2CheckpointAction)
        set udg_trigger55=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger55,udg_Checkpoints[16])
        call TriggerAddCondition(udg_trigger55,Condition(function Orange2CheckpointCondition))
        call TriggerAddAction(udg_trigger55,function Orange2CheckpointAction)
        set udg_trigger69=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger69,udg_Checkpoints[2])
        call TriggerAddCondition(udg_trigger69,Condition(function Red2CheckpointCondition))
        call TriggerAddAction(udg_trigger69,function Red2CheckpointAction)
        set udg_trigger70=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger70,udg_Checkpoints[5])
        call TriggerRegisterEnterRectSimple(udg_trigger70,udg_Checkpoints[6])
        call TriggerAddCondition(udg_trigger70,Condition(function Blue2CheckpointCondition))
        call TriggerAddAction(udg_trigger70,function Blue2CheckpointAction)
        set udg_trigger71=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger71,udg_Checkpoints[8])
        call TriggerAddCondition(udg_trigger71,Condition(function Teal2CheckpointCondition))
        call TriggerAddAction(udg_trigger71,function Teal2CheckpointAction)
        set udg_trigger72=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger72,udg_Checkpoints[30])
        call TriggerAddCondition(udg_trigger72,Condition(function Maroon2CheckpointCondition))
        call TriggerAddAction(udg_trigger72,function Maroon2CheckpointAction)
        set udg_trigger94=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger94,udg_Checkpoints[51])
        call TriggerAddCondition(udg_trigger94,Condition(function CheckpointBetweenBlueAndYellowCondition))
        call TriggerAddAction(udg_trigger94,function CheckpointBetweenBlueAndYellowAction)
        set udg_trigger95=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger95,udg_Checkpoints[53])
        call TriggerAddCondition(udg_trigger95,Condition(function CheckpointBetweenBrownAndOrangeCondition))
        call TriggerAddAction(udg_trigger95,function CheckpointBetweenBrownAndOrangeAction)
        set udg_trigger96=CreateTrigger()
        call TriggerRegisterEnterRectSimple(udg_trigger96,udg_Checkpoints[54])
        call TriggerAddCondition(udg_trigger96,Condition(function CheckpointBetweenMaroonAndPurpleCondition))
        call TriggerAddAction(udg_trigger96,function CheckpointBetweenMaroonAndPurpleAction)

        set udg_trigger24=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger24, udg_Redspawn )
        call TriggerRegisterEnterRectSimple( udg_trigger24, udg_Redspawn2 )
        call TriggerAddCondition(udg_trigger24,Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
        call TriggerAddAction( udg_trigger24, function RedSpawnAction )
        set udg_trigger25=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger25, udg_Bluespawn )
        call TriggerAddCondition(udg_trigger25,Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
        call TriggerAddAction( udg_trigger25, function BlueSpawnAction )
        set udg_trigger26=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger26, udg_Tealspawn )
        call TriggerRegisterEnterRectSimple( udg_trigger26, udg_Tealspawn2 )
        call TriggerAddCondition(udg_trigger26,Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
        call TriggerAddAction( udg_trigger26, function TealSpawnAction )
        set udg_trigger27=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger27, udg_Orangespawn )
        call TriggerRegisterEnterRectSimple( udg_trigger27, udg_Orangespawn2 )
        call TriggerAddCondition(udg_trigger27,Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
        call TriggerAddAction( udg_trigger27, function OrangeSpawnAction )
        set udg_trigger28=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger28, udg_Yellowspawn )
        call TriggerAddCondition(udg_trigger28,Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
        call TriggerAddAction( udg_trigger28, function YellowSpawnAction )
        set udg_trigger29=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger29, udg_Purplespawn )
        call TriggerRegisterEnterRectSimple( udg_trigger29, udg_Purplespawn2 )
        call TriggerAddCondition(udg_trigger29,Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
        call TriggerAddAction( udg_trigger29, function PurpleSpawnAction )
        set udg_trigger30=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger30, udg_Lightbluespawn )
        call TriggerRegisterEnterRectSimple( udg_trigger30, udg_Lightbluespawn2 )
        call TriggerAddCondition(udg_trigger30,Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
        call TriggerAddAction( udg_trigger30, function LightblueSpawnAction )
        set udg_trigger31=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger31, udg_Darkgreenspawn )
        call TriggerRegisterEnterRectSimple( udg_trigger31, udg_Darkgreenspawn2 )
        call TriggerAddCondition(udg_trigger31,Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
        call TriggerAddAction( udg_trigger31, function DarkgreenSpawnAction )
        set udg_trigger32=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger32, udg_Greenspawn )
        call TriggerRegisterEnterRectSimple( udg_trigger32, udg_Greenspawn2 )
        call TriggerAddCondition(udg_trigger32,Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
        call TriggerAddAction( udg_trigger32, function GreenSpawnAction )
        set udg_trigger33=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger33, udg_Greyspawn )
        call TriggerAddCondition(udg_trigger33,Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
        call TriggerAddAction( udg_trigger33, function GreySpawnAction )
        set udg_trigger34=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger34, udg_Pinkspawn )
        call TriggerRegisterEnterRectSimple( udg_trigger34, udg_Pinkspawn2 )
        call TriggerAddCondition(udg_trigger34,Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
        call TriggerAddAction( udg_trigger34, function PinkSpawnAction )
        set udg_trigger35=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger35, udg_Bluespawn2 )
        call TriggerAddCondition(udg_trigger35,Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
        call TriggerAddAction( udg_trigger35, function BlueSpawnAction2 )
        set udg_trigger36=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger36, udg_Yellowspawn2 )
        call TriggerAddCondition(udg_trigger36,Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
        call TriggerAddAction( udg_trigger36, function YellowSpawnAction2 )
        set udg_trigger37=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger37, udg_Brownspawn )
        call TriggerRegisterEnterRectSimple( udg_trigger37, udg_Brownspawn2 )
        call TriggerAddCondition(udg_trigger37,Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
        call TriggerAddAction( udg_trigger37, function BrownSpawnAction )
        set udg_trigger38=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger38, udg_Maroonspawn )
        call TriggerRegisterEnterRectSimple( udg_trigger38, udg_Maroonspawn2 )
        call TriggerAddCondition(udg_trigger38,Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
        call TriggerAddAction( udg_trigger38, function MaroonSpawnAction )

        set udg_trigger39=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger39, udg_Shipcheckpoint )
        call TriggerAddCondition(udg_trigger39,Condition(function WarcraftMaulLibrary_EnteringUnitIsCreep))
        call TriggerAddAction( udg_trigger39, function LoseALife )
        set udg_trigger40=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger40, udg_ShipDestination )
        call TriggerAddCondition(udg_trigger40, Condition(function ShipEntersDestination))
        call TriggerAddAction(udg_trigger40, function ShipEntersDestinationAction)

        set udg_trigger56=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger56, udg_PlayerRestrictionArea[0] )
        call TriggerAddAction(udg_trigger56, function Player1RestrictionAction)
        set udg_trigger57=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger57, udg_PlayerRestrictionArea[1] )
        call TriggerAddAction(udg_trigger57, function Player2RestrictionAction)
        set udg_trigger58=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger58, udg_PlayerRestrictionArea[2] )
        call TriggerAddAction(udg_trigger58, function Player3RestrictionAction)
        set udg_trigger59=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger59, udg_PlayerRestrictionArea[3] )
        call TriggerAddAction(udg_trigger59, function Player4RestrictionAction)
        set udg_trigger60=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger60, udg_PlayerRestrictionArea[4] )
        call TriggerAddAction(udg_trigger60, function Player5RestrictionAction)
        set udg_trigger61=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger61, udg_PlayerRestrictionArea[5] )
        call TriggerAddAction(udg_trigger61, function Player6RestrictionAction)
        set udg_trigger62=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger62, udg_PlayerRestrictionArea[6] )
        call TriggerAddAction(udg_trigger62, function Player7RestrictionAction)
        set udg_trigger63=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger63, udg_PlayerRestrictionArea[7] )
        call TriggerAddAction(udg_trigger63, function Player8RestrictionAction)
        set udg_trigger64=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger64, udg_PlayerRestrictionArea[8] )
        call TriggerAddAction(udg_trigger64, function Player9RestrictionAction)
        set udg_trigger65=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger65, udg_PlayerRestrictionArea[9] )
        call TriggerAddAction(udg_trigger65, function Player10RestrictionAction)
        set udg_trigger66=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger66, udg_PlayerRestrictionArea[10] )
        call TriggerAddAction(udg_trigger66, function Player11RestrictionAction)
        set udg_trigger67=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger67, udg_PlayerRestrictionArea[11] )
        call TriggerAddAction(udg_trigger67, function Player12RestrictionAction)
        set udg_trigger68=CreateTrigger()
        call TriggerRegisterEnterRectSimple( udg_trigger68, udg_PlayerRestrictionArea[12] )
        call TriggerAddAction(udg_trigger68, function Player13RestrictionAction)


        set udg_trigger41 = CreateTrigger(  )
        call TriggerRegisterTimerEventPeriodic( udg_trigger41, 1.00 )
        call TriggerAddAction( udg_trigger41, function UpdateGameTime )
        
        set udg_trigger42=CreateTrigger()
        call TriggerRegisterPlayerStateEvent(udg_trigger42,Player(13),PLAYER_STATE_RESOURCE_FOOD_USED,EQUAL,0.00)
        call TriggerRegisterPlayerStateEvent(udg_trigger42,Player(14),PLAYER_STATE_RESOURCE_FOOD_USED,EQUAL,0.00)
        call TriggerRegisterPlayerStateEvent(udg_trigger42,Player(15),PLAYER_STATE_RESOURCE_FOOD_USED,EQUAL,0.00)
        call TriggerRegisterPlayerStateEvent(udg_trigger42,Player(16),PLAYER_STATE_RESOURCE_FOOD_USED,EQUAL,0.00)
        call TriggerAddCondition( udg_trigger42, Condition( function CreepFoodConditions ) )
        call TriggerAddAction(udg_trigger42,function RoundEnd)
    endfunction

endlibrary