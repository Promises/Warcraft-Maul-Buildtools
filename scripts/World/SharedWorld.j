library SharedWorld
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