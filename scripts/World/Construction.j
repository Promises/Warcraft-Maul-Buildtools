library Construction initializer Init requires SharedWorld, ProudmooreOceanmaster, Utility
    globals
        private trigger udg_ConstructionTrigger = null
    endglobals

    private function AddElementalistAbilities takes nothing returns nothing
    local integer rng= GetRandomInt(0, udg_ElementalistAbilitiesSize)
    local integer array nums
    local integer i= 0
    local integer currentability
        
        loop
            exitwhen i > udg_ElementalistAbilitiesSize
            set nums[i]=i
            set i=i + 1
        endloop

        set i=0
        loop
            exitwhen i > 2
            set currentability=GetRandomInt(0, udg_ElementalistAbilitiesSize - i)
            call UnitAddAbilityBJ(udg_ElementalistAbilities[nums[currentability]], GetTriggerUnit())
            // call DisplayTextToForce( GetPlayersAll(), GetAbilityName(udg_ElementalistAbilities[nums[currentability]]) )
            set nums[udg_ElementalistAbilitiesSize - i]=nums[udg_ElementalistAbilitiesSize - i] + nums[currentability]
            set nums[currentability]=nums[udg_ElementalistAbilitiesSize - i] - nums[currentability]
            set nums[udg_ElementalistAbilitiesSize - i]=nums[udg_ElementalistAbilitiesSize - i] - nums[currentability]
            set i=i + 1
        endloop
    endfunction


    public function Marine_Force_Increase takes nothing returns nothing
        call SetUnitAbilityLevelSwapped('A0EJ', GetEnumUnit(), CountUnitsInGroup(udg_MarineGroups[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))]))
    endfunction

    private function InitializeCriticalStrikeGroupConditions takes nothing returns nothing
        if not IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) then
            return
        endif

        if GetFilterUnit() == GetTriggerUnit() then
            return
        endif

        if ( GetUnitAbilityLevel(GetFilterUnit(), 'A0CN') > 0 ) then
            return
        endif

        call UnitAddAbilityBJ('A0CN', GetFilterUnit())
    endfunction

    private function InitializeCriticalStrike takes nothing returns nothing
    local location loc= GetUnitLoc(GetTriggerUnit())
    local group grp= GetUnitsInRangeOfLocMatching(182.00, loc, Condition(function InitializeCriticalStrikeGroupConditions))

        call RemoveLocation(loc)
        call DestroyGroup(grp)
        set loc=null
        set grp=null
    endfunction



    private function displayForOnePlayer takes nothing returns nothing
        local string effectmodel = ""
        local integer i = 0
        

        if (GetTriggerPlayer() == GetLocalPlayer()) then
            set effectmodel = "Doodads\\Cinematic\\DemonFootPrint\\DemonFootPrint0.mdl"
        endif

        call Utility_DisplayMessageToAllPlayers(effectmodel)
        call Utility_DrawTempEffectRectangle(effectmodel,-64.00, 4032.00, 64.00, 4160.00)




    endfunction

    public function setupTowerTriggers takes unit tower returns nothing
        call UnitRemoveAbilityBJ('ARal', tower)
        call displayForOnePlayer()

        if ( GetUnitTypeId(tower) == 'n00A' ) then
            call AddElementalistAbilities()
        elseif ( GetUnitTypeId(tower) == 'n01B' ) then
            call InitializeCriticalStrike()
        elseif ( GetUnitTypeId(tower) == 'h01D' ) then
            if udg_ForestTrollShadowPriest == 0 then
                call EnableTrigger(gg_trg_BattleRoar)
            endif
            set udg_ForestTrollShadowPriest=udg_ForestTrollShadowPriest + 1
        elseif ( GetUnitTypeId(tower) == 'h01F' ) then
            if udg_EarthPandaren == 0 then
                call EnableTrigger(gg_trg_DrunkenHaze)
            endif
            set udg_EarthPandaren=udg_EarthPandaren + 1
        elseif ( GetUnitTypeId(tower) == 'h00R' ) then
            if udg_SacrificialPit == 0 then
                call EnableTrigger(gg_trg_SacrificeDamage)
            endif
            set udg_SacrificialPit=udg_SacrificialPit + 1
        elseif ( GetUnitTypeId(tower) == 'n00N' ) then
            if udg_CorruptedAncientofWar == 0 then
                call EnableTrigger(gg_trg_ForceOfNature)
            endif
            set udg_CorruptedAncientofWar=udg_CorruptedAncientofWar + 1
        elseif ( GetUnitTypeId(tower) == 'e00S' ) then
            if udg_Moonlight == 0 then
                call EnableTrigger(gg_trg_Moonstorm)
            endif
            set udg_Moonlight=udg_Moonlight + 1
        elseif ( GetUnitTypeId(tower) == 'h00W' ) then
            if udg_NerubianBehemoth == 0 then
                call EnableTrigger(gg_trg_CrushedDamage)
            endif
            set udg_NerubianBehemoth=udg_NerubianBehemoth + 1
        elseif ( GetUnitTypeId(tower) == 'h03E' ) then
            if udg_OrcPeon == 0 then
                call EnableTrigger(gg_trg_WorkersUnionOrcPeon)
            endif
            set udg_OrcPeon=udg_OrcPeon + 1
        elseif ( GetUnitTypeId(tower) == 'h03F' ) then
            if udg_HumanPeasant == 0 then
                call EnableTrigger(gg_trg_WorkersUnionHumanPeasant)
            endif
            set udg_HumanPeasant=udg_HumanPeasant + 1
        elseif ( GetUnitTypeId(tower) == 'h03G' ) then
            if udg_NagaSlave == 0 then
                call EnableTrigger(gg_trg_WorkersUnionNagaSlave)
            endif
            set udg_NagaSlave=udg_NagaSlave + 1
        elseif ( GetUnitTypeId(tower) == 'h03I' ) then
            if udg_UndeadAcolyte == 0 then
                call EnableTrigger(gg_trg_WorkersUnionUndeadAcolyte)
            endif
            set udg_UndeadAcolyte=udg_UndeadAcolyte + 1
        elseif ( GetUnitTypeId(tower) == 'h03H' ) then
            if udg_NightElfWisp == 0 then
                call EnableTrigger(gg_trg_WorkersUnionNightElfWisp)
            endif
            set udg_NightElfWisp=udg_NightElfWisp + 1
        elseif ( GetUnitAbilityLevelSwapped('A08X', tower) == 1 ) then
            if udg_FrostAttack == 0 then
                call EnableTrigger(gg_trg_FrostAttack)
            endif
            set udg_FrostAttack=udg_FrostAttack + 1
        elseif ( GetUnitTypeId(tower) == 'n00P' ) then
            if udg_CorruptedTreeofLife == 0 then
                call EnableTrigger(gg_trg_ChainLightningAttack)
            endif
            set udg_CorruptedTreeofLife=udg_CorruptedTreeofLife + 1
        elseif ( GetUnitTypeId(tower) == 'oC60' ) then
            if udg_Wyvern == 0 then
                call EnableTrigger(gg_trg_Wyvern)
            endif
            set udg_Wyvern=udg_Wyvern + 1
        elseif ( GetUnitTypeId(tower) == 'h01J' ) then
            if udg_StormPandaren == 0 then
                call EnableTrigger(gg_trg_DrunkenBrawler)
            endif
            set udg_StormPandaren=udg_StormPandaren + 1
        elseif ( GetUnitTypeId(tower) == 'oC35' ) then
            if udg_OgreWarrior == 0 then
                call EnableTrigger(gg_trg_MassiveBlow)
            endif
            set udg_OgreWarrior=udg_OgreWarrior + 1
        elseif ( GetUnitTypeId(tower) == 'h045' ) then
            if udg_VenomTower == 0 then
                call EnableTrigger(gg_trg_VenomTower)
            endif
            set udg_VenomTower=udg_VenomTower + 1
        elseif ( GetUnitTypeId(tower) == 'e00K' ) then
            if udg_MoonDancer == 0 then
                call EnableTrigger(gg_trg_MoonDancer)
            endif
            set udg_MoonDancer=udg_MoonDancer + 1
        elseif ( GetUnitTypeId(tower) == 'h04Q' ) then
            if udg_CavernDruid == 0 then
                call EnableTrigger(gg_trg_Cavern_Druid_Ability)
            endif
            set udg_CavernDruid=udg_CavernDruid + 1
        elseif ( GetUnitTypeId(tower) == 'h002' ) then
            if udg_Rokhan == 0 then
                call EnableTrigger(gg_trg_Rokhan)
            endif
            set udg_Rokhan=udg_Rokhan + 1
        elseif ( GetUnitTypeId(tower) == 'oC65' ) then
            if udg_WarchiefThrall == 0 then
                call EnableTrigger(gg_trg_WarchiefThrall)
            endif
            set udg_WarchiefThrall=udg_WarchiefThrall + 1
        elseif ( GetUnitTypeId(tower) == 'n05Q' ) then
            if udg_DwarfStatue == 0 then
                call EnableTrigger(gg_trg_DwarfStatue)
            endif
            set udg_DwarfStatue=udg_DwarfStatue + 1
        elseif ( GetUnitTypeId(tower) == 'h01A' ) then
            if udg_VoidCorruptor == 0 then
                call EnableTrigger(gg_trg_VoidCorrupter)
            endif
            set udg_VoidCorruptor=udg_VoidCorruptor + 1
        elseif ( GetUnitTypeId(tower) == 'h00T' ) then
            if udg_VoidBeing == 0 then
                call EnableTrigger(gg_trg_VoidBeing)
            endif
            set udg_VoidBeing=udg_VoidBeing + 1
        elseif ( GetUnitTypeId(tower) == 'o019' ) then
            if udg_AcidSpittingSpider == 0 then
                call EnableTrigger(gg_trg_AcidSpittingSpider)
            endif
            set udg_AcidSpittingSpider=udg_AcidSpittingSpider + 1
        elseif ( GetUnitTypeId(tower) == 'h03W' ) then
            if udg_FelGuard == 0 then
                call EnableTrigger(gg_trg_FelGuard)
            endif
            set udg_FelGuard=udg_FelGuard + 1
        elseif ( GetUnitTypeId(tower) == 'o00L' ) then
            if udg_Mannoroth == 0 then
                call EnableTrigger(gg_trg_Mannoroth)
            endif
            set udg_Mannoroth=udg_Mannoroth + 1
        elseif ( GetUnitTypeId(tower) == 'n00U' ) then
            if udg_SummoningShrine == 0 then
                call EnableTrigger(gg_trg_SummoningShrine)
            endif
            set udg_SummoningShrine=udg_SummoningShrine + 1
        elseif ( GetUnitTypeId(tower) == 'h00G' ) then
            if udg_Warden == 0 then
                call EnableTrigger(gg_trg_Warden)
            endif
            set udg_Warden=udg_Warden + 1
        elseif ( GetUnitTypeId(tower) == 'h00S' ) then
            if udg_Illidan == 0 then
                call EnableTrigger(gg_trg_DemonicIllidan)
            endif
            set udg_Illidan=udg_Illidan + 1
            set udg_CorruptedIllidan=udg_CorruptedIllidan - 1
            if udg_CorruptedIllidan == 0 then
                call DisableTrigger(gg_trg_CorruptedIllidan)
            endif
        elseif ( GetUnitTypeId(tower) == 'eC83' ) then
            if udg_CorruptedIllidan == 0 then
                call EnableTrigger(gg_trg_CorruptedIllidan)
            endif
            set udg_CorruptedIllidan=udg_CorruptedIllidan + 1

        elseif ( GetUnitTypeId(tower) == 'h04M' ) then
            if udg_CavernHermit == 0 then
                call EnableTrigger(gg_trg_CavernHermit)
            endif
            set udg_CavernHermit=udg_CavernHermit + 1
        elseif ( GetUnitTypeId(tower) == 'h04N' ) then
            if udg_CavernTurtle == 0 then
                call EnableTrigger(gg_trg_CavernTurtle)
            endif
            set udg_CavernTurtle=udg_CavernTurtle + 1
        elseif ( GetUnitTypeId(tower) == 'h04O' ) then
            if udg_CavernRevenant == 0 then
                call EnableTrigger(gg_trg_CavernRevenant)
            endif
            set udg_CavernRevenant=udg_CavernRevenant + 1
        elseif ( GetUnitTypeId(tower) == 'n01A' ) then
            if udg_IceTrollJoker == 0 then
                call EnableTrigger(gg_trg_IceTrollJoker)
            endif
            set udg_IceTrollJoker=udg_IceTrollJoker + 1
        elseif ( GetUnitTypeId(tower) == 'o01P' ) then
            if udg_GoblinBlademaster == 0 then
                call EnableTrigger(gg_trg_MirrorImageAttack)
            endif
            set udg_GoblinBlademaster=udg_GoblinBlademaster + 1
        elseif ( GetUnitTypeId(tower) == 'o01R' ) then
            if udg_GoblinMineLayer == 0 then
                call EnableTrigger(gg_trg_GoblinMineLayer)
            endif
            set udg_GoblinMineLayer=udg_GoblinMineLayer + 1
        elseif ( GetUnitTypeId(tower) == 'o01S' ) then
            if udg_GoblinTinker == 0 then
                call EnableTrigger(gg_trg_GoblinTinker)
            endif
            set udg_Magtheridon=udg_Magtheridon + 1
        elseif ( GetUnitTypeId(tower) == 'u01C' ) then
            if udg_Magtheridon == 0 then
                call EnableTrigger(gg_trg_Magtheridon)
            endif
            set udg_Magtheridon=udg_Magtheridon + 1
        elseif ( GetUnitTypeId(tower) == 'hC86' ) then
            call GroupAddUnitSimple(tower, udg_ChimaeraRoost)
        elseif ( GetUnitTypeId(tower) == 'h02H' ) then
            call GroupAddUnitSimple(tower, udg_MarineGroups[GetConvertedPlayerId(GetOwningPlayer(tower))])
            call ForGroupBJ(udg_MarineGroups[GetConvertedPlayerId(GetOwningPlayer(tower))], function Marine_Force_Increase)
        elseif ( GetUnitTypeId(tower) == 'h02J' ) then
            call ProudmooreOceanmaster_Trig_Proudmoore_Oceanmaster_Actions(tower)
        endif

        if ( GetUnitAbilityLevel(tower, 'A031') > 0 ) then
            call SharedWorld_AddToTickArray(tower)
        endif
        if GetUnitAbilityLevel(tower, 'A0A1') > 0 then
            call SharedWorld_AddToEndOfTurnArray(tower)
        endif
        if ( udg_PlayerHasBuilt[GetPlayerId(GetOwningPlayer(tower))] ) then
            set udg_PlayerHasBuilt[GetPlayerId(GetOwningPlayer(tower))]=true
        endif
        if ( GetUnitAbilityLevel(tower, 'A0DY') > 0 ) then
            call SharedWorld_AddToDeathInSpawnArray(tower)
        endif

        call DisableTowers_Trig_Disable_Towers_Add_Actions(tower)
        set tower = null
    endfunction


    private function ContructionFinishedActions takes nothing returns nothing
        call setupTowerTriggers(GetTriggerUnit())
    endfunction

    //===========================================================================
    private function Init takes nothing returns nothing
        set udg_ConstructionTrigger=CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(udg_ConstructionTrigger, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
        call TriggerRegisterAnyUnitEventBJ(udg_ConstructionTrigger, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
        call TriggerAddAction(udg_ConstructionTrigger, function ContructionFinishedActions)
    endfunction


endlibrary