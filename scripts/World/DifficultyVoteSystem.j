library DifficultyVoteSystem initializer Init
    globals
        private trigger udg_InitializeVotesTrigger = null
		private trigger udg_DifficultyVoteTrigger = null

    endglobals


	private function InitializePlayerScores takes nothing returns nothing
		local integer i = 0
		local integer count = 1
		loop
			exitwhen i > 12
			if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
				set udg_PlayerScorePosition[i] = count
				call MultiboardSetItemValueBJ(udg_Scoreboard, 1, 7 + count, udg_PlayerColorCodes[i] + GetPlayerName(Player(i)) + "|r")
				call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 7 + count, I2S(udg_PlayerKills[i]))
				call MultiboardSetItemStyleBJ(udg_Scoreboard, 1, 7 + count, true, false)
				call MultiboardSetItemStyleBJ(udg_Scoreboard, 2, 7 + count, true, false)
				call MultiboardSetItemWidthBJ(udg_Scoreboard, 1, 7 + count, udg_ScoreboardColumnWidth[1]) // Kills
				call MultiboardSetItemWidthBJ(udg_Scoreboard, 2, 7 + count, udg_ScoreboardColumnWidth[2])
				set count = count + 1
			endif

			set i = i + 1
		endloop
	endfunction

	private function ReplaceTerrainTypeId takes integer OldTerrain, integer NewTerrain, real MinX, real MaxX, real MinY, real MaxY returns nothing
		loop
			exitwhen MinY >= MaxY
				if(GetTerrainType(MinX, MinY) == OldTerrain) then
					if(GetRandomInt(0, 99) > 89) then
						call SetTerrainType(MinX, MinY, NewTerrain, -1, 1, 1)
						if(GetRandomInt(0, 99) > 89) then
							call AddSpecialEffect( "Abilities\\Spells\\Human\\FlameStrike\\FlameStrikeEmbers.mdl", MinX, MinY )
						endif
					endif
				endif

			if(MinX >= MaxX)then
				set MinY = MinY + 128.0
				set MinX = -5888.0
			else
				set MinX = MinX + 128.0
			endif
		endloop
	endfunction

	private function ReplaceRunedBricksWithLava takes nothing returns nothing
		call ReplaceTerrainTypeId('Irbk', 'Dlvc', -5888.0, 5888.0, -5888.0, 5888.0)
	endfunction

	private function CountPlayers takes nothing returns integer
		local integer i = 0
		local integer count = 0
		loop
			exitwhen i > 12
			if(GetPlayerSlotState(Player(i))==PLAYER_SLOT_STATE_PLAYING)then
				set count = count + 1
			endif

			set i = i + 1
		endloop

		return count
	endfunction

	private function InitializeScoreboard takes nothing returns nothing
		local integer count = CountPlayers()
		set udg_Scoreboard = CreateMultiboardBJ(2, count + 7, "Warcraft Maul Reimagined")
		call MultiboardSetItemValueBJ(udg_Scoreboard, 1, 1, "Starting in")
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 1, I2S(udg_WaveTimer))
		call MultiboardSetItemValueBJ(udg_Scoreboard, 1, 2, "Level")
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 2, I2S(udg_CreepLevel))
		call MultiboardSetItemValueBJ(udg_Scoreboard, 1, 3, "Difficulty")
		call MultiboardSetItemValueBJ(udg_Scoreboard, 1, 4, "Lives")
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 4, I2S(udg_TotalLives))
		call MultiboardSetItemValueBJ(udg_Scoreboard, 1, 5, "Armor Type")
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 5, udg_CreepTypes[0])
		call MultiboardSetItemValueBJ(udg_Scoreboard, 1, 7, "Player")
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 7, "Kills")

		call MultiboardSetItemWidthBJ(udg_Scoreboard, 1, 1, udg_ScoreboardColumnWidth[1]) // Game time
		call MultiboardSetItemWidthBJ(udg_Scoreboard, 2, 1, udg_ScoreboardColumnWidth[2])
		call MultiboardSetItemWidthBJ(udg_Scoreboard, 1, 2, udg_ScoreboardColumnWidth[1]) // Level
		call MultiboardSetItemWidthBJ(udg_Scoreboard, 2, 2, udg_ScoreboardColumnWidth[2])
		call MultiboardSetItemWidthBJ(udg_Scoreboard, 1, 3, udg_ScoreboardColumnWidth[1]) // Difficulty
		call MultiboardSetItemWidthBJ(udg_Scoreboard, 2, 3, udg_ScoreboardColumnWidth[2])
		call MultiboardSetItemWidthBJ(udg_Scoreboard, 1, 4, udg_ScoreboardColumnWidth[1]) // Lives
		call MultiboardSetItemWidthBJ(udg_Scoreboard, 2, 4, udg_ScoreboardColumnWidth[2])
		call MultiboardSetItemWidthBJ(udg_Scoreboard, 1, 5, udg_ScoreboardColumnWidth[1]) // Level Type
		call MultiboardSetItemWidthBJ(udg_Scoreboard, 2, 5, udg_ScoreboardColumnWidth[2])
		call MultiboardSetItemWidthBJ(udg_Scoreboard, 1, 6, udg_ScoreboardColumnWidth[1]) // Level Type 2
		call MultiboardSetItemWidthBJ(udg_Scoreboard, 2, 6, udg_ScoreboardColumnWidth[2])
		call MultiboardSetItemWidthBJ(udg_Scoreboard, 1, 7, udg_ScoreboardColumnWidth[1]) // Kills
		call MultiboardSetItemWidthBJ(udg_Scoreboard, 2, 7, udg_ScoreboardColumnWidth[2])

		call MultiboardSetItemStyleBJ(udg_Scoreboard, 1, 1, true, false)
		call MultiboardSetItemStyleBJ(udg_Scoreboard, 2, 1, true, false)
		call MultiboardSetItemStyleBJ(udg_Scoreboard, 1, 2, true, false)
		call MultiboardSetItemStyleBJ(udg_Scoreboard, 2, 2, true, false)
		call MultiboardSetItemStyleBJ(udg_Scoreboard, 1, 3, true, false)
		call MultiboardSetItemStyleBJ(udg_Scoreboard, 2, 3, true, false)
		call MultiboardSetItemStyleBJ(udg_Scoreboard, 1, 4, true, false)
		call MultiboardSetItemStyleBJ(udg_Scoreboard, 2, 4, true, false)
		call MultiboardSetItemStyleBJ(udg_Scoreboard, 1, 5, true, false)
		call MultiboardSetItemStyleBJ(udg_Scoreboard, 2, 5, true, false)
		call MultiboardSetItemStyleBJ(udg_Scoreboard, 1, 6, true, false)
		call MultiboardSetItemStyleBJ(udg_Scoreboard, 2, 6, true, false)
		call MultiboardSetItemStyleBJ(udg_Scoreboard, 1, 7, true, false)
		call MultiboardSetItemStyleBJ(udg_Scoreboard, 2, 7, true, false)
		
		call InitializePlayerScores()

		call MultiboardDisplayBJ(true,udg_Scoreboard)
	endfunction

	private function DifficultyVote takes nothing returns nothing
		local integer i = 0
		loop
			exitwhen i > 3
			if GetClickedButtonBJ() == udg_DifficultyButtons[i] then
				set udg_reals02[GetPlayerId(GetTriggerPlayer())] = udg_Difficulties[i]
				call DisplayTextToForce(GetPlayersAll(), udg_PlayerColorCodes[GetPlayerId(GetTriggerPlayer())] + GetPlayerName(GetTriggerPlayer()) + "|r voted for: " + udg_DifficultyStrings[i])
			endif

			set i = i + 1
		endloop
		call DialogDisplayBJ(false, udg_DifficultyDialog, GetTriggerPlayer())
	endfunction

	private function VoteTimerExpired takes nothing returns nothing
		local integer votingplayers = 0
		local timer t = GetExpiredTimer()
		local integer i = 0
		local integer j = 0
		local integer diffIndex
		local real totalDifficultyVote = 0.00
		call PauseTimer(t)
		call DestroyTimer(t)
		set t = null

		loop
				exitwhen i > 12
				if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
				if udg_reals02[i] == 0.00 then
					call DialogDisplayBJ(false, udg_DifficultyDialog, Player(i))
					call DisplayTextToForce(GetPlayersAll(), udg_PlayerColorCodes[i] + GetPlayerName(Player(i)) + "|r did not vote, their vote will not be counted")
						else
								set votingplayers = votingplayers + 1
						endif
						set totalDifficultyVote = totalDifficultyVote + udg_reals02[i]
				endif

				set i = i + 1
			endloop
		
		call InitializeScoreboard()
		if(votingplayers == 0)then
			call DisplayTextToForce(GetPlayersAll(), "Nobody voted, difficulty will automaticall be set to Normal")
			set udg_Difficulty = 100.0
		else
			set udg_Difficulty = totalDifficultyVote / I2R(votingplayers)
		endif

		set diffIndex = R2I((udg_Difficulty - 100.00) / 100.00 + ModuloReal((udg_Difficulty - 100.00) / 100.00, 1.00))
		call SetPlayerHandicapBJ(Player(13), udg_Difficulty)
		call SetPlayerHandicapBJ(Player(14), udg_Difficulty)
		call SetPlayerHandicapBJ(Player(15), udg_Difficulty)
		call SetPlayerHandicapBJ(Player(16), udg_Difficulty)
		call SetPlayerHandicapBJ(Player(PLAYER_NEUTRAL_PASSIVE), udg_Difficulty)
		call DisplayTextToForce(GetPlayersAll(), "Difficulty was set to " + I2S(R2I(udg_Difficulty)) + "% (" + udg_DifficultyStrings[diffIndex] + ")")
		
		loop
			exitwhen j > 12
			if(GetPlayerSlotState(Player(j))==PLAYER_SLOT_STATE_PLAYING)then
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_REQUEST, false, ConvertedPlayer(1))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_REQUEST, false, ConvertedPlayer(2))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_REQUEST, false, ConvertedPlayer(3))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_REQUEST, false, ConvertedPlayer(4))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_REQUEST, false, ConvertedPlayer(5))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_REQUEST, false, ConvertedPlayer(6))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_REQUEST, false, ConvertedPlayer(7))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_REQUEST, false, ConvertedPlayer(8))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_REQUEST, false, ConvertedPlayer(9))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_REQUEST, false, ConvertedPlayer(10))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_REQUEST, false, ConvertedPlayer(11))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_REQUEST, false, ConvertedPlayer(12))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_REQUEST, false, ConvertedPlayer(13))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_RESPONSE, false, ConvertedPlayer(1))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_RESPONSE, false, ConvertedPlayer(2))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_RESPONSE, false, ConvertedPlayer(3))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_RESPONSE, false, ConvertedPlayer(4))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_RESPONSE, false, ConvertedPlayer(5))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_RESPONSE, false, ConvertedPlayer(6))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_RESPONSE, false, ConvertedPlayer(7))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_RESPONSE, false, ConvertedPlayer(8))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_RESPONSE, false, ConvertedPlayer(9))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_RESPONSE, false, ConvertedPlayer(10))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_RESPONSE, false, ConvertedPlayer(11))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_RESPONSE, false, ConvertedPlayer(12))
				call SetPlayerAllianceBJ(Player(j), ALLIANCE_HELP_RESPONSE, false, ConvertedPlayer(13))
			endif

			set j = j + 1
		endloop
		
		if(udg_Difficulty >= 400)then
			call PlaySoundBJ(udg_ImpossibleDifficultySound)
			if(votingplayers == 0)then
				call DisplayTextToForce(GetPlayersAll(), "|cFF565656Mode set to Extreme, you will only have |r1|cFF565656 life!|r")
			else
				call DisplayTextToForce(GetPlayersAll(), "|cFF565656Everyone voted for Extreme, you will only have |r1|cFF565656 life!|r")
			endif

			set udg_TotalLives = 1
			call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 4, I2S(udg_TotalLives))
			call SetWaterBaseColorBJ(100, 20.00, 20.00, 0)
			call ReplaceRunedBricksWithLava()
		endif
		
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 3, I2S(R2I(udg_Difficulty)) + "%" + " (" + udg_DifficultyStrings[diffIndex] + ")")
	endfunction

	private function InitializeVoteTimer takes nothing returns nothing
		local timer t = CreateTimer()
		call TimerStart(t, 10.00, false, function VoteTimerExpired)
		set t = null
	endfunction

	private function DisableTriggers takes nothing returns nothing
		call DisableTrigger(gg_trg_BattleRoar)
		call DisableTrigger(gg_trg_DrunkenHaze)
		call DisableTrigger(gg_trg_SacrificeDamage)
		call DisableTrigger(gg_trg_ForceOfNature)
		call DisableTrigger(gg_trg_Moonstorm)
		call DisableTrigger(gg_trg_CrushedDamage)
		call DisableTrigger(gg_trg_WorkersUnionOrcPeon)
		call DisableTrigger(gg_trg_WorkersUnionHumanPeasant)
		call DisableTrigger(gg_trg_WorkersUnionNagaSlave)
		call DisableTrigger(gg_trg_WorkersUnionUndeadAcolyte)
		call DisableTrigger(gg_trg_WorkersUnionNightElfWisp)
		call DisableTrigger(gg_trg_FrostAttack)
		call DisableTrigger(gg_trg_ChainLightningAttack)
		call DisableTrigger(gg_trg_Wyvern)
		call DisableTrigger(gg_trg_Knight)
		call DisableTrigger(gg_trg_DrunkenBrawler)
		call DisableTrigger(gg_trg_MassiveBlow)
		call DisableTrigger(gg_trg_VenomTower)
		call DisableTrigger(gg_trg_MoonDancer)
		call DisableTrigger(gg_trg_Cavern_Druid_Ability)
		call DisableTrigger(gg_trg_Rokhan)
		call DisableTrigger(gg_trg_WarchiefThrall)
		call DisableTrigger(gg_trg_DwarfStatue)
		call DisableTrigger(gg_trg_VoidCorrupter)
		call DisableTrigger(gg_trg_VoidBeing)
		call DisableTrigger(gg_trg_AcidSpittingSpider)
		call DisableTrigger(gg_trg_FelGuard)
		call DisableTrigger(gg_trg_Mannoroth)
		call DisableTrigger(gg_trg_SummoningShrine)
		call DisableTrigger(gg_trg_Warden)
		call DisableTrigger(gg_trg_DemonicIllidan)
		call DisableTrigger(gg_trg_CorruptedIllidan)
		call DisableTrigger(gg_trg_CavernHermit)
		call DisableTrigger(gg_trg_CavernTurtle)
		call DisableTrigger(gg_trg_CavernRevenant)
		call DisableTrigger(gg_trg_IceTrollJoker)
		call DisableTrigger(gg_trg_DivineShield)
		call DisableTrigger(gg_trg_WalkItOff)
		call DisableTrigger(gg_trg_CrippleAura)
		call DisableTrigger(gg_trg_VampiricAura)
	endfunction

	private function InitializeVotes takes nothing returns nothing
		local integer i = 0

		set udg_Difficulties[0] = 100.00
		set udg_Difficulties[1] = 200.00
		set udg_Difficulties[2] = 300.00
		set udg_Difficulties[3] = 400.00
		set udg_DifficultyStrings[0] = "|cFF00A651Normal|r"
		set udg_DifficultyStrings[1] = "|cFFFFCD00Medium|r"
		set udg_DifficultyStrings[2] = "|cFFFF0000Hard|r"
		set udg_DifficultyStrings[3] = "|cFF383838Extreme|r"
		call DialogSetMessageBJ(udg_DifficultyDialog, "Difficulty vote:")
		set udg_DifficultyButtons[0] = DialogAddButtonBJ(udg_DifficultyDialog,"|cFF00A651100% |r" + udg_DifficultyStrings[0])
		set udg_DifficultyButtons[1] = DialogAddButtonBJ(udg_DifficultyDialog,"|cFFFFCD00200% |r" + udg_DifficultyStrings[1])
		set udg_DifficultyButtons[2] = DialogAddButtonBJ(udg_DifficultyDialog,"|cFFFF0000300% |r" + udg_DifficultyStrings[2])
		set udg_DifficultyButtons[3] = DialogAddButtonBJ(udg_DifficultyDialog,"|cFF383838400% |r" + udg_DifficultyStrings[3])

		call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'h03Q', -1920.00, 3000.00, 0.00)
		call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'h00H', -1920.00, 2624.00, 0.00)
		call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'h00O', -1920.00, 2240.00, 0.00)
		call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'h03C', -1920.00, 1856.00, 0.00)
		call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'h03K', -1920.00, 1472.00, 0.00)

		loop
			exitwhen i > 12
			if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
				call PanCameraToTimedForPlayer(Player(i), -1900.00, 2100.00, 0.00)
				call DialogDisplayBJ(true, udg_DifficultyDialog,Player(i))
				call CreateUnit(Player(i), 'e00C', -1920.00, 3000.00, 0.00)
				call CreateUnit(Player(i), 'e00C', -1920.00, 2624.00, 0.00)
				call CreateUnit(Player(i), 'e00C', -1920.00, 2240.00, 0.00)
				call CreateUnit(Player(i), 'e00C', -1920.00, 1856.00, 0.00)
				call CreateUnit(Player(i), 'e00C', -1920.00, 1472.00, 0.00)
			else
				set udg_IsSpawnOpen[i] = 0
			endif
			set i = i + 1
		endloop
		
		call DisableTriggers()
		call InitializeVoteTimer()
	endfunction

	private function Init takes nothing returns nothing
		set udg_InitializeVotesTrigger=CreateTrigger()
		call TriggerRegisterTimerEventSingle(udg_InitializeVotesTrigger,1.00)
		call TriggerAddAction(udg_InitializeVotesTrigger, function InitializeVotes)

		set udg_DifficultyVoteTrigger=CreateTrigger()
		call TriggerRegisterDialogEventBJ(udg_DifficultyVoteTrigger,udg_DifficultyDialog)
		call TriggerAddAction(udg_DifficultyVoteTrigger,function DifficultyVote)
	endfunction
	
endlibrary