library UnitDies initializer SetupEvents requires SharedWorld
    globals
        private trigger udg_RemoveDeadCreepsTrigger = null
    endglobals

    private function OwnerOfDyingUnitIsCreep takes nothing returns boolean
        if ( GetOwningPlayer(GetDyingUnit()) == Player(13) ) then
            return true
        endif
        if ( GetOwningPlayer(GetDyingUnit()) == Player(14) ) then
            return true
        endif
        if ( GetOwningPlayer(GetDyingUnit()) == Player(15) ) then
            return true
        endif
        if ( GetOwningPlayer(GetDyingUnit()) == Player(16) ) then
            return true
        endif
        return false
    endfunction

    private function UpdateScoreboard takes nothing returns nothing
        local integer playerid = GetPlayerId(GetOwningPlayer(GetKillingUnitBJ()))
        set udg_PlayerKills[playerid] = udg_PlayerKills[playerid] + 1
        if (udg_PlayerScorePosition[playerid] > 0) then
            call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 7 + udg_PlayerScorePosition[playerid], I2S(udg_PlayerKills[playerid]))
        endif
    endfunction

    private function DevourEnemy takes nothing returns nothing
        call BlzSetUnitBaseDamage(GetKillingUnitBJ(), (BlzGetUnitBaseDamage(GetKillingUnitBJ(), 1) + 1), 1)
    endfunction

    private function RockGiantKill takes nothing returns nothing
        local real mana = GetUnitStateSwap(UNIT_STATE_MANA, GetKillingUnitBJ()) + 1.00
        call SetUnitManaBJ(GetKillingUnitBJ(), mana )

        if(mana > 39) then
            call SetUnitManaBJ(GetKillingUnitBJ(), 0.00)
            call ReplaceUnitBJ(GetKillingUnitBJ(), 'h00A', 0)
        endif
    endfunction

    private function Flood takes nothing returns nothing
        local real x = GetUnitX(GetTriggerUnit())
        local real y = GetUnitY(GetTriggerUnit())
        local integer rand = GetRandomInt(0, 359)
        local unit dummyOne = CreateUnit(GetOwningPlayer(GetKillingUnit()), 'u008', x + 10 * CosBJ(rand + 45), y + 10 * SinBJ(rand + 45), 0)
        local unit dummyTwo = CreateUnit(GetOwningPlayer(GetKillingUnit()), 'u008', x + 10 * CosBJ(rand + 135), y + 10 * SinBJ(rand + 135), 0)
        local unit dummyThree = CreateUnit(GetOwningPlayer(GetKillingUnit()), 'u008', x + 10 * CosBJ(rand + 225), y + 10 * SinBJ(rand + 225), 0)
        local unit dummyFour = CreateUnit(GetOwningPlayer(GetKillingUnit()), 'u008', x + 10 * CosBJ(rand + 315), y + 10 * SinBJ(rand + 315), 0)
        call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummyOne)
        call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummyTwo)
        call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummyThree)
        call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummyFour)
        call UnitAddAbilityBJ('A03T', dummyOne)
        call UnitAddAbilityBJ('A03T', dummyTwo)
        call UnitAddAbilityBJ('A03T', dummyThree)
        call UnitAddAbilityBJ('A03T', dummyFour)
        call IssuePointOrder(dummyOne, "carrionswarm", x + 150 * CosBJ(rand + 45), y + 150 * SinBJ(rand + 45))
        call IssuePointOrder(dummyTwo, "carrionswarm", x + 150 * CosBJ(rand + 135), y + 150 * SinBJ(rand + 135))
        call IssuePointOrder(dummyThree, "carrionswarm", x + 150 * CosBJ(rand + 225), y + 150 * SinBJ(rand + 225))
        call IssuePointOrder(dummyFour, "carrionswarm", x + 150 * CosBJ(rand + 315), y + 150 * SinBJ(rand + 315))
        set dummyOne = null
        set dummyTwo = null
        set dummyThree = null
        set dummyFour = null
    endfunction

    private function LootLevelOne takes nothing returns nothing
        local integer rng = GetRandomInt(0, udg_ItemLootLevelOneSize)
        local item tierone = UnitAddItemByIdSwapped(udg_ItemLootLevelOne[rng], GetKillingUnit())
        call SetItemUserData(tierone, rng)
        set tierone = null
    endfunction

    private function DyingUnitIsSpider takes nothing returns boolean
        if (GetUnitTypeId(GetTriggerUnit()) == 'n00X') then
            return true
        endif

        if (GetUnitTypeId(GetTriggerUnit()) == 'n00Y') then
            return true
        endif

        if (GetUnitTypeId(GetTriggerUnit()) == 'n00Z') then
            return true
        endif

        if (GetUnitTypeId(GetTriggerUnit()) == 'n00T') then
            return true
        endif

        return false
    endfunction

    private function PlagueAction takes nothing returns nothing
        local unit dummy = CreateUnit(GetOwningPlayer(GetEnumUnit()), 'u008', GetUnitX(GetDyingUnit()), GetUnitY(GetDyingUnit()), bj_UNIT_FACING)
        call UnitAddAbilityBJ('A0DZ', dummy) // Plague
        call UnitApplyTimedLifeBJ(5.00, 'BTLF', dummy)

        set dummy=null
    endfunction

    private function HandleTowerDeathInSpawn takes nothing returns nothing
        if GetUnitTypeId(GetEnumUnit()) == 'u020' then
            call PlagueAction()
        endif
    endfunction

    private function HandleCreepDeath takes nothing returns nothing
        local integer handleId = GetHandleIdBJ(GetDyingUnit())
        local integer checkpointId = LoadIntegerBJ(handleId, 0, udg_UnitToCheckpointTable)

        call ForGroupBJ(udg_TowerDeathInSpawnGroup[udg_CheckpointNumberToSpawn[checkpointId]], function HandleTowerDeathInSpawn)
        // udg_TowerDeathInSpawnGroup
        if(GetUnitAbilityLevel(GetKillingUnit(), 'A067') > 0) then
            call DevourEnemy()
        endif
        if(GetUnitAbilityLevel(GetKillingUnit(), 'A02T') > 0) then
            call RockGiantKill()
        endif
        if(GetUnitAbilityLevel(GetKillingUnit(), 'A03S') > 0) then
            call Flood()
        endif
        if(GetUnitAbilityLevel(GetKillingUnit(), 'A03G') > 0) then
            if (UnitItemInSlotBJ(GetKillingUnitBJ(), 1) == null) then
                call LootLevelOne()
            endif
        endif

        call SaveIntegerBJ(0, handleId, 0, udg_UnitToCheckpointTable)
        call UpdateScoreboard()
        // call TriggerSleepAction(3.00)
        call RemoveUnit(GetDyingUnit())
    endfunction

    private function RemoveDeadCreeps takes nothing returns nothing
        // call RemoveSavedInteger(udg_UnitToCheckpointTable, GetHandleIdBJ(GetDyingUnit()), 0)
        if OwnerOfDyingUnitIsCreep() then
            call HandleCreepDeath()
        else
            if(DyingUnitIsSpider()) then
                call RemoveUnit(GetDyingUnit())

                return
            endif

            if GetUnitAbilityLevel(GetDyingUnit(), 'A031') > 0 then
                call SharedWorld_RemoveFromTickArray(GetDyingUnit())
            endif
            
            if GetUnitAbilityLevel(GetDyingUnit(), 'A0A1') > 0 then
                call SharedWorld_RemoveFromEndOfTurnArray(GetDyingUnit())
            endif

            if (LoadIntegerBJ(0, GetHandleIdBJ(GetDyingUnit()), udg_PlayerLeavesTable) > 0) then
                call FlushChildHashtableBJ( GetHandleIdBJ(GetDyingUnit()), udg_PlayerLeavesTable )
            endif
        endif
    endfunction

    private function SetupEvents takes nothing returns nothing
        set udg_RemoveDeadCreepsTrigger=CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(udg_RemoveDeadCreepsTrigger, EVENT_PLAYER_UNIT_DEATH)
        call TriggerAddAction(udg_RemoveDeadCreepsTrigger,function RemoveDeadCreeps)
    endfunction



endlibrary