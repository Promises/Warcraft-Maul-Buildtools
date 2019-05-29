library DemonicIllidan initializer Init
	function Trig_Illidan_Conditions takes nothing returns boolean
		if not udg_IsDamageSpell then
			return false
		endif

		if not (GetUnitTypeId(udg_DamageEventSource) == 'h00S') then
			return false
		endif

		return true
	endfunction

	function Trig_Illidan_Actions takes nothing returns nothing
		local unit u = CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget), bj_UNIT_FACING)
		call UnitApplyTimedLifeBJ(4.00, 'BTLF', u)
		call UnitAddAbilityBJ('A0BZ', u)
		call IssueTargetOrderBJ(u, "soulburn", udg_DamageEventTarget)
		set u = null
	endfunction

	//===========================================================================
	function Init takes nothing returns nothing
		set gg_trg_DemonicIllidan = CreateTrigger()
		call TriggerRegisterVariableEvent(gg_trg_DemonicIllidan, "udg_DamageEvent", EQUAL, 1.00)
		call TriggerAddCondition(gg_trg_DemonicIllidan, Condition( function Trig_Illidan_Conditions))
		call TriggerAddAction(gg_trg_DemonicIllidan, function Trig_Illidan_Actions)
	endfunction

endlibrary