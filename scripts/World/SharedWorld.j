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

endlibrary