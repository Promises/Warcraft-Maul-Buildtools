library FrostAttack initializer Init

	private function Trig_FrostAttack_Conditions takes nothing returns boolean
		if not (GetUnitAbilityLevelSwapped('A08X', udg_DamageEventSource) > 0) then
			return false
		endif

		if UnitHasBuffBJ(udg_DamageEventTarget, 'B017') then
			return false
		endif

		return true
	endfunction

	private function Trig_FrostAttack_Actions takes nothing returns nothing
		local unit dummy=CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget), bj_UNIT_FACING )
		call UnitAddAbilityBJ( 'A02U', dummy ) // Slow
		call IssueTargetOrderBJ(dummy, "slow", udg_DamageEventTarget)
		call UnitApplyTimedLifeBJ( 1.00, 'BTLF', dummy )
		set dummy=null
	endfunction

	//===========================================================================
	private function Init takes nothing returns nothing
		set gg_trg_FrostAttack = CreateTrigger(  )
		call TriggerRegisterVariableEvent( gg_trg_FrostAttack, "udg_DamageEvent", EQUAL, 1.00 )
		call TriggerAddCondition( gg_trg_FrostAttack, Condition( function Trig_FrostAttack_Conditions ) )
		call TriggerAddAction( gg_trg_FrostAttack, function Trig_FrostAttack_Actions )
	endfunction



endlibrary