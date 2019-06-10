library MapInit requires Utility
function InitializePlayers takes nothing returns nothing
	local integer i = 0
	loop
		exitwhen i > 12
		if(GetPlayerSlotState(Player(i))==PLAYER_SLOT_STATE_PLAYING)then
			set udg_PlayerCount = udg_PlayerCount + 1
			call CreateFogModifierRectBJ(true, Player(i), FOG_OF_WAR_VISIBLE, GetPlayableMapRect())
			call SetPlayerAllianceStateBJ(Player(i), Player(13), bj_ALLIANCE_UNALLIED)
			call SetPlayerAllianceStateBJ(Player(i), Player(14), bj_ALLIANCE_UNALLIED)
			call SetPlayerAllianceStateBJ(Player(i), Player(15), bj_ALLIANCE_UNALLIED)
			call SetPlayerAllianceStateBJ(Player(i), Player(16), bj_ALLIANCE_UNALLIED)
			if(i == 8) then
				call SetPlayerStateBJ(Player(i), PLAYER_STATE_RESOURCE_GOLD, 150)
			else
				call SetPlayerStateBJ(Player(i), PLAYER_STATE_RESOURCE_GOLD, 100)
			endif
   			call SetPlayerStateBJ(Player(i), PLAYER_STATE_RESOURCE_LUMBER, 1)
		endif
		set i = i + 1
	endloop

	if (udg_DebugMode) then
		call CreateUnit(Player(0), 'e00B', 0.00, 0.00, bj_UNIT_FACING)
	endif 
endfunction

function InitializeTeleports takes nothing returns nothing
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n017', 0.00, -970.00, bj_UNIT_FACING)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n017', -4400.00, 4737.00, bj_UNIT_FACING)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n017', 4400.00, 4737.00, bj_UNIT_FACING)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n017', -2176.00, 700.00, bj_UNIT_FACING)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n017', 2176.00, 700.00, bj_UNIT_FACING)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n017', -4400.00, -2500.00, bj_UNIT_FACING)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n017', 4400.00, -2500.00, bj_UNIT_FACING)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n017', 1950.00, -3500.00, bj_UNIT_FACING)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n017', -1950.00, -3500.00, bj_UNIT_FACING)
endfunction

function MakeSpecificCheckpointBuildable takes integer i returns nothing
	local real locX = GetRectCenterX(udg_Checkpoints[i])
	local real locY = GetRectCenterY(udg_Checkpoints[i])
	local integer x = -48
	local integer y = -48
	loop
		exitwhen x > 48
		loop
			exitwhen y > 48
			call SetTerrainPathable(locX + x, locY + y, PATHING_TYPE_BUILDABILITY, true)
			set y = y + 32
		endloop
		set y = -48
		set x = x + 32
	endloop
endfunction

function MakeCheckpointsBuildable takes nothing returns nothing
	local integer i = 1
	loop
		exitwhen i > 30
		call MakeSpecificCheckpointBuildable(i)
		set i = i + 1
	endloop
endfunction

function PreloadCreepAbilities takes nothing returns nothing
	local integer i = 0
	local unit u = CreateUnit(Player(bj_PLAYER_NEUTRAL_EXTRA), 'uloc', 0, 0, 0)

	loop
	exitwhen i == udg_CreepAbilitiesSize
		call UnitAddAbility(u, udg_CreepAbilities[i])
	set i = i + 1
	endloop

	call UnitAddAbilityBJ('A06B', u)

	call RemoveUnit(u)
	set u = null
endfunction

	public function DisplayMessageToPlayer takes string msg, integer playerid returns nothing
		call DisplayTimedTextToPlayer(Player(playerid), 0, 0, 5, msg )
	endfunction



function InitializeTowerTierArrays takes nothing returns nothing
	
	
endfunction

function TowerTimeout_Done takes nothing returns nothing
	local integer i = 0
	// Do whatever after the "Wait"
	call DestroyTimer(GetExpiredTimer())
	call InitializeTowerTierArrays()
endfunction

function TowerTimeout takes nothing returns nothing
	local timer T = CreateTimer()
	// Instead of "Wait 1.0 seconds"
	call TimerStart(T, 1.0, false, function TowerTimeout_Done)
	// "false" means "one-shot timer"
endfunction


function InitializeNeutralPassiveCreeps takes nothing returns nothing
	local unit array NeutralUnits
	local integer i = 0
	set NeutralUnits[0] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'u006', 1664.0, 3072.0, 270.0)
	set NeutralUnits[1] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'hC04', 1792.0, 3072.0, 270.0)
	set NeutralUnits[2] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'eC05', 1920.0, 3072.0, 270.0)
	set NeutralUnits[3] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'hC16', 2048.0, 3072.0, 270.0)
	set NeutralUnits[4] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC17', 2176.0, 3072.0, 270.0)
	set NeutralUnits[5] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC29', 1664.0, 2944.0, 270.0)
	set NeutralUnits[6] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'o01C', 1792.0, 2944.0, 270.0)
	set NeutralUnits[7] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC30', 1920.0, 2944.0, 270.0)
	set NeutralUnits[8] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'oC31', 2048.0, 2944.0, 270.0)
	set NeutralUnits[9] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC33', 2176.0, 2944.0, 270.0)
	set NeutralUnits[10] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n008', 1664.0, 2816.0, 270.0)
	set NeutralUnits[11] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'eC38', 1792.0, 2816.0, 270.0)
	set NeutralUnits[12] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC39', 1920.0, 2816.0, 270.0)
	set NeutralUnits[13] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC40', 2048.0, 2816.0, 270.0)
	set NeutralUnits[14] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC41', 2176.0, 2816.0, 270.0)
	set NeutralUnits[15] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC42', 1664.0, 2688.0, 270.0)
	set NeutralUnits[16] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'uC43', 1792.0, 2688.0, 270.0)
	set NeutralUnits[17] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'hC44', 1920.0, 2688.0, 270.0)
	set NeutralUnits[18] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'uC45', 2048.0, 2688.0, 270.0)
	set NeutralUnits[19] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n004', 2176.0, 2688.0, 270.0)
	set NeutralUnits[20] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'hC48', 1664.0, 2560.0, 270.0)
	set NeutralUnits[21] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'oC47', 1792.0, 2560.0, 270.0)
	set NeutralUnits[22] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC49', 1920.0, 2560.0, 270.0)
	set NeutralUnits[23] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC50', 2048.0, 2560.0, 270.0)
	set NeutralUnits[24] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC51', 2176.0, 2560.0, 270.0)
	set NeutralUnits[25] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC69', 1664.0, 2432.0, 270.0)
	set NeutralUnits[26] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'eC52', 1792.0, 2432.0, 270.0)
	set NeutralUnits[27] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'oC70', 1920.0, 2432.0, 270.0)
	set NeutralUnits[28] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'hC95', 2048.0, 2432.0, 270.0)
	set NeutralUnits[29] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'uC71', 2176.0, 2432.0, 270.0)
	set NeutralUnits[30] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'hC76', 1664.0, 2304.0, 270.0)
	set NeutralUnits[31] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'h03Y', 1792.0, 2304.0, 270.0)
	set NeutralUnits[32] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'h03Z', 1920.0, 2304.0, 270.0)
	set NeutralUnits[33] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'h040', 2048.0, 2304.0, 270.0)

	loop
		exitwhen i > 33
		call SetUnitInvulnerable(NeutralUnits[i], true)
		call PauseUnit(NeutralUnits[i], true)
		set i = i + 1
	endloop
endfunction


