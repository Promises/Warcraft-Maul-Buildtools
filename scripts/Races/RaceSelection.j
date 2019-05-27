library RaceSelection initializer InitRaceTrigger requires Utility

    globals
        private trigger udg_RaceSelectTrigger = null
    endglobals

    private function GetArrayIdFromItemSoldId takes nothing returns integer
        if ( GetItemTypeId(GetSoldItem()) == 'I01A' ) then // Worker's Union
            return 33
        elseif ( GetItemTypeId(GetSoldItem()) == 'I001' ) then // Demon Portal
            return 1
        elseif ( GetItemTypeId(GetSoldItem()) == 'I002' ) then // Undead Necropolis
            return 2
        elseif ( GetItemTypeId(GetSoldItem()) == 'I003' ) then // Aviaries
            return 3
        elseif ( GetItemTypeId(GetSoldItem()) == 'I004' ) then // High Elf Barracks
            return 4
        elseif ( GetItemTypeId(GetSoldItem()) == 'I005' ) then // Chaos Orc Barracks
            return 5
        elseif ( GetItemTypeId(GetSoldItem()) == 'I006' ) then // Human Town Hall
            return 6
        elseif ( GetItemTypeId(GetSoldItem()) == 'I007' ) then // Orc Stronghold
            return 7
        elseif ( GetItemTypeId(GetSoldItem()) == 'I025' ) then // High Elf Farm
            return 8
        elseif ( GetItemTypeId(GetSoldItem()) == 'I009' ) then // Giant's Hall
            return 9
        elseif ( GetItemTypeId(GetSoldItem()) == 'I027' ) then // The Unique
            return 10
        elseif ( GetItemTypeId(GetSoldItem()) == 'I00B' ) then // The Summons
            return 11
        elseif ( GetItemTypeId(GetSoldItem()) == 'I00C' ) then // Arachnid Hive
            return 12
        elseif ( GetItemTypeId(GetSoldItem()) == 'I00D' ) then // Dranei Haven
            return 13
        elseif ( GetItemTypeId(GetSoldItem()) == 'I00E' ) then // Dragons
            return 14
        elseif ( GetItemTypeId(GetSoldItem()) == 'I00F' ) then // Night Elf
            return 15
        elseif ( GetItemTypeId(GetSoldItem()) == 'I024' ) then // Elementalists
            return 16
        elseif ( GetItemTypeId(GetSoldItem()) == 'I00H' ) then // Tavern
            return 17
        elseif ( GetItemTypeId(GetSoldItem()) == 'I00I' ) then // Corrupted Night Elves
            return 18
        elseif ( GetItemTypeId(GetSoldItem()) == 'I00J' ) then // Goblins
            return 19
        elseif ( GetItemTypeId(GetSoldItem()) == 'I000' ) then // Caerbannog
            return 21
        elseif ( GetItemTypeId(GetSoldItem()) == 'I00L' ) then // Critters UNITE
            return 22
        elseif ( GetItemTypeId(GetSoldItem()) == 'I00M' ) then // Gnoll Republic
            return 23
        elseif ( GetItemTypeId(GetSoldItem()) == 'I019' ) then // Void Cult
            return 24
        elseif ( GetItemTypeId(GetSoldItem()) == 'I00P' ) then // Alliance Of Blades
            return 25
        elseif ( GetItemTypeId(GetSoldItem()) == 'I00Q' ) then // Cavernous Creatures
            return 26
        elseif ( GetItemTypeId(GetSoldItem()) == 'I00O' ) then // Forest Troll Hut
            return 27
        elseif ( GetItemTypeId(GetSoldItem()) == 'I00R' ) then // Ice Troll Hut
            return 28
        elseif ( GetItemTypeId(GetSoldItem()) == 'I00T' ) then // Temple Of The Damned
            return 30
        elseif ( GetItemTypeId(GetSoldItem()) == 'I00U' ) then // Dwarven Mine
            return 31
        elseif ( GetItemTypeId(GetSoldItem()) == 'I00Z' ) then // Galaxy
            return 32
        elseif ( GetItemTypeId(GetSoldItem()) == 'I02D' ) then // Loot boxer
            return 34
        elseif ( GetItemTypeId(GetSoldItem()) == 'I026' ) then // Shrine of Buffs
            return 35

        endif
        
        return - 1
    endfunction

    private function GiveBuyingPlayerBuilderWithId takes integer id returns nothing
        local real x = GetRectCenterX(udg_PlayerRestrictionArea[GetPlayerId(GetOwningPlayer(GetBuyingUnit()))])
        local real y = GetRectCenterY(udg_PlayerRestrictionArea[GetPlayerId(GetOwningPlayer(GetBuyingUnit()))])

        if(id == 'h02T') then // Void
            set udg_VoidCultBuilder[GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit()))] = CreateUnit(GetOwningPlayer(GetBuyingUnit()), id, x, y, bj_UNIT_FACING)
            call UnitAddItemByIdSwapped( 'I01Y', udg_VoidCultBuilder[GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit()))] )
            call UnitAddItemByIdSwapped( 'I01Z', udg_VoidCultBuilder[GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit()))] )
            call UnitAddItemByIdSwapped( 'I020', udg_VoidCultBuilder[GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit()))] )
            call UnitAddItemByIdSwapped( 'I01X', udg_VoidCultBuilder[GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit()))] )
        elseif(id == 'u043') then // Loot Boxer
            set udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetLastCreatedUnit()))] = CreateUnit(GetOwningPlayer(GetBuyingUnit()), id, x, y, bj_UNIT_FACING)
        else
            call CreateUnit(GetOwningPlayer(GetBuyingUnit()), id, x, y, bj_UNIT_FACING)
        endif

    endfunction

    private function IsIndexDisabled takes integer indx returns boolean
        if(indx == 20)then
            return true
        endif
        if(indx == 29)then
            return true
        endif
        if(indx == 34)then
            return true
        endif
        return false
    endfunction

    private function PlayerAlreadyHasRace takes integer r returns boolean
    local integer i = 0
    loop
        exitwhen i > udg_PlayerRaceCounter
        if(udg_PlayerRaceSelection[i] == r) then
            return true
        endif
        set i = i + 1
    endloop

    return false
    endfunction

    private function HardcoreRandomRace takes nothing returns nothing
        local integer Rng = GetRandomInt(0, udg_RacesCount)

        if(IsIndexDisabled(Rng))then
            call HardcoreRandomRace()
            return
        endif
        
        if(PlayerAlreadyHasRace(Rng))then
            call HardcoreRandomRace()
            return
        endif

        set udg_PlayerRaceSelection[udg_PlayerRaceCounter] = Rng
        set udg_PlayerRaceCounter = udg_PlayerRaceCounter + 1
        call GiveBuyingPlayerBuilderWithId(udg_RaceArray[Rng])
        call DisplayTextToForce( GetPlayersAll(), udg_PlayerColorCodes[GetPlayerId(GetOwningPlayer(GetBuyingUnit()))] + GetPlayerName(GetOwningPlayer(GetBuyingUnit())) + "|r has |cFFF13737ha|r|cFFF04C36rd|r|cFFEF6334co|r|cFFEF7833re|r randomed " + udg_RaceNameArray[Rng])
    endfunction

    private function RandomRace takes nothing returns nothing
        local integer Rng = GetRandomInt(0, udg_RacesCount)

        if(IsIndexDisabled(Rng))then
            call RandomRace()
            return
        endif
        
        if(PlayerAlreadyHasRace(Rng))then
            call RandomRace()
            return
        endif
        
        set udg_PlayerRaceSelection[udg_PlayerRaceCounter] = Rng
        set udg_PlayerRaceCounter = udg_PlayerRaceCounter + 1
        call GiveBuyingPlayerBuilderWithId(udg_RaceArray[Rng])
        call DisplayTextToForce( GetPlayersAll(), udg_PlayerColorCodes[GetPlayerId(GetOwningPlayer(GetBuyingUnit()))] + GetPlayerName(GetOwningPlayer(GetBuyingUnit())) + "|r has |cFF375FF1ra|r|cFF364CF0nd|r|cFF3535EFom|r|cFF4A34EFed|r " + udg_RaceNameArray[Rng])
    endfunction

    private function HybridRandomRace takes integer playerid returns nothing
        local integer TierOne = GetRandomInt(0, udg_TierOneSize)
        local integer TierTwo = GetRandomInt(0, udg_TierTwoSize)
        local integer TierThree = GetRandomInt(0, udg_TierThreeSize)
        local integer TierFour = GetRandomInt(0, udg_TierFourSize)
        local integer TierFive = GetRandomInt(0, udg_TierFiveSize)
        local integer TierSix = GetRandomInt(0, udg_TierSixSize)
        local integer TierSeven = GetRandomInt(0, udg_TierSevenSize)
        local integer TierEight = GetRandomInt(0, udg_TierEightSize)
        local integer TierNine = GetRandomInt(0, udg_TierNineSize)
        local integer i = 0
        local real x = GetRectCenterX(udg_PlayerRestrictionArea[playerid])
        local real y = GetRectCenterY(udg_PlayerRestrictionArea[playerid])
        local unit Builder
        local unit BuilderTwo
        if not(udg_HasHybridRandomed[playerid]) then
            set Builder = CreateUnit(Player(playerid), 'e00I', x, y, 0.0)
        endif
        set udg_HasHybridRandomed[playerid] = true

        loop
            exitwhen i > udg_TierOneSize
            if(i != TierOne)then
                call SetPlayerUnitAvailableBJ( udg_TierOneTowers[i], false, Player(playerid) )
            else
                call SetPlayerUnitAvailableBJ( udg_TierOneTowers[i], true, Player(playerid) )
            endif
            set i = i + 1
        endloop

        set i = 0
        loop
            exitwhen i > udg_TierTwoSize
            if(i != TierTwo)then
                call SetPlayerUnitAvailableBJ( udg_TierTwoTowers[i], false, Player(playerid) )
            else
                call SetPlayerUnitAvailableBJ( udg_TierTwoTowers[i], true, Player(playerid) )
            endif
            set i = i + 1
        endloop

        set i = 0
        loop
            exitwhen i > udg_TierThreeSize
            if(i != TierThree)then
                call SetPlayerUnitAvailableBJ( udg_TierThreeTowers[i], false, Player(playerid) )
            else
                call SetPlayerUnitAvailableBJ( udg_TierThreeTowers[i], true, Player(playerid) )
            endif
            set i = i + 1
        endloop

        set i = 0
        loop
            exitwhen i > udg_TierFourSize
            if(i != TierFour)then
                call SetPlayerUnitAvailableBJ( udg_TierFourTowers[i], false, Player(playerid) )
            else
                call SetPlayerUnitAvailableBJ( udg_TierFourTowers[i], true, Player(playerid) )
            endif
            set i = i + 1
        endloop

        set i = 0
        loop
            exitwhen i > udg_TierFiveSize
            if(i != TierFive)then
                call SetPlayerUnitAvailableBJ( udg_TierFiveTowers[i], false, Player(playerid) )
            else
                call SetPlayerUnitAvailableBJ( udg_TierFiveTowers[i], true, Player(playerid) )
            endif
            set i = i + 1
        endloop

        set i = 0
        loop
            exitwhen i > udg_TierSixSize
            if(i != TierSix)then
                call SetPlayerUnitAvailableBJ( udg_TierSixTowers[i], false, Player(playerid) )
            else
                call SetPlayerUnitAvailableBJ( udg_TierSixTowers[i], true, Player(playerid) )
            endif
            set i = i + 1
        endloop

        set i = 0
        loop
            exitwhen i > udg_TierSevenSize
            if(i != TierSeven)then
                call SetPlayerUnitAvailableBJ( udg_TierSevenTowers[i], false, Player(playerid) )
            else
                call SetPlayerUnitAvailableBJ( udg_TierSevenTowers[i], true, Player(playerid) )
            endif
            set i = i + 1
        endloop

        set i = 0
        loop
            exitwhen i > udg_TierEightSize
            if(i != TierEight)then
                call SetPlayerUnitAvailableBJ( udg_TierEightTowers[i], false, Player(playerid) )
            else
                call SetPlayerUnitAvailableBJ( udg_TierEightTowers[i], true, Player(playerid) )
            endif
            set i = i + 1
        endloop

        set i = 0
        loop
            exitwhen i > udg_TierNineSize
            if(i != TierNine)then
                call SetPlayerUnitAvailableBJ( udg_TierNineTowers[i], false, Player(playerid) )
            else
                call SetPlayerUnitAvailableBJ( udg_TierNineTowers[i], true, Player(playerid) )
            endif
            set i = i + 1
        endloop

        call DisplayTextToForce( GetPlayersAll(), udg_PlayerColorCodes[GetPlayerId(GetOwningPlayer(GetBuyingUnit()))] + GetPlayerName(GetOwningPlayer(GetBuyingUnit())) + "|r has |cFFB0F442hy|r|cFF8CF442b|r|cFF42F4C5r|r|cFF42F4F1id|r randomed!")

        set Builder=null
        set BuilderTwo=null
    endfunction

    private function GetSelectedRace takes nothing returns nothing
        local integer RaceIndex = GetArrayIdFromItemSoldId()

        if(RaceIndex > 0)then
            set udg_PlayerRaceSelection[udg_PlayerRaceCounter] = RaceIndex
            set udg_PlayerRaceCounter = udg_PlayerRaceCounter + 1
            call GiveBuyingPlayerBuilderWithId(udg_RaceArray[RaceIndex])
            call DisplayTextToForce( GetPlayersAll(), udg_PlayerColorCodes[GetPlayerId(GetOwningPlayer(GetBuyingUnit()))] + GetPlayerName(GetOwningPlayer(GetBuyingUnit())) + "|r has chosen " + udg_RaceNameArray[RaceIndex])
        endif
    endfunction

    private function OpenSpawnForPlayer takes integer i returns nothing
        local integer l = StringHash(GetPlayerName(Player(i)))
        if true then
            set udg_IsSpawnOpen[i] = 1
        endif
    endfunction

    private function RaceSelectionActions takes nothing returns nothing
        local integer playerid = GetPlayerId(GetOwningPlayer(GetBuyingUnit()))
        call OpenSpawnForPlayer(playerid)
        if (GetItemTypeId(GetSoldItem()) == 'I00W') then // Hardcore random
            if (udg_HasHybridRandomed[playerid]) then
                call AdjustPlayerStateBJ( 1, GetOwningPlayer(GetBuyingUnit()), PLAYER_STATE_RESOURCE_LUMBER )
                call Utility_DisplayMessageToPlayer("You can only use Hybrid Random!", playerid)
            else
                if(not(udg_HasHardcoreRandomed[playerid]))then
                    if(udg_RepickCounter[playerid] == 0)then
                        set udg_HasHardcoreRandomed[playerid] = true
                        call HardcoreRandomRace()
                        call AdjustPlayerStateBJ( 50, GetOwningPlayer(GetBuyingUnit()), PLAYER_STATE_RESOURCE_GOLD )
                    else
                        call AdjustPlayerStateBJ( 1, GetOwningPlayer(GetBuyingUnit()), PLAYER_STATE_RESOURCE_LUMBER )
                        call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "You can't hardcore random after using normal random!")
                    endif
                else
                    call AdjustPlayerStateBJ( 1, GetOwningPlayer(GetBuyingUnit()), PLAYER_STATE_RESOURCE_LUMBER )
                endif
            endif
        elseif (GetItemTypeId(GetSoldItem()) == 'I00V') then // Normal Random
            if(udg_HasHybridRandomed[playerid])then
                call AdjustPlayerStateBJ( 1, GetOwningPlayer(GetBuyingUnit()), PLAYER_STATE_RESOURCE_LUMBER )
                call Utility_DisplayMessageToPlayer("You can only use Hybrid Random!", playerid)
            else
                if(udg_RepickCounter[playerid] < 3)then
                    set udg_RepickCounter[playerid] = udg_RepickCounter[playerid] + 1
                endif
                call AdjustPlayerStateBJ( 40 - 10 * udg_RepickCounter[playerid], GetOwningPlayer(GetBuyingUnit()), PLAYER_STATE_RESOURCE_GOLD )
                call RandomRace()
            endif
        elseif(GetItemTypeId(GetSoldItem()) == 'I00X')then // Hybrid Random
            if(GetBooleanAnd(GetBooleanOr(udg_RepickCounter[playerid] == 0, udg_HasHardcoreRandomed[playerid]), not(udg_HasNormalPicked[playerid])))then
                call HybridRandomRace(playerid)
                call AdjustPlayerStateBJ( 50, GetOwningPlayer(GetBuyingUnit()), PLAYER_STATE_RESOURCE_GOLD )
            else
                call AdjustPlayerStateBJ( 1, GetOwningPlayer(GetBuyingUnit()), PLAYER_STATE_RESOURCE_LUMBER )
                call Utility_DisplayMessageToPlayer("You can't hybrid random after using normal / hardcore random / selection!", playerid)
            endif
        else
            if(udg_HasHybridRandomed[playerid])then
                call AdjustPlayerStateBJ( 1, GetOwningPlayer(GetBuyingUnit()), PLAYER_STATE_RESOURCE_LUMBER )
                call Utility_DisplayMessageToPlayer("You can only use Hybrid Random!", playerid)
            else
                set udg_HasNormalPicked[playerid] = true
                call GetSelectedRace()
            endif
        endif
    endfunction

    private function RaceSelectionConditions takes nothing returns boolean
        if(GetUnitTypeId(GetSellingUnit()) == 'h03Q')then
            return true
        endif
        if(GetUnitTypeId(GetSellingUnit()) == 'h00H')then
            return true
        endif
        if(GetUnitTypeId(GetSellingUnit()) == 'h00O')then
            return true
        endif
        if(GetUnitTypeId(GetSellingUnit()) == 'h03C')then
            return true
        endif
        if(GetUnitTypeId(GetSellingUnit()) == 'h03K')then
            return true
        endif
        return false
    endfunction


    private function InitRaceTrigger takes nothing returns nothing
        set udg_RaceSelectTrigger=CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(udg_RaceSelectTrigger,EVENT_PLAYER_UNIT_SELL_ITEM)
        call TriggerAddCondition(udg_RaceSelectTrigger,Condition(function RaceSelectionConditions))
        call TriggerAddAction(udg_RaceSelectTrigger,function RaceSelectionActions)

    endfunction

endlibrary