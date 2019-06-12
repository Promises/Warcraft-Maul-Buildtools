library SharedWorld


 	public function AirWave takes nothing returns boolean
        if ( udg_CreepLevel == 5 ) then
            return true
        endif
        if ( udg_CreepLevel == 15 ) then
            return true
        endif
        if ( udg_CreepLevel == 20 ) then
            return true
        endif
        if ( udg_CreepLevel == 25 ) then
            return true
        endif
        if ( udg_CreepLevel == 30 ) then
            return true
        endif
        return false
    endfunction


    public function RemoveFromTickArray takes unit u returns nothing
		call FlushChildHashtableBJ(GetHandleIdBJ(u), udg_TowerTickTable)
		call GroupRemoveUnitSimple(u, udg_TowerTickGroup)
		set u=null
	endfunction

    public function RemoveFromEndOfTurnArray takes unit u returns nothing
		call GroupRemoveUnitSimple(u, udg_TowerEndOfTurnGroup)
		set u=null
	endfunction

	public function AddToTickArray takes unit u returns nothing
			call SaveIntegerBJ(0, 0, GetHandleIdBJ(u), udg_TowerTickTable)
			call GroupAddUnitSimple(u, udg_TowerTickGroup)
			set u=null
		endfunction

	public function AddToEndOfTurnArray takes unit u returns nothing
			// call SaveIntegerBJ(0, 0, GetHandleIdBJ(u), udg_TowerEndOfTurnTable)
			call GroupAddUnitSimple(u, udg_TowerEndOfTurnGroup)
			set u=null
		endfunction

	public function IsCreep takes unit u returns boolean
		if ( GetOwningPlayer(u) == Player(13) ) then
			set u=null
			return true
		endif
		if ( GetOwningPlayer(u) == Player(14) ) then
			set u=null
			return true
		endif
		if ( GetOwningPlayer(u) == Player(15) ) then
			set u=null
			return true
		endif
		if ( GetOwningPlayer(u) == Player(16) ) then
			set u=null
			return true
		endif

		set u=null
		return false
	endfunction

	public function EnteringUnitIsCreep takes nothing returns boolean
		return IsCreep(GetEnteringUnit())
	endfunction

 	public function AddToDeathInSpawnArray takes unit u returns nothing
  		local integer i= 0

		loop
		exitwhen i > 12
			if RectContainsUnit(udg_PlayerRestrictionArea[i], u) then
				set udg_AntiblockPlayerid=i
				call GroupAddUnitSimple(u, udg_TowerDeathInSpawnGroup[i])
				set i=12
			endif
			set i=i + 1
		endloop

		set u=null
	endfunction

	private function GetSellTowerValue takes integer pointvalue,integer handleid returns integer
		if ( LoadIntegerBJ(0, handleid, udg_PlayerLeavesTable) > 0 ) then
			return pointvalue / 2
		endif

		return pointvalue
	endfunction

	public function RemoveFromDeathInSpawnArray takes unit u returns nothing
		local integer i= 0
	  
			  loop
			  exitwhen i > 12
				  if RectContainsUnit(udg_PlayerRestrictionArea[i], u) then
					  set udg_AntiblockPlayerid=i
					  call GroupRemoveUnitSimple(u, udg_TowerDeathInSpawnGroup[i])
					  set i=12
				  endif
				  set i=i + 1
			  endloop
	  
			  set u=null
		  endfunction

	public function RemoveCriticalStrike takes unit u returns nothing
		local location loc= GetUnitLoc(u)
		local group grp= GetUnitsInRangeOfLocAll(182.00, loc)
		local unit target= FirstOfGroup(grp)
	  
			  loop
				  exitwhen target == null
	  
				  call GroupRemoveUnit(grp, target)
	  
				  if ( GetUnitAbilityLevel(target, 'A0CN') > 0 ) then
					  call UnitRemoveAbilityBJ('A0CN', target)
				  endif
	  
				  set target=FirstOfGroup(grp)
			  endloop
			  
	  
			  call RemoveLocation(loc)
			  call DestroyGroup(grp)
			  set loc=null
			  set grp=null
			  set u=null
			  set target=null
		  endfunction

	public function SellTower takes unit u returns nothing
		local integer sellval= GetSellTowerValue(GetUnitPointValue(u) , GetHandleIdBJ(u))
		local texttag txt= CreateTextTagUnitBJ(I2S(sellval), u, 1, 10, 100, 80.00, 0.00, 0)
			  call SetTextTagPermanentBJ(txt, false)
			  call SetTextTagLifespanBJ(txt, 2.00)
			  call SetTextTagVelocityBJ(txt, 64, 90)
			  call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\ResourceItems\\ResourceEffectTarget.mdl", GetUnitX(u), GetUnitY(u)))
			  call PlaySoundOnUnitBJ(udg_GoldSound, 100, u)
			  call AdjustPlayerStateBJ(sellval, GetOwningPlayer(u), PLAYER_STATE_RESOURCE_GOLD)
			  call ShowUnitHide(u)
			  
			  if GetUnitAbilityLevel(u, 'A031') > 0 then
				  call RemoveFromTickArray(u)
			  endif
	  
			  if GetUnitAbilityLevel(u, 'A0A1') > 0 then
				  call RemoveFromEndOfTurnArray(u)
			  endif
	  
			  if GetUnitAbilityLevel(u, 'A0CL') > 0 then
				  call RemoveCriticalStrike(u)
			  endif
	  
			  if GetUnitAbilityLevel(u, 'A0DY') > 0 then
				  call RemoveFromDeathInSpawnArray(u)
			  endif
	  
			  if ( GetUnitTypeId(u) == 'h01D' ) then
				  set udg_ForestTrollShadowPriest=udg_ForestTrollShadowPriest - 1
				  if udg_ForestTrollShadowPriest == 0 then
					  call DisableTrigger(gg_trg_BattleRoar)
				  endif
			  elseif ( GetUnitTypeId(u) == 'h01F' ) then
				  set udg_EarthPandaren=udg_EarthPandaren - 1
				  if udg_EarthPandaren == 0 then
					  call DisableTrigger(gg_trg_DrunkenHaze)
				  endif
			  elseif ( GetUnitTypeId(u) == 'h00R' ) then
				  set udg_SacrificialPit=udg_SacrificialPit - 1
				  if udg_SacrificialPit == 0 then
					  call DisableTrigger(gg_trg_SacrificeDamage)
				  endif
			  elseif ( GetUnitTypeId(u) == 'n00N' ) then
				  set udg_CorruptedAncientofWar=udg_CorruptedAncientofWar - 1
				  if udg_CorruptedAncientofWar == 0 then
					  call DisableTrigger(gg_trg_ForceOfNature)
				  endif
			  elseif ( GetUnitTypeId(u) == 'e00S' ) then
				  set udg_Moonlight=udg_Moonlight - 1
				  if udg_Moonlight == 0 then
					  call DisableTrigger(gg_trg_Moonstorm)
				  endif
			  elseif ( GetUnitTypeId(u) == 'h00W' ) then
				  set udg_NerubianBehemoth=udg_NerubianBehemoth - 1
				  if udg_NerubianBehemoth == 0 then
					  call DisableTrigger(gg_trg_CrushedDamage)
				  endif
			  elseif ( GetUnitTypeId(u) == 'h03E' ) then
				  set udg_OrcPeon=udg_OrcPeon - 1
				  if udg_OrcPeon == 0 then
					  call DisableTrigger(gg_trg_WorkersUnionOrcPeon)
				  endif
			  elseif ( GetUnitTypeId(u) == 'h03F' ) then
				  set udg_HumanPeasant=udg_HumanPeasant - 1
				  if udg_HumanPeasant == 0 then
					  call DisableTrigger(gg_trg_WorkersUnionHumanPeasant)
				  endif
			  elseif ( GetUnitTypeId(u) == 'h03G' ) then
				  set udg_NagaSlave=udg_NagaSlave - 1
				  if udg_NagaSlave == 0 then
					  call DisableTrigger(gg_trg_WorkersUnionNagaSlave)
				  endif
			  elseif ( GetUnitTypeId(u) == 'h03I' ) then
				  set udg_UndeadAcolyte=udg_UndeadAcolyte - 1
				  if udg_UndeadAcolyte == 0 then
					  call DisableTrigger(gg_trg_WorkersUnionUndeadAcolyte)
				  endif
			  elseif ( GetUnitTypeId(u) == 'h03H' ) then
				  set udg_NightElfWisp=udg_NightElfWisp - 1
				  if udg_NightElfWisp == 0 then
					  call DisableTrigger(gg_trg_WorkersUnionNightElfWisp)
				  endif
			  elseif ( GetUnitAbilityLevelSwapped('A08X', u) == 1 ) then
				  set udg_FrostAttack=udg_FrostAttack - 1
				  if udg_FrostAttack == 0 then
					  call DisableTrigger(gg_trg_FrostAttack)
				  endif
			  elseif ( GetUnitTypeId(u) == 'n00P' ) then
				  set udg_CorruptedTreeofLife=udg_CorruptedTreeofLife - 1
				  if udg_CorruptedTreeofLife == 0 then
					  call DisableTrigger(gg_trg_ChainLightningAttack)
				  endif
	  
			  elseif ( GetUnitTypeId(u) == 'oC60' ) then
				  set udg_Wyvern=udg_Wyvern - 1
				  if udg_Wyvern == 0 then
					  call DisableTrigger(gg_trg_Wyvern)
				  endif
			  elseif ( GetUnitTypeId(u) == 'hC55' ) then
				  set udg_Knight=udg_Knight - 1
				  if udg_Knight == 0 then
					  call DisableTrigger(gg_trg_Knight)
				  endif
	  
			  elseif ( GetUnitTypeId(u) == 'h01J' ) then
				  set udg_StormPandaren=udg_StormPandaren - 1
				  if udg_StormPandaren == 0 then
					  call DisableTrigger(gg_trg_DrunkenBrawler)
				  endif
			  elseif ( GetUnitTypeId(u) == 'oC35' ) then
				  set udg_OgreWarrior=udg_OgreWarrior - 1
				  if udg_OgreWarrior == 0 then
					  call DisableTrigger(gg_trg_MassiveBlow)
				  endif
			  elseif ( GetUnitTypeId(u) == 'h045' ) then
				  set udg_VenomTower=udg_VenomTower - 1
				  if udg_VenomTower == 0 then
					  call DisableTrigger(gg_trg_VenomTower)
				  endif
			  elseif ( GetUnitTypeId(u) == 'e00K' ) then
				  set udg_MoonDancer=udg_MoonDancer - 1
				  if udg_MoonDancer == 0 then
					  call DisableTrigger(gg_trg_MoonDancer)
				  endif
			  elseif ( GetUnitTypeId(u) == 'h04Q' ) then
				  set udg_CavernDruid=udg_CavernDruid - 1
				  if udg_CavernDruid == 0 then
					  call DisableTrigger(gg_trg_Cavern_Druid_Ability)
				  endif
			  elseif ( GetUnitTypeId(u) == 'h002' ) then
				  set udg_Rokhan=udg_Rokhan - 1
				  if udg_Rokhan == 0 then
					  call DisableTrigger(gg_trg_Rokhan)
				  endif
			  elseif ( GetUnitTypeId(u) == 'oC65' ) then
				  set udg_WarchiefThrall=udg_WarchiefThrall - 1
				  if udg_WarchiefThrall == 0 then
					  call DisableTrigger(gg_trg_WarchiefThrall)
				  endif
			  elseif ( GetUnitTypeId(u) == 'n05Q' ) then
				  set udg_DwarfStatue=udg_DwarfStatue - 1
				  if udg_DwarfStatue == 0 then
					  call DisableTrigger(gg_trg_DwarfStatue)
				  endif
			  elseif ( GetUnitTypeId(u) == 'h01A' ) then
				  set udg_VoidCorruptor=udg_VoidCorruptor - 1
				  if udg_VoidCorruptor == 0 then
					  call DisableTrigger(gg_trg_VoidCorrupter)
				  endif
			  elseif ( GetUnitTypeId(u) == 'h00T' ) then
				  set udg_VoidBeing=udg_VoidBeing - 1
				  if udg_VoidBeing == 0 then
					  call DisableTrigger(gg_trg_VoidBeing)
				  endif
			  elseif ( GetUnitTypeId(u) == 'o019' ) then
				  set udg_AcidSpittingSpider=udg_AcidSpittingSpider - 1
				  if udg_AcidSpittingSpider == 0 then
					  call DisableTrigger(gg_trg_AcidSpittingSpider)
				  endif
			  elseif ( GetUnitTypeId(u) == 'h03W' ) then
				  set udg_FelGuard=udg_FelGuard - 1
				  if udg_FelGuard == 0 then
					  call DisableTrigger(gg_trg_FelGuard)
				  endif
			  elseif ( GetUnitTypeId(u) == 'o00L' ) then
				  set udg_Mannoroth=udg_Mannoroth - 1
				  if udg_Mannoroth == 0 then
					  call DisableTrigger(gg_trg_Mannoroth)
				  endif
			  elseif ( GetUnitTypeId(u) == 'n00U' ) then
				  set udg_SummoningShrine=udg_SummoningShrine - 1
				  if udg_SummoningShrine == 0 then
					  call DisableTrigger(gg_trg_SummoningShrine)
				  endif
			  elseif ( GetUnitTypeId(u) == 'h00G' ) then
				  set udg_Warden=udg_Warden - 1
				  if udg_Warden == 0 then
					  call DisableTrigger(gg_trg_Warden)
				  endif
			  elseif ( GetUnitTypeId(u) == 'eC83' ) then
				  set udg_Illidan=udg_Illidan - 1
				  if udg_Illidan == 0 then
					  call DisableTrigger(gg_trg_DemonicIllidan)
				  endif
			  elseif ( GetUnitTypeId(u) == 'h00S' ) then
				  set udg_CorruptedIllidan=udg_CorruptedIllidan - 1
				  if udg_CorruptedIllidan == 0 then
					  call DisableTrigger(gg_trg_CorruptedIllidan)
				  endif
			  elseif ( GetUnitTypeId(u) == 'h04M' ) then
				  set udg_CavernHermit=udg_CavernHermit - 1
				  if udg_CavernHermit == 0 then
					  call DisableTrigger(gg_trg_CavernHermit)
				  endif
			  elseif ( GetUnitTypeId(u) == 'h04N' ) then
				  set udg_CavernTurtle=udg_CavernTurtle - 1
				  if udg_CavernTurtle == 0 then
					  call DisableTrigger(gg_trg_CavernTurtle)
				  endif
			  elseif ( GetUnitTypeId(u) == 'h04O' ) then
				  set udg_CavernRevenant=udg_CavernRevenant - 1
				  if udg_CavernRevenant == 0 then
					  call DisableTrigger(gg_trg_CavernRevenant)
				  endif
			  elseif ( GetUnitTypeId(u) == 'n01A' ) then
				  set udg_IceTrollJoker=udg_IceTrollJoker - 1
				  if udg_IceTrollJoker == 0 then
					  call DisableTrigger(gg_trg_IceTrollJoker)
				  endif
			  elseif ( GetUnitTypeId(u) == 'o01P' ) then
				  set udg_GoblinBlademaster=udg_GoblinBlademaster - 1
				  if udg_GoblinBlademaster == 0 then
					  call DisableTrigger(gg_trg_MirrorImageAttack)
				  endif
			  elseif ( GetUnitTypeId(u) == 'o01R' ) then
				  set udg_GoblinMineLayer=udg_GoblinMineLayer - 1
				  if udg_GoblinMineLayer == 0 then
					  call DisableTrigger(gg_trg_GoblinMineLayer)
				  endif
			  elseif ( GetUnitTypeId(u) == 'o01S' ) then
				  set udg_GoblinTinker=udg_GoblinTinker - 1
				  if udg_GoblinTinker == 0 then
					  call DisableTrigger(gg_trg_GoblinTinker)
				  endif
			  elseif ( GetUnitTypeId(u) == 'u01C' ) then
				  set udg_Magtheridon=udg_Magtheridon - 1
				  if udg_Magtheridon == 0 then
					  call DisableTrigger(gg_trg_Magtheridon)
				  endif
			  endif
	  
			  call FlushChildHashtableBJ(GetHandleIdBJ(u), udg_PlayerLeavesTable)
			  
			  call RemoveUnit(u)
			  set txt=null
			  set u=null
		  endfunction

endlibrary