public function InitializeVariables takes nothing returns nothing
	local rect bluerect = Rect(-64.00, 4032.00, 64.00, 4160.00)
	local rect bluerect2 = Rect(-64.00, 2880.00, 64.00, 3008.00)
	local rect yellowrect = Rect(-32.00, 992.00, 32.00, 1056.00)
	local rect yellowrect2 = Rect(-32.00, -160.00, 32.00, -96.00)
	local rect yellowInSpawnCheckpoint = Rect(-64, 1920, 64, 2016)
	local rect yellowTeleport = Rect(-32.00, -928.00, 32.00, -864.00)
    
	// TEST
	// RED
	set udg_Redtestregions[0] = Rect(-4160.0, 5440.0, -1856.0, 5504.0) // Long top
	set udg_Redtestregions[1] = Rect(-1856.0, 5024.0, -1792.0, 5440.0) // Spawn top
	set udg_Redtestregions[2] = Rect(-4160.0, 3968.0, -1856.0, 4032.0) // Long bottom
	set udg_Redtestregions[3] = Rect(-1856.0, 4032.0, -1792.0, 4416.0) // Spawn bottom
	set udg_Redtestregions[4] = Rect(-4224.0, 3968.0, -4160.0, 4672.0) // Left bottom
	set udg_Redtestregions[5] = Rect(-4224.0, 4768.0, -4160.0, 5440.0) // Left top
	
	// Circle 1
	set udg_Redtestregions[6] = Rect(-3552.0, 4672.0, -2464.0, 4800.0) // Left
	set udg_Redtestregions[7] = Rect(-2496.0, 4768.0, -2368.0, 5440.0) // Up
	set udg_Redtestregions[8] = Rect(-2400.0, 4672.0, -1856.0, 4800.0) // Right
	set udg_Redtestregions[9] = Rect(-2496.0, 4032.0, -2368.0, 4704.0) // Down
	
	// Circle 2
	set udg_Redtestregions[10] = Rect(-3648.0, 4032.0, -3520.0, 4704.0) // Down
	set udg_Redtestregions[11] = Rect(-4192.0, 4672.0, -3616.0, 4800.0) // Left
	set udg_Redtestregions[12] = Rect(-3648.0, 4768.0, -3520.0, 5440.0) // Up
	
	// Checkpoint 1
	set udg_Redtestregions[13] = Rect(-2496.0, 4736.0, -2432.0, 4800.0) // UL
	set udg_Redtestregions[14] = Rect(-2432.0, 4736.0, -2368.0, 4800.0) // UR
	set udg_Redtestregions[15] = Rect(-2432.0, 4672.0, -2368.0, 4736.0) // LR
	set udg_Redtestregions[16] = Rect(-2496.0, 4672.0, -2432.0, 4736.0) // LL
	
	// Checkpoint 2
	set udg_Redtestregions[17] = Rect(-3648.0, 4736.0, -3584.0, 4800.0) // UL
	set udg_Redtestregions[18] = Rect(-3584.0, 4736.0, -3520.0, 4800.0) // UR
	set udg_Redtestregions[19] = Rect(-3584.0, 4672.0, -3520.0, 4736.0) // LR
	set udg_Redtestregions[20] = Rect(-3648.0, 4672.0, -3584.0, 4736.0) // LL

	// BLUE
	set udg_Redtestregions[21] = Rect(-768.0, 2304.0, -704.0, 4672.0) // Long left
	set udg_Redtestregions[22] = Rect(-768.0, 4672.0, -320.0, 4736.0) // Spawn top left
	set udg_Redtestregions[23] = Rect(704.0, 2304.0, 768.0, 4672.0) // Long right
	set udg_Redtestregions[24] = Rect(320.0, 4672.0, 768.0, 4736.0) // Spawn top right
	set udg_Redtestregions[25] = Rect(160.0, 2304.0, 704.0, 2368.0) // Exit right
	set udg_Redtestregions[26] = Rect(-704.0, 2304.0, -160.0, 2368.0) // Exit left
	
	// Circle 1
	set udg_Redtestregions[27] = Rect(-64.0, 2976.0, 64.0, 4064.0) // Down
	set udg_Redtestregions[28] = Rect(-704.0, 4032.0, -32.0, 4160.0) // Left
	set udg_Redtestregions[29] = Rect(-64.0, 4128.0, 64.0, 4704.0) // Up
	set udg_Redtestregions[30] = Rect(32.0, 4032.0, 704.0, 4160.0) // Right
	
	// Circle 2
	set udg_Redtestregions[31] = Rect(32.0, 2880.0, 704.0, 3008.0) // Right
	set udg_Redtestregions[32] = Rect(-64.0, 2336.0, 64.0, 2912.0) // Down
	set udg_Redtestregions[33] = Rect(-704.0, 2880.0, -32.0, 3008.0) // Up
	
	// Checkpoint 1
	set udg_Redtestregions[34] = Rect(-64.0, 4096.0, 0.0, 4160.0) // UL
	set udg_Redtestregions[35] = Rect(0.0, 4096.0, 64.0, 4160.0) // UR
	set udg_Redtestregions[36] = Rect(0.0, 4032.0, 64.0, 4096.0) // LR
	set udg_Redtestregions[37] = Rect(-64.0, 4032.0, 0.0, 4096.0) // LL
	
	// Checkpoint 2
	set udg_Redtestregions[38] = Rect(-64.0, 2944.0, 0.0, 3008.0) // UL
	set udg_Redtestregions[39] = Rect(0.0, 2944.0, 64.0, 3008.0) // UR
	set udg_Redtestregions[40] = Rect(0.0, 2880.0, 64.0, 2944.0) // LR
	set udg_Redtestregions[41] = Rect(-64.0, 2880.0, 0.0, 2944.0) // LL

	// TEAL
	set udg_Redtestregions[42] = Rect(1856.0, 5440.0, 4160.0, 5504.0) // Long top
	set udg_Redtestregions[43] = Rect(4160.0, 4800.0, 4224.0, 5504.0) // Spawn top
	set udg_Redtestregions[44] = Rect(1856.0, 3968.0, 4160.0, 4032.0) // Long bottom
	set udg_Redtestregions[45] = Rect(4160.0, 3968.0, 4224.0, 4704.0) // Spawn bottom
	set udg_Redtestregions[46] = Rect(1792.0, 3968.0, 1856.0, 4384.0) // Left bottom
	set udg_Redtestregions[47] = Rect(1792.0, 5056.0, 1856.0, 5504.0) // Left top
	
	// Circle 1
	set udg_Redtestregions[48] = Rect(2464.0, 4672.0, 3552.0, 4800.0) // Right
	set udg_Redtestregions[49] = Rect(2368.0, 4032.0, 2496.0, 4704.0) // Down
	set udg_Redtestregions[50] = Rect(1824.0, 4672.0, 2400.0, 4800.0) // Left
	set udg_Redtestregions[51] = Rect(2368.0, 4768.0, 2496.0, 5440.0) // Up
	
	// Circle 2
	set udg_Redtestregions[52] = Rect(3520.0, 4768.0, 3648.0, 5440.0) // Up
	set udg_Redtestregions[53] = Rect(3616.0, 4672.0, 4160.0, 4800.0) // Right
	set udg_Redtestregions[54] = Rect(3520.0, 4032.0, 3648.0, 4704.0) // Down
	
	// Checkpoint 1
	set udg_Redtestregions[55] = Rect(2368.0, 4736.0, 2432.0, 4800.0) // UL
	set udg_Redtestregions[56] = Rect(2432.0, 4736.0, 2496.0, 4800.0) // UR
	set udg_Redtestregions[57] = Rect(2432.0, 4672.0, 2496.0, 4736.0) // LR
	set udg_Redtestregions[58] = Rect(2368.0, 4672.0, 2432.0, 4736.0) // LL
	
	// Checkpoint 2
	set udg_Redtestregions[59] = Rect(3520.0, 4736.0, 3584.0, 4800.0) // UL
	set udg_Redtestregions[60] = Rect(3584.0, 4736.0, 3648.0, 4800.0) // UR
	set udg_Redtestregions[61] = Rect(3584.0, 4672.0, 3648.0, 4736.0) // LR
	set udg_Redtestregions[62] = Rect(3520.0, 4672.0, 3584.0, 4736.0) // LL

	// Purple	
	set udg_Redtestregions[63] = Rect(3584.0, -2304.0, 3648.0, 64.0) // Long left
	set udg_Redtestregions[64] = Rect(3585.0, 64.0, 4032.0, 128.0) // Spawn top left
	set udg_Redtestregions[65] = Rect(5056.0, -2304.0, 5156.0, 64.0) // Long right
	set udg_Redtestregions[66] = Rect(4672.0, 64.0, 5120.0, 128.0) // Spawn top right
	set udg_Redtestregions[67] = Rect(4384.0, -2304.0, 5056.0, -2240.0) // Exit right
	set udg_Redtestregions[68] = Rect(3648.0, -2304.0, 4320.0, -2240.0) // Exit left
	
	// Circle 1
	set udg_Redtestregions[69] = Rect(4288.0, -1632.0, 4416.0, -544.0) // Down
	set udg_Redtestregions[70] = Rect(3648.0, -576.0, 4320.0, -448.0) // Left
	set udg_Redtestregions[71] = Rect(4288.0, -480.0, 4416.0, 96.0) // Up
	set udg_Redtestregions[72] = Rect(4384.0, -576.0, 5056.0, -448.0) // Right
	
	// Circle 2
	set udg_Redtestregions[73] = Rect(4384.0, -1728.0, 5056.0, -1600.0) // Right
	set udg_Redtestregions[74] = Rect(4288.0, -2272.0, 4416.0, -1696.0) // Down
	set udg_Redtestregions[75] = Rect(3648.0, -1728.0, 4320.0, -1600.0) // Up
	
	// Checkpoint 1
	set udg_Redtestregions[76] = Rect(4288.0, -512.0, 4352.0, -448.0) // UL
	set udg_Redtestregions[77] = Rect(4352.0, -512.0, 4416.0, -448.0) // UR
	set udg_Redtestregions[78] = Rect(4352.0, -576.0, 4416.0, -512.0) // LR
	set udg_Redtestregions[79] = Rect(4288.0, -576.0, 4352.0, -512.0) // LL
	
	// Checkpoint 2
	set udg_Redtestregions[80] = Rect(4288.0, -1664.0, 4352.0, -1600.0) // UL
	set udg_Redtestregions[81] = Rect(4352.0, -1664.0, 4416.0, -1600.0) // UR
	set udg_Redtestregions[82] = Rect(4352.0, -1728.0, 4416.0, -1664.0) // LR
	set udg_Redtestregions[83] = Rect(4288.0, -1728.0, 4352.0, -1664.0) // LL

	// Yellow
	set udg_Redtestregions[84] = Rect(-768.0, -768.0, -704.0, 1600.0) // Long left
	set udg_Redtestregions[85] = Rect(-768.0, 1600.0, -320.0, 1664.0) // Spawn top left
	set udg_Redtestregions[86] = Rect(704.0, -768.0, 768.0, 1600.0) // Long right
	set udg_Redtestregions[87] = Rect(320.0, 1600.0, 768.0, 1664.0) // Spawn top right
	set udg_Redtestregions[88] = Rect(32.0, -768.0, 736.0, -704.0) // Exit right
	set udg_Redtestregions[89] = Rect(-704.0, -768.0, -32.0, -704.0) // Exit left

	// Circle 1
	set udg_Redtestregions[90] = Rect(-64.0, -96.0, 64.0, 992.0) // Down
	set udg_Redtestregions[91] = Rect(-704.0, 960.0, -32.0, 1088.0) // Left
	set udg_Redtestregions[92] = Rect(-64.0, 1056.0, 64.0, 1632.0) // Up
	set udg_Redtestregions[93] = Rect(32.0, 960.0, 704.0, 1088.0) // Right
	
	// Circle 2
	set udg_Redtestregions[94] = Rect(32.0, -192.0, 704.0, -64.0) // Right
	set udg_Redtestregions[95] = Rect(-64.0, -736.0, 64.0, -160.0) // Down
	set udg_Redtestregions[96] = Rect(-704.0, -192.0, -32.0, -64.0) // Left
	
	// Checkpoint 1
	set udg_Redtestregions[97] = Rect(-64.0, 1024.0, 0.0, 1088.0) // Upper Left
	set udg_Redtestregions[98] = Rect(0.0, 1024.0, 64.0, 1088.0) // Upper Right
	set udg_Redtestregions[99] = Rect(0.0, 960.0, 64.0, 1024.0) // Lower Right
	set udg_Redtestregions[100] = Rect(-64.0, 960.0, 0.0, 1024.0) // Lower Left
	
	// Checkpoint 2
	set udg_Redtestregions[101] = Rect(-64.0, -128.0, 0.0, -64.0) // Upper Left
	set udg_Redtestregions[102] = Rect(0.0, -128.0, 64.0, -64.0) // Upper Right
	set udg_Redtestregions[103] = Rect(0.0, -192.0, 64.0, -128.0) // Lower Right
	set udg_Redtestregions[104] = Rect(-64.0, -192.0, 0.0, -128.0) // Lower Left
	
	// Orange
	set udg_Redtestregions[105] = Rect(-5120.0, -2304.0, -5056.0, 64.0) // Long left
	set udg_Redtestregions[106] = Rect(-5120.0, 64.0, -4672.0, 128.0) // Spawn top left
	set udg_Redtestregions[107] = Rect(-3648.0, -2304.0, -3584.0, 64.0) // Long right
	set udg_Redtestregions[108] = Rect(-4032.0, 64.0, -3584.0, 128.0) // Spawn top right
	set udg_Redtestregions[109] = Rect(-4320.0, -2304.0, -3616.0, -2240.0) // Exit right
	set udg_Redtestregions[110] = Rect(-5056.0, -2304.0, -4416.0, -2240.0) // Exit left
	
	// Circle 1
	set udg_Redtestregions[111] = Rect(-4416.0, -1632.0, -4288.0, -544.0) // Down
	set udg_Redtestregions[112] = Rect(-5056.0, -576.0, -4384.0, -448.0) // Left
	set udg_Redtestregions[113] = Rect(-4416.0, -480.0, -4288.0, 96.0) // Up
	set udg_Redtestregions[114] = Rect(-4320.0, -576.0, -3648.0, -448.0) // Right
	
	// Circle 2
	set udg_Redtestregions[115] = Rect(-4320.0, -1728.0, -3648.0, -1600.0) // Right
	set udg_Redtestregions[116] = Rect(-4416.0, -2272.0, -4288.0, -1696.0) // Down
	set udg_Redtestregions[117] = Rect(-5056.0, -1728.0, -4384.0, -1600.0) // Left
	
	// Checkpoint 1
	set udg_Redtestregions[118] = Rect(-4416.0, -512.0, -4352.0, -448.0) // Upper Left
	set udg_Redtestregions[119] = Rect(-4352.0, -512.0, -4288.0, -448.0) // Upper Right
	set udg_Redtestregions[120] = Rect(-4352.0, -576.0, -4288.0, -512.0) // Lower Right
	set udg_Redtestregions[121] = Rect(-4416.0, -576.0, -4352.0, -512.0) // Lower Left
	
	// Checkpoint 2
	set udg_Redtestregions[122] = Rect(-4416.0, -1664.0, -4352.0, -1600.0) // Upper Left
	set udg_Redtestregions[123] = Rect(-4352.0, -1664.0, -4288.0, -1600.0) // Upper Right
	set udg_Redtestregions[124] = Rect(-4352.0, -1728.0, -4288.0, -1664.0) // Lower Right
	set udg_Redtestregions[125] = Rect(-4416.0, -1728.0, -4352.0, -1664.0) // Lower Left
	
	// Green
	set udg_Redtestregions[126] = Rect(-4416.0, -4224.0, -2112.0, -4160.0) // Long bottom
	set udg_Redtestregions[127] = Rect(-4480.0, -4224.0, -4416.0, -3808.0) // Spawn bottom
	set udg_Redtestregions[128] = Rect(-4416.0, -2752.0, -2048.0, -2688.0) // Long top
	set udg_Redtestregions[129] = Rect(-4480.0, -3136.0, -4416.0, -2688.0) // Spawn top
	set udg_Redtestregions[130] = Rect(-2112.0, -3424.0, -2048.0, -2752.0) // Exit top
	set udg_Redtestregions[131] = Rect(-2112.0, -4224.0, -2048.0, -3488.0) // Exit bottom
	
	// Circle 1
	set udg_Redtestregions[132] = Rect(-3808.0, -3520.0, -2720.0, -3392.0) // Right
	set udg_Redtestregions[133] = Rect(-3904.0, -4160.0, -3776.0, -3488.0) // Down
	set udg_Redtestregions[134] = Rect(-4416.0, -3520.0, -3872.0, -3392.0) // Left
	set udg_Redtestregions[135] = Rect(-3904.0, -3424.0, -3776.0, -2752.0) // Up
	
	// Circle 2
	set udg_Redtestregions[136] = Rect(-2752.0, -3424.0, -2624.0, -2752.0) // Up
	set udg_Redtestregions[137] = Rect(-2656.0, -3520.0, -2112.0, -3392.0) // Right
	set udg_Redtestregions[138] = Rect(-2752.0, -4160.0, -2624.0, -3488.0) // Down
	
	// Checkpoint 1
	set udg_Redtestregions[139] = Rect(-3904.0, -3456.0, -3840.0, -3392.0) // Upper Left
	set udg_Redtestregions[140] = Rect(-3840.0, -3456.0, -3776.0, -3392.0) // Upper Right
	set udg_Redtestregions[141] = Rect(-3840.0, -3520.0, -3776.0, -3456.0) // Lower Right
	set udg_Redtestregions[142] = Rect(-3904.0, -3520.0, -3840.0, -3456.0) // Lower Left
	
	// Checkpoint 2
	set udg_Redtestregions[143] = Rect(-2752.0, -3456.0, -2688.0, -3392.0) // Upper Left
	set udg_Redtestregions[144] = Rect(-2688.0, -3456.0, -2624.0, -3392.0) // Upper Right
	set udg_Redtestregions[145] = Rect(-2688.0, -3520.0, -2624.0, -3456.0) // Lower Right
	set udg_Redtestregions[146] = Rect(-2752.0, -3520.0, -2688.0, -3456.0) // Lower Left
	
	// Pink
	set udg_Redtestregions[147] = Rect(2112.0, -4224.0, 4416.0, -4160.0) // Long bottom
	set udg_Redtestregions[148] = Rect(4416.0, -4224.0, 4480.0, -3776.0) // Spawn bottom
	set udg_Redtestregions[149] = Rect(2112.0, -2752.0, 4416.0, -2688.0) // Long top
	set udg_Redtestregions[150] = Rect(4416.0, -3168.0, 4480.0, -2688.0) // Spawn top
	set udg_Redtestregions[151] = Rect(2048.0, -3424.0, 2112.0, -2688.0) // Exit top
	set udg_Redtestregions[152] = Rect(2048.0, -4224.0, 2112.0, -3520.0) // Exit bottom
	
	// Circle 1
	set udg_Redtestregions[153] = Rect(2720.0, -3520.0, 3808.0, -3392.0) // Left
	set udg_Redtestregions[154] = Rect(3776.0, -3424.0, 3904.0, -2752.0) // Up
	set udg_Redtestregions[155] = Rect(3872.0, -3520.0, 4416.0, -3392.0) // Right
	set udg_Redtestregions[156] = Rect(3776.0, -4160.0, 3904.0, -3488.0) // Down
	
	// Circle 2
	set udg_Redtestregions[157] = Rect(2624.0, -4160.0, 2752.0, -3488.0) // Down
	set udg_Redtestregions[158] = Rect(2080.0, -3520.0, 2656.0, -3392.0) // Left
	set udg_Redtestregions[159] = Rect(2624.0, -3424.0, 2752.0, -2752.0) // Up
	
	// Checkpoint 1
	set udg_Redtestregions[160] = Rect(3776.0, -3456.0, 3840.0, -3392.0) // Upper Left
	set udg_Redtestregions[161] = Rect(3840.0, -3456.0, 3904.0, -3392.0) // Upper Right
	set udg_Redtestregions[162] = Rect(3840.0, -3520.0, 3904.0, -3456.0) // Lower Right
	set udg_Redtestregions[163] = Rect(3776.0, -3520.0, 3840.0, -3456.0) // Lower Left
	
	// Checkpoint 2
	set udg_Redtestregions[164] = Rect(2624.0, -3520.0, 2688.0, -3392.0) // Upper Left
	set udg_Redtestregions[165] = Rect(2688.0, -3456.0, 2752.0, -3392.0) // Upper Right
	set udg_Redtestregions[166] = Rect(2688.0, -3520.0, 2752.0, -3456.0) // Lower Right
	set udg_Redtestregions[167] = Rect(2624.0, -3520.0, 2688.0, -3456.0) // Lower Left
	
	// Grey
	set udg_Redtestregions[168] = Rect(-768.0, -4864.0, -704.0, -2496.0) // Long left
	set udg_Redtestregions[169] = Rect(-768.0, -2496.0, -192.0, -2432.0) // Spawn top left
	set udg_Redtestregions[170] = Rect(704.0, -4864.0, 768.0, -2496.0) // Long right
	set udg_Redtestregions[171] = Rect(192.0, -2496.0, 768.0, -2432.0) // Spawn top right
	set udg_Redtestregions[172] = Rect(160.0, -4864.0, 740.0, -4800.0) // Exit right
	set udg_Redtestregions[173] = Rect(-704.0, -4864.0, -160.0, -4800.0) // Exit left
	
	// Circle 1
	set udg_Redtestregions[174] = Rect(-64.0, -4192.0, 64.0, -3104.0) // Down
	set udg_Redtestregions[175] = Rect(-704.0, -3136.0, -32.0, -3008.0) // Left
	set udg_Redtestregions[176] = Rect(-64.0, -3040.0, 64.0, -2464.0) // Up
	set udg_Redtestregions[177] = Rect(32.0, -3136.0, 704.0, -3008.0) // Right
	
	// Circle 2
	set udg_Redtestregions[178] = Rect(32.0, -4288.0, 704.0, -4160.0) // Right
	set udg_Redtestregions[179] = Rect(-64.0, -4832.0, 64.0, -4256.0) // Down
	set udg_Redtestregions[180] = Rect(-704.0, -4288.0, -32.0, -4160.0) // Left
	
	// Checkpoint 1
	set udg_Redtestregions[181] = Rect(-64.0, -3072.0, 0.0, -3008.0) // Upper Left
	set udg_Redtestregions[182] = Rect(0.0, -3072.0, 64.0, -3008.0) // Upper Right
	set udg_Redtestregions[183] = Rect(0.0, -3136.0, 64.0, -3072.0) // Lower Right
	set udg_Redtestregions[184] = Rect(-64.0, -3136.0, 0.0, -3072.0) // Lower Left	
	
	// Checkpoint 2
	set udg_Redtestregions[185] = Rect(-64.0, -4224.0, 0.0, -4160.0) // Upper Left
	set udg_Redtestregions[186] = Rect(0.0, -4224.0, 64.0, -4160.0) // Upper Right
	set udg_Redtestregions[187] = Rect(0.0, -4288.0, 64.0, -4224.0) // Lower Right
	set udg_Redtestregions[188] = Rect(-64.0, -4288.0, 0.0, -4224.0) // Lower Left
	
	// Lightblue
	set udg_Redtestregions[189] = Rect(-1472.0, -1920.0, -1408.0, 448.0) // Long left
	set udg_Redtestregions[190] = Rect(-1856.0, -1920.0, -1472.0, -1856.0) // Spawn right
	set udg_Redtestregions[191] = Rect(-2944.0, -1920.0, -2880.0, 448.0) // Long left
	set udg_Redtestregions[192] = Rect(-2880.0, -1920.0, -2496.0, -1856.0) // Spawn right
	set udg_Redtestregions[193] = Rect(-2944.0, 448.0, -2240.0, 512.0) // Exit left
	set udg_Redtestregions[194] = Rect(-2112.0, 448.0, -1408.0, 512.0) // Exit right
	
	// Circle 1
	set udg_Redtestregions[195] = Rect(-2240.0, -1248.0, -2112.0, -160.0) // Up
	set udg_Redtestregions[196] = Rect(-2144.0, -1344.0, -1472.0, -1216.0) // Right
	set udg_Redtestregions[197] = Rect(-2240.0, -1888.0, -2112.0, -1312.0) // Down
	set udg_Redtestregions[198] = Rect(-2880.0, -1344.0, -2208.0, -1216.0) // Left
	
	// Circle 2
	set udg_Redtestregions[199] = Rect(-2880.0, -192.0, -2208.0, -64.0) // Left
	set udg_Redtestregions[200] = Rect(-2240.0, -96.0, -2112.0, 480.0) // Up
	set udg_Redtestregions[201] = Rect(-2144.0, -192.0, -1472.0, -64.0) // Right
	
	// Checkpoint 1
	set udg_Redtestregions[202] = Rect(-2240.0, -1280.0, -2176.0, -1344.0) // Upper Left
	set udg_Redtestregions[203] = Rect(-2176.0, -1280.0, -2112.0, -1216.0) // Upper Right
	set udg_Redtestregions[204] = Rect(-2176.0, -1344.0, -2112.0, -1280.0) // Lower Right
	set udg_Redtestregions[205] = Rect(-2240.0, -1344.0, -2176.0, -1280.0) // Lower Left
	
	// Checkpoint 2
	set udg_Redtestregions[206] = Rect(-2240.0, -128.0, -2176.0, -64.0) // Upper Left
	set udg_Redtestregions[207] = Rect(-2176.0, -128.0, -2112.0, -64.0) // Upper Right
	set udg_Redtestregions[208] = Rect(-2176.0, -192.0, -2112.0, -128.0) // Lower Right
	set udg_Redtestregions[209] = Rect(-2240.0, -192.0, -2176.0, -128.0) // Lower Left
	
	// Darkgreen
	set udg_Redtestregions[210] = Rect(2880.0, -1920.0, 2944.0, 448.0) // Long left
	set udg_Redtestregions[211] = Rect(2496.0, -1920.0, 2880.0, -1856.0) // Spawn right
	set udg_Redtestregions[212] = Rect(1408.0, -1920.0, 1472.0, 448.0) // Long right
	set udg_Redtestregions[213] = Rect(1472.0, -1920.0, 1856.0, -1856.0) // Spawn left
	set udg_Redtestregions[214] = Rect(1408.0, 448.0, 2112.0, 512.0) // Exit left
	set udg_Redtestregions[215] = Rect(2240.0, 448.0, 2944.0, 512.0) // Exit right
	
	// Circle 1
	set udg_Redtestregions[216] = Rect(2112.0, -1248.0, 2240.0, -160.0) // Up
	set udg_Redtestregions[217] = Rect(2208.0, -1344.0, 2880.0, -1216.0) // Right
	set udg_Redtestregions[218] = Rect(2112.0, -1888.0, 2240.0, -1312.0) // Down
	set udg_Redtestregions[219] = Rect(1472.0, -1344.0, 2144.0, -1216.0) // Left
	
	// Circle 2
	set udg_Redtestregions[220] = Rect(1472.0, -192.0, 2144.0, -64.0) // Left
	set udg_Redtestregions[221] = Rect(2112.0, -96.0, 2240.0, 480.0) // Up
	set udg_Redtestregions[222] = Rect(2208.0, -192.0, 2880.0, -64.0) // Right
	
	// Checkpoint 1
	set udg_Redtestregions[223] = Rect(2112.0, -1280.0, 2176.0, -1344.0) // Upper Left
	set udg_Redtestregions[224] = Rect(2176.0, -1280.0, 2240.0, -1216.0) // Upper Right
	set udg_Redtestregions[225] = Rect(2176.0, -1344.0, 2240.0, -1280.0) // Lower Right
	set udg_Redtestregions[226] = Rect(2112.0, -1344.0, 2176.0, -1280.0) // Lower Left
	
	// Checkpoint 2
	set udg_Redtestregions[227] = Rect(2112.0, -128.0, 2176.0, -64.0) // Upper Left
	set udg_Redtestregions[228] = Rect(2176.0, -128.0, 2240.0, -64.0) // Upper Right
	set udg_Redtestregions[229] = Rect(2176.0, -192.0, 2240.0, -128.0) // Lower Right
	set udg_Redtestregions[230] = Rect(2112.0, -192.0, 2176.0, -128.0) // Lower Left
	
	// Brown
	set udg_Redtestregions[231] = Rect(-5120.0, 768.0, -5056.0, 3136.0) // Long left
	set udg_Redtestregions[232] = Rect(-5120.0, 3136.0, -4672.0, 3200.0) // Spawn top left
	set udg_Redtestregions[233] = Rect(-3648.0, 768.0, -3584.0, 3136.0) // Long right
	set udg_Redtestregions[234] = Rect(-4032.0, 3136.0, -3584.0, 3200.0) // Spawn top right
	set udg_Redtestregions[235] = Rect(-4192.0, 768.0, -3612.0, 832.0) // Exit right
	set udg_Redtestregions[236] = Rect(-5056.0, 768.0, -4512.0, 832.0) // Exit left
	
	// Circle 1
	set udg_Redtestregions[237] = Rect(-4416.0, 1440.0, -4288.0, 2528.0) // Down
	set udg_Redtestregions[238] = Rect(-5056.0, 2496.0, -4384.0, 2624.0) // Left
	set udg_Redtestregions[239] = Rect(-4416.0, 2592.0, -4288.0, 3168.0) // Up
	set udg_Redtestregions[240] = Rect(-4320.0, 2496.0, -3648.0, 2624.0) // Right
	
	// Circle 2
	set udg_Redtestregions[241] = Rect(-4320.0, 1344.0, -3648.0, 1472.0) // Right
	set udg_Redtestregions[242] = Rect(-4416.0, 800.0, -4288.0, 1376.0) // Down
	set udg_Redtestregions[243] = Rect(-5056.0, 1344.0, -4384.0, 1472.0) // Left
	
	// Checkpoint 1
	set udg_Redtestregions[244] = Rect(-4416.0, 2560.0, -4352.0, 2624.0) // Upper Left
	set udg_Redtestregions[245] = Rect(-4352.0, 2560.0, -4288.0, 2624.0) // Upper Right
	set udg_Redtestregions[246] = Rect(-4352.0, 2496.0, -4288.0, 2560.0) // Lower Right
	set udg_Redtestregions[247] = Rect(-4416.0, 2496.0, -4352.0, 2560.0) // Lower Left
	
	// Checkpoint 2
	set udg_Redtestregions[248] = Rect(-4416.0, 1408.0, -4352.0, 1472.0) // Upper Left
	set udg_Redtestregions[249] = Rect(-4352.0, 1408.0, -4288.0, 1472.0) // Upper Right
	set udg_Redtestregions[250] = Rect(-4352.0, 1344.0, -4288.0, 1408.0) // Lower Right
	set udg_Redtestregions[251] = Rect(-4416.0, 1344.0, -4352.0, 1408.0) // Lower Left
	
	// Maroon
	set udg_Redtestregions[252] = Rect(3584.0, 768.0, 3648.0, 3200.0) // Long left
	set udg_Redtestregions[253] = Rect(3648.0, 3136.0, 4064.0, 3200.0) // Spawn top left
	set udg_Redtestregions[254] = Rect(5056.0, 768.0, 5120.0, 3200.0) // Long right
	set udg_Redtestregions[255] = Rect(4704.0, 3136.0, 5056.0, 3200.0) // Spawn top right
	set udg_Redtestregions[256] = Rect(4640.0, 768.0, 5056.0, 832.0) // Exit right
	set udg_Redtestregions[257] = Rect(3648.0, 768.0, 4064.0, 832.0) // Exit left

	// Circle 1
	set udg_Redtestregions[258] = Rect(4288.0, 1440.0, 4416.0, 2528.0) // Down
	set udg_Redtestregions[259] = Rect(3648.0, 2496.0, 4320.0, 2624.0) // Left
	set udg_Redtestregions[260] = Rect(4288.0, 2592.0, 4416.0, 3168.0) // Up
	set udg_Redtestregions[261] = Rect(4384.0, 2496.0, 5056.0, 2624.0) // Right
	
	// Circle 2
	set udg_Redtestregions[262] = Rect(4384.0, 1344.0, 5056.0, 1472.0) // Right
	set udg_Redtestregions[263] = Rect(4288.0, 800.0, 4416.0, 1376.0) // Down
	set udg_Redtestregions[264] = Rect(3648.0, 1344.0, 4320.0, 1472.0) // Left
	
	// Checkpoint 1
	set udg_Redtestregions[265] = Rect(4288.0, 2560.0, 4352.0, 2624.0) // Upper Left
	set udg_Redtestregions[266] = Rect(4352.0, 2560.0, 4416.0, 2624.0) // Upper Right
	set udg_Redtestregions[267] = Rect(4352.0, 2496.0, 4416.0, 2560.0) // Lower Right
	set udg_Redtestregions[268] = Rect(4288.0, 2496.0, 4352.0, 2560.0) // Lower Left
	
	// Checkpoint 2
	set udg_Redtestregions[269] = Rect(4288.0, 1408.0, 4352.0, 1472.0) // Upper Left
	set udg_Redtestregions[270] = Rect(4352.0, 1408.0, 4416.0, 1472.0) // Upper Right
	set udg_Redtestregions[271] = Rect(4352.0, 1344.0, 4416.0, 1408.0) // Lower Right
	set udg_Redtestregions[272] = Rect(4288.0, 1344.0, 4352.0, 1408.0) // Lower Left
	//TSET
	
	set udg_Checkpoints[1] = Rect(-2464.00, 4704.00, -2400.00, 4768.00)
	set udg_Checkpoints[2] = Rect(-3616.00, 4704.00, -3552.00, 4768.00)
	set udg_Checkpoints[3] = bluerect // Blue checkpoint
	set udg_Checkpoints[4] = bluerect // This is for blue's right side
	set udg_Checkpoints[5] = bluerect2 // Blue 2 checkpoint
	set udg_Checkpoints[6] = bluerect2 // Blue 2 right side checkpoint
	set udg_Checkpoints[7] = Rect(2400.00, 4704.00, 2464.00, 4768.00)
	set udg_Checkpoints[8] = Rect(3552.00, 4704.00, 3616.00, 4768.00)
	set udg_Checkpoints[9] = Rect(4320.00, -544.00, 4384.00, -480.00)
	set udg_Checkpoints[10] = Rect(4320.00, -1696.00, 4384.00, -1632.00)
	set udg_Checkpoints[11] = yellowrect // Yellow checkpoint
	set udg_Checkpoints[12] = yellowrect // This is for yellow's right side
	set udg_Checkpoints[13] = yellowrect2 // Yellow 2 checkpoint
	set udg_Checkpoints[14] = yellowrect2 // Yellow 2 right side checkpoint
	set udg_Checkpoints[15] = Rect(-4384.00, -544.00, -4320.00, -480.00)
	set udg_Checkpoints[16] = Rect(-4384.00, -1696.00, -4320.00, -1632.00)
	set udg_Checkpoints[17] = Rect(-3872.00, -3488.00, -3808.00, -3424.00)
	set udg_Checkpoints[18] = Rect(-2720.00, -3488.00, -2656.00, -3424.00)
	set udg_Checkpoints[19] = Rect(3808.00, -3488.00, 3872.00, -3424.00)
	set udg_Checkpoints[20] = Rect(2656.00, -3488.00, 2720.00, -3424.00)
	set udg_Checkpoints[21] = Rect(-32.00, -3104.00, 32.00, -3040.00)
	set udg_Checkpoints[22] = Rect(-32.00, -4256.00, 32.00, -4192.00)
	set udg_Checkpoints[23] = Rect(-2208.00, -1312.00, -2144.00, -1248.00)
	set udg_Checkpoints[24] = Rect(-2208.00, -160.00, -2144.00, -96.00)
	set udg_Checkpoints[25] = Rect(2144.00, -1312.00, 2208.00, -1248.00)
	set udg_Checkpoints[26] = Rect(2144.00, -160.00, 2208.00, -96.00)
	set udg_Checkpoints[27] = Rect(-4384.00, 2528.00, -4320.00, 2592.00)
	set udg_Checkpoints[28] = Rect(-4384.00, 1376.00, -4320.00, 1440.00)
	set udg_Checkpoints[29] = Rect(4320.00, 2528.00, 4384.00, 2592.00)
	set udg_Checkpoints[30] = Rect(4320.00, 1376.00, 4384.00, 1440.00)
	set udg_Checkpoints[31] = Rect(-768.00, -4992.00, 768.00, -4800.00)
	set udg_Checkpoints[32] = Rect(-1952.00, -3488.00, -1888.00, -3424.00)
	set udg_Checkpoints[33] = Rect(1888.00, -3488.00, 1952.00, -3424.00)
	set udg_Checkpoints[34] = Rect(-32.00, -2240.00, 32.00, -2176.00)
	set udg_Checkpoints[35] = Rect(-4384.00, 3392.00, -4320.00, 3456.00)
	set udg_Checkpoints[36] = Rect(-4384.00, 4704.00, -4320.00, 4768.00)
	set udg_Checkpoints[37] = Rect(-4384.00, -2464.00, -4320.00, -2400.00)
	set udg_Checkpoints[38] = Rect(-4768.00, -3488.00, -4704.00, -3424.00)
	set udg_Checkpoints[39] = Rect(4320.00, 4704.00, 4384.00, 4768.00)
	set udg_Checkpoints[40] = Rect(4320.00, 3392.00, 4384.00, 3456.00)
	set udg_Checkpoints[41] = Rect(4320.00, -2464.00, 4384.00, -2400.00)
	set udg_Checkpoints[42] = Rect(4672.00, -3488.00, 4736.00, -3424.00)
	set udg_Checkpoints[43] = yellowTeleport
	set udg_Checkpoints[44] = Rect(-2208.00, -2144.00, -2144.00, -2080.00)
	set udg_Checkpoints[45] = Rect(2144.00, -2144.00, 2208.00, -2080.00)
	set udg_Checkpoints[46] = Rect(-2208.00, 608.00, -2144.00, 672.00)
	set udg_Checkpoints[47] = Rect(-4384.00, 352.00, -4320.00, 416.00)
	set udg_Checkpoints[48] = Rect(2144.00, 608.00, 2208.00, 672.00)
	set udg_Checkpoints[49] = Rect(4320.00, 320.00, 4384.00, 384.00)
	set udg_Checkpoints[50] = yellowTeleport
	set udg_Checkpoints[51] = yellowInSpawnCheckpoint
	set udg_Checkpoints[52] = yellowInSpawnCheckpoint
	set udg_Checkpoints[53] = Rect(-4416.00, 384.00, -4288.00, 480.00)
	set udg_Checkpoints[54] = Rect(4288.00, 384.00, 4416.00, 480.00)
	// call Utility_DrawRect(bj_mapInitialPlayableArea)
	// call Utility_DrawGrid()


	// call MakeCheckpointsBuildable()
	
	set bluerect = null
	set bluerect2 = null
	set yellowrect = null
	set yellowrect2 = null
	set yellowInSpawnCheckpoint = null
	set yellowTeleport = null
	
	set udg_CheckpointNumberToSpawn[1] = 0
	set udg_CheckpointNumberToSpawn[2] = 0
	set udg_CheckpointNumberToSpawn[3] = 1
	set udg_CheckpointNumberToSpawn[4] = 1
	set udg_CheckpointNumberToSpawn[5] = 1
	set udg_CheckpointNumberToSpawn[6] = 1
	set udg_CheckpointNumberToSpawn[7] = 2
	set udg_CheckpointNumberToSpawn[8] = 2
	set udg_CheckpointNumberToSpawn[9] = 3
	set udg_CheckpointNumberToSpawn[10] = 3
	set udg_CheckpointNumberToSpawn[11] = 4
	set udg_CheckpointNumberToSpawn[12] = 4
	set udg_CheckpointNumberToSpawn[13] = 4
	set udg_CheckpointNumberToSpawn[14] = 4
	set udg_CheckpointNumberToSpawn[15] = 5
	set udg_CheckpointNumberToSpawn[16] = 5
	set udg_CheckpointNumberToSpawn[17] = 6
	set udg_CheckpointNumberToSpawn[18] = 6
	set udg_CheckpointNumberToSpawn[19] = 7
	set udg_CheckpointNumberToSpawn[20] = 7
	set udg_CheckpointNumberToSpawn[21] = 8
	set udg_CheckpointNumberToSpawn[22] = 8
	set udg_CheckpointNumberToSpawn[23] = 9
	set udg_CheckpointNumberToSpawn[24] = 9
	set udg_CheckpointNumberToSpawn[25] = 10
	set udg_CheckpointNumberToSpawn[26] = 10
	set udg_CheckpointNumberToSpawn[27] = 11
	set udg_CheckpointNumberToSpawn[28] = 11
	set udg_CheckpointNumberToSpawn[29] = 12
	set udg_CheckpointNumberToSpawn[30] = 12
	set udg_CheckpointNumberToSpawn[31] = 8
	set udg_CheckpointNumberToSpawn[32] = 6
	set udg_CheckpointNumberToSpawn[33] = 7
	set udg_CheckpointNumberToSpawn[34] = 8
	set udg_CheckpointNumberToSpawn[35] = 0
	set udg_CheckpointNumberToSpawn[36] = 0
	set udg_CheckpointNumberToSpawn[37] = 5
	set udg_CheckpointNumberToSpawn[38] = 5
	set udg_CheckpointNumberToSpawn[39] = 2
	set udg_CheckpointNumberToSpawn[40] = 2
	set udg_CheckpointNumberToSpawn[41] = 3
	set udg_CheckpointNumberToSpawn[42] = 3
	set udg_CheckpointNumberToSpawn[43] = 4
	set udg_CheckpointNumberToSpawn[44] = 4
	set udg_CheckpointNumberToSpawn[45] = 4
	set udg_CheckpointNumberToSpawn[46] = 9
	set udg_CheckpointNumberToSpawn[47] = 9
	set udg_CheckpointNumberToSpawn[48] = 10
	set udg_CheckpointNumberToSpawn[49] = 10
	set udg_CheckpointNumberToSpawn[50] = 4
	set udg_CheckpointNumberToSpawn[51] = 1
	set udg_CheckpointNumberToSpawn[52] = 1
	set udg_CheckpointNumberToSpawn[53] = 11
	set udg_CheckpointNumberToSpawn[54] = 12

	set udg_ShipDestination = Rect(-5440.0, -5664.0, -5184.0, -4864.0) // Ship moves to here when game ends

	set udg_UnitToCheckpointTable = InitHashtableBJ()
	set udg_TowerTickTable = InitHashtableBJ()
	set udg_PlayerLeavesTable = InitHashtableBJ()
	set udg_AntiBlockTable = InitHashtableBJ()

	set udg_Redspawn=Rect(-1792.0, 4736.0, -1472.0, 5056.0)
	set udg_Redspawn2=Rect(-1792.0, 4416.0, -1472.0, 4736.0)
	set udg_Bluespawn=Rect(-320.0, 4768.0, 0.0, 5088.0)
	set udg_Bluespawn2=Rect(0.0, 4768.0, 320.0, 5088.0)
	set udg_Tealspawn=Rect(1472.0, 4768.0, 1792.0, 5088.0)
	set udg_Tealspawn2=Rect(1472.0, 4448.0, 1792.0, 4768.0)
	set udg_Purplespawn=Rect(4032.0, 128.0, 4352.0, 448.0)
	set udg_Purplespawn2=Rect(4352.0, 128.0, 4672.0, 448.0)
	set udg_Yellowspawn=Rect(-320.0, 1664.0, 0.0, 1984.0)
	set udg_Yellowspawn2=Rect(0.0, 1664.0, 320.0, 1984.0)
	set udg_Orangespawn=Rect(-4672.0, 128.0, -4352.0, 448.0)
	set udg_Orangespawn2=Rect(-4352.0, 128.0, -4032.0, 448.0)
	set udg_Greenspawn=Rect(-4800.0, -3456.0, -4480.0, -3136.0)
	set udg_Greenspawn2=Rect(-4800.0, -3776.0, -4480.0, -3456.0)
	set udg_Pinkspawn=Rect(4480.0, -3456.0, 4800.0, -3136.0)
	set udg_Pinkspawn2=Rect(4480.0, -3776.0, 4800.0, -3456.0)
	set udg_Greyspawn=Rect(-160.0, -2464.0, 160.0, -2144.0)
	set udg_Lightbluespawn=Rect(-2496.0, -2240.0, -2176.0, -1920.0)
	set udg_Lightbluespawn2=Rect(-2176.0, -2240.0, -1856.0, -1920.0)
	set udg_Darkgreenspawn=Rect(1856.0, -2240.0, 2176.0, -1920.0)
	set udg_Darkgreenspawn2=Rect(2176.0, -2240.0, 2496.0, -1920.0)
	set udg_Brownspawn=Rect(-4672.0, 3200.0, -4352.0, 3520.0)
	set udg_Brownspawn2=Rect(-4352.0, 3200.0, -4032.0, 3520.0)
	set udg_Maroonspawn=Rect(4032.0, 3200.0, 4352.0, 3520.0)
	set udg_Maroonspawn2=Rect(4352.0, 3200.0, 4672.0, 3520.0)

	set udg_Shipcheckpoint=Rect(-704.0, -4960.0, 704.0, -4800.0)

	set udg_PlayerRestrictionArea[0]=Rect(-4640.0, 3808.0, -1248.0, 5632.0) // Red area
	set udg_PlayerRestrictionArea[1]=Rect(-928.0, 2016.0, 928.0, 5344.0) // Blue area
	set udg_PlayerRestrictionArea[2]=Rect(1248.0, 3808.0, 4640.0, 5632.0) // Teal area
	set udg_PlayerRestrictionArea[3]=Rect(3424.0, -2592.0, 5280.0, 480.0) // Purple area
	set udg_PlayerRestrictionArea[4]=Rect(-928.0, -1312.0, 928, 2016.0) // Yellow area
	set udg_PlayerRestrictionArea[5]=Rect(-5280.0, -2592.0, -3224.0, 480.0) // Orange area
	set udg_PlayerRestrictionArea[6]=Rect(-5024.0, -4384.0, -1504.0, -2560.0) // Green area
	set udg_PlayerRestrictionArea[7]=Rect(1504.0, -4384.0, 5024.0, -2560.0) // Pink area
	set udg_PlayerRestrictionArea[8]=Rect(-928.0, -4992.0, 928.0, -1888.0) // Grey area
	set udg_PlayerRestrictionArea[9]=Rect(-3104.0, -2464.0, -1248.0, 928.0) // Lightblue area
	set udg_PlayerRestrictionArea[10]=Rect(1248.0, -2464.0, 3104.0, 928.0) // Darkgreen area
	set udg_PlayerRestrictionArea[11]=Rect(-5280.0, 480.0, -3424.0, 3776.0) // Brown area
	set udg_PlayerRestrictionArea[12]=Rect(3424.0, 480.0, 5280.0, 3776.0) // Maroon area

	// Allow Players Tower
	set udg_AllowPlayersTower[1]=CreateUnit(Player(0),'h03S', -1536.0, 5376.0, 0.000) // Red
	set udg_AllowPlayersTower[2]=CreateUnit(Player(1),'h03S', 640.0, 4992.0, 0.000) // Blue
	set udg_AllowPlayersTower[3]=CreateUnit(Player(2),'h03S', 1536.0, 5376.0, 0.000) // Teal
	set udg_AllowPlayersTower[4]=CreateUnit(Player(3),'h03S', 5120.0, 448.0, 0.000) // Purple
	set udg_AllowPlayersTower[5]=CreateUnit(Player(4),'h03S', 768.0, 1984.0, 0.000) // Yellow
	set udg_AllowPlayersTower[6]=CreateUnit(Player(5),'h03S', -3616.0, 448.0, 0.000) // Orange
	set udg_AllowPlayersTower[7]=CreateUnit(Player(6),'h03S', -4736.0, -2816.0, 0.000) // Green
	set udg_AllowPlayersTower[8]=CreateUnit(Player(7),'h03S', 4736.0, -2816.0, 0.000) // Pink
	set udg_AllowPlayersTower[9]=CreateUnit(Player(8),'h03S', 512.0, -2176.0, 0.000) // Grey
	set udg_AllowPlayersTower[10]=CreateUnit(Player(9),'h03S', -1536.0, -2176.0, 0.000) // Lightblue
	set udg_AllowPlayersTower[11]=CreateUnit(Player(10),'h03S', 2816.0, -2176.0, 0.000) // Darkgreen
	set udg_AllowPlayersTower[12]=CreateUnit(Player(11),'h03S', -3712.0, 3456.0, 0.000) // Brown
	set udg_AllowPlayersTower[12]=CreateUnit(Player(12),'h03S', 4992.0, 3456.0, 0.000) // Maroon

	// Ship
	set udg_Ship = CreateUnit(Player(13),'n05G',63.0,-5343.5,0.000)

	call SetPlayerName(Player(13), "Forces of Darkness")
	call SetPlayerName(Player(14), "Forces of Darkness")
	call SetPlayerName(Player(15), "Forces of Darkness")
	call SetPlayerName(Player(15), "Forces of Darkness")
	call SetPlayerAllianceStateBJ(Player(13), Player(14), bj_ALLIANCE_ALLIED_VISION)
	call SetPlayerAllianceStateBJ(Player(13), Player(15), bj_ALLIANCE_ALLIED_VISION)
	call SetPlayerAllianceStateBJ(Player(13), Player(16), bj_ALLIANCE_ALLIED_VISION)
	call SetPlayerAllianceStateBJ(Player(14), Player(13), bj_ALLIANCE_ALLIED_VISION)
	call SetPlayerAllianceStateBJ(Player(14), Player(15), bj_ALLIANCE_ALLIED_VISION)
	call SetPlayerAllianceStateBJ(Player(14), Player(16), bj_ALLIANCE_ALLIED_VISION)
	call SetPlayerAllianceStateBJ(Player(15), Player(13), bj_ALLIANCE_ALLIED_VISION)
	call SetPlayerAllianceStateBJ(Player(15), Player(14), bj_ALLIANCE_ALLIED_VISION)
	call SetPlayerAllianceStateBJ(Player(15), Player(16), bj_ALLIANCE_ALLIED_VISION)
	call SetPlayerAllianceStateBJ(Player(16), Player(13), bj_ALLIANCE_ALLIED_VISION)
	call SetPlayerAllianceStateBJ(Player(16), Player(14), bj_ALLIANCE_ALLIED_VISION)
	call SetPlayerAllianceStateBJ(Player(16), Player(15), bj_ALLIANCE_ALLIED_VISION)
	
	call InitializeNeutralPassiveCreeps()

	set udg_PlayerColorsWithName[1]="|cFFFF0303Red|r"
	set udg_PlayerColorsWithName[2]="|cFF0042FFBlue|r"
	set udg_PlayerColorsWithName[3]="|cFF1CE6B9Teal|r"
	set udg_PlayerColorsWithName[4]="|cFF540081Purple|r"
	set udg_PlayerColorsWithName[5]="|cFFFFFC00Yellow|r"
	set udg_PlayerColorsWithName[6]="|cFFFEA80EOrange|r"
	set udg_PlayerColorsWithName[7]="|cFF20C000Green|r"
	set udg_PlayerColorsWithName[8]="|cFFE55BB0Pink|r"
	set udg_PlayerColorsWithName[9]="|cFF959697Grey|r"
	set udg_PlayerColorsWithName[10]="|cFF7FBFF1Light Blue|r"
	set udg_PlayerColorsWithName[11]="|cFF106246Dark Green|r"
	set udg_PlayerColorsWithName[12]="|cFF4E2A04Brown|r"
	set udg_PlayerColorsWithName[13]="|cFF7C0A02Maroon|r"
	set udg_PlayerColorNames[1]="red"
	set udg_PlayerColorNames[2]="blue"
	set udg_PlayerColorNames[3]="teal"
	set udg_PlayerColorNames[4]="purple"
	set udg_PlayerColorNames[5]="yellow"
	set udg_PlayerColorNames[6]="orange"
	set udg_PlayerColorNames[7]="green"
	set udg_PlayerColorNames[8]="pink"
	set udg_PlayerColorNames[9]="grey"
	set udg_PlayerColorNames[10]="lightblue"
	set udg_PlayerColorNames[11]="darkgreen"
	set udg_PlayerColorNames[12]="brown"
	set udg_PlayerColorNames[13]="maroon"
	//set udg_PlayerColorNames[14]="gray"
	//set udg_PlayerColorNames[15]="lb"
	//set udg_PlayerColorNames[16]="dg"
	
	set udg_ItemLootLevelOne[0] = 'I00A'
	set udg_ItemLootLevelOne[1] = 'I010'
	set udg_ItemLootLevelOne[2] = 'I011'
	set udg_ItemLootLevelOne[3] = 'I012'
	set udg_ItemLootLevelOne[4] = 'I013'
	set udg_ItemLootLevelOne[5] = 'I014'
	set udg_ItemLootLevelOne[6] = 'I015'
	set udg_ItemLootLevelOne[7] = 'I016'
	
	set udg_ItemLootLevelOneSize = 7

	set udg_ItemLootLevelTwo[0] = 'I01D'
	set udg_ItemLootLevelTwo[1] = 'I01C'
	set udg_ItemLootLevelTwo[2] = 'I017'
	set udg_ItemLootLevelTwo[3] = 'I01F'
	set udg_ItemLootLevelTwo[4] = 'I01G'
	set udg_ItemLootLevelTwo[5] = 'I01B'
	set udg_ItemLootLevelTwo[6] = 'I01E'
	set udg_ItemLootLevelTwo[7] = 'I018'
	
	set udg_ItemLootLevelTwoSize = 7

	set udg_ItemLootLevelThree[0] = 'I01H'
	set udg_ItemLootLevelThree[1] = 'I01M'
	set udg_ItemLootLevelThree[2] = 'I01N'
	set udg_ItemLootLevelThree[3] = 'I01L'
	set udg_ItemLootLevelThree[4] = 'I01I'
	set udg_ItemLootLevelThree[5] = 'I01J'
	set udg_ItemLootLevelThree[6] = 'I01K'
	set udg_ItemLootLevelThree[7] = 'I01O'
	
	set udg_ItemLootLevelThreeSize = 7

	set udg_ItemLootLevelFour[0] = 'I01W'
	set udg_ItemLootLevelFour[1] = 'I01P'
	set udg_ItemLootLevelFour[2] = 'I01U'
	set udg_ItemLootLevelFour[3] = 'I01V'
	set udg_ItemLootLevelFour[4] = 'I01R'
	set udg_ItemLootLevelFour[5] = 'I01T'
	set udg_ItemLootLevelFour[6] = 'I01Q'
	set udg_ItemLootLevelFour[7] = 'I01S'
	
	set udg_ItemLootLevelFourSize = 7

	set udg_ElementalistAbilities[0] = 'A0BO'
	set udg_ElementalistAbilities[1] = 'A0BS'
	set udg_ElementalistAbilities[2] = 'A0C0'
	set udg_ElementalistAbilities[3] = 'A0C1'
	set udg_ElementalistAbilities[4] = 'A0C2'
	set udg_ElementalistAbilities[5] = 'A0C3'

	set udg_ElementalistAbilitiesSize = 5

	if ( udg_RaceSelectionEnabled ) then
		set udg_CreepNames[1]="Wisp"
		set udg_CreepNames[2]="Clockwerk"
		set udg_CreepNames[3]="Acolyte"
		set udg_CreepNames[4]="Militia"
		set udg_CreepNames[5]="Wind Rider"
		set udg_CreepNames[6]="Tauren Mystic"
		set udg_CreepNames[7]="Grunt"
		set udg_CreepNames[8]="Makrura Snapper"
		set udg_CreepNames[9]="Mutant"
		set udg_CreepNames[10]="Mini-Tank"
		set udg_CreepNames[11]="Enraged Yeti"
		set udg_CreepNames[12]="Faceless Brute"
		set udg_CreepNames[13]="Stampeding Reptile"
		set udg_CreepNames[14]="Nymph"
		set udg_CreepNames[15]="Matured Dragon"
		set udg_CreepNames[16]="Merfolk Champion"
		set udg_CreepNames[17]="Eternal Spirit"
		set udg_CreepNames[18]="Granite Golem"
		set udg_CreepNames[19]="Walking Corpse"
		set udg_CreepNames[20]="Adult Dragon"
		set udg_CreepNames[21]="Bear"
		set udg_CreepNames[22]="Heavy Tank"
		set udg_CreepNames[23]="Big Game Hunter"
		set udg_CreepNames[24]="Water Spirit"
		set udg_CreepNames[25]="Ancient Dragon"
		set udg_CreepNames[26]="Steel Golem"
		set udg_CreepNames[27]="Demonic Minion"
		set udg_CreepNames[28]="Fire Spirit"
		set udg_CreepNames[29]="Demon Queen"
		set udg_CreepNames[30]="Nether Dragon"
		set udg_CreepNames[31]="Blood Golem"
		set udg_CreepNames[32]="Big Bad Ogre"
		set udg_CreepNames[33]="Snap Dragon"
		set udg_CreepNames[34]="Zergling"
		set udg_CreepNames[35]="Archimonde"
		set udg_CreepNames[36]="CRAB OF DEATH"

		set udg_CreepLevel=1
		set udg_Creeps[1]='u006'
		set udg_Creeps[2]='hC04'
		set udg_Creeps[3]='eC05'
		set udg_Creeps[4]='hC16'
		set udg_Creeps[5]='nC17'
		set udg_Creeps[6]='nC29'
		set udg_Creeps[7]='o01C'
		set udg_Creeps[8]='nC30'
		set udg_Creeps[9]='oC31'
		set udg_Creeps[10]='nC33'
		set udg_Creeps[11]='n008'
		set udg_Creeps[12]='eC38'
		set udg_Creeps[13]='nC39'
		set udg_Creeps[14]='nC40'
		set udg_Creeps[15]='nC41'
		set udg_Creeps[16]='nC42'
		set udg_Creeps[17]='uC43'
		set udg_Creeps[18]='hC44'
		set udg_Creeps[19]='uC45'
		set udg_Creeps[20]='n004'
		set udg_Creeps[21]='hC48'
		set udg_Creeps[22]='oC47'
		set udg_Creeps[23]='nC49'
		set udg_Creeps[24]='nC50'
		set udg_Creeps[25]='nC51'
		set udg_Creeps[26]='nC69'
		set udg_Creeps[27]='eC52'
		set udg_Creeps[28]='oC70'
		set udg_Creeps[29]='hC95'
		set udg_Creeps[30]='uC71'
		set udg_Creeps[31]='hC76'
		set udg_Creeps[32]='h03Y' // Big Bad Ogre
		set udg_Creeps[33]='h03Z' // Snap Dragon
		set udg_Creeps[34]='h040' // Zergling
		set udg_Creeps[35]='uC72' // Archimonde
		set udg_Creeps[36]='hC79' // CRAB OF DEATH


		set udg_RaceArray[0]='h03L' // Workers Union
		set udg_RaceArray[1]='uC98' // Demon Portal
		set udg_RaceArray[2]='oC22' // Undead Necropolis
		set udg_RaceArray[3]='eC10' // Aviaries
		set udg_RaceArray[4]='u002' // High Elf Barracks
		set udg_RaceArray[5]='u001' // Chaos Orc Barracks
		set udg_RaceArray[6]='hC07' // Human Town Hall
		set udg_RaceArray[7]='nC03' // Orc Stronghold
		set udg_RaceArray[8]='n03W' // High Elf Farm
		set udg_RaceArray[9]='uC13' // Giant's Hall
		set udg_RaceArray[10]='e00A' // The Unique
		set udg_RaceArray[11]='e007' // The Summons
		set udg_RaceArray[12]='n00J' // Arachnid Hive
		set udg_RaceArray[13]='o017' // Dranei Haven
		set udg_RaceArray[14]='u00B' // Dragons
		set udg_RaceArray[15]='e00F' // Night Elf Ancient
		set udg_RaceArray[16]='e00W' // Elementalists
		set udg_RaceArray[17]='e002' // Tavern
		set udg_RaceArray[18]='e003' // Corrupted Night Elves
		set udg_RaceArray[19]='e005' // Goblins
		set udg_RaceArray[20]='n03M' // Hero's Altar
		set udg_RaceArray[21]='e00D' // Caerbannog
		set udg_RaceArray[22]='n01V' // Critteres UNITE
		set udg_RaceArray[23]='n02A' // Gnoll Republic
		set udg_RaceArray[24]='h02T' // Void
		set udg_RaceArray[25]='n02S' // Alliance Of Blades
		set udg_RaceArray[26]='n03C' // Cavernous Creatures
		set udg_RaceArray[27]='n046' // Forest Troll Hut
		set udg_RaceArray[28]='n014' // Ice Troll Hut
		set udg_RaceArray[29]='n03W' // Dark Troll Hut
		set udg_RaceArray[30]='n04I' // Temple Of The Damned
		set udg_RaceArray[31]='e00H' // Dwarven Mine
		set udg_RaceArray[32]='e00G' // Galaxy
		set udg_RaceArray[33]='u01B' // Shrine of Buffs
		
		set udg_RacesCount=32

		set udg_RaceNameArray[0]="Workers Union"
		set udg_RaceNameArray[1]="Demon Portal"
		set udg_RaceNameArray[2]="Undead Necropolis"
		set udg_RaceNameArray[3]="Aviaries"
		set udg_RaceNameArray[4]="High Elf Barracks"
		set udg_RaceNameArray[5]="Outland"
		set udg_RaceNameArray[6]="Human Town Hall"
		set udg_RaceNameArray[7]="Orc Stronghold"
		set udg_RaceNameArray[8]="High Elf Farm"
		set udg_RaceNameArray[9]="Giant's Hall"
		set udg_RaceNameArray[10]="The Unique"
		set udg_RaceNameArray[11]="The Summons"
		set udg_RaceNameArray[12]="Arachnid Hive"
		set udg_RaceNameArray[13]="Draenei Haven"
		set udg_RaceNameArray[14]="Dragons"
		set udg_RaceNameArray[15]="Night Elf Ancient"
		set udg_RaceNameArray[16]="Elementalists"
		set udg_RaceNameArray[17]="Tavern"
		set udg_RaceNameArray[18]="Corrupted Night Elves"
		set udg_RaceNameArray[19]="Goblins"
		set udg_RaceNameArray[20]="Hero's Altar"
		set udg_RaceNameArray[21]="Caerbannog"
		set udg_RaceNameArray[22]="Critters UNITE"
		set udg_RaceNameArray[23]="Gnoll Republic"
		set udg_RaceNameArray[24]="Void Cult"
		set udg_RaceNameArray[25]="Alliance of Blades"
		set udg_RaceNameArray[26]="Cavernous Creatures"
		set udg_RaceNameArray[27]="Forest Troll Hut"
		set udg_RaceNameArray[28]="Ice Troll Hut"
		set udg_RaceNameArray[29]="Dark Troll Hut"
		set udg_RaceNameArray[30]="The Forsaken"
		set udg_RaceNameArray[31]="Dwarven Mine"
		set udg_RaceNameArray[32]="Galaxy"
		set udg_RaceNameArray[33]="Shrine of Buffs"
	endif
	set udg_PlayerColorCodes[0]="|cFFFF0303"
	set udg_PlayerColorCodes[1]="|cFF0042FF"
	set udg_PlayerColorCodes[2]="|cFF1CE6B9"
	set udg_PlayerColorCodes[3]="|cFF540081"
	set udg_PlayerColorCodes[4]="|cFFFFFC00"
	set udg_PlayerColorCodes[5]="|cFFFEA80E"
	set udg_PlayerColorCodes[6]="|cFF20C000"
	set udg_PlayerColorCodes[7]="|cFFE55BB0"
	set udg_PlayerColorCodes[8]="|cFF959697"
	set udg_PlayerColorCodes[9]="|cFF7FBFF1"
	set udg_PlayerColorCodes[10]="|cFF106246"
	set udg_PlayerColorCodes[11]="|cFF4E2A04"
	set udg_PlayerColorCodes[12]="|cFF7C0A02"

	set udg_ScoreboardColumnWidth[1] = 10.00
	set udg_ScoreboardColumnWidth[2] = 8.00

	set udg_CreepTypes[0]="|cFF999999Unarmored|r"
	set udg_CreepTypes[1]="|cFF6d7c86Light|r"
	set udg_CreepTypes[2]="|cFF416073Medium|r"
	set udg_CreepTypes[3]="|cFF154360Heavy|r"
	set udg_CreepTypes[4]="|cFFCA8500Fortified|r"
	set udg_CreepTypes[5]="|cFF7525FFHero|r"
	set udg_CreepTypes[6]="(|cFF999999Air|r)"
	set udg_CreepTypes[7]="(|cFF3737F2Boss|r)"
	set udg_CreepTypes[8]="(|cFFF2A137Champion|r)"
	
	set udg_CreepAbilities[0] = 'A069' // Hardened Skin
	set udg_CreepAbilities[1] = 'A06A' // Evasion
	set udg_CreepAbilities[2] = 'A06C' // Armor Bonus
	set udg_CreepAbilities[3] = 'A08G' // Cripple Aura
	set udg_CreepAbilities[4] = 'A00D' // Spell Shield
	set udg_CreepAbilities[5] = 'A01S' // Tornado Aura
	set udg_CreepAbilities[6] = 'A0B3' // Vampiric Aura
	set udg_CreepAbilities[7] = 'A01E' // Divine Shield
	set udg_CreepAbilities[8] = 'A01T' // Walk it Off
	set udg_CreepAbilities[9] = 'A06D' // Morning Person
	set udg_CreepAbilitiesSize = 10

	call PreloadCreepAbilities()

	set udg_ArchimondeDummy = CreateUnit(Player(13), 'u000', 4868.0, -4964.0, 240.0)
	call PauseUnitBJ( true, udg_ArchimondeDummy )

	call TowerTimeout()

	set udg_LoseALifeSound=CreateSound("Abilities\\Spells\\Other\\LoadUnload\\Loading.wav",false,false,true,10,10,"DefaultEAXON")
	call SetSoundParamsFromLabel(udg_LoseALifeSound,"LoadUnload")
	call SetSoundDuration(udg_LoseALifeSound,740)
	set udg_GoldSound=CreateSound("Abilities\\Spells\\Items\\ResourceItems\\ReceiveGold.wav",false,true,true,10,10,"DefaultEAXON")
	call SetSoundParamsFromLabel(udg_GoldSound,"ReceiveGold")
	call SetSoundDuration(udg_GoldSound,589)
	call SetSoundChannel(udg_GoldSound,0)
	call SetSoundDistances(udg_GoldSound,750.0,1000.0)
	set udg_VictorySound=CreateSound("Sound\\Music\\mp3Music\\PH1.mp3", false, false, false, 10, 10, "DefaultEAXON")
	set udg_DefeatSound=CreateSound("Sound\\Music\\mp3Music\\TragicConfrontation.mp3", false, false, false, 10, 10, "DefaultEAXON")
	set udg_ImpossibleDifficultySound=CreateSound("Sound\\Music\\mp3Music\\PursuitTheme.mp3", false, false, false, 10, 10, "DefaultEAXON")

	set udg_Spawnamount=20
	set udg_CreepWaveWaitTime=20
	set udg_FinishWaveGoldReward=10
	set udg_TotalLives=30
	//set udg_CreepLevel=35
	//set udg_StartWaveTimer = true

	if (GetPlayerName(Player(0)) == "WorldEdit") then
		set udg_DebugMode = true
	endif

	if udg_DebugMode then
		set udg_WaveTimer = 30
	else
		set udg_WaveTimer = 90
	endif

	call SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, true, Player(13) )
	call SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, true, Player(14) )
	call SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, true, Player(15) )
	call SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, true, Player(16) )

	call InitializeTeleports()
	call InitializePlayers()
endfunction
endlibrary

