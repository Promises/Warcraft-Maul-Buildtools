library ForceOfNature initializer Init

	private function Trig_ForceOfNature_Conditions takes nothing returns boolean
		if not UnitHasBuffBJ(udg_DamageEventTarget, 'B005') then
			return false
		endif

		if udg_DamageEventAmount < GetUnitStateSwap(UNIT_STATE_LIFE, udg_DamageEventTarget) then
			return false
		endif

		if GetRandomInt(1, 100) > 75 then
			return false
		endif

		return true
	endfunction

	private function Trig_ForceOfNature_Actions takes nothing returns nothing
		local unit dummy=CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u005', GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget), bj_UNIT_FACING )
		call UnitApplyTimedLifeBJ( 10.00, 'BTLF', dummy )
		set dummy=null
	endfunction

	//===========================================================================
	private function Init takes nothing returns nothing
		set gg_trg_ForceOfNature = CreateTrigger(  )
		call TriggerRegisterVariableEvent( gg_trg_ForceOfNature, "udg_DamageEvent", EQUAL, 1.00 )
		call TriggerAddCondition( gg_trg_ForceOfNature, Condition( function Trig_ForceOfNature_Conditions ) )
		call TriggerAddAction( gg_trg_ForceOfNature, function Trig_ForceOfNature_Actions )
	endfunction

endlibrary