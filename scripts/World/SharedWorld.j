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

endlibrary