library CorruptedIllidan initializer Init

	function Trig_CorruptedIllidan_Conditions takes nothing returns boolean
		if not udg_IsDamageSpell then
			return false
		endif

		if not (GetUnitTypeId(udg_DamageEventSource) == 'eC83') then
			return false
		endif

		return true
	endfunction

	function Trig_CorruptedIllidan_Actions takes nothing returns nothing
		local unit u = CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING)
		call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
		call UnitAddAbilityBJ('A0BZ', u)
		call IssueTargetOrderBJ(u, "soulburn", udg_DamageEventTarget)

		set u = null
	endfunction

	//===========================================================================
	function InitTrig_CorruptedIllidan takes nothing returns nothing
		set gg_trg_CorruptedIllidan = CreateTrigger()
		call TriggerRegisterVariableEvent(gg_trg_CorruptedIllidan, "udg_DamageEvent", EQUAL, 1.00)
		call TriggerAddCondition(gg_trg_CorruptedIllidan, Condition( function Trig_CorruptedIllidan_Conditions))
		call TriggerAddAction(gg_trg_CorruptedIllidan, function Trig_CorruptedIllidan_Actions)
	endfunction
endlibrary
