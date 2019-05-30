library MirrorImageAttack initializer Init
	private function Trig_MirrorImageAttack_Conditions takes nothing returns boolean
		if not (GetUnitTypeId(udg_DamageEventSource) == 'o01P') then
			return false
		endif

		if (GetRandomInt(1, 100) > 8) then
			return false
		endif

		return true
	endfunction

	private function Trig_MirrorImageAttack_Actions takes nothing returns nothing
		local unit dummy=CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING )
		call UnitAddAbilityBJ( 'A0D6', dummy ) // MirrorImage
		call IssueImmediateOrderBJ(dummy,"spiritwolf")
		call UnitApplyTimedLifeBJ( 10.00, 'BTLF', dummy )
		set dummy=null
	endfunction

	//===========================================================================
	private function Init takes nothing returns nothing
		set gg_trg_MirrorImageAttack = CreateTrigger(  )
		call TriggerRegisterVariableEvent( gg_trg_MirrorImageAttack, "udg_DamageEvent", EQUAL, 1.00 )
		call TriggerAddCondition( gg_trg_MirrorImageAttack, Condition( function Trig_MirrorImageAttack_Conditions ) )
		call TriggerAddAction( gg_trg_MirrorImageAttack, function Trig_MirrorImageAttack_Actions )
	endfunction

endlibrary