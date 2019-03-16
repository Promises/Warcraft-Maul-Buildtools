globals
//globals from MapInit:
constant boolean LIBRARY_MapInit=true
//endglobals from MapInit
//globals from WarcraftMaulLibrary:
constant boolean LIBRARY_WarcraftMaulLibrary=true
//endglobals from WarcraftMaulLibrary
    // User-defined
integer udg_Spawnamount= 0
integer udg_TotalLives= 0
integer udg_LivesLost= 0
dialog udg_DifficultyDialog= null
integer array udg_RaceArray
integer udg_RacesCount= 0
button array udg_DifficultyButtons
real array udg_Difficulties
string array udg_DifficultyStrings
real array udg_reals02
string array udg_PlayerColorsWithName
string array udg_PlayerColorNames
integer array udg_IsSpawnOpen
rect array udg_Checkpoints
integer udg_PlayerCount= 0
unit array udg_AllowPlayersTower
rect udg_Tealcheckpoint= null
rect udg_Yellowcheckpoint= null
rect udg_Bluespawn= null
rect udg_Bluespawn2= null
rect udg_Darkgreenspawn= null
rect udg_Darkgreenspawn2= null
rect udg_Greenspawn= null
rect udg_Greenspawn2= null
rect udg_Greyspawn= null
rect udg_Lightbluespawn= null
rect udg_Lightbluespawn2= null
rect udg_Shipcheckpoint= null
rect udg_Orangespawn= null
rect udg_Orangespawn2= null
rect udg_Pinkspawn= null
rect udg_Pinkspawn2= null
rect udg_Purplespawn= null
rect udg_Purplespawn2= null
rect udg_Redspawn= null
rect udg_Redspawn2= null
rect udg_Tealspawn= null
rect udg_Tealspawn2= null
rect udg_Yellowspawn= null
rect udg_Yellowspawn2= null
sound udg_LoseALifeSound= null
trigger udg_trigger01= null
trigger udg_trigger02= null
trigger udg_trigger03= null
trigger udg_trigger04= null
trigger udg_trigger05= null
trigger udg_trigger06= null
trigger udg_trigger07= null
trigger udg_trigger08= null
trigger udg_trigger09= null
trigger udg_trigger10= null
trigger udg_trigger11= null
trigger udg_trigger12= null
trigger udg_trigger13= null
trigger udg_trigger14= null
trigger udg_trigger15= null
trigger udg_trigger16= null
trigger udg_trigger17= null
trigger udg_trigger18= null
trigger udg_trigger19= null
trigger udg_trigger20= null
trigger udg_trigger21= null
trigger udg_trigger22= null
trigger udg_trigger23= null
trigger udg_trigger24= null
trigger udg_trigger25= null
trigger udg_trigger26= null
trigger udg_trigger27= null
trigger udg_trigger28= null
trigger udg_trigger29= null
trigger udg_trigger30= null
trigger udg_trigger31= null
trigger udg_trigger32= null
trigger udg_trigger33= null
trigger udg_trigger34= null
trigger udg_trigger35= null
trigger udg_trigger36= null
trigger udg_trigger37= null
trigger udg_trigger38= null
trigger udg_trigger39= null
trigger udg_trigger40= null
trigger udg_trigger41= null
trigger udg_trigger42= null
trigger udg_trigger43= null
trigger udg_trigger44= null
trigger udg_trigger45= null
trigger udg_trigger46= null
trigger udg_trigger47= null
trigger udg_trigger48= null
trigger udg_trigger49= null
trigger udg_trigger50= null
trigger udg_trigger51= null
trigger udg_trigger52= null
unit udg_Ship= null
integer udg_UnitOwnershipInt= 0
integer array udg_Creeps
integer udg_CreepLevel= 0
integer udg_CreepWaveWaitTime= 0
integer udg_FinishWaveGoldReward= 0
multiboard udg_Scoreboard= null
integer udg_GameTime= 0
integer array udg_PlayerKills
string array udg_PlayerColorCodes
real array udg_ScoreboardColumnWidth
boolean udg_IsWaveInProgress= false
boolean udg_StartWaveTimer= false
integer udg_WaveTimer= 0
string array udg_CreepTypes
boolean udg_HasGameEnded= false
integer udg_GameEndTimer= 0
sound udg_GoldSound= null
integer array udg_PlayerScorePosition
boolean array udg_HasHardcoreRandomed
integer array udg_RepickCounter
rect udg_ShipDestination= null
sound udg_VictorySound= null
sound udg_DefeatSound= null
hashtable udg_UnitToCheckpointTable= null
rect udg_Brownspawn= null
rect udg_Brownspawn2= null
rect udg_Maroonspawn= null
rect udg_Maroonspawn2= null
hashtable udg_UtilityHashtable= null
string array udg_CreepNames
sound udg_ImpossibleDifficultySound= null
integer array udg_TierOneTowers
integer array udg_TierTwoTowers
integer array udg_TierThreeTowers
integer array udg_TierFourTowers
integer array udg_TierFiveTowers
integer array udg_TierSixTowers
integer array udg_TierSevenTowers
integer array udg_TierEightTowers
integer array udg_TierNineTowers
integer udg_TierNineSize= 0
integer udg_TierEightSize= 0
integer udg_TierSevenSize= 0
integer udg_TierSixSize= 0
integer udg_TierFiveSize= 0
integer udg_TierFourSize= 0
integer udg_TierThreeSize= 0
integer udg_TierTwoSize= 0
integer udg_TierOneSize= 0
trigger udg_trigger53= null
trigger udg_trigger55= null
rect array udg_PlayerRestrictionArea
trigger udg_trigger56= null
trigger udg_trigger57= null
trigger udg_trigger58= null
trigger udg_trigger59= null
trigger udg_trigger60= null
trigger udg_trigger61= null
trigger udg_trigger62= null
trigger udg_trigger63= null
trigger udg_trigger64= null
trigger udg_trigger65= null
trigger udg_trigger66= null
trigger udg_trigger67= null
trigger udg_trigger68= null
boolean array udg_PlayerRestrictions
trigger udg_trigger69= null
trigger udg_trigger70= null
trigger udg_trigger71= null
trigger udg_trigger72= null
string array udg_RaceNameArray
boolean array udg_HasHybridRandomed
unit udg_ArchimondeDummy= null
trigger udg_trigger73= null
trigger udg_trigger74= null
trigger udg_trigger75= null
trigger udg_trigger76= null
integer array udg_CreepAbilities
integer udg_CreepAbilitiesSize= 0
integer array udg_CurrentCreepAbilities
integer udg_CurrentCreepAbilitiesSize= 0
integer udg_PlayerRaceCounter= 0
integer array udg_PlayerRaceSelection
boolean array udg_HasNormalPicked
group udg_TowerTickGroup= null
hashtable udg_TowerTickTable= null
integer array udg_ItemLootLevelOne
integer udg_ItemLootLevelOneSize= 0
integer array udg_VoidFragmentTick
integer array udg_VoidFragmentTotal
unit array udg_VoidCultBuilder
integer udg_VoidFissureSpell= 0
location array udg_SpellPoint
integer udg_WorkerSlaveSpell= 0
hashtable udg_TowerEndOfTurnTable= null
group udg_TowerEndOfTurnGroup= null
integer udg_UDex= 0
integer array udg_UnitIndexLock
integer array udg_UDexPrev
integer array udg_UDexNext
real udg_UnitIndexEvent= 0
unit array udg_UDexUnits
integer udg_UDexRecycle= 0
boolean udg_UnitIndexerEnabled= false
integer udg_UDexWasted= 0
integer udg_UDexGen= 0
integer udg_DamageBlockingAbility= 0
integer udg_SpellDamageAbility= 0
integer udg_DamageTypeExplosive= 0
integer udg_DamageTypeCriticalStrike= 0
integer udg_DamageTypeHeal= 0
integer udg_DamageTypeReduced= 0
integer udg_DamageTypeBlocked= 0
integer udg_DmgEvBracers= 0
real udg_DAMAGE_FACTOR_BRACERS= 0
real udg_DAMAGE_FACTOR_ELUNES= 0
real udg_DAMAGE_FACTOR_ETHEREAL= 0
integer udg_DamageEventAOE= 0
integer udg_DamageEventLevel= 0
real udg_AfterDamageEvent= 0
real udg_DamageEvent= 0
real udg_AOEDamageEvent= 0
real udg_DamageModifierEvent= 0
trigger udg_ClearDamageEvent= null
real udg_DamageEventAmount= 0
real udg_DamageEventPrevAmt= 0
boolean udg_DamageEventOverride= false
boolean udg_NextDamageOverride= false
unit udg_DamageEventSource= null
unit udg_DamageEventTarget= null
trigger udg_DamageEventTrigger= null
trigger udg_DmgEvTrig= null
integer udg_DamageEventType= 0
integer array udg_LastDmgPrevType
integer udg_NextDamageType= 0
integer udg_DamageEventsWasted= 0
integer udg_DmgEvRecursionN= 0
boolean udg_DmgEvStarted= false
boolean udg_IsDamageSpell= false
boolean array udg_LastDmgWasSpell
real udg_LastDamageHP= 0
timer udg_DmgEvTimer= null
real array udg_LastDmgPrevAmount
real array udg_LastDmgValue
unit array udg_LastDmgSource
unit array udg_LastDmgTarget
boolean array udg_HideDamageFrom
boolean array udg_UnitDamageRegistered
unit udg_EnhancedDamageTarget= null
group udg_DamageEventAOEGroup= null
integer array udg_ItemLootLevelTwo
integer udg_ItemLootLevelTwoSize= 0
integer array udg_ItemLootLevelThree
integer udg_ItemLootLevelThreeSize= 0
integer array udg_ItemLootLevelFour
integer udg_ItemLootLevelFourSize= 0
hashtable udg_PlayerLeavesTable= null
integer array udg_ThrallSpellChance
integer array udg_ThrallSpell
boolean array udg_PlayerHasBuilt
group udg_Antiblockcheckgroup= null
integer udg_PlayerLimitLeft= 0
integer udg_PlayerLimitRight= 0
rect array udg_Redtestregions
hashtable udg_AntiBlockTable= null
boolean udg_TouchedLastTower= false
integer udg_PlayerLimitCircleOne= 0
integer udg_PlayerLimitCircleTwo= 0
integer udg_PlayerLimitCircleThree= 0
integer udg_PlayerLimitCircleFour= 0
unit array udg_Unitarray
integer udg_Unitarraysize= 0
integer udg_Towercounter= 0
integer udg_PlayerLimitOne= 0
integer udg_PlayerLimitTwo= 0
integer udg_PlayerLimitThree= 0
integer udg_PlayerLimitFour= 0
integer udg_PlayerLimitFive= 0
integer udg_PlayerLimitSix= 0
integer udg_PlayerLimitCircleFive= 0
integer udg_PlayerLimitCircleSix= 0
integer udg_PlayerLimitCircleSeven= 0
integer udg_PlayerLimitCheckpointOne= 0
integer udg_PlayerLimitCheckpointTwo= 0
integer udg_PlayerLimitCheckpointThree= 0
integer udg_PlayerLimitCheckpointFour= 0
integer udg_PlayerLimitCheckpointFive= 0
integer udg_PlayerLimitCheckpointSix= 0
integer udg_PlayerLimitCheckpointSeven= 0
integer udg_PlayerLimitCheckpointEight= 0
integer udg_AntiblockPlayerid= 0
trigger udg_trigger54= null
trigger udg_trigger77= null
trigger udg_trigger78= null
trigger udg_trigger79= null
trigger udg_trigger80= null
trigger udg_trigger81= null
trigger udg_trigger82= null
trigger udg_trigger83= null
trigger udg_trigger84= null
trigger udg_trigger86= null
trigger udg_trigger85= null
trigger udg_trigger87= null
trigger udg_trigger88= null
trigger udg_trigger89= null
trigger udg_trigger90= null
trigger udg_trigger91= null
trigger udg_trigger92= null
trigger udg_trigger93= null
boolean udg_Antijuggle= false
integer array udg_DisableOnOff
group array udg_TowerUnitGroup
integer array udg_SpittingSpiderChance
integer array udg_NaturesNourishChance
integer array udg_ChimaeraCount
group udg_ChimaeraRoost= null
integer array udg_ElementalistAbilities
integer udg_ElementalistAbilitiesSize= 0
integer udg_ForestTrollShadowPriest= 0
integer udg_EarthPandaren= 0
integer udg_SacrificialPit= 0
integer udg_CorruptedAncientofWar= 0
integer udg_Moonlight= 0
integer udg_NerubianBehemoth= 0
integer udg_OrcPeon= 0
integer udg_HumanPeasant= 0
integer udg_NagaSlave= 0
integer udg_UndeadAcolyte= 0
integer udg_NightElfWisp= 0
integer udg_FrostAttack= 0
integer udg_CorruptedTreeofLife= 0
integer udg_AdultGreenDragon= 0
integer udg_Wyvern= 0
integer udg_Knight= 0
integer udg_NetherDragon= 0
integer udg_StormPandaren= 0
integer udg_OgreWarrior= 0
integer udg_VenomTower= 0
integer udg_MoonDancer= 0
integer udg_CavernDruid= 0
integer udg_Rokhan= 0
integer udg_WarchiefThrall= 0
integer udg_DwarfStatue= 0
integer udg_VoidCorruptor= 0
integer udg_VoidBeing= 0
integer udg_AcidSpittingSpider= 0
integer udg_FelGuard= 0
integer udg_Mannoroth= 0
integer udg_SummoningShrine= 0
integer udg_Warden= 0
integer udg_Illidan= 0
integer udg_CavernHermit= 0
integer udg_CavernTurtle= 0
integer udg_CavernRevenant= 0
integer udg_CorruptedIllidan= 0
real udg_Difficulty= 0
boolean udg_DebugMode= false
integer udg_IceTrollJoker= 0
boolean udg_DmgEvRunning= false
boolean udg_DmgEvQueued= false

    // Generated
trigger gg_trg_Unit_Indexer= null
trigger gg_trg_Damage_Engine_Config= null
trigger gg_trg_Damage_Engine= null
trigger gg_trg_WarcraftMaulLibrary= null
trigger gg_trg_MapInit= null
trigger gg_trg_UnchargedRune= null
trigger gg_trg_JuggleDetection= null
trigger gg_trg_AntiBlockAndJuggle= null
trigger gg_trg_DifficultyVoteSystem= null
trigger gg_trg_PathingSystem= null
trigger gg_trg_Commands= null
trigger gg_trg_RaceSelection= null
trigger gg_trg_Quests= null
trigger gg_trg_UnitDies= null
trigger gg_trg_TowerAttackTrigger= null
trigger gg_trg_Construction= null
trigger gg_trg_RemoveBuilder= null
trigger gg_trg_PlayerLeaves= null
trigger gg_trg_SellTower= null
trigger gg_trg_MoveArchimonde= null
trigger gg_trg_Artifacts= null
trigger gg_trg_TowerTick= null
trigger gg_trg_Channel_Item= null
trigger gg_trg_Trade= null
trigger gg_trg_Enchantment= null
trigger gg_trg_Transfuse= null
trigger gg_trg_Infuse= null
trigger gg_trg_Sacrifice= null
trigger gg_trg_AlchemicalTransmutation= null
trigger gg_trg_BattleRoar= null
trigger gg_trg_DrunkenHaze= null
trigger gg_trg_SacrificeDamage= null
trigger gg_trg_ForceOfNature= null
trigger gg_trg_Moonstorm= null
trigger gg_trg_Crushed= null
trigger gg_trg_CrushedDamage= null
trigger gg_trg_WorkersUnionOrcPeon= null
trigger gg_trg_WorkersUnionHumanPeasant= null
trigger gg_trg_WorkersUnionNagaSlave= null
trigger gg_trg_WorkersUnionUndeadAcolyte= null
trigger gg_trg_WorkersUnionNightElfWisp= null
trigger gg_trg_FrostAttack= null
trigger gg_trg_ChainLightningAttack= null
trigger gg_trg_AdultGreenDragon= null
trigger gg_trg_Wyvern= null
trigger gg_trg_Knight= null
trigger gg_trg_AncientNetherDragon= null
trigger gg_trg_DrunkenBrawler= null
trigger gg_trg_MassiveBlow= null
trigger gg_trg_VenomTower= null
trigger gg_trg_MoonDancer= null
trigger gg_trg_Cavern_Druid_Ability= null
trigger gg_trg_Rokhan= null
trigger gg_trg_WarchiefThrall= null
trigger gg_trg_DwarfStatue= null
trigger gg_trg_VoidCorrupter= null
trigger gg_trg_VoidBeing= null
trigger gg_trg_AcidSpittingSpider= null
trigger gg_trg_FelGuard= null
trigger gg_trg_Mannoroth= null
trigger gg_trg_SummoningShrine= null
trigger gg_trg_Warden= null
trigger gg_trg_DemonicIllidan= null
trigger gg_trg_CorruptedIllidan= null
trigger gg_trg_CavernHermit= null
trigger gg_trg_CavernTurtle= null
trigger gg_trg_CavernRevenant= null
trigger gg_trg_IceTrollJoker= null
trigger gg_trg_WalkItOff= null
trigger gg_trg_DivineShield= null
trigger gg_trg_CrippleAura= null
trigger gg_trg_VampiricAura= null
destructable gg_dest_B000_0160= null
trigger gg_trg_Remove_Spiders= null
trigger gg_trg_Disable_Tower_Create_UG= null
trigger gg_trg_Disable_Towers_Command= null
trigger gg_trg_Disable_Towers_Add= null
trigger gg_trg_Disable_Towers_Select= null
trigger gg_trg_Disable_Towers_Remove= null
trigger gg_trg_Growth_Aura_Level_Up= null
trigger gg_trg_Ancient_Protector_Ability= null
trigger gg_trg_Chim_Int_Reduce= null
trigger gg_trg_Chim_Spawn= null
trigger gg_trg_Chim_Add_to_Grp= null
trigger gg_trg_Chim_Rem_from_Grp= null
trigger gg_trg_Natures_Nourishment_Item= null
trigger gg_trg_Void_Lord_Ability= null
trigger gg_trg_Void_Fissure_Ability= null
trigger gg_trg_Void_Worshipper_Limit= null
trigger gg_trg_Void_Fragment_Die= null
trigger gg_trg_Void_Fragment_Construction= null
trigger gg_trg_Void_Fragment_Ability= null
trigger gg_trg_Void_Fragment_Tick= null
trigger gg_trg_Void_Fragment_Spend= null
trigger gg_trg_SiphonEnergy= null


//JASSHelper struct globals:



//JASSHelper struct globals:



//JASSHelper struct globals:



//JASSHelper struct globals:

endglobals








//library MapInit:
function InitializePlayers takes nothing returns nothing
 local integer i= 0
	loop
		exitwhen i > 12
		if ( GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING ) then
			set udg_PlayerCount=udg_PlayerCount + 1
			call CreateFogModifierRectBJ(true, Player(i), FOG_OF_WAR_VISIBLE, GetPlayableMapRect())
			call SetPlayerAllianceStateBJ(Player(i), Player(13), bj_ALLIANCE_UNALLIED)
			call SetPlayerAllianceStateBJ(Player(i), Player(14), bj_ALLIANCE_UNALLIED)
			call SetPlayerAllianceStateBJ(Player(i), Player(15), bj_ALLIANCE_UNALLIED)
			call SetPlayerAllianceStateBJ(Player(i), Player(16), bj_ALLIANCE_UNALLIED)
			if ( i == 8 ) then
				call SetPlayerStateBJ(Player(i), PLAYER_STATE_RESOURCE_GOLD, 150)
			else
				call SetPlayerStateBJ(Player(i), PLAYER_STATE_RESOURCE_GOLD, 100)
			endif
   			call SetPlayerStateBJ(Player(i), PLAYER_STATE_RESOURCE_LUMBER, 1)
		endif
		set i=i + 1
	endloop

	if ( udg_DebugMode ) then
		call CreateUnit(Player(0), 'e00W', 0.00, 0.00, bj_UNIT_FACING)
	endif
endfunction

function InitializeTeleports takes nothing returns nothing
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n017', 0.00, - 970.00, bj_UNIT_FACING)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n017', - 4400.00, 4737.00, bj_UNIT_FACING)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n017', 4400.00, 4737.00, bj_UNIT_FACING)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n017', - 2176.00, 700.00, bj_UNIT_FACING)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n017', 2176.00, 700.00, bj_UNIT_FACING)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n017', - 4400.00, - 2500.00, bj_UNIT_FACING)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n017', 4400.00, - 2500.00, bj_UNIT_FACING)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n017', 1950.00, - 3500.00, bj_UNIT_FACING)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n017', - 1950.00, - 3500.00, bj_UNIT_FACING)
endfunction

function MakeSpecificCheckpointBuildable takes integer i returns nothing
 local real locX= GetRectCenterX(udg_Checkpoints[i])
 local real locY= GetRectCenterY(udg_Checkpoints[i])
 local integer x= - 48
 local integer y= - 48
	loop
		exitwhen x > 48
		loop
			exitwhen y > 48
			call SetTerrainPathable(locX + x, locY + y, PATHING_TYPE_BUILDABILITY, true)
			set y=y + 32
		endloop
		set y=- 48
		set x=x + 32
	endloop
endfunction

function MakeCheckpointsBuildable takes nothing returns nothing
 local integer i= 1
	loop
		exitwhen i > 30
		call MakeSpecificCheckpointBuildable(i)
		set i=i + 1
	endloop
endfunction

function PreloadCreepAbilities takes nothing returns nothing
 local integer i= 0
 local unit u= CreateUnit(Player(bj_PLAYER_NEUTRAL_EXTRA), 'uloc', 0, 0, 0)

	loop
	exitwhen i == udg_CreepAbilitiesSize
		call UnitAddAbility(u, udg_CreepAbilities[i])
	set i=i + 1
	endloop

	call UnitAddAbilityBJ('A06B', u)

	call RemoveUnit(u)
	set u=null
endfunction

function InitializeTowerTierArrays takes nothing returns nothing

	// TIER ONE 3 - 15
	set udg_TierOneTowers[0]='hC85' // Black Dragon Whelp
	set udg_TierOneTowers[1]='h03W' // Felguard
	set udg_TierOneTowers[2]='hC66' // Tower (5)
	set udg_TierOneTowers[3]='hC21' // Ghast
	set udg_TierOneTowers[4]='hC02' // Grunt
	set udg_TierOneTowers[5]='hC11' // Hippogryph
	set udg_TierOneTowers[6]='o003' // Chaos Grunt (10)
	set udg_TierOneTowers[7]='o009' // High Elf Swordsman (10)
	set udg_TierOneTowers[8]='oC14' // Sasquatch (10)
	set udg_TierOneTowers[9]='h01C' // Centaur Outrunner (8)
	set udg_TierOneTowers[10]='n009' // Corrupted Moon Well (10)
	set udg_TierOneTowers[11]='n031' // Angel Warrior (8)
	set udg_TierOneTowers[12]='n02T' // Adventurer (8)
	set udg_TierOneTowers[13]='n03D' // Forest Troll (8)
	set udg_TierOneTowers[14]='n055' // French Soldier (7)
	set udg_TierOneTowers[15]='n047' // Ghoul (8)
	set udg_TierOneTowers[16]='n029' // Gnoll (7)
	set udg_TierOneTowers[17]='h04T' // [Cavernous Creatures] - Cavern Mushroom (5)
	set udg_TierOneTowers[18]='n01Y' // MAZE ME PLOX (3)
	set udg_TierOneTowers[19]='n04K' // Mild-Mannered Chris (10)
	set udg_TierOneTowers[20]='n05H' // Undead Dwarf (5)
	set udg_TierOneTowers[21]='h02H' // Marine (10)
	set udg_TierOneTowers[22]='h01P' // Minature Mecha Goblin (10)
	set udg_TierOneTowers[23]='h01Z' // Spirit Wolf (8)
	set udg_TierOneTowers[24]='e00J' // Star Shooter (7)
	set udg_TierOneTowers[25]='h03D' // [Draenei] - Draenei Hut (5)
	set udg_TierOneTowers[26]='h04K' // [Arachnid] - Basement Barrel (10)
	set udg_TierOneTowers[27]='n02H' // Roots (3)
	set udg_TierOneTowers[28]='h02G' // [Void Cult] - Void Worshipper (8)
	set udg_TierOneTowers[29]='h03E' // [Workers Union] - Orc Peon (5)
	set udg_TierOneTowers[30]='n02X' // Scavenger (12)
	set udg_TierOneTowers[31]='e00E' // [Night Elves] - Wisp (8)
	set udg_TierOneTowers[32]='n00F' // Ice Troll (8)
	
	set udg_TierOneSize=32

	// TIER TWO 16 - 99
	set udg_TierTwoTowers[0]='hC87' // Blue Dragon Whelp
	set udg_TierTwoTowers[1]='hC27' // Crypt Fiend
	set udg_TierTwoTowers[2]='o004' // Chaos Raider (40)
	set udg_TierTwoTowers[3]='oC18' // Gargoyle (40)
	set udg_TierTwoTowers[4]='o00A' // High Elf Archer (40)
	set udg_TierTwoTowers[5]='oC35' // Ogre Warrior (40)
	set udg_TierTwoTowers[6]='n00O' // Corrupted Ent (40)
	set udg_TierTwoTowers[7]='n02J' // Blademastur (40)
	set udg_TierTwoTowers[8]='n04L' // Decimator (40)
	set udg_TierTwoTowers[9]='n049' // Fallen Archer (40)
	set udg_TierTwoTowers[10]='n05I' // Mortar Dwarves (30)
	set udg_TierTwoTowers[11]='n02U' // Sorceress (20)
	set udg_TierTwoTowers[12]='n048' // Zombie (40)
	set udg_TierTwoTowers[13]='h02I' // Fel Clown (40)
	set udg_TierTwoTowers[14]='h01Q' // Goblin Sapper (40)
	set udg_TierTwoTowers[15]='h020' // Water Elemental (40)
	set udg_TierTwoTowers[16]='h03U' // Felhound
	set udg_TierTwoTowers[17]='h00C' // Faerie Dragon (80)
	set udg_TierTwoTowers[18]='oC56' // Meat Wagon (80)
	set udg_TierTwoTowers[19]='oC58' // Shaman (95)
	set udg_TierTwoTowers[20]='h01E' // Gnoll Warden (60)
	set udg_TierTwoTowers[21]='n056' // Cow Catapult (Sheep) (60)
	set udg_TierTwoTowers[22]='n00M' // Den (60)
	set udg_TierTwoTowers[23]='n04A' // Abomination (80)
	set udg_TierTwoTowers[24]='n05J' // Dwarven Hunter (50)
	set udg_TierTwoTowers[25]='n03E' // Forest Troll Berserker (50)
	set udg_TierTwoTowers[26]='n02B' // Gnoll Brute (60)
	set udg_TierTwoTowers[27]='n04M' // Lord D.O.T (80)
	set udg_TierTwoTowers[28]='n05K' // Mountain Dwarf (90)
	set udg_TierTwoTowers[29]='n01T' // Stag (50)
	set udg_TierTwoTowers[30]='n04V' // The B3ast (80)
	set udg_TierTwoTowers[31]='e00K' // Moon Dancer (30)
	set udg_TierTwoTowers[32]='h04H' // [Draenei] - Salamander Hatchling (50)
	set udg_TierTwoTowers[33]='n010' // Corrupted Ancient of Lore (16)
	set udg_TierTwoTowers[34]='h03I' // [Workers Union] - Undead Acolyte (75)
	set udg_TierTwoTowers[35]='n02V' // Merchant (16)
	set udg_TierTwoTowers[36]='n02W' // Arcane Infuser (28)
	set udg_TierTwoTowers[37]='n007' // Elemental (24)
	set udg_TierTwoTowers[38]='n012' // Merchant (32)
	set udg_TierTwoTowers[39]='hC80' // [Night Elves] - Huntress (75)
	set udg_TierTwoTowers[40]='h04R' // [Cavernous Creatures] - Small Cavernous Growth (50)
	set udg_TierTwoTowers[41]='h041' // [Cavernous Creatures] - Cavern Frog (80)
	set udg_TierTwoTowers[42]='oC19' // [Orc Stronghold] - Headhunter (50)
	set udg_TierTwoTowers[43]='n00G' // Ice Troll Berserker (50)

	set udg_TierTwoSize=43

	// TIER THREE 100 - 149
	set udg_TierThreeTowers[0]='hC53' // Ancient Protector
	set udg_TierThreeTowers[1]='hC36' // Gyrocopter
	set udg_TierThreeTowers[2]='o005' // Chaos Warlock (100)
	set udg_TierThreeTowers[3]='o00B' // High Elf Sorceress (100)
	set udg_TierThreeTowers[4]='oC73' // Obsidian Statue (120)
	set udg_TierThreeTowers[5]='n02K' // Eliminator (100)
	set udg_TierThreeTowers[6]='n03F' // Forest Troll Trapper (120)
	set udg_TierThreeTowers[7]='n02C' // Gnoll Overseer (120)
	set udg_TierThreeTowers[8]='n04B' // Necromancer (120)
	set udg_TierThreeTowers[9]='n057' // Witch Hunter (Peasant) (100)
	set udg_TierThreeTowers[10]='h02A' // Orc Firebat (100)
	set udg_TierThreeTowers[11]='h01R' // Goblin Bomber (100)
	set udg_TierThreeTowers[12]='hC08' // Knight (120)
	set udg_TierThreeTowers[13]='e00L' // Druid (100)
	set udg_TierThreeTowers[14]='h04F' // [Draenei] - Draenei Seer (100)
	set udg_TierThreeTowers[15]='n00H' // Ice Troll Trapper (120)

	set udg_TierThreeSize=15

	// TIER FOUR 150 - 299
	set udg_TierFourTowers[0]='hC89' // Adult Green Dragon (170)
	set udg_TierFourTowers[1]='hC88' // Adult Bronze Dragon (160)
	set udg_TierFourTowers[2]='h01D' // Forest Troll Shadow Priest (150)
	set udg_TierFourTowers[3]='n00L' // Corrupted Ancient Protector (150)
	set udg_TierFourTowers[4]='n05L' // Blacksmith (150)
	set udg_TierFourTowers[5]='n03G' // Forest Troll Warlord (160)
	set udg_TierFourTowers[6]='n01U' // Frog (150)
	set udg_TierFourTowers[7]='n04C' // Rifleman (160)
	set udg_TierFourTowers[8]='n02L' // Sniper (150)
	set udg_TierFourTowers[9]='n058' // The Knights Who Say Ni! (180)
	set udg_TierFourTowers[10]='h005' // Gryphon Rider (175)
	set udg_TierFourTowers[11]='h025' // Serpent Ward (150)
	set udg_TierFourTowers[12]='h01S' // Superior Mecha Goblin (150)
	set udg_TierFourTowers[13]='hC54' // Siege Engine (160)
	set udg_TierFourTowers[14]='h03X' // Succubus
	set udg_TierFourTowers[15]='h00Q' // Batrider
	set udg_TierFourTowers[16]='h00M' // Harpy
	set udg_TierFourTowers[17]='hC94' // Lich
	set udg_TierFourTowers[18]='hC96' // Ancient Red Dragon (280)
	set udg_TierFourTowers[19]='o00R' // Boneyard (250)
	set udg_TierFourTowers[20]='o007' // Chaos Champ
	set udg_TierFourTowers[21]='o012' // Chaos Shrine (250)
	set udg_TierFourTowers[22]='h006' // Phoenix Egg (250)
	set udg_TierFourTowers[23]='o00Z' // High Elf Ballista (250)
	set udg_TierFourTowers[24]='oC26' // Mountain Giant (200)
	set udg_TierFourTowers[25]='h04E' // Archmage (200)
	set udg_TierFourTowers[26]='o00X' // Rock Golem (250)
	set udg_TierFourTowers[27]='oC64' // Tauren (200)
	set udg_TierFourTowers[28]='h01B' // Druid of the Claw (200)
	set udg_TierFourTowers[29]='hC34' // Harpy Scout (250)
	set udg_TierFourTowers[30]='n02M' // 50fang (250)
	set udg_TierFourTowers[31]='n05M' // Dwarven Warrior (225)
	set udg_TierFourTowers[32]='n03H' // Forest Troll Shadow Priest (200)
	set udg_TierFourTowers[33]='n04D' // Knight (200)
	set udg_TierFourTowers[34]='n04N' // Sir C.R.U.S.T.Y. (200)
	set udg_TierFourTowers[35]='n059' // Tim the Enchanter (260)
	set udg_TierFourTowers[36]='h02J' // Admiral Proudmoore (200)
	set udg_TierFourTowers[37]='h03O' // Goblin's Ogre (275)
	set udg_TierFourTowers[38]='h026' // Lava Spawn (250)
	set udg_TierFourTowers[39]='e00O' // Night Star (200)
	set udg_TierFourTowers[40]='h02R' // [Draenei] - Draenei Demolisher (200)
	set udg_TierFourTowers[41]='n00U' // [Demon] - Summoning Shrine (225)
	set udg_TierFourTowers[42]='h03F' // [Workers Union] - Human Peasant (200)
	set udg_TierFourTowers[43]='h02F' // [Void Cult] - Void Priest (200)
	set udg_TierFourTowers[44]='hC82' // [Night Elves] - Ancient Protector (150)
	set udg_TierFourTowers[45]='hC86' // [Night Elves] - Chimaera Roost (250)
	set udg_TierFourTowers[46]='h04M' // [Cavernous Creatures] - Cavern Hermit (200)
	set udg_TierFourTowers[47]='h022' // Spirit Bear (150)
	set udg_TierFourTowers[48]='o00C' // [High Elven] - High Elf Captain (200)
	set udg_TierFourTowers[49]='n018' // Ice Troll Priest (200)

	set udg_TierFourSize=49

	// TIER FIVE 300 - 399
	set udg_TierFiveTowers[0]='h03V' // Doom Guard
	set udg_TierFiveTowers[1]='hC97' // Iron Golem
	set udg_TierFiveTowers[2]='h00R' // Sacrificial Pit
	set udg_TierFiveTowers[3]='h027' // Prawn (350)
	set udg_TierFiveTowers[4]='hC92' // Ancient Nether Dragon (350)
	set udg_TierFiveTowers[5]='o006' // Chaos Kodo Beast (300)
	set udg_TierFiveTowers[6]='o011' // Chaos Wyvern Rider (350)
	set udg_TierFiveTowers[7]='oC67' // Flesh Golem (350)
	set udg_TierFiveTowers[8]='h04B' // Cold Tower (300)
	set udg_TierFiveTowers[9]='oC60' // Wyvern (350)
	set udg_TierFiveTowers[10]='h01G' // Razormane (325)
	set udg_TierFiveTowers[11]='n00N' // Corrupted Ancient of War (325)
	set udg_TierFiveTowers[12]='n04E' // Banshee (300)
	set udg_TierFiveTowers[13]='n05B' // Brother Maynard (300)
	set udg_TierFiveTowers[14]='n03I' // Forest Troll High Priest (320)
	set udg_TierFiveTowers[15]='n02D' // Gnoll Poacher (300)
	set udg_TierFiveTowers[16]='n05A' // Killer Rabbit (333)
	set udg_TierFiveTowers[17]='n04O' // Mr. Charlie (300)
	set udg_TierFiveTowers[18]='n01W' // Penguin (300)
	set udg_TierFiveTowers[19]='h02K' // Forgotten One (300)
	set udg_TierFiveTowers[20]='h02L' // Hydralisk (350)
	set udg_TierFiveTowers[21]='h01W' // Decepticon Goblin Autobot (375)
	set udg_TierFiveTowers[22]='e00P' // Star Chaser (350)
	set udg_TierFiveTowers[23]='h04G' // [Draenei] - Draenei Spiritualist (350)
	set udg_TierFiveTowers[24]='h04N' // [Cavernous Creatures] - Cavern Turtle (300)
	set udg_TierFiveTowers[25]='n019' // Ice Troll High Priest (320)

	set udg_TierFiveSize=25

	// TIER SIX 400 - 499
	set udg_TierSixTowers[0]='hC32' // Frost Wyrm (400)
	set udg_TierSixTowers[1]='o013' // Chaos Pool (400)
	set udg_TierSixTowers[2]='oC68' // Chimera (450)
	set udg_TierSixTowers[3]='o00D' // High Elf Blood Mage (450)
	set udg_TierSixTowers[4]='o00Q' // Hight Elf Captain (400)
	set udg_TierSixTowers[5]='o00S' // Tauren Chieftain (400)
	set udg_TierSixTowers[6]='n00P' // Corrupted Tree of Life (400)
	set udg_TierSixTowers[7]='n02N' // Captain (400)
	set udg_TierSixTowers[8]='n05N' // Flying Dwarf (400)
	set udg_TierSixTowers[9]='n03J' // Forest Troll Joker (400)
	set udg_TierSixTowers[10]='n01Z' // Pig (450)
	set udg_TierSixTowers[11]='h00K' // Death Tower (400)
	set udg_TierSixTowers[12]='n04P' // OhMyWTEFF? (400)
	set udg_TierSixTowers[13]='e00Q' // Space Runner (450)
	set udg_TierSixTowers[14]='h03G' // [Workers Union] - Naga Slave (400)
	set udg_TierSixTowers[15]='h00B' // [Night Elves] - Ancient of Wind (400)
	set udg_TierSixTowers[16]='h04Q' // [Cavernous Creatures] - Cavern Druid (400)
	set udg_TierSixTowers[17]='n01A' // Ice Troll Joker (400)

	set udg_TierSixSize=17

	// TIER SEVEN 500 - 699
	set udg_TierSevenTowers[0]='h00F' // Dreadlord
	set udg_TierSevenTowers[1]='h00N' // Infernal Fireblaster
	set udg_TierSevenTowers[2]='h004' // Sapphiron
	set udg_TierSevenTowers[3]='h001' // Deathwing (600)
	set udg_TierSevenTowers[4]='o00T' // Blademaster (500)
	set udg_TierSevenTowers[5]='o016' // Chaos Farseer (500)
	set udg_TierSevenTowers[6]='oC74' // Dune Worm (500)
	set udg_TierSevenTowers[7]='o015' // Giant King (600)
	set udg_TierSevenTowers[8]='o008' // Gnom Hellscream (600)
	set udg_TierSevenTowers[9]='o00G' // Jungle Stalker (500)
	set udg_TierSevenTowers[10]='h04C' // Boulder Tower (600)
	set udg_TierSevenTowers[11]='o00U' // Phoenix (600)
	set udg_TierSevenTowers[12]='o00P' // Rexxar (600)
	set udg_TierSevenTowers[13]='o00Y' // Sea Giant (550)
	set udg_TierSevenTowers[14]='o00K' // Zealot (600)
	set udg_TierSevenTowers[15]='n05O' // Battle Golem (650)
	set udg_TierSevenTowers[16]='n04Q' // BladeMastur (600)
	set udg_TierSevenTowers[17]='n02E' // Gnoll Assassin (500)
	set udg_TierSevenTowers[18]='n01X' // Lizard (550)
	set udg_TierSevenTowers[19]='n04F' // Lord Garithos (500)
	set udg_TierSevenTowers[20]='n05C' // Sir Galahad the Pure (500)
	set udg_TierSevenTowers[21]='n020' // Snow Owl (650)
	set udg_TierSevenTowers[22]='n04G' // Varimathras (600)
	set udg_TierSevenTowers[23]='h02M' // Orc Kart (500)
	set udg_TierSevenTowers[24]='h02N' // Undead Kart (650)
	set udg_TierSevenTowers[25]='h01Y' // Goblin Inferno Silo (650)
	set udg_TierSevenTowers[26]='h01X' // Goblin Tesla Coil (500)
	set udg_TierSevenTowers[27]='h028' // Skeletal Mage (500)
	set udg_TierSevenTowers[28]='h029' // Spirit Hawk (600)
	set udg_TierSevenTowers[29]='e00R' // Celestial Mist (600)
	set udg_TierSevenTowers[30]='h04I' // [Draenei] - Salamander Lord (500)
	set udg_TierSevenTowers[31]='h01M' // [Void Cult] - Void Fissure (500)
	set udg_TierSevenTowers[32]='h03H' // [Workers Union] - Night Elf Wisp (600)
	set udg_TierSevenTowers[33]='h00G' // [Night Elves] - Warden (550)
	set udg_TierSevenTowers[34]='h04O' // [Cavernous Creatures] - Cavern Revenant (600)
	set udg_TierSevenTowers[35]='n01B' // Ice Troll King (500)

	set udg_TierSevenSize=35

	// TIER EIGHT 700 - 899
	set udg_TierEightTowers[0]='h00P' // Queen Alexstrasza
	set udg_TierEightTowers[1]='h002' // Rokhan
	set udg_TierEightTowers[2]='o01B' // Chaos Blademaster (800) 
	set udg_TierEightTowers[3]='o00N' // Kael (700)
	set udg_TierEightTowers[4]='oC65' // Warchief Thrall (800)
	set udg_TierEightTowers[5]='h01U' // Fire Lord (850)
	set udg_TierEightTowers[6]='n03L' // Forest Troll King (800)
	set udg_TierEightTowers[7]='n02F' // Gnoll Warden (800)
	set udg_TierEightTowers[8]='n02O' // Grand General Nice-Angel (750)
	set udg_TierEightTowers[9]='n04R' // MissyisPissy (800)
	set udg_TierEightTowers[10]='n05D' // Shrubbery (700)
	set udg_TierEightTowers[11]='n03B' // Spirit Hydra (800)
	set udg_TierEightTowers[12]='n021' // iamBEAST (850)
	set udg_TierEightTowers[13]='h02O' // Dwarf Kart (800)
	set udg_TierEightTowers[14]='h02B' // Treant (700)
	set udg_TierEightTowers[15]='h04D' // Flame Tower (750)
	set udg_TierEightTowers[16]='h00L' // Dalaran Guard Tower (850)
	set udg_TierEightTowers[17]='e00S' // Moonlight (850)
	set udg_TierEightTowers[18]='h00I' // [Draenei] - Akama (800)
	set udg_TierEightTowers[19]='h01A' // [Void Cult] - Void Corrupter (800)
	set udg_TierEightTowers[20]='e008' // [Night Elves] - Illidan (700)

	set udg_TierEightSize=20

	// TIER NINE 900+
	set udg_TierNineTowers[0]='h000' // Antonidas the Undead
	set udg_TierNineTowers[1]='h02V' // Sky-Fury (1000)
	set udg_TierNineTowers[2]='o00L' // Mannoroth (1000)
	set udg_TierNineTowers[3]='eC93' // Kil'jaeden (1200)
	set udg_TierNineTowers[4]='n00R' // Corrupted Shandris (1000)
	set udg_TierNineTowers[5]='n00S' // Corrupted Warden (900)
	set udg_TierNineTowers[6]='n04S' // BrandTheOne (1400)
	set udg_TierNineTowers[7]='n05Q' // Dwarf King (Statue) (2000)
	set udg_TierNineTowers[8]='n03K' // Forest Troll Emperor (1000)
	set udg_TierNineTowers[9]='n05F' // Sir Lancelot the Brave (1000)
	set udg_TierNineTowers[10]='n04H' // Sylvanus Windrunner (900)
	set udg_TierNineTowers[11]='n02R' // Dragon Turtle (1200)
	set udg_TierNineTowers[12]='n04T' // Trap (1800)
	set udg_TierNineTowers[13]='n05E' // The Black Beast of Arrrghhh (1300)
	set udg_TierNineTowers[14]='n02P' // White-Angel (900)
	set udg_TierNineTowers[15]='n02G' // phoenixfun.rg the gnoll (1000)
	set udg_TierNineTowers[16]='h02P' // Diablo Kart (1000)
	set udg_TierNineTowers[17]='h02Q' // Iron As In Arthas (1200)
	set udg_TierNineTowers[18]='h02D' // Avatar of Vengeance (1000)
	set udg_TierNineTowers[19]='h01K' // Goblin Tinker (900)
	set udg_TierNineTowers[20]='h02C' // Quilbeast (900)
	set udg_TierNineTowers[21]='e00T' // The Creator (1000)
	set udg_TierNineTowers[22]='o001' // Giant King (999)
	set udg_TierNineTowers[23]='n03B' // [Cavernous Creatures] - Spirit Hydra (900)
	set udg_TierNineTowers[24]='n01C' // Ice Troll Emperor (900)

	set udg_TierNineSize=24
endfunction

function InitializeNeutralPassiveCreeps takes nothing returns nothing
 local unit array NeutralUnits
 local integer i= 0
	set NeutralUnits[0]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'u006', 1664.0, 3072.0, 270.0)
	set NeutralUnits[1]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'hC04', 1792.0, 3072.0, 270.0)
	set NeutralUnits[2]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'eC05', 1920.0, 3072.0, 270.0)
	set NeutralUnits[3]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'hC16', 2048.0, 3072.0, 270.0)
	set NeutralUnits[4]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC17', 2176.0, 3072.0, 270.0)
	set NeutralUnits[5]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC29', 1664.0, 2944.0, 270.0)
	set NeutralUnits[6]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'o01C', 1792.0, 2944.0, 270.0)
	set NeutralUnits[7]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC30', 1920.0, 2944.0, 270.0)
	set NeutralUnits[8]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'oC31', 2048.0, 2944.0, 270.0)
	set NeutralUnits[9]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC33', 2176.0, 2944.0, 270.0)
	set NeutralUnits[10]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n008', 1664.0, 2816.0, 270.0)
	set NeutralUnits[11]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'eC38', 1792.0, 2816.0, 270.0)
	set NeutralUnits[12]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC39', 1920.0, 2816.0, 270.0)
	set NeutralUnits[13]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC40', 2048.0, 2816.0, 270.0)
	set NeutralUnits[14]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC41', 2176.0, 2816.0, 270.0)
	set NeutralUnits[15]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC42', 1664.0, 2688.0, 270.0)
	set NeutralUnits[16]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'uC43', 1792.0, 2688.0, 270.0)
	set NeutralUnits[17]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'hC44', 1920.0, 2688.0, 270.0)
	set NeutralUnits[18]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'uC45', 2048.0, 2688.0, 270.0)
	set NeutralUnits[19]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n004', 2176.0, 2688.0, 270.0)
	set NeutralUnits[20]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'hC48', 1664.0, 2560.0, 270.0)
	set NeutralUnits[21]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'oC47', 1792.0, 2560.0, 270.0)
	set NeutralUnits[22]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC49', 1920.0, 2560.0, 270.0)
	set NeutralUnits[23]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC50', 2048.0, 2560.0, 270.0)
	set NeutralUnits[24]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC51', 2176.0, 2560.0, 270.0)
	set NeutralUnits[25]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nC69', 1664.0, 2432.0, 270.0)
	set NeutralUnits[26]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'eC52', 1792.0, 2432.0, 270.0)
	set NeutralUnits[27]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'oC70', 1920.0, 2432.0, 270.0)
	set NeutralUnits[28]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'hC95', 2048.0, 2432.0, 270.0)
	set NeutralUnits[29]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'uC71', 2176.0, 2432.0, 270.0)
	set NeutralUnits[30]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'hC76', 1664.0, 2304.0, 270.0)
	set NeutralUnits[31]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'h03Y', 1792.0, 2304.0, 270.0)
	set NeutralUnits[32]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'h03Z', 1920.0, 2304.0, 270.0)
	set NeutralUnits[33]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'h040', 2048.0, 2304.0, 270.0)

	loop
		exitwhen i > 33
		call SetUnitInvulnerable(NeutralUnits[i], true)
		call PauseUnit(NeutralUnits[i], true)
		set i=i + 1
	endloop
endfunction

function MapInit_InitializeVariables takes nothing returns nothing
 local rect bluerect= Rect(- 64.00, 4032.00, 64.00, 4160.00)
 local rect bluerect2= Rect(- 64.00, 2880.00, 64.00, 3008.00)
 local rect yellowrect= Rect(- 32.00, 992.00, 32.00, 1056.00)
 local rect yellowrect2= Rect(- 32.00, - 160.00, 32.00, - 96.00)

	// TEST
	// RED
	set udg_Redtestregions[0]=Rect(- 4160.0, 5440.0, - 1856.0, 5504.0) // Long top
	set udg_Redtestregions[1]=Rect(- 1856.0, 5024.0, - 1792.0, 5440.0) // Spawn top
	set udg_Redtestregions[2]=Rect(- 4160.0, 3968.0, - 1856.0, 4032.0) // Long bottom
	set udg_Redtestregions[3]=Rect(- 1856.0, 4032.0, - 1792.0, 4416.0) // Spawn bottom
	set udg_Redtestregions[4]=Rect(- 4224.0, 3968.0, - 4160.0, 4672.0) // Left bottom
	set udg_Redtestregions[5]=Rect(- 4224.0, 4768.0, - 4160.0, 5440.0) // Left top
	
	// Circle 1
	set udg_Redtestregions[6]=Rect(- 3552.0, 4672.0, - 2464.0, 4800.0) // Left
	set udg_Redtestregions[7]=Rect(- 2496.0, 4768.0, - 2368.0, 5440.0) // Up
	set udg_Redtestregions[8]=Rect(- 2400.0, 4672.0, - 1856.0, 4800.0) // Right
	set udg_Redtestregions[9]=Rect(- 2496.0, 4032.0, - 2368.0, 4704.0) // Down
	
	// Circle 2
	set udg_Redtestregions[10]=Rect(- 3648.0, 4032.0, - 3520.0, 4704.0) // Down
	set udg_Redtestregions[11]=Rect(- 4192.0, 4672.0, - 3616.0, 4800.0) // Left
	set udg_Redtestregions[12]=Rect(- 3648.0, 4768.0, - 3520.0, 5440.0) // Up
	
	// Checkpoint 1
	set udg_Redtestregions[13]=Rect(- 2496.0, 4736.0, - 2432.0, 4800.0) // UL
	set udg_Redtestregions[14]=Rect(- 2432.0, 4736.0, - 2368.0, 4800.0) // UR
	set udg_Redtestregions[15]=Rect(- 2432.0, 4672.0, - 2368.0, 4736.0) // LR
	set udg_Redtestregions[16]=Rect(- 2496.0, 4672.0, - 2432.0, 4736.0) // LL
	
	// Checkpoint 2
	set udg_Redtestregions[17]=Rect(- 3648.0, 4736.0, - 3584.0, 4800.0) // UL
	set udg_Redtestregions[18]=Rect(- 3584.0, 4736.0, - 3520.0, 4800.0) // UR
	set udg_Redtestregions[19]=Rect(- 3584.0, 4672.0, - 3520.0, 4736.0) // LR
	set udg_Redtestregions[20]=Rect(- 3648.0, 4672.0, - 3584.0, 4736.0) // LL

	// BLUE
	set udg_Redtestregions[21]=Rect(- 768.0, 2304.0, - 704.0, 4672.0) // Long left
	set udg_Redtestregions[22]=Rect(- 768.0, 4672.0, - 320.0, 4736.0) // Spawn top left
	set udg_Redtestregions[23]=Rect(704.0, 2304.0, 768.0, 4672.0) // Long right
	set udg_Redtestregions[24]=Rect(320.0, 4672.0, 768.0, 4736.0) // Spawn top right
	set udg_Redtestregions[25]=Rect(160.0, 2304.0, 704.0, 2368.0) // Exit right
	set udg_Redtestregions[26]=Rect(- 704.0, 2304.0, - 160.0, 2368.0) // Exit left
	
	// Circle 1
	set udg_Redtestregions[27]=Rect(- 64.0, 2976.0, 64.0, 4064.0) // Down
	set udg_Redtestregions[28]=Rect(- 704.0, 4032.0, - 32.0, 4160.0) // Left
	set udg_Redtestregions[29]=Rect(- 64.0, 4128.0, 64.0, 4704.0) // Up
	set udg_Redtestregions[30]=Rect(32.0, 4032.0, 704.0, 4160.0) // Right
	
	// Circle 2
	set udg_Redtestregions[31]=Rect(32.0, 2880.0, 704.0, 3008.0) // Right
	set udg_Redtestregions[32]=Rect(- 64.0, 2336.0, 64.0, 2912.0) // Down
	set udg_Redtestregions[33]=Rect(- 704.0, 2880.0, - 32.0, 3008.0) // Up
	
	// Checkpoint 1
	set udg_Redtestregions[34]=Rect(- 64.0, 4096.0, 0.0, 4160.0) // UL
	set udg_Redtestregions[35]=Rect(0.0, 4096.0, 64.0, 4160.0) // UR
	set udg_Redtestregions[36]=Rect(0.0, 4032.0, 64.0, 4096.0) // LR
	set udg_Redtestregions[37]=Rect(- 64.0, 4032.0, 0.0, 4096.0) // LL
	
	// Checkpoint 2
	set udg_Redtestregions[38]=Rect(- 64.0, 2944.0, 0.0, 3008.0) // UL
	set udg_Redtestregions[39]=Rect(0.0, 2944.0, 64.0, 3008.0) // UR
	set udg_Redtestregions[40]=Rect(0.0, 2880.0, 64.0, 2944.0) // LR
	set udg_Redtestregions[41]=Rect(- 64.0, 2880.0, 0.0, 2944.0) // LL

	// TEAL
	set udg_Redtestregions[42]=Rect(1856.0, 5440.0, 4160.0, 5504.0) // Long top
	set udg_Redtestregions[43]=Rect(4160.0, 4800.0, 4224.0, 5504.0) // Spawn top
	set udg_Redtestregions[44]=Rect(1856.0, 3968.0, 4160.0, 4032.0) // Long bottom
	set udg_Redtestregions[45]=Rect(4160.0, 3968.0, 4224.0, 4704.0) // Spawn bottom
	set udg_Redtestregions[46]=Rect(1792.0, 3968.0, 1856.0, 4384.0) // Left bottom
	set udg_Redtestregions[47]=Rect(1792.0, 5056.0, 1856.0, 5504.0) // Left top
	
	// Circle 1
	set udg_Redtestregions[48]=Rect(2464.0, 4672.0, 3552.0, 4800.0) // Right
	set udg_Redtestregions[49]=Rect(2368.0, 4032.0, 2496.0, 4704.0) // Down
	set udg_Redtestregions[50]=Rect(1824.0, 4672.0, 2400.0, 4800.0) // Left
	set udg_Redtestregions[51]=Rect(2368.0, 4768.0, 2496.0, 5440.0) // Up
	
	// Circle 2
	set udg_Redtestregions[52]=Rect(3520.0, 4768.0, 3648.0, 5440.0) // Up
	set udg_Redtestregions[53]=Rect(3616.0, 4672.0, 4160.0, 4800.0) // Right
	set udg_Redtestregions[54]=Rect(3520.0, 4032.0, 3648.0, 4704.0) // Down
	
	// Checkpoint 1
	set udg_Redtestregions[55]=Rect(2368.0, 4736.0, 2432.0, 4800.0) // UL
	set udg_Redtestregions[56]=Rect(2432.0, 4736.0, 2496.0, 4800.0) // UR
	set udg_Redtestregions[57]=Rect(2432.0, 4672.0, 2496.0, 4736.0) // LR
	set udg_Redtestregions[58]=Rect(2368.0, 4672.0, 2432.0, 4736.0) // LL
	
	// Checkpoint 2
	set udg_Redtestregions[59]=Rect(3520.0, 4736.0, 3584.0, 4800.0) // UL
	set udg_Redtestregions[60]=Rect(3584.0, 4736.0, 3648.0, 4800.0) // UR
	set udg_Redtestregions[61]=Rect(3584.0, 4672.0, 3648.0, 4736.0) // LR
	set udg_Redtestregions[62]=Rect(3520.0, 4672.0, 3584.0, 4736.0) // LL

	// Purple	
	set udg_Redtestregions[63]=Rect(3584.0, - 2304.0, 3648.0, 64.0) // Long left
	set udg_Redtestregions[64]=Rect(3585.0, 64.0, 4032.0, 128.0) // Spawn top left
	set udg_Redtestregions[65]=Rect(5056.0, - 2304.0, 5156.0, 64.0) // Long right
	set udg_Redtestregions[66]=Rect(4672.0, 64.0, 5120.0, 128.0) // Spawn top right
	set udg_Redtestregions[67]=Rect(4384.0, - 2304.0, 5056.0, - 2240.0) // Exit right
	set udg_Redtestregions[68]=Rect(3648.0, - 2304.0, 4320.0, - 2240.0) // Exit left
	
	// Circle 1
	set udg_Redtestregions[69]=Rect(4288.0, - 1632.0, 4416.0, - 544.0) // Down
	set udg_Redtestregions[70]=Rect(3648.0, - 576.0, 4320.0, - 448.0) // Left
	set udg_Redtestregions[71]=Rect(4288.0, - 480.0, 4416.0, 96.0) // Up
	set udg_Redtestregions[72]=Rect(4384.0, - 576.0, 5056.0, - 448.0) // Right
	
	// Circle 2
	set udg_Redtestregions[73]=Rect(4384.0, - 1728.0, 5056.0, - 1600.0) // Right
	set udg_Redtestregions[74]=Rect(4288.0, - 2272.0, 4416.0, - 1696.0) // Down
	set udg_Redtestregions[75]=Rect(3648.0, - 1728.0, 4320.0, - 1600.0) // Up
	
	// Checkpoint 1
	set udg_Redtestregions[76]=Rect(4288.0, - 512.0, 4352.0, - 448.0) // UL
	set udg_Redtestregions[77]=Rect(4352.0, - 512.0, 4416.0, - 448.0) // UR
	set udg_Redtestregions[78]=Rect(4352.0, - 576.0, 4416.0, - 512.0) // LR
	set udg_Redtestregions[79]=Rect(4288.0, - 576.0, 4352.0, - 512.0) // LL
	
	// Checkpoint 2
	set udg_Redtestregions[80]=Rect(4288.0, - 1664.0, 4352.0, - 1600.0) // UL
	set udg_Redtestregions[81]=Rect(4352.0, - 1664.0, 4416.0, - 1600.0) // UR
	set udg_Redtestregions[82]=Rect(4352.0, - 1728.0, 4416.0, - 1664.0) // LR
	set udg_Redtestregions[83]=Rect(4288.0, - 1728.0, 4352.0, - 1664.0) // LL

	// Yellow
	set udg_Redtestregions[84]=Rect(- 768.0, - 768.0, - 704.0, 1600.0) // Long left
	set udg_Redtestregions[85]=Rect(- 768.0, 1600.0, - 320.0, 1664.0) // Spawn top left
	set udg_Redtestregions[86]=Rect(704.0, - 768.0, 768.0, 1600.0) // Long right
	set udg_Redtestregions[87]=Rect(320.0, 1600.0, 768.0, 1664.0) // Spawn top right
	set udg_Redtestregions[88]=Rect(32.0, - 768.0, 736.0, - 704.0) // Exit right
	set udg_Redtestregions[89]=Rect(- 704.0, - 768.0, - 32.0, - 704.0) // Exit left

	// Circle 1
	set udg_Redtestregions[90]=Rect(- 64.0, - 96.0, 64.0, 992.0) // Down
	set udg_Redtestregions[91]=Rect(- 704.0, 960.0, - 32.0, 1088.0) // Left
	set udg_Redtestregions[92]=Rect(- 64.0, 1056.0, 64.0, 1632.0) // Up
	set udg_Redtestregions[93]=Rect(32.0, 960.0, 704.0, 1088.0) // Right
	
	// Circle 2
	set udg_Redtestregions[94]=Rect(32.0, - 192.0, 704.0, - 64.0) // Right
	set udg_Redtestregions[95]=Rect(- 64.0, - 736.0, 64.0, - 160.0) // Down
	set udg_Redtestregions[96]=Rect(- 704.0, - 192.0, - 32.0, - 64.0) // Left
	
	// Checkpoint 1
	set udg_Redtestregions[97]=Rect(- 64.0, 1024.0, 0.0, 1088.0) // Upper Left
	set udg_Redtestregions[98]=Rect(0.0, 1024.0, 64.0, 1088.0) // Upper Right
	set udg_Redtestregions[99]=Rect(0.0, 960.0, 64.0, 1024.0) // Lower Right
	set udg_Redtestregions[100]=Rect(- 64.0, 960.0, 0.0, 1024.0) // Lower Left
	
	// Checkpoint 2
	set udg_Redtestregions[101]=Rect(- 64.0, - 128.0, 0.0, - 64.0) // Upper Left
	set udg_Redtestregions[102]=Rect(0.0, - 128.0, 64.0, - 64.0) // Upper Right
	set udg_Redtestregions[103]=Rect(0.0, - 192.0, 64.0, - 128.0) // Lower Right
	set udg_Redtestregions[104]=Rect(- 64.0, - 192.0, 0.0, - 128.0) // Lower Left
	
	// Orange
	set udg_Redtestregions[105]=Rect(- 5120.0, - 2304.0, - 5056.0, 64.0) // Long left
	set udg_Redtestregions[106]=Rect(- 5120.0, 64.0, - 4672.0, 128.0) // Spawn top left
	set udg_Redtestregions[107]=Rect(- 3648.0, - 2304.0, - 3584.0, 64.0) // Long right
	set udg_Redtestregions[108]=Rect(- 4032.0, 64.0, - 3584.0, 128.0) // Spawn top right
	set udg_Redtestregions[109]=Rect(- 4320.0, - 2304.0, - 3616.0, - 2240.0) // Exit right
	set udg_Redtestregions[110]=Rect(- 5056.0, - 2304.0, - 4416.0, - 2240.0) // Exit left
	
	// Circle 1
	set udg_Redtestregions[111]=Rect(- 4416.0, - 1632.0, - 4288.0, - 544.0) // Down
	set udg_Redtestregions[112]=Rect(- 5056.0, - 576.0, - 4384.0, - 448.0) // Left
	set udg_Redtestregions[113]=Rect(- 4416.0, - 480.0, - 4288.0, 96.0) // Up
	set udg_Redtestregions[114]=Rect(- 4320.0, - 576.0, - 3648.0, - 448.0) // Right
	
	// Circle 2
	set udg_Redtestregions[115]=Rect(- 4320.0, - 1728.0, - 3648.0, - 1600.0) // Right
	set udg_Redtestregions[116]=Rect(- 4416.0, - 2272.0, - 4288.0, - 1696.0) // Down
	set udg_Redtestregions[117]=Rect(- 5056.0, - 1728.0, - 4384.0, - 1600.0) // Left
	
	// Checkpoint 1
	set udg_Redtestregions[118]=Rect(- 4416.0, - 512.0, - 4352.0, - 448.0) // Upper Left
	set udg_Redtestregions[119]=Rect(- 4352.0, - 512.0, - 4288.0, - 448.0) // Upper Right
	set udg_Redtestregions[120]=Rect(- 4352.0, - 576.0, - 4288.0, - 512.0) // Lower Right
	set udg_Redtestregions[121]=Rect(- 4416.0, - 576.0, - 4352.0, - 512.0) // Lower Left
	
	// Checkpoint 2
	set udg_Redtestregions[122]=Rect(- 4416.0, - 1664.0, - 4352.0, - 1600.0) // Upper Left
	set udg_Redtestregions[123]=Rect(- 4352.0, - 1664.0, - 4288.0, - 1600.0) // Upper Right
	set udg_Redtestregions[124]=Rect(- 4352.0, - 1728.0, - 4288.0, - 1664.0) // Lower Right
	set udg_Redtestregions[125]=Rect(- 4416.0, - 1728.0, - 4352.0, - 1664.0) // Lower Left
	
	// Green
	set udg_Redtestregions[126]=Rect(- 4416.0, - 4224.0, - 2112.0, - 4160.0) // Long bottom
	set udg_Redtestregions[127]=Rect(- 4480.0, - 4224.0, - 4416.0, - 3808.0) // Spawn bottom
	set udg_Redtestregions[128]=Rect(- 4416.0, - 2752.0, - 2048.0, - 2688.0) // Long top
	set udg_Redtestregions[129]=Rect(- 4480.0, - 3136.0, - 4416.0, - 2688.0) // Spawn top
	set udg_Redtestregions[130]=Rect(- 2112.0, - 3424.0, - 2048.0, - 2752.0) // Exit top
	set udg_Redtestregions[131]=Rect(- 2112.0, - 4224.0, - 2048.0, - 3488.0) // Exit bottom
	
	// Circle 1
	set udg_Redtestregions[132]=Rect(- 3808.0, - 3520.0, - 2720.0, - 3392.0) // Right
	set udg_Redtestregions[133]=Rect(- 3904.0, - 4160.0, - 3776.0, - 3488.0) // Down
	set udg_Redtestregions[134]=Rect(- 4416.0, - 3520.0, - 3872.0, - 3392.0) // Left
	set udg_Redtestregions[135]=Rect(- 3904.0, - 3424.0, - 3776.0, - 2752.0) // Up
	
	// Circle 2
	set udg_Redtestregions[136]=Rect(- 2752.0, - 3424.0, - 2624.0, - 2752.0) // Up
	set udg_Redtestregions[137]=Rect(- 2656.0, - 3520.0, - 2112.0, - 3392.0) // Right
	set udg_Redtestregions[138]=Rect(- 2752.0, - 4160.0, - 2624.0, - 3488.0) // Down
	
	// Checkpoint 1
	set udg_Redtestregions[139]=Rect(- 3904.0, - 3456.0, - 3840.0, - 3392.0) // Upper Left
	set udg_Redtestregions[140]=Rect(- 3840.0, - 3456.0, - 3776.0, - 3392.0) // Upper Right
	set udg_Redtestregions[141]=Rect(- 3840.0, - 3520.0, - 3776.0, - 3456.0) // Lower Right
	set udg_Redtestregions[142]=Rect(- 3904.0, - 3520.0, - 3840.0, - 3456.0) // Lower Left
	
	// Checkpoint 2
	set udg_Redtestregions[143]=Rect(- 2752.0, - 3456.0, - 2688.0, - 3392.0) // Upper Left
	set udg_Redtestregions[144]=Rect(- 2688.0, - 3456.0, - 2624.0, - 3392.0) // Upper Right
	set udg_Redtestregions[145]=Rect(- 2688.0, - 3520.0, - 2624.0, - 3456.0) // Lower Right
	set udg_Redtestregions[146]=Rect(- 2752.0, - 3520.0, - 2688.0, - 3456.0) // Lower Left
	
	// Pink
	set udg_Redtestregions[147]=Rect(2112.0, - 4224.0, 4416.0, - 4160.0) // Long bottom
	set udg_Redtestregions[148]=Rect(4416.0, - 4224.0, 4480.0, - 3776.0) // Spawn bottom
	set udg_Redtestregions[149]=Rect(2112.0, - 2752.0, 4416.0, - 2688.0) // Long top
	set udg_Redtestregions[150]=Rect(4416.0, - 3168.0, 4480.0, - 2688.0) // Spawn top
	set udg_Redtestregions[151]=Rect(2048.0, - 3424.0, 2112.0, - 2688.0) // Exit top
	set udg_Redtestregions[152]=Rect(2048.0, - 4224.0, 2112.0, - 3520.0) // Exit bottom
	
	// Circle 1
	set udg_Redtestregions[153]=Rect(2720.0, - 3520.0, 3808.0, - 3392.0) // Left
	set udg_Redtestregions[154]=Rect(3776.0, - 3424.0, 3904.0, - 2752.0) // Up
	set udg_Redtestregions[155]=Rect(3872.0, - 3520.0, 4416.0, - 3392.0) // Right
	set udg_Redtestregions[156]=Rect(3776.0, - 4160.0, 3904.0, - 3488.0) // Down
	
	// Circle 2
	set udg_Redtestregions[157]=Rect(2624.0, - 4160.0, 2752.0, - 3488.0) // Down
	set udg_Redtestregions[158]=Rect(2080.0, - 3520.0, 2656.0, - 3392.0) // Left
	set udg_Redtestregions[159]=Rect(2624.0, - 3424.0, 2752.0, - 2752.0) // Up
	
	// Checkpoint 1
	set udg_Redtestregions[160]=Rect(3776.0, - 3456.0, 3840.0, - 3392.0) // Upper Left
	set udg_Redtestregions[161]=Rect(3840.0, - 3456.0, 3904.0, - 3392.0) // Upper Right
	set udg_Redtestregions[162]=Rect(3840.0, - 3520.0, 3904.0, - 3456.0) // Lower Right
	set udg_Redtestregions[163]=Rect(3776.0, - 3520.0, 3840.0, - 3456.0) // Lower Left
	
	// Checkpoint 2
	set udg_Redtestregions[164]=Rect(2624.0, - 3520.0, 2688.0, - 3392.0) // Upper Left
	set udg_Redtestregions[165]=Rect(2688.0, - 3456.0, 2752.0, - 3392.0) // Upper Right
	set udg_Redtestregions[166]=Rect(2688.0, - 3520.0, 2752.0, - 3456.0) // Lower Right
	set udg_Redtestregions[167]=Rect(2624.0, - 3520.0, 2688.0, - 3456.0) // Lower Left
	
	// Grey
	set udg_Redtestregions[168]=Rect(- 768.0, - 4864.0, - 704.0, - 2496.0) // Long left
	set udg_Redtestregions[169]=Rect(- 768.0, - 2496.0, - 192.0, - 2432.0) // Spawn top left
	set udg_Redtestregions[170]=Rect(704.0, - 4864.0, 768.0, - 2496.0) // Long right
	set udg_Redtestregions[171]=Rect(192.0, - 2496.0, 768.0, - 2432.0) // Spawn top right
	set udg_Redtestregions[172]=Rect(160.0, - 4864.0, 740.0, - 4800.0) // Exit right
	set udg_Redtestregions[173]=Rect(- 704.0, - 4864.0, - 160.0, - 4800.0) // Exit left
	
	// Circle 1
	set udg_Redtestregions[174]=Rect(- 64.0, - 4192.0, 64.0, - 3104.0) // Down
	set udg_Redtestregions[175]=Rect(- 704.0, - 3136.0, - 32.0, - 3008.0) // Left
	set udg_Redtestregions[176]=Rect(- 64.0, - 3040.0, 64.0, - 2464.0) // Up
	set udg_Redtestregions[177]=Rect(32.0, - 3136.0, 704.0, - 3008.0) // Right
	
	// Circle 2
	set udg_Redtestregions[178]=Rect(32.0, - 4288.0, 704.0, - 4160.0) // Right
	set udg_Redtestregions[179]=Rect(- 64.0, - 4832.0, 64.0, - 4256.0) // Down
	set udg_Redtestregions[180]=Rect(- 704.0, - 4288.0, - 32.0, - 4160.0) // Left
	
	// Checkpoint 1
	set udg_Redtestregions[181]=Rect(- 64.0, - 3072.0, 0.0, - 3008.0) // Upper Left
	set udg_Redtestregions[182]=Rect(0.0, - 3072.0, 64.0, - 3008.0) // Upper Right
	set udg_Redtestregions[183]=Rect(0.0, - 3136.0, 64.0, - 3072.0) // Lower Right
	set udg_Redtestregions[184]=Rect(- 64.0, - 3136.0, 0.0, - 3072.0) // Lower Left	
	
	// Checkpoint 2
	set udg_Redtestregions[185]=Rect(- 64.0, - 4224.0, 0.0, - 4160.0) // Upper Left
	set udg_Redtestregions[186]=Rect(0.0, - 4224.0, 64.0, - 4160.0) // Upper Right
	set udg_Redtestregions[187]=Rect(0.0, - 4288.0, 64.0, - 4224.0) // Lower Right
	set udg_Redtestregions[188]=Rect(- 64.0, - 4288.0, 0.0, - 4224.0) // Lower Left
	
	// Lightblue
	set udg_Redtestregions[189]=Rect(- 1472.0, - 1920.0, - 1408.0, 448.0) // Long left
	set udg_Redtestregions[190]=Rect(- 1856.0, - 1920.0, - 1472.0, - 1856.0) // Spawn right
	set udg_Redtestregions[191]=Rect(- 2944.0, - 1920.0, - 2880.0, 448.0) // Long left
	set udg_Redtestregions[192]=Rect(- 2880.0, - 1920.0, - 2496.0, - 1856.0) // Spawn right
	set udg_Redtestregions[193]=Rect(- 2944.0, 448.0, - 2240.0, 512.0) // Exit left
	set udg_Redtestregions[194]=Rect(- 2112.0, 448.0, - 1408.0, 512.0) // Exit right
	
	// Circle 1
	set udg_Redtestregions[195]=Rect(- 2240.0, - 1248.0, - 2112.0, - 160.0) // Up
	set udg_Redtestregions[196]=Rect(- 2144.0, - 1344.0, - 1472.0, - 1216.0) // Right
	set udg_Redtestregions[197]=Rect(- 2240.0, - 1888.0, - 2112.0, - 1312.0) // Down
	set udg_Redtestregions[198]=Rect(- 2880.0, - 1344.0, - 2208.0, - 1216.0) // Left
	
	// Circle 2
	set udg_Redtestregions[199]=Rect(- 2880.0, - 192.0, - 2208.0, - 64.0) // Left
	set udg_Redtestregions[200]=Rect(- 2240.0, - 96.0, - 2112.0, 480.0) // Up
	set udg_Redtestregions[201]=Rect(- 2144.0, - 192.0, - 1472.0, - 64.0) // Right
	
	// Checkpoint 1
	set udg_Redtestregions[202]=Rect(- 2240.0, - 1280.0, - 2176.0, - 1344.0) // Upper Left
	set udg_Redtestregions[203]=Rect(- 2176.0, - 1280.0, - 2112.0, - 1216.0) // Upper Right
	set udg_Redtestregions[204]=Rect(- 2176.0, - 1344.0, - 2112.0, - 1280.0) // Lower Right
	set udg_Redtestregions[205]=Rect(- 2240.0, - 1344.0, - 2176.0, - 1280.0) // Lower Left
	
	// Checkpoint 2
	set udg_Redtestregions[206]=Rect(- 2240.0, - 128.0, - 2176.0, - 64.0) // Upper Left
	set udg_Redtestregions[207]=Rect(- 2176.0, - 128.0, - 2112.0, - 64.0) // Upper Right
	set udg_Redtestregions[208]=Rect(- 2176.0, - 192.0, - 2112.0, - 128.0) // Lower Right
	set udg_Redtestregions[209]=Rect(- 2240.0, - 192.0, - 2176.0, - 128.0) // Lower Left
	
	// Darkgreen
	set udg_Redtestregions[210]=Rect(2880.0, - 1920.0, 2944.0, 448.0) // Long left
	set udg_Redtestregions[211]=Rect(2496.0, - 1920.0, 2880.0, - 1856.0) // Spawn right
	set udg_Redtestregions[212]=Rect(1408.0, - 1920.0, 1472.0, 448.0) // Long right
	set udg_Redtestregions[213]=Rect(1472.0, - 1920.0, 1856.0, - 1856.0) // Spawn left
	set udg_Redtestregions[214]=Rect(1408.0, 448.0, 2112.0, 512.0) // Exit left
	set udg_Redtestregions[215]=Rect(2240.0, 448.0, 2944.0, 512.0) // Exit right
	
	// Circle 1
	set udg_Redtestregions[216]=Rect(2112.0, - 1248.0, 2240.0, - 160.0) // Up
	set udg_Redtestregions[217]=Rect(2208.0, - 1344.0, 2880.0, - 1216.0) // Right
	set udg_Redtestregions[218]=Rect(2112.0, - 1888.0, 2240.0, - 1312.0) // Down
	set udg_Redtestregions[219]=Rect(1472.0, - 1344.0, 2144.0, - 1216.0) // Left
	
	// Circle 2
	set udg_Redtestregions[220]=Rect(1472.0, - 192.0, 2144.0, - 64.0) // Left
	set udg_Redtestregions[221]=Rect(2112.0, - 96.0, 2240.0, 480.0) // Up
	set udg_Redtestregions[222]=Rect(2208.0, - 192.0, 2880.0, - 64.0) // Right
	
	// Checkpoint 1
	set udg_Redtestregions[223]=Rect(2112.0, - 1280.0, 2176.0, - 1344.0) // Upper Left
	set udg_Redtestregions[224]=Rect(2176.0, - 1280.0, 2240.0, - 1216.0) // Upper Right
	set udg_Redtestregions[225]=Rect(2176.0, - 1344.0, 2240.0, - 1280.0) // Lower Right
	set udg_Redtestregions[226]=Rect(2112.0, - 1344.0, 2176.0, - 1280.0) // Lower Left
	
	// Checkpoint 2
	set udg_Redtestregions[227]=Rect(2112.0, - 128.0, 2176.0, - 64.0) // Upper Left
	set udg_Redtestregions[228]=Rect(2176.0, - 128.0, 2240.0, - 64.0) // Upper Right
	set udg_Redtestregions[229]=Rect(2176.0, - 192.0, 2240.0, - 128.0) // Lower Right
	set udg_Redtestregions[230]=Rect(2112.0, - 192.0, 2176.0, - 128.0) // Lower Left
	
	// Brown
	set udg_Redtestregions[231]=Rect(- 5120.0, 768.0, - 5056.0, 3136.0) // Long left
	set udg_Redtestregions[232]=Rect(- 5120.0, 3136.0, - 4672.0, 3200.0) // Spawn top left
	set udg_Redtestregions[233]=Rect(- 3648.0, 768.0, - 3584.0, 3136.0) // Long right
	set udg_Redtestregions[234]=Rect(- 4032.0, 3136.0, - 3584.0, 3200.0) // Spawn top right
	set udg_Redtestregions[235]=Rect(- 4192.0, 768.0, - 3612.0, 832.0) // Exit right
	set udg_Redtestregions[236]=Rect(- 5056.0, 768.0, - 4512.0, 832.0) // Exit left
	
	// Circle 1
	set udg_Redtestregions[237]=Rect(- 4416.0, 1440.0, - 4288.0, 2528.0) // Down
	set udg_Redtestregions[238]=Rect(- 5056.0, 2496.0, - 4384.0, 2624.0) // Left
	set udg_Redtestregions[239]=Rect(- 4416.0, 2592.0, - 4288.0, 3168.0) // Up
	set udg_Redtestregions[240]=Rect(- 4320.0, 2496.0, - 3648.0, 2624.0) // Right
	
	// Circle 2
	set udg_Redtestregions[241]=Rect(- 4320.0, 1344.0, - 3648.0, 1472.0) // Right
	set udg_Redtestregions[242]=Rect(- 4416.0, 800.0, - 4288.0, 1376.0) // Down
	set udg_Redtestregions[243]=Rect(- 5056.0, 1344.0, - 4384.0, 1472.0) // Left
	
	// Checkpoint 1
	set udg_Redtestregions[244]=Rect(- 4416.0, 2560.0, - 4352.0, 2624.0) // Upper Left
	set udg_Redtestregions[245]=Rect(- 4352.0, 2560.0, - 4288.0, 2624.0) // Upper Right
	set udg_Redtestregions[246]=Rect(- 4352.0, 2496.0, - 4288.0, 2560.0) // Lower Right
	set udg_Redtestregions[247]=Rect(- 4416.0, 2496.0, - 4352.0, 2560.0) // Lower Left
	
	// Checkpoint 2
	set udg_Redtestregions[248]=Rect(- 4416.0, 1408.0, - 4352.0, 1472.0) // Upper Left
	set udg_Redtestregions[249]=Rect(- 4352.0, 1408.0, - 4288.0, 1472.0) // Upper Right
	set udg_Redtestregions[250]=Rect(- 4352.0, 1344.0, - 4288.0, 1408.0) // Lower Right
	set udg_Redtestregions[251]=Rect(- 4416.0, 1344.0, - 4352.0, 1408.0) // Lower Left
	
	// Maroon
	set udg_Redtestregions[252]=Rect(3584.0, 768.0, 3648.0, 3200.0) // Long left
	set udg_Redtestregions[253]=Rect(3648.0, 3136.0, 4064.0, 3200.0) // Spawn top left
	set udg_Redtestregions[254]=Rect(5056.0, 768.0, 5120.0, 3200.0) // Long right
	set udg_Redtestregions[255]=Rect(4704.0, 3136.0, 5056.0, 3200.0) // Spawn top right
	set udg_Redtestregions[256]=Rect(4640.0, 768.0, 5056.0, 832.0) // Exit right
	set udg_Redtestregions[257]=Rect(3648.0, 768.0, 4064.0, 832.0) // Exit left

	// Circle 1
	set udg_Redtestregions[258]=Rect(4288.0, 1440.0, 4416.0, 2528.0) // Down
	set udg_Redtestregions[259]=Rect(3648.0, 2496.0, 4320.0, 2624.0) // Left
	set udg_Redtestregions[260]=Rect(4288.0, 2592.0, 4416.0, 3168.0) // Up
	set udg_Redtestregions[261]=Rect(4384.0, 2496.0, 5056.0, 2624.0) // Right
	
	// Circle 2
	set udg_Redtestregions[262]=Rect(4384.0, 1344.0, 5056.0, 1472.0) // Right
	set udg_Redtestregions[263]=Rect(4288.0, 800.0, 4416.0, 1376.0) // Down
	set udg_Redtestregions[264]=Rect(3648.0, 1344.0, 4320.0, 1472.0) // Left
	
	// Checkpoint 1
	set udg_Redtestregions[265]=Rect(4288.0, 2560.0, 4352.0, 2624.0) // Upper Left
	set udg_Redtestregions[266]=Rect(4352.0, 2560.0, 4416.0, 2624.0) // Upper Right
	set udg_Redtestregions[267]=Rect(4352.0, 2496.0, 4416.0, 2560.0) // Lower Right
	set udg_Redtestregions[268]=Rect(4288.0, 2496.0, 4352.0, 2560.0) // Lower Left
	
	// Checkpoint 2
	set udg_Redtestregions[269]=Rect(4288.0, 1408.0, 4352.0, 1472.0) // Upper Left
	set udg_Redtestregions[270]=Rect(4352.0, 1408.0, 4416.0, 1472.0) // Upper Right
	set udg_Redtestregions[271]=Rect(4352.0, 1344.0, 4416.0, 1408.0) // Lower Right
	set udg_Redtestregions[272]=Rect(4288.0, 1344.0, 4352.0, 1408.0) // Lower Left
	//TSET
	
	set udg_Checkpoints[1]=Rect(- 2464.00, 4704.00, - 2400.00, 4768.00)
	set udg_Checkpoints[2]=Rect(- 3616.00, 4704.00, - 3552.00, 4768.00)
	set udg_Checkpoints[3]=bluerect // Blue checkpoint
	set udg_Checkpoints[4]=bluerect // This is for blue's right side
	set udg_Checkpoints[5]=bluerect2 // Blue 2 checkpoint
	set udg_Checkpoints[6]=bluerect2 // Blue 2 right side checkpoint
	set udg_Checkpoints[7]=Rect(2400.00, 4704.00, 2464.00, 4768.00)
	set udg_Checkpoints[8]=Rect(3552.00, 4704.00, 3616.00, 4768.00)
	set udg_Checkpoints[9]=Rect(4320.00, - 544.00, 4384.00, - 480.00)
	set udg_Checkpoints[10]=Rect(4320.00, - 1696.00, 4384.00, - 1632.00)
	set udg_Checkpoints[11]=yellowrect // Yellow checkpoint
	set udg_Checkpoints[12]=yellowrect // This is for yellow's right side
	set udg_Checkpoints[13]=yellowrect2 // Yellow 2 checkpoint
	set udg_Checkpoints[14]=yellowrect2 // Yellow 2 right side checkpoint
	set udg_Checkpoints[15]=Rect(- 4384.00, - 544.00, - 4320.00, - 480.00)
	set udg_Checkpoints[16]=Rect(- 4384.00, - 1696.00, - 4320.00, - 1632.00)
	set udg_Checkpoints[17]=Rect(- 3872.00, - 3488.00, - 3808.00, - 3424.00)
	set udg_Checkpoints[18]=Rect(- 2720.00, - 3488.00, - 2656.00, - 3424.00)
	set udg_Checkpoints[19]=Rect(3808.00, - 3488.00, 3872.00, - 3424.00)
	set udg_Checkpoints[20]=Rect(2656.00, - 3488.00, 2720.00, - 3424.00)
	set udg_Checkpoints[21]=Rect(- 32.00, - 3104.00, 32.00, - 3040.00)
	set udg_Checkpoints[22]=Rect(- 32.00, - 4256.00, 32.00, - 4192.00)
	set udg_Checkpoints[23]=Rect(- 2208.00, - 1312.00, - 2144.00, - 1248.00)
	set udg_Checkpoints[24]=Rect(- 2208.00, - 160.00, - 2144.00, - 96.00)
	set udg_Checkpoints[25]=Rect(2144.00, - 1312.00, 2208.00, - 1248.00)
	set udg_Checkpoints[26]=Rect(2144.00, - 160.00, 2208.00, - 96.00)
	set udg_Checkpoints[27]=Rect(- 4384.00, 2528.00, - 4320.00, 2592.00)
	set udg_Checkpoints[28]=Rect(- 4384.00, 1376.00, - 4320.00, 1440.00)
	set udg_Checkpoints[29]=Rect(4320.00, 2528.00, 4384.00, 2592.00)
	set udg_Checkpoints[30]=Rect(4320.00, 1376.00, 4384.00, 1440.00)
	set udg_Checkpoints[31]=Rect(- 768.00, - 4992.00, 768.00, - 4800.00)
	set udg_Checkpoints[32]=Rect(- 1952.00, - 3488.00, - 1888.00, - 3424.00)
	set udg_Checkpoints[33]=Rect(1888.00, - 3488.00, 1952.00, - 3424.00)
	set udg_Checkpoints[34]=Rect(- 32.00, - 2240.00, 32.00, - 2176.00)
	set udg_Checkpoints[35]=Rect(- 4384.00, 3392.00, - 4320.00, 3456.00)
	set udg_Checkpoints[36]=Rect(- 4384.00, 4704.00, - 4320.00, 4768.00)
	set udg_Checkpoints[37]=Rect(- 4384.00, - 2464.00, - 4320.00, - 2400.00)
	set udg_Checkpoints[38]=Rect(- 4768.00, - 3488.00, - 4704.00, - 3424.00)
	set udg_Checkpoints[39]=Rect(4320.00, 4704.00, 4384.00, 4768.00)
	set udg_Checkpoints[40]=Rect(4320.00, 3392.00, 4384.00, 3456.00)
	set udg_Checkpoints[41]=Rect(4320.00, - 2464.00, 4384.00, - 2400.00)
	set udg_Checkpoints[42]=Rect(4672.00, - 3488.00, 4736.00, - 3424.00)
	set udg_Checkpoints[43]=Rect(- 32.00, - 928.00, 32.00, - 864.00)
	set udg_Checkpoints[44]=Rect(- 2208.00, - 2144.00, - 2144.00, - 2080.00)
	set udg_Checkpoints[45]=Rect(2144.00, - 2144.00, 2208.00, - 2080.00)
	set udg_Checkpoints[46]=Rect(- 2208.00, 608.00, - 2144.00, 672.00)
	set udg_Checkpoints[47]=Rect(- 4384.00, 352.00, - 4320.00, 416.00)
	set udg_Checkpoints[48]=Rect(2144.00, 608.00, 2208.00, 672.00)
	set udg_Checkpoints[49]=Rect(4320.00, 320.00, 4384.00, 384.00)

	// call MakeCheckpointsBuildable()
	
	set bluerect=null
	set bluerect2=null
	set yellowrect=null
	set yellowrect2=null
	
	set udg_ShipDestination=Rect(- 5440.0, - 5664.0, - 5184.0, - 4864.0) // Ship moves to here when game ends

	set udg_UnitToCheckpointTable=InitHashtableBJ()
	set udg_TowerTickTable=InitHashtableBJ()
	set udg_PlayerLeavesTable=InitHashtableBJ()
	set udg_AntiBlockTable=InitHashtableBJ()

	set udg_Redspawn=Rect(- 1792.0, 4736.0, - 1472.0, 5056.0)
	set udg_Redspawn2=Rect(- 1792.0, 4416.0, - 1472.0, 4736.0)
	set udg_Bluespawn=Rect(- 320.0, 4768.0, 0.0, 5088.0)
	set udg_Bluespawn2=Rect(0.0, 4768.0, 320.0, 5088.0)
	set udg_Tealspawn=Rect(1472.0, 4768.0, 1792.0, 5088.0)
	set udg_Tealspawn2=Rect(1472.0, 4448.0, 1792.0, 4768.0)
	set udg_Purplespawn=Rect(4032.0, 128.0, 4352.0, 448.0)
	set udg_Purplespawn2=Rect(4352.0, 128.0, 4672.0, 448.0)
	set udg_Yellowspawn=Rect(- 320.0, 1664.0, 0.0, 1984.0)
	set udg_Yellowspawn2=Rect(0.0, 1664.0, 320.0, 1984.0)
	set udg_Orangespawn=Rect(- 4672.0, 128.0, - 4352.0, 448.0)
	set udg_Orangespawn2=Rect(- 4352.0, 128.0, - 4032.0, 448.0)
	set udg_Greenspawn=Rect(- 4800.0, - 3456.0, - 4480.0, - 3136.0)
	set udg_Greenspawn2=Rect(- 4800.0, - 3776.0, - 4480.0, - 3456.0)
	set udg_Pinkspawn=Rect(4480.0, - 3456.0, 4800.0, - 3136.0)
	set udg_Pinkspawn2=Rect(4480.0, - 3776.0, 4800.0, - 3456.0)
	set udg_Greyspawn=Rect(- 160.0, - 2464.0, 160.0, - 2144.0)
	set udg_Lightbluespawn=Rect(- 2496.0, - 2240.0, - 2176.0, - 1920.0)
	set udg_Lightbluespawn2=Rect(- 2176.0, - 2240.0, - 1856.0, - 1920.0)
	set udg_Darkgreenspawn=Rect(1856.0, - 2240.0, 2176.0, - 1920.0)
	set udg_Darkgreenspawn2=Rect(2176.0, - 2240.0, 2496.0, - 1920.0)
	set udg_Brownspawn=Rect(- 4672.0, 3200.0, - 4352.0, 3520.0)
	set udg_Brownspawn2=Rect(- 4352.0, 3200.0, - 4032.0, 3520.0)
	set udg_Maroonspawn=Rect(4032.0, 3200.0, 4352.0, 3520.0)
	set udg_Maroonspawn2=Rect(4352.0, 3200.0, 4672.0, 3520.0)

	set udg_Shipcheckpoint=Rect(- 704.0, - 4960.0, 704.0, - 4800.0)

	set udg_PlayerRestrictionArea[0]=Rect(- 4640.0, 3808.0, - 1248.0, 5632.0) // Red area
	set udg_PlayerRestrictionArea[1]=Rect(- 928.0, 2016.0, 928.0, 5344.0) // Blue area
	set udg_PlayerRestrictionArea[2]=Rect(1248.0, 3808.0, 4640.0, 5632.0) // Teal area
	set udg_PlayerRestrictionArea[3]=Rect(3424.0, - 2592.0, 5280.0, 480.0) // Purple area
	set udg_PlayerRestrictionArea[4]=Rect(- 928.0, - 1312.0, 928, 2016.0) // Yellow area
	set udg_PlayerRestrictionArea[5]=Rect(- 5280.0, - 2592.0, - 3224.0, 480.0) // Orange area
	set udg_PlayerRestrictionArea[6]=Rect(- 5024.0, - 4384.0, - 1504.0, - 2560.0) // Green area
	set udg_PlayerRestrictionArea[7]=Rect(1504.0, - 4384.0, 5024.0, - 2560.0) // Pink area
	set udg_PlayerRestrictionArea[8]=Rect(- 928.0, - 4992.0, 928.0, - 1888.0) // Grey area
	set udg_PlayerRestrictionArea[9]=Rect(- 3104.0, - 2464.0, - 1248.0, 928.0) // Lightblue area
	set udg_PlayerRestrictionArea[10]=Rect(1248.0, - 2464.0, 3104.0, 928.0) // Darkgreen area
	set udg_PlayerRestrictionArea[11]=Rect(- 5280.0, 480.0, - 3424.0, 3776.0) // Brown area
	set udg_PlayerRestrictionArea[12]=Rect(3424.0, 480.0, 5280.0, 3776.0) // Maroon area

	// Allow Players Tower
	set udg_AllowPlayersTower[1]=CreateUnit(Player(0), 'h03S', - 1536.0, 5376.0, 0.000) // Red
	set udg_AllowPlayersTower[2]=CreateUnit(Player(1), 'h03S', 640.0, 4992.0, 0.000) // Blue
	set udg_AllowPlayersTower[3]=CreateUnit(Player(2), 'h03S', 1536.0, 5376.0, 0.000) // Teal
	set udg_AllowPlayersTower[4]=CreateUnit(Player(3), 'h03S', 5120.0, 448.0, 0.000) // Purple
	set udg_AllowPlayersTower[5]=CreateUnit(Player(4), 'h03S', 768.0, 1984.0, 0.000) // Yellow
	set udg_AllowPlayersTower[6]=CreateUnit(Player(5), 'h03S', - 3616.0, 448.0, 0.000) // Orange
	set udg_AllowPlayersTower[7]=CreateUnit(Player(6), 'h03S', - 4736.0, - 2816.0, 0.000) // Green
	set udg_AllowPlayersTower[8]=CreateUnit(Player(7), 'h03S', 4736.0, - 2816.0, 0.000) // Pink
	set udg_AllowPlayersTower[9]=CreateUnit(Player(8), 'h03S', 512.0, - 2176.0, 0.000) // Grey
	set udg_AllowPlayersTower[10]=CreateUnit(Player(9), 'h03S', - 1536.0, - 2176.0, 0.000) // Lightblue
	set udg_AllowPlayersTower[11]=CreateUnit(Player(10), 'h03S', 2816.0, - 2176.0, 0.000) // Darkgreen
	set udg_AllowPlayersTower[12]=CreateUnit(Player(11), 'h03S', - 3712.0, 3456.0, 0.000) // Brown
	set udg_AllowPlayersTower[12]=CreateUnit(Player(12), 'h03S', 4992.0, 3456.0, 0.000) // Maroon

	// Ship
	set udg_Ship=CreateUnit(Player(13), 'n05G', 63.0, - 5343.5, 0.000)

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
	
	set udg_ItemLootLevelOne[0]='I00A'
	set udg_ItemLootLevelOne[1]='I010'
	set udg_ItemLootLevelOne[2]='I011'
	set udg_ItemLootLevelOne[3]='I012'
	set udg_ItemLootLevelOne[4]='I013'
	set udg_ItemLootLevelOne[5]='I014'
	set udg_ItemLootLevelOne[6]='I015'
	set udg_ItemLootLevelOne[7]='I016'
	
	set udg_ItemLootLevelOneSize=7

	set udg_ItemLootLevelTwo[0]='I01D'
	set udg_ItemLootLevelTwo[1]='I01C'
	set udg_ItemLootLevelTwo[2]='I017'
	set udg_ItemLootLevelTwo[3]='I01F'
	set udg_ItemLootLevelTwo[4]='I01G'
	set udg_ItemLootLevelTwo[5]='I01B'
	set udg_ItemLootLevelTwo[6]='I01E'
	set udg_ItemLootLevelTwo[7]='I018'
	
	set udg_ItemLootLevelTwoSize=7

	set udg_ItemLootLevelThree[0]='I01H'
	set udg_ItemLootLevelThree[1]='I01M'
	set udg_ItemLootLevelThree[2]='I01N'
	set udg_ItemLootLevelThree[3]='I01L'
	set udg_ItemLootLevelThree[4]='I01I'
	set udg_ItemLootLevelThree[5]='I01J'
	set udg_ItemLootLevelThree[6]='I01K'
	set udg_ItemLootLevelThree[7]='I01O'
	
	set udg_ItemLootLevelThreeSize=7

	set udg_ItemLootLevelFour[0]='I01W'
	set udg_ItemLootLevelFour[1]='I01P'
	set udg_ItemLootLevelFour[2]='I01U'
	set udg_ItemLootLevelFour[3]='I01V'
	set udg_ItemLootLevelFour[4]='I01R'
	set udg_ItemLootLevelFour[5]='I01T'
	set udg_ItemLootLevelFour[6]='I01Q'
	set udg_ItemLootLevelFour[7]='I01S'
	
	set udg_ItemLootLevelFourSize=7

	set udg_ElementalistAbilities[0]='A0BO'
	set udg_ElementalistAbilities[1]='A0BS'
	set udg_ElementalistAbilities[2]='A0C0'
	set udg_ElementalistAbilities[3]='A0C1'
	set udg_ElementalistAbilities[4]='A0C2'
	set udg_ElementalistAbilities[5]='A0C3'

	set udg_ElementalistAbilitiesSize=5

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

	set udg_RaceArray[0]='n04U' // Sexy People, COME HERE!
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
	set udg_RaceArray[14]='uC84' // Dragon Roost
	set udg_RaceArray[15]='e00F' // Night Elf Ancient
	set udg_RaceArray[16]='e005' // Shrine of Ultron
	set udg_RaceArray[17]='e002' // Tavern
	set udg_RaceArray[18]='e003' // Corrupted Night Elves
	set udg_RaceArray[19]='e006' // Goblin War Room
	set udg_RaceArray[20]='n03M' // Hero's Altar
	set udg_RaceArray[21]='e00D' // Caerbannog
	set udg_RaceArray[22]='n01V' // Critteres UNITE
	set udg_RaceArray[23]='n02A' // Gnoll Republic
	set udg_RaceArray[24]='n02Q' // Angel's Gateway
	set udg_RaceArray[25]='n02S' // Alliance Of Blades
	set udg_RaceArray[26]='n03C' // Cavernous Creatures
	set udg_RaceArray[27]='n046' // Forest Troll Hut
	set udg_RaceArray[28]='n014' // Ice Troll Hut
	set udg_RaceArray[29]='n03W' // Dark Troll Hut
	set udg_RaceArray[30]='n04I' // Temple Of The Damned
	set udg_RaceArray[31]='e00H' // Dwarven Mine
	set udg_RaceArray[32]='e00G' // Galaxy
	set udg_RaceArray[33]='h02T' // Void
	set udg_RaceArray[34]='h03L' // Workers Union
	
	set udg_RacesCount=34

	set udg_RaceNameArray[0]="Sexy People, COME HERE!"
	set udg_RaceNameArray[1]="Demon Portal"
	set udg_RaceNameArray[2]="Undead Necropolis"
	set udg_RaceNameArray[3]="Aviaries"
	set udg_RaceNameArray[4]="High Elf Barracks"
	set udg_RaceNameArray[5]="Chaos Orc Barracks"
	set udg_RaceNameArray[6]="Human Town Hall"
	set udg_RaceNameArray[7]="Orc Stronghold"
	set udg_RaceNameArray[8]="High Elf Farm"
	set udg_RaceNameArray[9]="Giant's Hall"
	set udg_RaceNameArray[10]="The Unique"
	set udg_RaceNameArray[11]="The Summons"
	set udg_RaceNameArray[12]="Arachnid Hive"
	set udg_RaceNameArray[13]="Draenei Haven"
	set udg_RaceNameArray[14]="Dragon Roost"
	set udg_RaceNameArray[15]="Night Elf Ancient"
	set udg_RaceNameArray[16]="Shrine of Ultron"
	set udg_RaceNameArray[17]="Tavern"
	set udg_RaceNameArray[18]="Corrupted Night Elves"
	set udg_RaceNameArray[19]="Goblin War Room"
	set udg_RaceNameArray[20]="Hero's Altar"
	set udg_RaceNameArray[21]="Caerbannog"
	set udg_RaceNameArray[22]="Critters UNITE"
	set udg_RaceNameArray[23]="Gnoll Republic"
	set udg_RaceNameArray[24]="Angel's Gateway"
	set udg_RaceNameArray[25]="Alliance of Blades"
	set udg_RaceNameArray[26]="Cavernous Creatures"
	set udg_RaceNameArray[27]="Forest Troll Hut"
	set udg_RaceNameArray[28]="Ice Troll Hut"
	set udg_RaceNameArray[29]="Dark Troll Hut"
	set udg_RaceNameArray[30]="Temple of the Damned"
	set udg_RaceNameArray[31]="Dwarven Mine"
	set udg_RaceNameArray[32]="Galaxy"
	set udg_RaceNameArray[33]="Void Cult"
	set udg_RaceNameArray[34]="Workers Union"

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

	set udg_ScoreboardColumnWidth[1]=10.00
	set udg_ScoreboardColumnWidth[2]=8.00

	set udg_CreepTypes[0]="|cFF999999Unarmored|r"
	set udg_CreepTypes[1]="|cFF6d7c86Light|r"
	set udg_CreepTypes[2]="|cFF416073Medium|r"
	set udg_CreepTypes[3]="|cFF154360Heavy|r"
	set udg_CreepTypes[4]="|cFFCA8500Fortified|r"
	set udg_CreepTypes[5]="|cFF7525FFHero|r"
	set udg_CreepTypes[6]="(|cFF999999Air|r)"
	set udg_CreepTypes[7]="(|cFF3737F2Boss|r)"
	set udg_CreepTypes[8]="(|cFFF2A137Champion|r)"
	
	set udg_CreepAbilities[0]='A069' // Hardened Skin
	set udg_CreepAbilities[1]='A06A' // Evasion
	set udg_CreepAbilities[2]='A06C' // Armor Bonus
	set udg_CreepAbilities[3]='A08G' // Cripple Aura
	set udg_CreepAbilities[4]='A00D' // Spell Shield
	set udg_CreepAbilities[5]='A01S' // Tornado Aura
	set udg_CreepAbilities[6]='A0B3' // Vampiric Aura
	set udg_CreepAbilities[7]='A01E' // Divine Shield
	set udg_CreepAbilities[8]='A01T' // Walk it Off
	set udg_CreepAbilities[9]='A06D' // Morning Person
	set udg_CreepAbilitiesSize=10

	call PreloadCreepAbilities()

	set udg_ArchimondeDummy=CreateUnit(Player(13), 'u000', 4868.0, - 4964.0, 240.0)
	call PauseUnitBJ(true, udg_ArchimondeDummy)

	call InitializeTowerTierArrays()

	set udg_LoseALifeSound=CreateSound("Abilities\\Spells\\Other\\LoadUnload\\Loading.wav", false, false, true, 10, 10, "DefaultEAXON")
	call SetSoundParamsFromLabel(udg_LoseALifeSound, "LoadUnload")
	call SetSoundDuration(udg_LoseALifeSound, 740)
	set udg_GoldSound=CreateSound("Abilities\\Spells\\Items\\ResourceItems\\ReceiveGold.wav", false, true, true, 10, 10, "DefaultEAXON")
	call SetSoundParamsFromLabel(udg_GoldSound, "ReceiveGold")
	call SetSoundDuration(udg_GoldSound, 589)
	call SetSoundChannel(udg_GoldSound, 0)
	call SetSoundDistances(udg_GoldSound, 750.0, 1000.0)
	set udg_VictorySound=CreateSound("Sound\\Music\\mp3Music\\PH1.mp3", false, false, false, 10, 10, "DefaultEAXON")
	set udg_DefeatSound=CreateSound("Sound\\Music\\mp3Music\\TragicConfrontation.mp3", false, false, false, 10, 10, "DefaultEAXON")
	set udg_ImpossibleDifficultySound=CreateSound("Sound\\Music\\mp3Music\\PursuitTheme.mp3", false, false, false, 10, 10, "DefaultEAXON")

	set udg_Spawnamount=20
	set udg_CreepWaveWaitTime=20
	set udg_FinishWaveGoldReward=10
	set udg_TotalLives=30
	//set udg_CreepLevel=35
	//set udg_StartWaveTimer = true

	if ( GetPlayerName(Player(0)) == "WorldEdit" ) then
		set udg_DebugMode=true
	endif

	if udg_DebugMode then
		set udg_WaveTimer=30
	else
		set udg_WaveTimer=90
	endif

	call SetPlayerFlagBJ(PLAYER_STATE_GIVES_BOUNTY, true, Player(13))
	call SetPlayerFlagBJ(PLAYER_STATE_GIVES_BOUNTY, true, Player(14))
	call SetPlayerFlagBJ(PLAYER_STATE_GIVES_BOUNTY, true, Player(15))
	call SetPlayerFlagBJ(PLAYER_STATE_GIVES_BOUNTY, true, Player(16))

	call InitializeTeleports()
	call InitializePlayers()
endfunction

//library MapInit ends
//library WarcraftMaulLibrary:
 function WarcraftMaulLibrary_DisplayMessageToPlayer takes string msg,integer playerid returns nothing
		call DisplayTimedTextToPlayer(Player(playerid), 0, 0, 5, msg)
	endfunction

 function WarcraftMaulLibrary_UpdateBossKilled takes integer val returns nothing
  local integer i= 0
		loop
		exitwhen i > 12
			if ( GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING ) then
				//call MMD_UpdateValueInt("BOSSKILLED",Player(i),MMD_OP_SET, val)
			endif
		set i=i + 1
		endloop
	endfunction

 function WarcraftMaulLibrary_IsCreep takes unit u returns boolean
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

 function WarcraftMaulLibrary_DamageTargetIsCreep takes nothing returns boolean
		return WarcraftMaulLibrary_IsCreep(udg_DamageEventTarget)
	endfunction

 function WarcraftMaulLibrary_EnteringUnitIsCreep takes nothing returns boolean
		return WarcraftMaulLibrary_IsCreep(GetEnteringUnit())
	endfunction

 function WarcraftMaulLibrary_AddToTickArray takes unit u returns nothing
		call SaveIntegerBJ(0, 0, GetHandleIdBJ(u), udg_TowerTickTable)
		call GroupAddUnitSimple(u, udg_TowerTickGroup)
		set u=null
	endfunction

 function WarcraftMaulLibrary_AddToEndOfTurnArray takes unit u returns nothing
		// call SaveIntegerBJ(0, 0, GetHandleIdBJ(u), udg_TowerEndOfTurnTable)
		call GroupAddUnitSimple(u, udg_TowerEndOfTurnGroup)
		set u=null
	endfunction

 function WarcraftMaulLibrary_RemoveFromTickArray takes unit u returns nothing
		call FlushChildHashtableBJ(GetHandleIdBJ(u), udg_TowerTickTable)
		call GroupRemoveUnitSimple(u, udg_TowerTickGroup)
		set u=null
	endfunction

 function WarcraftMaulLibrary_RemoveFromEndOfTurnArray takes unit u returns nothing
		// call FlushChildHashtableBJ( GetHandleIdBJ(u), udg_TowerEndOfTurnTable )
		call GroupRemoveUnitSimple(u, udg_TowerEndOfTurnGroup)
		set u=null
	endfunction

 function WarcraftMaulLibrary___GetSellTowerValue takes integer pointvalue,integer handleid returns integer
		if ( LoadIntegerBJ(0, handleid, udg_PlayerLeavesTable) > 0 ) then
			return pointvalue / 2
		endif

		return pointvalue
	endfunction

 function RemoveCriticalStrike takes unit u returns nothing
  local location loc= GetUnitLoc(u)
  local group grp= GetUnitsInRangeOfLocAll(182.00, loc)
  local unit target= FirstOfGroup(grp)

		loop
			exitwhen target == null

			call GroupRemoveUnit(grp, target)

			if ( GetUnitAbilityLevel(target, 'A0CN') > 0 ) then
				call UnitRemoveAbilityBJ('A0CN', target)
			endif

			set target=FirstOfGroup(grp)
		endloop
		

		call RemoveLocation(loc)
		call DestroyGroup(grp)
		set loc=null
		set grp=null
		set u=null
		set target=null
	endfunction

 function WarcraftMaulLibrary_SellTower takes unit u returns nothing
  local integer sellval= WarcraftMaulLibrary___GetSellTowerValue(GetUnitPointValue(u) , GetHandleIdBJ(u))
  local texttag txt= CreateTextTagUnitBJ(I2S(sellval), u, 1, 10, 100, 80.00, 0.00, 0)
		call SetTextTagPermanentBJ(txt, false)
		call SetTextTagLifespanBJ(txt, 2.00)
		call SetTextTagVelocityBJ(txt, 64, 90)
		call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\ResourceItems\\ResourceEffectTarget.mdl", GetUnitX(u), GetUnitY(u)))
		call PlaySoundOnUnitBJ(udg_GoldSound, 100, u)
		call AdjustPlayerStateBJ(sellval, GetOwningPlayer(u), PLAYER_STATE_RESOURCE_GOLD)
		call ShowUnitHide(u)
		
		if GetUnitAbilityLevel(u, 'A031') > 0 then
			call WarcraftMaulLibrary_RemoveFromTickArray(u)
		endif

		if GetUnitAbilityLevel(u, 'A0A1') > 0 then
			call WarcraftMaulLibrary_RemoveFromEndOfTurnArray(u)
		endif

		if GetUnitAbilityLevel(u, 'A0CL') > 0 then
			call RemoveCriticalStrike(u)
		endif

		if ( GetUnitTypeId(u) == 'h01D' ) then
			set udg_ForestTrollShadowPriest=udg_ForestTrollShadowPriest - 1
			if udg_ForestTrollShadowPriest == 0 then
				call DisableTrigger(gg_trg_BattleRoar)
			endif
		elseif ( GetUnitTypeId(u) == 'h01F' ) then
			set udg_EarthPandaren=udg_EarthPandaren - 1
			if udg_EarthPandaren == 0 then
				call DisableTrigger(gg_trg_DrunkenHaze)
			endif
		elseif ( GetUnitTypeId(u) == 'h00R' ) then
			set udg_SacrificialPit=udg_SacrificialPit - 1
			if udg_SacrificialPit == 0 then
				call DisableTrigger(gg_trg_SacrificeDamage)
			endif
		elseif ( GetUnitTypeId(u) == 'n00N' ) then
			set udg_CorruptedAncientofWar=udg_CorruptedAncientofWar - 1
			if udg_CorruptedAncientofWar == 0 then
				call DisableTrigger(gg_trg_ForceOfNature)
			endif
		elseif ( GetUnitTypeId(u) == 'e00S' ) then
			set udg_Moonlight=udg_Moonlight - 1
			if udg_Moonlight == 0 then
				call DisableTrigger(gg_trg_Moonstorm)
			endif
		elseif ( GetUnitTypeId(u) == 'h00W' ) then
			set udg_NerubianBehemoth=udg_NerubianBehemoth - 1
			if udg_NerubianBehemoth == 0 then
				call DisableTrigger(gg_trg_CrushedDamage)
			endif
		elseif ( GetUnitTypeId(u) == 'h03E' ) then
			set udg_OrcPeon=udg_OrcPeon - 1
			if udg_OrcPeon == 0 then
				call DisableTrigger(gg_trg_WorkersUnionOrcPeon)
			endif
		elseif ( GetUnitTypeId(u) == 'h03F' ) then
			set udg_HumanPeasant=udg_HumanPeasant - 1
			if udg_HumanPeasant == 0 then
				call DisableTrigger(gg_trg_WorkersUnionHumanPeasant)
			endif
		elseif ( GetUnitTypeId(u) == 'h03G' ) then
			set udg_NagaSlave=udg_NagaSlave - 1
			if udg_NagaSlave == 0 then
				call DisableTrigger(gg_trg_WorkersUnionNagaSlave)
			endif
		elseif ( GetUnitTypeId(u) == 'h03I' ) then
			set udg_UndeadAcolyte=udg_UndeadAcolyte - 1
			if udg_UndeadAcolyte == 0 then
				call DisableTrigger(gg_trg_WorkersUnionUndeadAcolyte)
			endif
		elseif ( GetUnitTypeId(u) == 'h03H' ) then
			set udg_NightElfWisp=udg_NightElfWisp - 1
			if udg_NightElfWisp == 0 then
				call DisableTrigger(gg_trg_WorkersUnionNightElfWisp)
			endif
		elseif ( GetUnitAbilityLevelSwapped('A08X', u) == 1 ) then
			set udg_FrostAttack=udg_FrostAttack - 1
			if udg_FrostAttack == 0 then
				call DisableTrigger(gg_trg_FrostAttack)
			endif
		elseif ( GetUnitTypeId(u) == 'n00P' ) then
			set udg_CorruptedTreeofLife=udg_CorruptedTreeofLife - 1
			if udg_CorruptedTreeofLife == 0 then
				call DisableTrigger(gg_trg_ChainLightningAttack)
			endif
		elseif ( GetUnitTypeId(u) == 'hC89' ) then
			set udg_AdultGreenDragon=udg_AdultGreenDragon - 1
			if udg_AdultGreenDragon == 0 then
				call DisableTrigger(gg_trg_AdultGreenDragon)
			endif
		elseif ( GetUnitTypeId(u) == 'oC60' ) then
			set udg_Wyvern=udg_Wyvern - 1
			if udg_Wyvern == 0 then
				call DisableTrigger(gg_trg_Wyvern)
			endif
		elseif ( GetUnitTypeId(u) == 'hC55' ) then
			set udg_Knight=udg_Knight - 1
			if udg_Knight == 0 then
				call DisableTrigger(gg_trg_Knight)
			endif
		elseif ( GetUnitTypeId(u) == 'hC92' ) then
			set udg_NetherDragon=udg_NetherDragon - 1
			if udg_NetherDragon == 0 then
				call DisableTrigger(gg_trg_AncientNetherDragon)
			endif
		elseif ( GetUnitTypeId(u) == 'h01J' ) then
			set udg_StormPandaren=udg_StormPandaren - 1
			if udg_StormPandaren == 0 then
				call DisableTrigger(gg_trg_DrunkenBrawler)
			endif
		elseif ( GetUnitTypeId(u) == 'oC35' ) then
			set udg_OgreWarrior=udg_OgreWarrior - 1
			if udg_OgreWarrior == 0 then
				call DisableTrigger(gg_trg_MassiveBlow)
			endif
		elseif ( GetUnitTypeId(u) == 'h045' ) then
			set udg_VenomTower=udg_VenomTower - 1
			if udg_VenomTower == 0 then
				call DisableTrigger(gg_trg_VenomTower)
			endif
		elseif ( GetUnitTypeId(u) == 'e00K' ) then
			set udg_MoonDancer=udg_MoonDancer - 1
			if udg_MoonDancer == 0 then
				call DisableTrigger(gg_trg_MoonDancer)
			endif
		elseif ( GetUnitTypeId(u) == 'h04Q' ) then
			set udg_CavernDruid=udg_CavernDruid - 1
			if udg_CavernDruid == 0 then
				call DisableTrigger(gg_trg_Cavern_Druid_Ability)
			endif
		elseif ( GetUnitTypeId(u) == 'h002' ) then
			set udg_Rokhan=udg_Rokhan - 1
			if udg_Rokhan == 0 then
				call DisableTrigger(gg_trg_Rokhan)
			endif
		elseif ( GetUnitTypeId(u) == 'oC65' ) then
			set udg_WarchiefThrall=udg_WarchiefThrall - 1
			if udg_WarchiefThrall == 0 then
				call DisableTrigger(gg_trg_WarchiefThrall)
			endif
		elseif ( GetUnitTypeId(u) == 'n05Q' ) then
			set udg_DwarfStatue=udg_DwarfStatue - 1
			if udg_DwarfStatue == 0 then
				call DisableTrigger(gg_trg_DwarfStatue)
			endif
		elseif ( GetUnitTypeId(u) == 'h01A' ) then
			set udg_VoidCorruptor=udg_VoidCorruptor - 1
			if udg_VoidCorruptor == 0 then
				call DisableTrigger(gg_trg_VoidCorrupter)
			endif
		elseif ( GetUnitTypeId(u) == 'h00T' ) then
			set udg_VoidBeing=udg_VoidBeing - 1
			if udg_VoidBeing == 0 then
				call DisableTrigger(gg_trg_VoidBeing)
			endif
		elseif ( GetUnitTypeId(u) == 'o019' ) then
			set udg_AcidSpittingSpider=udg_AcidSpittingSpider - 1
			if udg_AcidSpittingSpider == 0 then
				call DisableTrigger(gg_trg_AcidSpittingSpider)
			endif
		elseif ( GetUnitTypeId(u) == 'h03W' ) then
			set udg_FelGuard=udg_FelGuard - 1
			if udg_FelGuard == 0 then
				call DisableTrigger(gg_trg_FelGuard)
			endif
		elseif ( GetUnitTypeId(u) == 'o00L' ) then
			set udg_Mannoroth=udg_Mannoroth - 1
			if udg_Mannoroth == 0 then
				call DisableTrigger(gg_trg_Mannoroth)
			endif
		elseif ( GetUnitTypeId(u) == 'n00U' ) then
			set udg_SummoningShrine=udg_SummoningShrine - 1
			if udg_SummoningShrine == 0 then
				call DisableTrigger(gg_trg_SummoningShrine)
			endif
		elseif ( GetUnitTypeId(u) == 'h00G' ) then
			set udg_Warden=udg_Warden - 1
			if udg_Warden == 0 then
				call DisableTrigger(gg_trg_Warden)
			endif
		elseif ( GetUnitTypeId(u) == 'eC83' ) then
			set udg_Illidan=udg_Illidan - 1
			if udg_Illidan == 0 then
				call DisableTrigger(gg_trg_DemonicIllidan)
			endif
		elseif ( GetUnitTypeId(u) == 'h00S' ) then
			set udg_CorruptedIllidan=udg_CorruptedIllidan - 1
			if udg_CorruptedIllidan == 0 then
				call DisableTrigger(gg_trg_CorruptedIllidan)
			endif
		elseif ( GetUnitTypeId(u) == 'h04M' ) then
			set udg_CavernHermit=udg_CavernHermit - 1
			if udg_CavernHermit == 0 then
				call DisableTrigger(gg_trg_CavernHermit)
			endif
		elseif ( GetUnitTypeId(u) == 'h04N' ) then
			set udg_CavernTurtle=udg_CavernTurtle - 1
			if udg_CavernTurtle == 0 then
				call DisableTrigger(gg_trg_CavernTurtle)
			endif
		elseif ( GetUnitTypeId(u) == 'h04O' ) then
			set udg_CavernRevenant=udg_CavernRevenant - 1
			if udg_CavernRevenant == 0 then
				call DisableTrigger(gg_trg_CavernRevenant)
			endif
		elseif ( GetUnitTypeId(u) == 'n01A' ) then
			set udg_IceTrollJoker=udg_IceTrollJoker - 1
			if udg_IceTrollJoker == 0 then
				call DisableTrigger(gg_trg_IceTrollJoker)
			endif
		endif

		call FlushChildHashtableBJ(GetHandleIdBJ(u), udg_PlayerLeavesTable)
		
		call RemoveUnit(u)
		set txt=null
		set u=null
	endfunction	

//library WarcraftMaulLibrary ends
//===========================================================================
// 
// WarCraft Maul: Reimagined 4.1.0b3
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Tue Mar 12 18:54:32 2019
//   Map Author: runi95 & Promises
// 
//===========================================================================

//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************


function InitGlobals takes nothing returns nothing
    local integer i= 0
    set udg_Spawnamount=0
    set udg_TotalLives=0
    set udg_LivesLost=0
    set udg_DifficultyDialog=DialogCreate()
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_RaceArray[i]=0
        set i=i + 1
    endloop

    set udg_RacesCount=0
    set i=0
    loop
        exitwhen ( i > 4 )
        set udg_Difficulties[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 4 )
        set udg_DifficultyStrings[i]=""
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_reals02[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_PlayerColorsWithName[i]=""
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_PlayerColorNames[i]=""
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_IsSpawnOpen[i]=0
        set i=i + 1
    endloop

    set udg_PlayerCount=0
    set udg_UnitOwnershipInt=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_Creeps[i]=0
        set i=i + 1
    endloop

    set udg_CreepLevel=0
    set udg_CreepWaveWaitTime=0
    set udg_FinishWaveGoldReward=0
    set udg_GameTime=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_PlayerKills[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_PlayerColorCodes[i]=""
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 2 )
        set udg_ScoreboardColumnWidth[i]=0
        set i=i + 1
    endloop

    set udg_IsWaveInProgress=false
    set udg_StartWaveTimer=false
    set udg_WaveTimer=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_CreepTypes[i]=""
        set i=i + 1
    endloop

    set udg_HasGameEnded=false
    set udg_GameEndTimer=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_PlayerScorePosition[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_HasHardcoreRandomed[i]=false
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_RepickCounter[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_CreepNames[i]=""
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_TierOneTowers[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_TierTwoTowers[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_TierThreeTowers[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_TierFourTowers[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_TierFiveTowers[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_TierSixTowers[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_TierSevenTowers[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_TierEightTowers[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_TierNineTowers[i]=0
        set i=i + 1
    endloop

    set udg_TierNineSize=0
    set udg_TierEightSize=0
    set udg_TierSevenSize=0
    set udg_TierSixSize=0
    set udg_TierFiveSize=0
    set udg_TierFourSize=0
    set udg_TierThreeSize=0
    set udg_TierTwoSize=0
    set udg_TierOneSize=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_PlayerRestrictions[i]=false
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_RaceNameArray[i]=""
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_HasHybridRandomed[i]=false
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_CreepAbilities[i]=0
        set i=i + 1
    endloop

    set udg_CreepAbilitiesSize=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_CurrentCreepAbilities[i]=0
        set i=i + 1
    endloop

    set udg_CurrentCreepAbilitiesSize=0
    set udg_PlayerRaceCounter=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_PlayerRaceSelection[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_HasNormalPicked[i]=false
        set i=i + 1
    endloop

    set udg_TowerTickGroup=CreateGroup()
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_ItemLootLevelOne[i]=0
        set i=i + 1
    endloop

    set udg_ItemLootLevelOneSize=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_VoidFragmentTick[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_VoidFragmentTotal[i]=0
        set i=i + 1
    endloop

    set udg_VoidFissureSpell=0
    set udg_WorkerSlaveSpell=0
    set udg_TowerEndOfTurnGroup=CreateGroup()
    set udg_UDex=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UnitIndexLock[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UDexPrev[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UDexNext[i]=0
        set i=i + 1
    endloop

    set udg_UnitIndexEvent=0
    set udg_UDexRecycle=0
    set udg_UnitIndexerEnabled=false
    set udg_UDexWasted=0
    set udg_UDexGen=0
    set udg_DamageTypeExplosive=0
    set udg_DamageTypeCriticalStrike=0
    set udg_DamageTypeHeal=0
    set udg_DamageTypeReduced=0
    set udg_DamageTypeBlocked=0
    set udg_DAMAGE_FACTOR_BRACERS=0
    set udg_DAMAGE_FACTOR_ELUNES=0
    set udg_DAMAGE_FACTOR_ETHEREAL=0
    set udg_DamageEventAOE=0
    set udg_DamageEventLevel=0
    set udg_AfterDamageEvent=0
    set udg_DamageEvent=0
    set udg_AOEDamageEvent=0
    set udg_DamageModifierEvent=0
    set udg_DamageEventAmount=0
    set udg_DamageEventPrevAmt=0
    set udg_DamageEventOverride=false
    set udg_NextDamageOverride=false
    set udg_DamageEventType=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_LastDmgPrevType[i]=0
        set i=i + 1
    endloop

    set udg_NextDamageType=0
    set udg_DamageEventsWasted=0
    set udg_DmgEvRecursionN=0
    set udg_DmgEvStarted=false
    set udg_IsDamageSpell=false
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_LastDmgWasSpell[i]=false
        set i=i + 1
    endloop

    set udg_LastDamageHP=0
    set udg_DmgEvTimer=CreateTimer()
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_LastDmgPrevAmount[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_LastDmgValue[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_HideDamageFrom[i]=false
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UnitDamageRegistered[i]=false
        set i=i + 1
    endloop

    set udg_DamageEventAOEGroup=CreateGroup()
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_ItemLootLevelTwo[i]=0
        set i=i + 1
    endloop

    set udg_ItemLootLevelTwoSize=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_ItemLootLevelThree[i]=0
        set i=i + 1
    endloop

    set udg_ItemLootLevelThreeSize=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_ItemLootLevelFour[i]=0
        set i=i + 1
    endloop

    set udg_ItemLootLevelFourSize=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_ThrallSpellChance[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_ThrallSpell[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_PlayerHasBuilt[i]=false
        set i=i + 1
    endloop

    set udg_Antiblockcheckgroup=CreateGroup()
    set udg_PlayerLimitLeft=0
    set udg_PlayerLimitRight=0
    set udg_TouchedLastTower=false
    set udg_PlayerLimitCircleOne=0
    set udg_PlayerLimitCircleTwo=0
    set udg_PlayerLimitCircleThree=0
    set udg_PlayerLimitCircleFour=0
    set udg_Unitarraysize=0
    set udg_Towercounter=0
    set udg_PlayerLimitOne=0
    set udg_PlayerLimitTwo=0
    set udg_PlayerLimitThree=0
    set udg_PlayerLimitFour=0
    set udg_PlayerLimitFive=0
    set udg_PlayerLimitSix=0
    set udg_PlayerLimitCircleFive=0
    set udg_PlayerLimitCircleSix=0
    set udg_PlayerLimitCircleSeven=0
    set udg_PlayerLimitCheckpointOne=0
    set udg_PlayerLimitCheckpointTwo=0
    set udg_PlayerLimitCheckpointThree=0
    set udg_PlayerLimitCheckpointFour=0
    set udg_PlayerLimitCheckpointFive=0
    set udg_PlayerLimitCheckpointSix=0
    set udg_PlayerLimitCheckpointSeven=0
    set udg_PlayerLimitCheckpointEight=0
    set udg_AntiblockPlayerid=0
    set udg_Antijuggle=false
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_DisableOnOff[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_TowerUnitGroup[i]=CreateGroup()
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_SpittingSpiderChance[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_NaturesNourishChance[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_ChimaeraCount[i]=0
        set i=i + 1
    endloop

    set udg_ChimaeraRoost=CreateGroup()
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_ElementalistAbilities[i]=0
        set i=i + 1
    endloop

    set udg_ElementalistAbilitiesSize=0
    set udg_ForestTrollShadowPriest=0
    set udg_EarthPandaren=0
    set udg_SacrificialPit=0
    set udg_CorruptedAncientofWar=0
    set udg_Moonlight=0
    set udg_NerubianBehemoth=0
    set udg_OrcPeon=0
    set udg_HumanPeasant=0
    set udg_NagaSlave=0
    set udg_UndeadAcolyte=0
    set udg_NightElfWisp=0
    set udg_FrostAttack=0
    set udg_CorruptedTreeofLife=0
    set udg_AdultGreenDragon=0
    set udg_Wyvern=0
    set udg_Knight=0
    set udg_NetherDragon=0
    set udg_StormPandaren=0
    set udg_OgreWarrior=0
    set udg_VenomTower=0
    set udg_MoonDancer=0
    set udg_CavernDruid=0
    set udg_Rokhan=0
    set udg_WarchiefThrall=0
    set udg_DwarfStatue=0
    set udg_VoidCorruptor=0
    set udg_VoidBeing=0
    set udg_AcidSpittingSpider=0
    set udg_FelGuard=0
    set udg_Mannoroth=0
    set udg_SummoningShrine=0
    set udg_Warden=0
    set udg_Illidan=0
    set udg_CavernHermit=0
    set udg_CavernTurtle=0
    set udg_CavernRevenant=0
    set udg_CorruptedIllidan=0
    set udg_Difficulty=0
    set udg_DebugMode=false
    set udg_IceTrollJoker=0
    set udg_DmgEvRunning=false
    set udg_DmgEvQueued=false
endfunction

//***************************************************************************
//*
//*  Destructable Objects
//*
//***************************************************************************

function CreateAllDestructables takes nothing returns nothing
    local destructable d
    local trigger t
    local real life
    set gg_dest_B000_0160=CreateDestructable('B000', 3520.0, - 5312.0, 0.000, 0.900, 0)
endfunction

//***************************************************************************
//*
//*  Custom Script Code
//*
//***************************************************************************
// Map deprotected by X-deprotect (version 2006-10-02) by zibada
// http://dimon.xgm.ru/xdep/
// Visit our modmaking community at http://xgm.ru/


//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************

//===========================================================================
// Trigger: Unit Indexer
//
// Unit Indexer gives you an array-safe (1-8190) custom value for units, eliminating the need for hashtables to store unit-specific data.
// Just use "Set MyArrayData[(Custom value of Unit)] = (Some data)".
// --------
// If you want to get the unit assigned to an index (reverse lookup) use "UDexUnits[(Index)]".
// --------
// If you want to detect when an index is created or when it is released, use "UnitIndexEvent Equal to 1.00" (created) or "UnitIndexEvent Equal to 2.00" (released). The index being created/released is called "UDex".
// --------
// You can enable/disable Unit Indexer to protect some of your undesirable units from being indexed like this:
// Trigger - Turn off Unit Indexer <gen>
// Unit - Create 1 Dummy for (Triggering player) at TempPoint facing 0.00 degrees
// Trigger - Turn on Unit Indexer <gen>
// --------
// If you want to use a Map Initialization trigger that uses custom value of units, to make sure that UnitIndexer initializes first, use the event "UnitIndexEvent Equal to 3.00". Otherwise the custom value of units may be zero.
// --------
// Advanced:
// --------
// If you want to lock the index of a unit, use "Set UnitIndexLock[(Index)] = (UnitIndexLock[(Index)] + 1)". This will prevent the index from being recycled. If you want to unlock it and allow it to be recycled, run the Unit Indexer <gen> trigger.
// Note: Make sure if you add a lock that you will eventually remove the lock, otherwise the index will never be recycled.
//===========================================================================
function Trig_Unit_Indexer_Func005Func002C takes nothing returns boolean
    if ( not ( udg_UnitIndexLock[udg_UDex] == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Unit_Indexer_Func005C takes nothing returns boolean
    if ( not ( GetUnitUserData(udg_UDexUnits[udg_UDex]) == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Unit_Indexer_Func014Func003C takes nothing returns boolean
    if ( not ( udg_UDexWasted == 32 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Unit_Indexer_Func014Func005C takes nothing returns boolean
    if ( not ( udg_UDexRecycle == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Unit_Indexer_Func014C takes nothing returns boolean
    if ( not ( udg_UnitIndexerEnabled == true ) ) then
        return false
    endif
    if ( not ( GetUnitUserData(GetFilterUnit()) == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Unit_Indexer_Actions takes nothing returns nothing
        call ExecuteFunc("InitializeUnitIndexer")
    endfunction
     
    function ClearUnitIndex takes nothing returns nothing
    if ( Trig_Unit_Indexer_Func005C() ) then
        set udg_UnitIndexLock[udg_UDex]=( udg_UnitIndexLock[udg_UDex] - 1 )
        if ( Trig_Unit_Indexer_Func005Func002C() ) then
            set udg_UDexNext[udg_UDexPrev[udg_UDex]]=udg_UDexNext[udg_UDex]
            set udg_UDexPrev[udg_UDexNext[udg_UDex]]=udg_UDexPrev[udg_UDex]
            set udg_UDexPrev[udg_UDex]=0
            set udg_UnitIndexEvent=0.00
            set udg_UnitIndexEvent=2.00
            set udg_UnitIndexEvent=0.00
            set udg_UDexUnits[udg_UDex]=null
            set udg_UDexNext[udg_UDex]=udg_UDexRecycle
            set udg_UDexRecycle=udg_UDex
        else
        endif
    else
    endif
    endfunction
     
    function IndexUnit takes nothing returns boolean
        local integer pdex= udg_UDex
        local integer ndex
    // -
    // You can customize the following block - if conditions are false the (Matching unit) won't be indexed.
    // -
    if ( Trig_Unit_Indexer_Func014C() ) then
        set udg_UDexWasted=( udg_UDexWasted + 1 )
        if ( Trig_Unit_Indexer_Func014Func003C() ) then
            set udg_UDexWasted=0
            set udg_UDex=udg_UDexNext[0]
            loop
                exitwhen udg_UDex == 0
                set ndex=udg_UDexNext[udg_UDex]
                call ClearUnitIndex()
                set udg_UDex=ndex
            endloop
        else
        endif
        if ( Trig_Unit_Indexer_Func014Func005C() ) then
            set udg_UDex=( udg_UDexGen + 1 )
            set udg_UDexGen=udg_UDex
        else
            set udg_UDex=udg_UDexRecycle
            set udg_UDexRecycle=udg_UDexNext[udg_UDex]
        endif
        set udg_UDexUnits[udg_UDex]=GetFilterUnit()
        call SetUnitUserData(udg_UDexUnits[udg_UDex], udg_UDex)
        set udg_UDexPrev[udg_UDexNext[0]]=udg_UDex
        set udg_UDexNext[udg_UDex]=udg_UDexNext[0]
        set udg_UDexNext[0]=udg_UDex
        set udg_UnitIndexLock[udg_UDex]=1
        set udg_UnitIndexEvent=0.00
        set udg_UnitIndexEvent=1.00
        set udg_UnitIndexEvent=0.00
        set udg_UDex=pdex
    else
    endif
        return false
    endfunction
     
    function InitializeUnitIndexer takes nothing returns nothing
        local integer i= bj_MAX_PLAYER_SLOTS
        local boolexpr b= Filter(function IndexUnit)
        local region re= CreateRegion()
        local trigger t= GetTriggeringTrigger()
        local rect r= GetWorldBounds()
        call RegionAddRect(re, r)
        call TriggerRegisterEnterRegion(t, re, b)
        call TriggerClearActions(t)
        call TriggerAddAction(t, function ClearUnitIndex)
    set udg_UnitIndexerEnabled=true
        loop
            set i=i - 1
            call GroupEnumUnitsOfPlayer(bj_lastCreatedGroup, Player(i), b)
            exitwhen i == 0
        endloop
        call RemoveRect(r)
        set re=null
        set r=null
        set t=null
        set b=null
    set udg_UnitIndexEvent=3.00
    set udg_UnitIndexEvent=0.00
endfunction

//===========================================================================
function InitTrig_Unit_Indexer takes nothing returns nothing
    set gg_trg_Unit_Indexer=CreateTrigger()
    call TriggerAddAction(gg_trg_Unit_Indexer, function Trig_Unit_Indexer_Actions)
endfunction

//===========================================================================
// Trigger: Damage Engine Config
//===========================================================================
function Trig_Damage_Engine_Config_Actions takes nothing returns nothing
    // -
    // This trigger's conditions let you filter out units you don't want detection for.
    // NOTE: By default, units with Locust will not pass the check.
    // TIP: The unit is called UDexUnits[UDex] and its custom value is UDex
    // -
    // Copy the Detect Spell Damage Ability from Object Editor into your map and set the following variable respectively:
    // -
    set udg_SpellDamageAbility='A0A2'
    // -
    // You can add extra classifications here if you want to differentiate between your triggered damage
    // Use DamageTypeExplosive (or any negative value damage type) if you want a unit killed by that damage to explode
    // -
    set udg_DamageTypeExplosive=- 1
    set udg_DamageTypeCriticalStrike=1
    set udg_DamageTypeHeal=2
    set udg_DamageTypeReduced=3
    set udg_DamageTypeBlocked=4
    // -
    // Leave the next Set statement disabled if you modified the Spell Damage Reduction item ability to 1.67 reduction
    // Otherwise, if you removed that ability from Runed Bracers, you'll need to enable this line:
    // -
    // -
    // Set the damage multiplication factor (1.00 being unmodified, increasing in damage over 1.00 and at 0 damage with 0.00)
    // NOTE. With the default values, Runed Bracers is reduces 33%, Elune's Grace reduces 20% and Ethereal increases 67%
    // -
    set udg_DAMAGE_FACTOR_BRACERS=0.67
    set udg_DAMAGE_FACTOR_ELUNES=0.80
    set udg_DAMAGE_FACTOR_ETHEREAL=1.67
    // -
    // Added 25 July 2017 to allow detection of things like Bash or Pulverize or AOE spread
    // -
    set udg_DamageEventAOE=1
    set udg_DamageEventLevel=1
    // -
    // Do not enable any of the following lines as they are simply variable declarations to make copying easier
    // -
endfunction

//===========================================================================
function InitTrig_Damage_Engine_Config takes nothing returns nothing
    set gg_trg_Damage_Engine_Config=CreateTrigger()
    call TriggerAddAction(gg_trg_Damage_Engine_Config, function Trig_Damage_Engine_Config_Actions)
endfunction

//===========================================================================
// Trigger: Damage Engine
//===========================================================================
//===========================================================================
// Damage Engine lets you detect, amplify, block or nullify damage. It even
// lets you detect if the damage was physical or from a spell. Just reference
// DamageEventAmount/Source/Target or the boolean IsDamageSpell, to get the
// necessary damage event data.
//
// - Detect damage: use the event "DamageEvent Equal to 1.00"
// - To change damage before it's dealt: use the event "DamageModifierEvent Equal to 1.00"
// - Detect damage after it was applied, use the event "AfterDamageEvent Equal to 1.00"
// - Detect spell damage: use the condition "IsDamageSpell Equal to True"
// - Detect zero-damage: use the event "DamageEvent Equal to 2.00" (an AfterDamageEvent will not fire for this)
//
// You can specify the DamageEventType before dealing triggered damage, then run the trigger "ClearDamageEvent (Checking Conditions)" after dealing triggered damage from within a damage event:
// - Set NextDamageType = DamageTypeWhatever
// - Unit - Cause...
// - Trigger - Run ClearDamageEvent (Checking Conditions)
//
// You can modify the DamageEventAmount and the DamageEventType from a "DamageModifierEvent Equal to 1.00" trigger.
// - If the amount is modified to negative, it will count as a heal.
// - If the amount is set to 0, no damage will be dealt.
//
// If you need to reference the original in-game damage, use the variable "DamageEventPrevAmt".
//
//===========================================================================
// Programming note about "integer i" and "udg_DmgEvRecursionN": integer i
// ranges from -1 upwards. "udg_DmgEvRecursionN" ranges from 0 upwards.
// "integer i" is always 1 less than "udg_DmgEvRecursionN"
//
function DmgEvResetVars takes nothing returns nothing
    local integer i= udg_DmgEvRecursionN - 2
    set udg_DmgEvRecursionN=i + 1
    if i >= 0 then
        set udg_DamageEventPrevAmt=udg_LastDmgPrevAmount[i]
        set udg_DamageEventAmount=udg_LastDmgValue[i]
        set udg_DamageEventSource=udg_LastDmgSource[i]
        set udg_DamageEventTarget=udg_LastDmgTarget[i]
        set udg_IsDamageSpell=udg_LastDmgWasSpell[i]
        set udg_DamageEventType=udg_LastDmgPrevType[i]
    endif
endfunction

function ClearDamageEvent takes boolean clear returns nothing
    if clear then
        set udg_NextDamageOverride=false
        set udg_NextDamageType=0
    endif
    if udg_DmgEvQueued then
        //The 0-second timer has expired, or there had been multiple sequential damage events running in parallel.        
        set udg_DmgEvQueued=false
        set udg_AfterDamageEvent=0.00
        set udg_AfterDamageEvent=1.00 //No longer fires with Unit State Event detection - this is
        set udg_AfterDamageEvent=0.00 //lighter on the system but will fire slightly later than before.
                                        //It now only serves for counter-damage after the initial damage.
        call ClearDamageEvent(true) //Check for any potential failed recursive damage from the previous event.
        call DmgEvResetVars()
    endif
endfunction
function DmgEvOnAOEEnd takes nothing returns nothing
    if udg_DamageEventAOE > 1 then
        set udg_AOEDamageEvent=0.00
        set udg_AOEDamageEvent=1.00
        set udg_AOEDamageEvent=0.00
        set udg_DamageEventAOE=1
    endif
    set udg_DamageEventLevel=1
    set udg_EnhancedDamageTarget=null
    call GroupClear(udg_DamageEventAOEGroup)
endfunction
   
function DmgEvOnExpire takes nothing returns nothing
    set udg_DmgEvStarted=false //The timer has expired. Flag off to allow it to be restarted when needed.
    call ClearDamageEvent(true) //Check for any lingering damage
    //Reset things so they don't perpetuate for AoE/Level target detection
    call DmgEvOnAOEEnd()
    set udg_DamageEventTarget=null
    set udg_DamageEventSource=null
endfunction
function PreClearDamageEvent takes nothing returns boolean
    call ClearDamageEvent(true)
    return false
endfunction
function OnUnitDamage takes nothing returns boolean
    local boolean override= udg_DamageEventOverride
    local integer i
    local integer e= udg_DamageEventLevel
    local integer a= udg_DamageEventAOE
    local string s
    local unit u
    local unit f
    call ClearDamageEvent(false) //in case the 0.00 second timer hasn't yet expired
    set i=udg_DmgEvRecursionN - 1 //Had to be moved here due to false recursion tracking
    if i < 0 then
        //Added 25 July 2017 to detect AOE damage or multiple single-target damage
        set u=udg_DamageEventTarget
        set f=udg_DamageEventSource
    elseif i < 16 then
        set udg_LastDmgPrevAmount[i]=udg_DamageEventPrevAmt
        set udg_LastDmgValue[i]=udg_DamageEventAmount
        set udg_LastDmgSource[i]=udg_DamageEventSource
        set udg_LastDmgTarget[i]=udg_DamageEventTarget
        set udg_LastDmgWasSpell[i]=udg_IsDamageSpell
        set udg_LastDmgPrevType[i]=udg_DamageEventType
    else
        set s="WARNING: Recursion error when dealing damage! Make sure when you deal damage from within a DamageEvent trigger, do it like this:"
        set s=s + "Trigger - Turn off (This Trigger)"
        set s=s + "Unit - Cause..."
        set s=s + "Trigger - Run ClearDamageEvent (Checking Conditions)"
        set s=s + "Trigger - Turn on (This Trigger)"
       
        //Delete the next couple of lines to disable the in-game recursion crash warnings
        call ClearTextMessages()
        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0.00, 0.00, 999.00, s)
        return false
    endif
    set udg_DmgEvRecursionN=i + 2
    set udg_DamageEventAmount=GetEventDamage()
    set udg_DamageEventTarget=GetTriggerUnit()
    set udg_DamageEventSource=GetEventDamageSource()
   
    set udg_DamageEventType=udg_NextDamageType
    set udg_NextDamageType=0
    set udg_DamageEventOverride=udg_NextDamageOverride
    set udg_NextDamageOverride=false
   
    if i < 0 then
        //Added 25 July 2017 to detect AOE damage or multiple single-target damage
        if udg_DamageEventType == 0 then
            if f == udg_DamageEventSource then
                //Source has damaged more than once
                if IsUnitInGroup(udg_DamageEventTarget, udg_DamageEventAOEGroup) then
                    //Added 5 August 2017 to improve tracking of enhanced damage against, say, Pulverize
                    set udg_DamageEventLevel=udg_DamageEventLevel + 1
                    set udg_EnhancedDamageTarget=udg_DamageEventTarget
                else
                    //Multiple targets hit by this source - flag as AOE
                    set udg_DamageEventAOE=udg_DamageEventAOE + 1
                endif
            else
                //New damage source - unflag everything
                set u=udg_DamageEventSource
                set udg_DamageEventSource=f
                call DmgEvOnAOEEnd()
                set udg_DamageEventSource=u
            endif
            call GroupAddUnit(udg_DamageEventAOEGroup, udg_DamageEventTarget)
        endif
        if not udg_DmgEvStarted then
            set udg_DmgEvStarted=true
            call TimerStart(udg_DmgEvTimer, 0.00, false, function DmgEvOnExpire)
        endif
    endif
   
    if udg_DamageEventAmount == 0.00 then
        if not udg_HideDamageFrom[GetUnitUserData(udg_DamageEventSource)] then
            set udg_DamageEventPrevAmt=0.00
            set udg_DamageEvent=0.00
            set udg_DamageEvent=2.00
            set udg_DamageEvent=0.00
        endif
        call DmgEvResetVars()
    else
        set u=udg_DamageEventTarget
        set udg_IsDamageSpell=udg_DamageEventAmount < 0.00
        if udg_IsDamageSpell then
            set udg_DamageEventAmount=- udg_DamageEventAmount
            if IsUnitType(u, UNIT_TYPE_ETHEREAL) and not IsUnitType(u, UNIT_TYPE_HERO) then
                set udg_DamageEventAmount=udg_DamageEventAmount * udg_DAMAGE_FACTOR_ETHEREAL //1.67
            endif
            if GetUnitAbilityLevel(u, 'Aegr') > 0 then
                set udg_DamageEventAmount=udg_DamageEventAmount * udg_DAMAGE_FACTOR_ELUNES //0.80
            endif
            if udg_DmgEvBracers != 0 and IsUnitType(u, UNIT_TYPE_HERO) then
                //Inline of UnitHasItemOfTypeBJ without the potential handle ID leak.
                set i=bj_MAX_INVENTORY
                loop
                    set i=i - 1
                    if GetItemTypeId(UnitItemInSlot(u, i)) == udg_DmgEvBracers then
                        set udg_DamageEventAmount=udg_DamageEventAmount * udg_DAMAGE_FACTOR_BRACERS //0.67
                        exitwhen true
                    endif
                    exitwhen i == 0
                endloop
            endif
        endif
        set udg_DamageEventPrevAmt=udg_DamageEventAmount
        set udg_DamageModifierEvent=0.00
        if not udg_DamageEventOverride then
            set udg_DamageModifierEvent=1.00 //Primary modification - multiplication, blocking, reversing, etc.
            set udg_DamageModifierEvent=2.00 //Secondary Modification - addition/subtraction 
            set udg_DamageModifierEvent=3.00 //Similar to 2.00 but with knowing all previous addition/subtraction have run.
        endif
        if udg_DamageEventAmount > 0.00 then
            set udg_DamageModifierEvent=4.00 //Apply finite damage modification such as Mana Shield or Anti-Magic Shell.
        endif
        set udg_DamageEventOverride=override
        set udg_DamageModifierEvent=0.00
        if not udg_HideDamageFrom[GetUnitUserData(udg_DamageEventSource)] then
            set udg_DamageEvent=0.00
            set udg_DamageEvent=1.00
            set udg_DamageEvent=0.00
        endif
        call ClearDamageEvent(true) //in case the unit state event failed from a recursive damage event
       
        //All events have run and the damage amount is finalized.
        call BlzSetEventDamage(udg_DamageEventAmount)
        set udg_DmgEvQueued=true
        if udg_DamageEventType < 0 and GetWidgetLife(u) - udg_DamageEventAmount <= 0.405 then
            call SetUnitExploded(u, true) //In 1.29 Finger of Death works as intended and triggering a fix is unnecessary.
        endif //However, if you have a custom spell you want to be able to explode units with,
    endif //then this negative damage type is still useful.
    set u=null
    set f=null
    return false
endfunction
function CreateDmgEvTrg takes nothing returns nothing
    set udg_DamageEventTrigger=CreateTrigger()
    call TriggerAddCondition(udg_DamageEventTrigger, Filter(function OnUnitDamage))
endfunction
function SetupDmgEv takes nothing returns boolean
    local integer i= udg_UDex
    local unit u= udg_UDexUnits[i]
    if GetUnitAbilityLevel(u, 'Aloc') == 0 and TriggerEvaluate(gg_trg_Damage_Engine_Config) then
        set udg_UnitDamageRegistered[i]=true
        call TriggerRegisterUnitEvent(udg_DamageEventTrigger, u, EVENT_UNIT_DAMAGED)
        call UnitAddAbility(u, udg_SpellDamageAbility)
        call UnitMakeAbilityPermanent(u, true, udg_SpellDamageAbility)
    endif
    set u=null
    return false
endfunction
function RemoveDmgEv takes nothing returns boolean
    local integer i= udg_UDex
    set udg_HideDamageFrom[i]=false
    if udg_UnitDamageRegistered[i] then
        set udg_UnitDamageRegistered[i]=false
        set udg_DamageEventsWasted=udg_DamageEventsWasted + 1
        if udg_DamageEventsWasted == 32 then //After 32 registered units have been removed...
            set udg_DamageEventsWasted=0
               
            //Rebuild the mass EVENT_UNIT_DAMAGED trigger:
            call DestroyTrigger(udg_DamageEventTrigger)
            call CreateDmgEvTrg()
            set i=udg_UDexNext[0]
            loop
                exitwhen i == 0
                if udg_UnitDamageRegistered[i] then
                    call TriggerRegisterUnitEvent(udg_DamageEventTrigger, udg_UDexUnits[i], EVENT_UNIT_DAMAGED)
                endif
                set i=udg_UDexNext[i]
            endloop
        endif
    endif
    return false
endfunction
   
//===========================================================================
function InitTrig_Damage_Engine takes nothing returns nothing
    local unit u= CreateUnit(Player(bj_PLAYER_NEUTRAL_EXTRA), 'uloc', 0, 0, 0)
    local integer i= bj_MAX_PLAYERS
   
    //Create trigger to add units to the system.
    local trigger t= CreateTrigger()
    call TriggerRegisterVariableEvent(t, "udg_UnitIndexEvent", EQUAL, 1.00)
    call TriggerAddCondition(t, Filter(function SetupDmgEv))
    
    //Create trigger to remove units from the system.
    set t=CreateTrigger()
    call TriggerRegisterVariableEvent(t, "udg_UnitIndexEvent", EQUAL, 2.00)
    call TriggerAddCondition(t, Filter(function RemoveDmgEv))
    set t=null
   
    //Execute the configuration function to first set all GUI variables:
    call ExecuteFunc("Trig_Damage_Engine_Config_Actions")
   
    //Create trigger for storing all EVENT_UNIT_DAMAGED events.
    call CreateDmgEvTrg()
   
    //Create GUI-friendly trigger for cleaning up after UnitDamageTarget.
    set udg_ClearDamageEvent=CreateTrigger()
    call TriggerAddCondition(udg_ClearDamageEvent, Filter(function PreClearDamageEvent))
   
    //Disable SpellDamageAbility for every player.
    loop
        set i=i - 1
        call SetPlayerAbilityAvailable(Player(i), udg_SpellDamageAbility, false)
        exitwhen i == 0
    endloop
   
    //Preload ability
    call UnitAddAbility(u, udg_SpellDamageAbility)
    call RemoveUnit(u)
    set u=null
endfunction //===========================================================================
// Trigger: WarcraftMaulLibrary
//===========================================================================
// Trigger: MapInit
//===========================================================================

//===========================================================================
// Trigger: UnchargedRune
//===========================================================================
function Trig_UnchargedRune_Conditions takes nothing returns boolean
	return GetUnitAbilityLevelSwapped('A0CS', GetTriggerUnit()) > 0
endfunction

function Trig_UnchargedRune_Actions takes nothing returns nothing
	if ( GetSpellAbilityId() == 'A0BO' ) then
		call ReplaceUnitBJ(GetTriggerUnit(), 'n01R', bj_UNIT_STATE_METHOD_DEFAULTS) // Water Rune
	elseif ( GetSpellAbilityId() == 'A0BS' ) then
		call ReplaceUnitBJ(GetTriggerUnit(), 'n01S', bj_UNIT_STATE_METHOD_DEFAULTS) // Fire Rune
	elseif ( GetSpellAbilityId() == 'A0C0' ) then
		call ReplaceUnitBJ(GetTriggerUnit(), 'n022', bj_UNIT_STATE_METHOD_DEFAULTS) // Nature Rune
	elseif ( GetSpellAbilityId() == 'A0C1' ) then
		call ReplaceUnitBJ(GetTriggerUnit(), 'n023', bj_UNIT_STATE_METHOD_DEFAULTS) // Air Rune
	elseif ( GetSpellAbilityId() == 'A0C2' ) then
		call ReplaceUnitBJ(GetTriggerUnit(), 'n024', bj_UNIT_STATE_METHOD_DEFAULTS) // Death Rune
	elseif ( GetSpellAbilityId() == 'A0C3' ) then
		call ReplaceUnitBJ(GetTriggerUnit(), 'n025', bj_UNIT_STATE_METHOD_DEFAULTS) // Life Rune
	endif
endfunction

//===========================================================================
function InitTrig_UnchargedRune takes nothing returns nothing
	set gg_trg_UnchargedRune=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(gg_trg_UnchargedRune, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(gg_trg_UnchargedRune, Condition(function Trig_UnchargedRune_Conditions))
	call TriggerAddAction(gg_trg_UnchargedRune, function Trig_UnchargedRune_Actions)
endfunction

//===========================================================================
// Trigger: AntiBlockAndJuggle
//===========================================================================
function FilteredUnitIsInGroup takes nothing returns boolean
	return IsUnitInGroup(GetFilterUnit(), udg_Antiblockcheckgroup)
endfunction

function FilteredUnitIsStructure takes nothing returns boolean
	if ( GetUnitTypeId(GetFilterUnit()) == 'h03M' ) then
		return false
	endif

	return IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE)
endfunction

function CheckIfTowersTouch takes integer first,integer second returns boolean
 local boolean flag= false
 local real dist= SquareRoot(Pow(LoadReal(udg_AntiBlockTable, first, 2) - LoadReal(udg_AntiBlockTable, second, 2), 2.00) + Pow(LoadReal(udg_AntiBlockTable, first, 3) - LoadReal(udg_AntiBlockTable, second, 3), 2.00))

	if ( dist > 182.00 ) then
		set flag=true
	endif

	return flag
endfunction

function CheckHashtable takes nothing returns nothing
 local integer filterid= GetHandleIdBJ(GetFilterUnit())
 local integer enumid= GetHandleIdBJ(GetEnumUnit())
 local integer handleid= LoadInteger(udg_AntiBlockTable, GetHandleIdBJ(GetEnumUnit()), 1)
 local integer handleidFilter= LoadInteger(udg_AntiBlockTable, filterid, 1)

	if ( handleid == handleidFilter ) then
		return
	endif

	if ( handleid == GetHandleIdBJ(GetFilterUnit()) ) then
		return
	endif

	if ( handleid == LoadInteger(udg_AntiBlockTable, handleidFilter, 1) ) then
		if ( not CheckIfTowersTouch(handleidFilter , enumid) ) then
			return
		endif
	endif

	if ( handleidFilter == LoadInteger(udg_AntiBlockTable, handleid, 1) ) then
		return
	endif

	set udg_TouchedLastTower=true
endfunction

function GetUnitsInRangeFilter takes nothing returns boolean
	if ( not FilteredUnitIsStructure() ) then
		return false
	endif

	if ( GetFilterUnit() == GetEnumUnit() ) then
		return false
	endif

	if ( ( IsUnitInGroup(GetFilterUnit(), udg_Antiblockcheckgroup) ) ) then // INLINED!!
		call CheckHashtable()

		return false
	endif

	call SaveInteger(udg_AntiBlockTable, GetHandleIdBJ(GetFilterUnit()), 1, GetHandleIdBJ(GetEnumUnit()))
	// call BlzSetUnitName(GetFilterUnit(), I2S(GetHandleIdBJ(GetEnumUnit())))

	return true
endfunction

function NewNeighbourTower takes integer handleid returns nothing
 local location loc= GetUnitLoc(GetEnumUnit())
 local group grp= null

	call SaveBoolean(udg_AntiBlockTable, handleid, 0, true)
	call SaveReal(udg_AntiBlockTable, handleid, 2, GetLocationX(loc))
	call SaveReal(udg_AntiBlockTable, handleid, 3, GetLocationY(loc))

	set grp=GetUnitsInRangeOfLocMatching(182.00, loc, Condition(function GetUnitsInRangeFilter))

	call SaveGroupHandle(udg_AntiBlockTable, handleid, 1, grp)
	call GroupAddGroup(grp, udg_Antiblockcheckgroup)
	set udg_Towercounter=udg_Towercounter + 1
endfunction

function FindNeighbouringTowers takes nothing returns nothing
 local integer handleid= GetHandleIdBJ(GetEnumUnit())
	if ( LoadBoolean(udg_AntiBlockTable, handleid, 0) ) then
		return
	endif

	call NewNeighbourTower(handleid)
endfunction

function IsPlayerBlocking takes nothing returns nothing
	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 5], GetEnumUnit()) ) then
		// call DisplayTextToForce(GetPlayersAll(), "5")
		set udg_PlayerLimitOne=udg_PlayerLimitOne + 1
	endif

	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid], GetEnumUnit()) ) then
		// call DisplayTextToForce(GetPlayersAll(), "0")
		set udg_PlayerLimitTwo=udg_PlayerLimitTwo + 1
	endif

	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 1], GetEnumUnit()) ) then
		// call DisplayTextToForce(GetPlayersAll(), "1")
		set udg_PlayerLimitThree=udg_PlayerLimitThree + 1
	endif

	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 3], GetEnumUnit()) ) then
		set udg_PlayerLimitFour=udg_PlayerLimitFour + 1
	endif

	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 2], GetEnumUnit()) ) then
		set udg_PlayerLimitFive=udg_PlayerLimitFive + 1
	endif

	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 4], GetEnumUnit()) ) then
		set udg_PlayerLimitSix=udg_PlayerLimitSix + 1
	endif

	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 6], GetEnumUnit()) ) then
		set udg_PlayerLimitCircleOne=udg_PlayerLimitCircleOne + 1
	endif

	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 7], GetEnumUnit()) ) then
		set udg_PlayerLimitCircleTwo=udg_PlayerLimitCircleTwo + 1
	endif

	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 8], GetEnumUnit()) ) then
		set udg_PlayerLimitCircleThree=udg_PlayerLimitCircleThree + 1
	endif

	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 9], GetEnumUnit()) ) then
		set udg_PlayerLimitCircleFour=udg_PlayerLimitCircleFour + 1
	endif

	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 10], GetEnumUnit()) ) then
		set udg_PlayerLimitCircleFive=udg_PlayerLimitCircleFive + 1
	endif

	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 11], GetEnumUnit()) ) then
		set udg_PlayerLimitCircleSix=udg_PlayerLimitCircleSix + 1
	endif

	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 12], GetEnumUnit()) ) then
		set udg_PlayerLimitCircleSeven=udg_PlayerLimitCircleSeven + 1
	endif
endfunction

function AreAnyOfTheBordersLargerThanOne takes nothing returns boolean
	if ( udg_PlayerLimitOne > 1 ) then
		return true
	endif

	if ( udg_PlayerLimitTwo > 1 ) then
		return true
	endif

	if ( udg_PlayerLimitThree > 1 ) then
		return true
	endif

	if ( udg_PlayerLimitFour > 1 ) then
		return true
	endif

	if ( udg_PlayerLimitFive > 1 ) then
		return true
	endif

	if ( udg_PlayerLimitSix > 1 ) then
		return true
	endif

	return false
endfunction

function ThreeSidesOfCircleTwo takes nothing returns boolean
	return ( ( udg_PlayerLimitCircleOne + udg_PlayerLimitCircleFive + udg_PlayerLimitCircleSix + udg_PlayerLimitCircleSeven ) > 2 )
endfunction

function ThreeSidesOfCircleOne takes nothing returns boolean
	return ( ( udg_PlayerLimitCircleOne + udg_PlayerLimitCircleTwo + udg_PlayerLimitCircleThree + udg_PlayerLimitCircleFour ) > 2 )
endfunction

function ThreeSidesOfAnyCircle takes nothing returns boolean
	if ( ( ( udg_PlayerLimitCircleOne + udg_PlayerLimitCircleTwo + udg_PlayerLimitCircleThree + udg_PlayerLimitCircleFour ) > 2 ) ) then // INLINED!!
		return true
	endif

	if ( ( ( udg_PlayerLimitCircleOne + udg_PlayerLimitCircleFive + udg_PlayerLimitCircleSix + udg_PlayerLimitCircleSeven ) > 2 ) ) then // INLINED!!
		return true
	endif

	return false
endfunction

function AllSidesOfBothCirclesAreConnected takes nothing returns boolean
	if not ( udg_PlayerLimitCircleOne > 0 ) then
		return false
	endif

	if not ( udg_PlayerLimitCircleTwo > 0 ) then
		return false
	endif

	if not ( udg_PlayerLimitCircleThree > 0 ) then
		return false
	endif

	if not ( udg_PlayerLimitCircleFour > 0 ) then
		return false
	endif

	if not ( udg_PlayerLimitCircleFive > 0 ) then
		return false
	endif

	if not ( udg_PlayerLimitCircleSix > 0 ) then
		return false
	endif

	if not ( udg_PlayerLimitCircleSeven > 0 ) then
		return false
	endif

	return true
endfunction

function TwoSidesConnected takes nothing returns boolean
	return ( udg_PlayerLimitOne + udg_PlayerLimitTwo + udg_PlayerLimitThree + udg_PlayerLimitFour + udg_PlayerLimitFive + udg_PlayerLimitSix > 1 )
endfunction

function CheckCrossSectionTwelve takes nothing returns boolean
	if not ( udg_PlayerLimitCircleOne > 0 ) then
		return false
	endif

	if not ( udg_PlayerLimitCircleFive > 0 ) then
		return false
	endif

	if not ( udg_PlayerLimitOne > 0 ) then
		return false
	endif

	if not ( udg_PlayerLimitTwo > 0 ) then
		return false
	endif

	return true
endfunction

function CheckCrossSectionEleven takes nothing returns boolean
	if not AllSidesOfBothCirclesAreConnected() then
		return false
	endif

	if ( not ( udg_PlayerLimitOne + udg_PlayerLimitTwo + udg_PlayerLimitThree + udg_PlayerLimitFour + udg_PlayerLimitFive + udg_PlayerLimitSix > 1 ) ) then // INLINED!!
		return false
	endif

	return true
endfunction

function CheckCrossSectionTen takes nothing returns boolean
	if ( not AreAnyOfTheBordersLargerThanOne() ) then
		return false
	endif

	if ( not ThreeSidesOfAnyCircle() ) then
		return false
	endif

	return true
endfunction

function CheckCircleLine takes nothing returns boolean
	if ( udg_PlayerLimitCircleOne > 0 ) then
		return true
	endif

	if ( udg_PlayerLimitCircleThree > 0 ) then
		return true
	endif

	if ( udg_PlayerLimitCircleSix > 0 ) then
		return true
	endif

	return false
endfunction

function CheckCrossSectionThirteen takes nothing returns boolean
	if not ( udg_PlayerLimitTwo > 0 ) then
		return false
	endif

	if not ( udg_PlayerLimitSix > 0 ) then
		return false
	endif

	return true
endfunction

function CheckCrossSectionNine takes nothing returns boolean
	if not ( udg_PlayerLimitFour > 0 ) then
		return false
	endif

	if not ( udg_PlayerLimitFive > 0 ) then
		return false
	endif

	if CheckCircleLine() then
		return true
	endif

	return false
endfunction

function CheckCrossSectionEight takes nothing returns boolean
	if ( not ( udg_PlayerLimitOne > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitSix > 0 ) ) then
		return false
	endif

	return true
endfunction

function CheckCrossSectionSeven takes nothing returns boolean
	if ( not ( udg_PlayerLimitThree > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitSix > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitCircleFive > 0 ) ) then
		return false
	endif

	return true
endfunction

function CheckCrossSectionSix takes nothing returns boolean
	if ( not ( udg_PlayerLimitThree > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitFour > 0 ) ) then
		return false
	endif

	return true
endfunction

function CheckCrossSectionFive takes nothing returns boolean
	if ( not ( udg_PlayerLimitTwo > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitFour > 0 ) ) then
		return false
	endif

	return true
endfunction

function CheckCrossSectionFour takes nothing returns boolean
	if ( not ( udg_PlayerLimitOne > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitFour > 0 ) ) then
		return false
	endif

	return true
endfunction

function CheckCrossSectionThree takes nothing returns boolean
	if ( not ( udg_PlayerLimitThree > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitFive > 0 ) ) then
		return false
	endif

	return true
endfunction

function CheckCrossSectionTwo takes nothing returns boolean
	if ( not ( udg_PlayerLimitTwo > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitFive > 0 ) ) then
		return false
	endif

	return true
endfunction

function CheckCrossSectionOne takes nothing returns boolean
	if ( not ( udg_PlayerLimitOne > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitFive > 0 ) ) then
		return false
	endif

	return true
endfunction

function IsPlayerBlockingCheck takes nothing returns boolean
	if CheckCrossSectionOne() then
		return true
	endif

	if CheckCrossSectionTwo() then
		return true
	endif

	if CheckCrossSectionThree() then
		return true
	endif

	if CheckCrossSectionFour() then
		return true
	endif

	if CheckCrossSectionFive() then
		return true
	endif

	if CheckCrossSectionSix() then
		return true
	endif

	if CheckCrossSectionSeven() then
		return true
	endif

	if CheckCrossSectionEight() then
		return true
	endif

	if CheckCrossSectionNine() then
		return true
	endif

	if CheckCrossSectionTen() then
		return true
	endif

	if CheckCrossSectionEleven() then
		return true
	endif

	if CheckCrossSectionTwelve() then
		return true
	endif

	if CheckCrossSectionThirteen() then
		return true
	endif

	// call DisplayTextToForce(GetPlayersAll(), I2S(udg_PlayerLimitOne) + ", " + I2S(udg_PlayerLimitTwo) + ", " + I2S(udg_PlayerLimitThree) + ", " + I2S(udg_PlayerLimitFour) + ", " + I2S(udg_PlayerLimitFive) + ", " + I2S(udg_PlayerLimitSix))

	return false
endfunction

function CheckCircleAroundBothCheckpoints takes nothing returns boolean
	if ( not ( udg_PlayerLimitCircleTwo > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitCircleThree > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitCircleFour > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitCircleFive > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitCircleSix > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitCircleSeven > 0 ) ) then
		return false
	endif

	return true
endfunction

function CheckCircleAroundCheckpointTwo takes nothing returns boolean
	if ( not ( udg_PlayerLimitCircleOne > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitCircleFive > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitCircleSix > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitCircleSeven > 0 ) ) then
		return false
	endif

	return true
endfunction

function CheckCircleAroundCheckpointOne takes nothing returns boolean
	if ( not ( udg_PlayerLimitCircleOne > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitCircleTwo > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitCircleThree > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitCircleFour > 0 ) ) then
		return false
	endif

	return true
endfunction

function CheckForCircle takes nothing returns boolean
	if ( not udg_TouchedLastTower ) then
		return false
	endif

	if ( CheckCircleAroundCheckpointOne() ) then
		return true
	endif

	if ( CheckCircleAroundCheckpointTwo() ) then
		return true
	endif

	if ( CheckCircleAroundBothCheckpoints() ) then
		return true
	endif

	return false
endfunction

function Blocking takes nothing returns nothing
	call WarcraftMaulLibrary_DisplayMessageToPlayer("|CFFFF0303[Anti-Block]|r |CFFFFFF01Detected a possible blocking attempt. Your building has been cancelled and you have been refunded the full cost.|r" , GetPlayerId(GetOwningPlayer(GetConstructingStructure())))
	call TriggerSleepAction(0.01)
	call IssueImmediateOrderById(GetConstructingStructure(), 851976)
	// call RemoveUnit(GetConstructingStructure())
endfunction

function CheckCheckpoints takes nothing returns nothing
	if ( GetUnitTypeId(GetEnumUnit()) == 'h03M' ) then
		return
	endif

	if ( not IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE) ) then
		return
	endif

	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 13], GetEnumUnit()) ) then
		set udg_PlayerLimitCheckpointOne=udg_PlayerLimitCheckpointOne + 1
	endif


	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 14], GetEnumUnit()) ) then
		set udg_PlayerLimitCheckpointTwo=udg_PlayerLimitCheckpointTwo + 1
	endif


	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 15], GetEnumUnit()) ) then
		set udg_PlayerLimitCheckpointThree=udg_PlayerLimitCheckpointThree + 1
	endif


	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 16], GetEnumUnit()) ) then
		set udg_PlayerLimitCheckpointFour=udg_PlayerLimitCheckpointFour + 1
	endif


	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 17], GetEnumUnit()) ) then
		set udg_PlayerLimitCheckpointFive=udg_PlayerLimitCheckpointFive + 1
	endif


	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 18], GetEnumUnit()) ) then
		set udg_PlayerLimitCheckpointSix=udg_PlayerLimitCheckpointSix + 1
	endif


	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 19], GetEnumUnit()) ) then
		set udg_PlayerLimitCheckpointSeven=udg_PlayerLimitCheckpointSeven + 1
	endif


	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 20], GetEnumUnit()) ) then
		set udg_PlayerLimitCheckpointEight=udg_PlayerLimitCheckpointEight + 1
	endif
endfunction

function IterateCheckpoints takes nothing returns nothing
 local location loc= GetUnitLoc(GetConstructingStructure())
 local group grp= GetUnitsInRangeOfLocAll(182.00, loc)
	call ForGroup(grp, function CheckCheckpoints)
	call DestroyGroup(grp)
	call RemoveLocation(loc)
	set grp=null
	set loc=null
endfunction

function CheckCheckpointsConstructing takes nothing returns boolean
	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 13], GetConstructingStructure()) ) then
		set udg_PlayerLimitCheckpointOne=udg_PlayerLimitCheckpointOne + 1
		return true
	endif


	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 14], GetConstructingStructure()) ) then
		set udg_PlayerLimitCheckpointTwo=udg_PlayerLimitCheckpointTwo + 1
		return true
	endif


	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 15], GetConstructingStructure()) ) then
		set udg_PlayerLimitCheckpointThree=udg_PlayerLimitCheckpointThree + 1
		return true
	endif


	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 16], GetConstructingStructure()) ) then
		set udg_PlayerLimitCheckpointFour=udg_PlayerLimitCheckpointFour + 1
		return true
	endif


	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 17], GetConstructingStructure()) ) then
		set udg_PlayerLimitCheckpointFive=udg_PlayerLimitCheckpointFive + 1
		return true
	endif


	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 18], GetConstructingStructure()) ) then
		set udg_PlayerLimitCheckpointSix=udg_PlayerLimitCheckpointSix + 1
		return true
	endif


	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 19], GetConstructingStructure()) ) then
		set udg_PlayerLimitCheckpointSeven=udg_PlayerLimitCheckpointSeven + 1
		return true
	endif


	if ( RectContainsUnit(udg_Redtestregions[21 * udg_AntiblockPlayerid + 20], GetConstructingStructure()) ) then
		set udg_PlayerLimitCheckpointEight=udg_PlayerLimitCheckpointEight + 1
		return true
	endif

	return false
endfunction

function IsBlockingCheckpointTwo takes nothing returns boolean
	if ( not ( udg_PlayerLimitCheckpointFive > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitCheckpointSix > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitCheckpointSeven > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitCheckpointEight > 0 ) ) then
		return false
	endif

	return true
endfunction

function IsBlockingCheckpointOne takes nothing returns boolean
	if ( not ( udg_PlayerLimitCheckpointOne > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitCheckpointTwo > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitCheckpointThree > 0 ) ) then
		return false
	endif

	if ( not ( udg_PlayerLimitCheckpointFour > 0 ) ) then
		return false
	endif

	return true
endfunction

function IsBlockingACheckpoint takes nothing returns boolean
	if ( IsBlockingCheckpointOne() ) then
		return true
	endif

	if ( IsBlockingCheckpointTwo() ) then
		return true
	endif

	return false
endfunction

function IssueCreepMovement takes nothing returns nothing
 local real x= GetRectCenterX(udg_Checkpoints[LoadIntegerBJ(GetHandleIdBJ(GetEnumUnit()), 0, udg_UnitToCheckpointTable)])
 local real y= GetRectCenterY(udg_Checkpoints[LoadIntegerBJ(GetHandleIdBJ(GetEnumUnit()), 0, udg_UnitToCheckpointTable)])
	call IssuePointOrder(GetEnumUnit(), "move", x, y)
endfunction

function FilteredUnitIsCreep takes nothing returns boolean
	if GetOwningPlayer(GetFilterUnit()) == Player(13) then
		return true
	endif

	if GetOwningPlayer(GetFilterUnit()) == Player(14) then
		return true
	endif

	if GetOwningPlayer(GetFilterUnit()) == Player(15) then
		return true
	endif

	if GetOwningPlayer(GetFilterUnit()) == Player(16) then
		return true
	endif

	return false
endfunction

function UnitIsAliveCreepFilter takes nothing returns boolean
	if not FilteredUnitIsCreep() then
		return false
	endif

	if not IsUnitAliveBJ(GetFilterUnit()) then
		return false
	endif

	if IsUnitType(GetFilterUnit(), UNIT_TYPE_FLYING) then
		return false
	endif

	set udg_Antijuggle=true
	return true
endfunction

function IsJuggling takes nothing returns nothing
	call WarcraftMaulLibrary_DisplayMessageToPlayer("|CFFFF0303[Anti-Juggle]|r |CFFFFFF01Detected a possible juggling attempt. Your building has been cancelled and you have been refunded the full cost.|r" , GetPlayerId(GetOwningPlayer(GetConstructingStructure())))
	call TriggerSleepAction(0.01)
	call IssueImmediateOrderById(GetConstructingStructure(), 851976)
endfunction

function CheckForCreeps takes nothing returns nothing
 local location loc= GetUnitLoc(GetConstructingStructure())
 local group grp= GetUnitsInRangeOfLocMatching(124.00, loc, Condition(function UnitIsAliveCreepFilter))
	if ( udg_Antijuggle ) then
		call IsJuggling()
	endif

	call ForGroupBJ(grp, function IssueCreepMovement)

	call DestroyGroup(grp)
	call RemoveLocation(loc)
	set grp=null
	set loc=null
endfunction

function Trig_AntiBlock_Actions takes nothing returns nothing
 local integer indx= 0
 local boolean loopCheckerDone= false

	if ( GetUnitAbilityLevelSwapped('A0CR', GetConstructingStructure()) > 0 ) then
		if not ( RectContainsUnit(udg_PlayerRestrictionArea[GetPlayerId(GetOwningPlayer(GetConstructingStructure()))], GetConstructingStructure()) ) then
			call TriggerSleepAction(0.01)
			call IssueImmediateOrderById(GetConstructingStructure(), 851976)
		endif
	endif

	set udg_Antijuggle=false
	set udg_Towercounter=0
	set udg_TouchedLastTower=false
	set udg_PlayerLimitCircleOne=0
	set udg_PlayerLimitCircleTwo=0
	set udg_PlayerLimitCircleThree=0
	set udg_PlayerLimitCircleFour=0
	set udg_PlayerLimitCircleFive=0
	set udg_PlayerLimitCircleSix=0
	set udg_PlayerLimitCircleSeven=0
	set udg_PlayerLimitLeft=0
	set udg_PlayerLimitRight=0
	set udg_PlayerLimitOne=0
	set udg_PlayerLimitTwo=0
	set udg_PlayerLimitThree=0
	set udg_PlayerLimitFour=0
	set udg_PlayerLimitFive=0
	set udg_PlayerLimitSix=0
	set udg_PlayerLimitCheckpointOne=0
	set udg_PlayerLimitCheckpointTwo=0
	set udg_PlayerLimitCheckpointThree=0
	set udg_PlayerLimitCheckpointFour=0
	set udg_PlayerLimitCheckpointFive=0
	set udg_PlayerLimitCheckpointSix=0
	set udg_PlayerLimitCheckpointSeven=0
	set udg_PlayerLimitCheckpointEight=0

	loop
		exitwhen indx > 13
		if ( RectContainsUnit(udg_PlayerRestrictionArea[indx], GetConstructingStructure()) ) then
			set udg_AntiblockPlayerid=indx
			set indx=13
		endif
		set indx=indx + 1
	endloop

	call CheckForCreeps()
	if ( udg_Antijuggle ) then
		return
	endif

	if ( CheckCheckpointsConstructing() ) then
		call IterateCheckpoints()
		if ( IsBlockingACheckpoint() ) then
			call Blocking()
			return
		endif
	endif
	
	call GroupClear(udg_Antiblockcheckgroup)
	call GroupAddUnitSimple(GetConstructingStructure(), udg_Antiblockcheckgroup)
	call SaveInteger(udg_AntiBlockTable, GetHandleIdBJ(GetConstructingStructure()), 1, GetHandleIdBJ(GetConstructingStructure()))

	loop
		exitwhen loopCheckerDone
		call ForGroupBJ(udg_Antiblockcheckgroup, function FindNeighbouringTowers)
		if ( udg_Towercounter == CountUnitsInGroup(udg_Antiblockcheckgroup) ) then
			set loopCheckerDone=true
		endif
	endloop

	call FlushParentHashtable(udg_AntiBlockTable)
	set udg_AntiBlockTable=InitHashtable()

	// Is Player blocking?
	call ForGroupBJ(udg_Antiblockcheckgroup, function IsPlayerBlocking)

	call GroupClear(udg_Antiblockcheckgroup)

	if ( IsPlayerBlockingCheck() ) then
		call Blocking()
		return
	endif

	if ( CheckForCircle() ) then
		call Blocking()
		return
	endif
endfunction

//===========================================================================
function InitTrig_AntiBlockAndJuggle takes nothing returns nothing
    set gg_trg_AntiBlockAndJuggle=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AntiBlockAndJuggle, EVENT_PLAYER_UNIT_CONSTRUCT_START)
    call TriggerAddAction(gg_trg_AntiBlockAndJuggle, function Trig_AntiBlock_Actions)
endfunction//===========================================================================
// Trigger: DifficultyVoteSystem
//===========================================================================
function InitializePlayerScores takes nothing returns nothing
 local integer i=0
 local integer count= 1
	loop
		exitwhen i > 12
		if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
			set udg_PlayerScorePosition[i]=count
			call MultiboardSetItemValueBJ(udg_Scoreboard, 1, 7 + count, udg_PlayerColorCodes[i] + GetPlayerName(Player(i)) + "|r")
			call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 7 + count, I2S(udg_PlayerKills[i]))
			call MultiboardSetItemStyleBJ(udg_Scoreboard, 1, 7 + count, true, false)
			call MultiboardSetItemStyleBJ(udg_Scoreboard, 2, 7 + count, true, false)
			call MultiboardSetItemWidthBJ(udg_Scoreboard, 1, 7 + count, udg_ScoreboardColumnWidth[1]) // Kills
			call MultiboardSetItemWidthBJ(udg_Scoreboard, 2, 7 + count, udg_ScoreboardColumnWidth[2])
			set count=count + 1
		endif

		set i=i + 1
	endloop
endfunction

function ReplaceTerrainTypeId takes integer OldTerrain,integer NewTerrain,real MinX,real MaxX,real MinY,real MaxY returns nothing
	loop
		exitwhen MinY >= MaxY
			if ( GetTerrainType(MinX, MinY) == OldTerrain ) then
				if ( GetRandomInt(0, 99) > 89 ) then
					call SetTerrainType(MinX, MinY, NewTerrain, - 1, 1, 1)
					if ( GetRandomInt(0, 99) > 89 ) then
						call AddSpecialEffect("Abilities\\Spells\\Human\\FlameStrike\\FlameStrikeEmbers.mdl", MinX, MinY)
					endif
				endif
			endif

		if ( MinX >= MaxX ) then
			set MinY=MinY + 128.0
			set MinX=- 5888.0
		else
			set MinX=MinX + 128.0
		endif
	endloop
endfunction

function ReplaceRunedBricksWithLava takes nothing returns nothing
	call ReplaceTerrainTypeId('Irbk' , 'Dlvc' , - 5888.0 , 5888.0 , - 5888.0 , 5888.0)
endfunction

function CountPlayers takes nothing returns integer
 local integer i= 0
 local integer count= 0
	loop
		exitwhen i > 12
		if ( GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING ) then
			set count=count + 1
		endif

		set i=i + 1
	endloop

	return count
endfunction

function InitializeScoreboard takes nothing returns nothing
 local integer count= CountPlayers()
	set udg_Scoreboard=CreateMultiboardBJ(2, count + 7, "Warcraft Maul Reimagined")
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

	call MultiboardDisplayBJ(true, udg_Scoreboard)
endfunction

function DifficultyVote takes nothing returns nothing
 local integer i= 0
	loop
		exitwhen i > 3
		if GetClickedButtonBJ() == udg_DifficultyButtons[i] then
			set udg_reals02[GetPlayerId(GetTriggerPlayer())]=udg_Difficulties[i]
			call DisplayTextToForce(GetPlayersAll(), udg_PlayerColorCodes[GetPlayerId(GetTriggerPlayer())] + GetPlayerName(GetTriggerPlayer()) + "|r voted for: " + udg_DifficultyStrings[i])
		endif

		set i=i + 1
	endloop
	call DialogDisplayBJ(false, udg_DifficultyDialog, GetTriggerPlayer())
endfunction

function VoteTimerExpired takes nothing returns nothing
 local integer votingplayers= 0
 local timer t= GetExpiredTimer()
 local integer i= 0
 local integer j= 0
 local integer diffIndex
 local real totalDifficultyVote= 0.00
	call PauseTimer(t)
	call DestroyTimer(t)
	set t=null

	loop
        	exitwhen i > 12
        	if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
			if udg_reals02[i] == 0.00 then
				call DialogDisplayBJ(false, udg_DifficultyDialog, Player(i))
				call DisplayTextToForce(GetPlayersAll(), udg_PlayerColorCodes[i] + GetPlayerName(Player(i)) + "|r did not vote, their vote will not be counted")
                	else
                    		set votingplayers=votingplayers + 1
                	endif
            		set totalDifficultyVote=totalDifficultyVote + udg_reals02[i]
        	endif

        	set i=i + 1
    	endloop
	
	call InitializeScoreboard()
	if ( votingplayers == 0 ) then
		call DisplayTextToForce(GetPlayersAll(), "Nobody voted, difficulty will automaticall be set to Easy")
		set udg_Difficulty=100.0
	else
		set udg_Difficulty=totalDifficultyVote / I2R(votingplayers)
	endif

	set diffIndex=R2I(( udg_Difficulty - 100.00 ) / 100.00 + ModuloReal(( udg_Difficulty - 100.00 ) / 100.00, 1.00))
	call SetPlayerHandicapBJ(Player(13), udg_Difficulty)
	call SetPlayerHandicapBJ(Player(14), udg_Difficulty)
	call SetPlayerHandicapBJ(Player(15), udg_Difficulty)
	call SetPlayerHandicapBJ(Player(16), udg_Difficulty)
	call SetPlayerHandicapBJ(Player(PLAYER_NEUTRAL_PASSIVE), udg_Difficulty)
	call DisplayTextToForce(GetPlayersAll(), "Difficulty was set to " + I2S(R2I(udg_Difficulty)) + "% (" + udg_DifficultyStrings[diffIndex] + ")")
	
	call WarcraftMaulLibrary_UpdateBossKilled(0)
	loop
		exitwhen j > 12
		if ( GetPlayerSlotState(Player(j)) == PLAYER_SLOT_STATE_PLAYING ) then
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

		set j=j + 1
	endloop
	
	if ( udg_Difficulty >= 400 ) then
		call PlaySoundBJ(udg_ImpossibleDifficultySound)
		if ( votingplayers == 0 ) then
			call DisplayTextToForce(GetPlayersAll(), "|cFF565656Mode set to Extreme, you will only have |r1|cFF565656 life!|r")
		else
			call DisplayTextToForce(GetPlayersAll(), "|cFF565656Everyone voted for Extreme, you will only have |r1|cFF565656 life!|r")
		endif

		set udg_TotalLives=1
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 4, I2S(udg_TotalLives))
		call SetWaterBaseColorBJ(100, 20.00, 20.00, 0)
		call ReplaceTerrainTypeId('Irbk' , 'Dlvc' , - 5888.0 , 5888.0 , - 5888.0 , 5888.0) // INLINED!!
	endif
	
	call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 3, I2S(R2I(udg_Difficulty)) + "% (" + udg_DifficultyStrings[diffIndex] + ")")
endfunction

function InitializeVoteTimer takes nothing returns nothing
 local timer t= CreateTimer()
	call TimerStart(t, 10.00, false, function VoteTimerExpired)
	set t=null
endfunction

function DisableTriggers takes nothing returns nothing
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
	call DisableTrigger(gg_trg_AdultGreenDragon)
	call DisableTrigger(gg_trg_Wyvern)
	call DisableTrigger(gg_trg_Knight)
	call DisableTrigger(gg_trg_AncientNetherDragon)
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

function InitializeVotes takes nothing returns nothing
 local integer i= 0

	set udg_Difficulties[0]=100.00
	set udg_Difficulties[1]=200.00
	set udg_Difficulties[2]=300.00
	set udg_Difficulties[3]=400.00
	set udg_DifficultyStrings[0]="|cFF00A651Easy|r"
	set udg_DifficultyStrings[1]="|cFFFFCD00Medium|r"
	set udg_DifficultyStrings[2]="|cFFFF0000Hard|r"
	set udg_DifficultyStrings[3]="|cFF383838Extreme|r"
	call DialogSetMessageBJ(udg_DifficultyDialog, "Difficulty vote:")
	set udg_DifficultyButtons[0]=DialogAddButtonBJ(udg_DifficultyDialog, "|cFF00A651100% |r" + udg_DifficultyStrings[0])
	set udg_DifficultyButtons[1]=DialogAddButtonBJ(udg_DifficultyDialog, "|cFFFFCD00200% |r" + udg_DifficultyStrings[1])
	set udg_DifficultyButtons[2]=DialogAddButtonBJ(udg_DifficultyDialog, "|cFFFF0000300% |r" + udg_DifficultyStrings[2])
	set udg_DifficultyButtons[3]=DialogAddButtonBJ(udg_DifficultyDialog, "|cFF383838400% |r" + udg_DifficultyStrings[3])

	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'h03Q', - 1920.00, 3000.00, 0.00)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'h00H', - 1920.00, 2624.00, 0.00)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'h00O', - 1920.00, 2240.00, 0.00)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'h03C', - 1920.00, 1856.00, 0.00)
	call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'h03K', - 1920.00, 1472.00, 0.00)

	loop
		exitwhen i > 12
		if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
			call PanCameraToTimedForPlayer(Player(i), - 1900.00, 2100.00, 0.00)
			call DialogDisplayBJ(true, udg_DifficultyDialog, Player(i))
			call CreateUnit(Player(i), 'e00C', - 1920.00, 3000.00, 0.00)
			call CreateUnit(Player(i), 'e00C', - 1920.00, 2624.00, 0.00)
			call CreateUnit(Player(i), 'e00C', - 1920.00, 2240.00, 0.00)
			call CreateUnit(Player(i), 'e00C', - 1920.00, 1856.00, 0.00)
			call CreateUnit(Player(i), 'e00C', - 1920.00, 1472.00, 0.00)
		else
			set udg_IsSpawnOpen[i]=0
		endif
		set i=i + 1
	endloop
	
	call DisableTriggers()
	call InitializeVoteTimer()
endfunction

//===========================================================================
function InitTrig_DifficultyVoteSystem takes nothing returns nothing
		set udg_trigger01=CreateTrigger()
	call TriggerRegisterTimerEventSingle(udg_trigger01, 1.00)
	call TriggerAddAction(udg_trigger01, function InitializeVotes)

	set udg_trigger02=CreateTrigger()
	call TriggerRegisterDialogEventBJ(udg_trigger02, udg_DifficultyDialog)
	call TriggerAddAction(udg_trigger02, function DifficultyVote)
endfunction//===========================================================================
// Trigger: PathingSystem
//===========================================================================
function MoveEnteringUnitBackToHisOwnSpawn takes nothing returns nothing
 local real x= GetRectCenterX(udg_PlayerRestrictionArea[GetPlayerId(GetOwningPlayer(GetEnteringUnit()))])
 local real y= GetRectCenterY(udg_PlayerRestrictionArea[GetPlayerId(GetOwningPlayer(GetEnteringUnit()))])
	call SetUnitPosition(GetEnteringUnit(), x, y)
endfunction

function IsCreepTest takes nothing returns boolean
	if GetOwningPlayer(GetEnteringUnit()) == Player(13) then
		return true
	endif

	if GetOwningPlayer(GetEnteringUnit()) == Player(14) then
		return true
	endif

	if GetOwningPlayer(GetEnteringUnit()) == Player(15) then
		return true
	endif

	if GetOwningPlayer(GetEnteringUnit()) == Player(16) then
		return true
	endif

	return false
endfunction

function HasteEnteringUnit takes nothing returns nothing
 local unit dummy= CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'u008', 0.0, - 5300.0, bj_UNIT_FACING)
	call UnitAddAbilityBJ('A068', dummy)
	call IssueTargetOrderBJ(dummy, "bloodlust", GetEnteringUnit())
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummy)

	set dummy=null
endfunction

function PlayerRestrictionActions takes integer playerid returns nothing
	if ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) then // INLINED!!
		if ( udg_IsSpawnOpen[playerid] == 0 ) then
			if not ( UnitHasBuffBJ(GetEnteringUnit(), 'Bblo') ) then
				call HasteEnteringUnit()
			endif
		else
			call UnitRemoveBuffBJ('Bblo', GetEnteringUnit())
		endif
	elseif ( IsUnitType(GetEnteringUnit(), UNIT_TYPE_SUMMONED) ) then
		if ( GetUnitTypeId(GetTriggerUnit()) != 'u008' ) then
			if ( GetOwningPlayer(GetEnteringUnit()) != Player(playerid) ) then
				call MoveEnteringUnitBackToHisOwnSpawn()
			endif
		endif
	elseif ( IsUnitType(GetEnteringUnit(), UNIT_TYPE_STRUCTURE) ) then
		if ( udg_PlayerRestrictions[13 * playerid + GetPlayerId(GetOwningPlayer(GetEnteringUnit()))] ) then
			if ( not ( IsUnitType(GetEnteringUnit(), UNIT_TYPE_TOWNHALL) ) ) then
				call SetUnitOwner(GetEnteringUnit(), Player(playerid), true)
			endif
		endif
	elseif ( udg_PlayerRestrictions[13 * playerid + GetPlayerId(GetOwningPlayer(GetEnteringUnit()))] ) then
		call MoveEnteringUnitBackToHisOwnSpawn()
	endif
endfunction

function Player1RestrictionAction takes nothing returns nothing
	call PlayerRestrictionActions(0)
endfunction

function Player2RestrictionAction takes nothing returns nothing
	call PlayerRestrictionActions(1)
endfunction

function Player3RestrictionAction takes nothing returns nothing
	call PlayerRestrictionActions(2)
endfunction

function Player4RestrictionAction takes nothing returns nothing
	call PlayerRestrictionActions(3)
endfunction

function Player5RestrictionAction takes nothing returns nothing
	call PlayerRestrictionActions(4)
endfunction

function Player6RestrictionAction takes nothing returns nothing
	call PlayerRestrictionActions(5)
endfunction

function Player7RestrictionAction takes nothing returns nothing
	call PlayerRestrictionActions(6)
endfunction

function Player8RestrictionAction takes nothing returns nothing
	call PlayerRestrictionActions(7)
endfunction

function Player9RestrictionAction takes nothing returns nothing
	if ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) then // INLINED!!
		call UnitRemoveBuffBJ('Bblo', GetEnteringUnit())
	elseif ( IsUnitType(GetEnteringUnit(), UNIT_TYPE_SUMMONED) ) then
		if ( GetOwningPlayer(GetEnteringUnit()) != Player(8) ) then
			call MoveEnteringUnitBackToHisOwnSpawn()
		endif
	elseif ( udg_PlayerRestrictions[13 * 8 + GetPlayerId(GetOwningPlayer(GetEnteringUnit()))] ) then
		if ( IsUnitType(GetEnteringUnit(), UNIT_TYPE_STRUCTURE) ) then
			if ( not ( IsUnitType(GetEnteringUnit(), UNIT_TYPE_TOWNHALL) ) ) then
				call SetUnitOwner(GetEnteringUnit(), Player(8), true)
			endif
		else
			call MoveEnteringUnitBackToHisOwnSpawn()
		endif
	endif
endfunction

function Player10RestrictionAction takes nothing returns nothing
	call PlayerRestrictionActions(9)
endfunction

function Player11RestrictionAction takes nothing returns nothing
	call PlayerRestrictionActions(10)
endfunction

function Player12RestrictionAction takes nothing returns nothing
	call PlayerRestrictionActions(11)
endfunction

function Player13RestrictionAction takes nothing returns nothing
	call PlayerRestrictionActions(12)
endfunction

function EnteringUnitIsCreepAndHasNoCheckpoint takes nothing returns boolean
	if not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) then // INLINED!!
		return false
	endif

	if not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 0 ) then
		return false
	endif

	return true
endfunction

function RemoveUnitIfNotShip takes nothing returns nothing
	if GetUnitTypeId(GetEnumUnit()) == 'n05G' then
		call KillUnit(GetEnumUnit())
	else
		call RemoveUnit(GetEnumUnit())
	endif
endfunction

function RemoveEveryUnit takes nothing returns nothing
 local group grp= GetUnitsInRectAll(GetPlayableMapRect())
	call ForGroupBJ(grp, function RemoveUnitIfNotShip)
	
	call DestroyGroup(grp)
	set grp=null
endfunction

function GameOver takes nothing returns nothing
	set udg_GameEndTimer=600
	set udg_HasGameEnded=true
	call PlaySoundBJ(udg_DefeatSound)
	call DisplayTextToForce(GetPlayersAll(), "|cFFFF0000GAME OVER|r")
	call RemoveEveryUnit()
endfunction

function LoseALife takes nothing returns nothing
	if ( not ( udg_HasGameEnded ) ) then
		if ( GetUnitTypeId(GetEnteringUnit()) == 'uC72' ) then
			set udg_TotalLives=0
			call DisplayTextToForce(GetPlayersAll(), "Archimonde has boarded the ship! |cFFFF0000YOU LOSE!|r")
		else
			set udg_TotalLives=( udg_TotalLives - 1 )
			set udg_LivesLost=( udg_LivesLost + 1 )
			call DisplayTextToForce(GetPlayersAll(), "|c00ff0000A unit has boarded the ship! |r" + I2S(udg_TotalLives) + " |c00ff0000chances left|r")
		endif

		call RemoveUnit(GetEnteringUnit())
		call PlaySoundBJ(udg_LoseALifeSound)

		// Update scoreboard
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 4, I2S(udg_TotalLives))

		if ( udg_TotalLives <= 0 ) then
			call GameOver()
		endif
	endif
endfunction

function SetCreepAbilities takes nothing returns nothing
 local real totalchance= udg_Difficulty - 100.0
 local real chance
 local integer array nums
 local integer i= 0
 local integer creepabilitiescount= udg_CreepAbilitiesSize - 1
 local integer currentability
	
	loop
		exitwhen i > udg_CreepAbilitiesSize
		set nums[i]=i
		set i=i + 1
	endloop
	
	set i=0
	set udg_CurrentCreepAbilitiesSize=0
	
	loop
		exitwhen i > 0
		if ( totalchance > 0.0 ) then
			set chance=RMinBJ(totalchance, 100.00)
			if ( GetRandomInt(1, 100) <= chance ) then
				set currentability=GetRandomInt(0, creepabilitiescount)
				set udg_CurrentCreepAbilities[udg_CurrentCreepAbilitiesSize]=udg_CreepAbilities[nums[currentability]]
				// call DisplayTextToForce( GetPlayersAll(), "Setting Ability(" + GetAbilityName(udg_CreepAbilities[nums[currentability]]) + "... " + I2S(nums[currentability]) )
				if nums[currentability] == 8 then
					call EnableTrigger(gg_trg_WalkItOff)
				elseif nums[currentability] == 7 then
					// call DisplayTextToForce(GetPlayersAll(), "Divine Shield")
					call EnableTrigger(gg_trg_DivineShield)
				elseif nums[currentability] == 3 then
					call EnableTrigger(gg_trg_CrippleAura)
				elseif nums[currentability] == 6 then
					call EnableTrigger(gg_trg_VampiricAura)
				endif
				set udg_CurrentCreepAbilitiesSize=udg_CurrentCreepAbilitiesSize + 1
				set nums[creepabilitiescount]=nums[creepabilitiescount] + nums[currentability]
				set nums[currentability]=nums[creepabilitiescount] - nums[currentability]
				set nums[creepabilitiescount]=nums[creepabilitiescount] - nums[currentability]
				set creepabilitiescount=creepabilitiescount - 1
			endif
			set totalchance=totalchance - 100.0
		else
			set i=1
		endif
	endloop
endfunction

function SetLifeToMax takes nothing returns nothing
	call SetUnitLifePercentBJ(GetEnumUnit(), 100)
endfunction

function HealEverythingOnMap takes nothing returns nothing
 local group grp= GetUnitsInRectAll(GetPlayableMapRect())
	call ForGroupBJ(grp, function SetLifeToMax)
	
	call DestroyGroup(grp)
	set grp=null
endfunction

function GiveWaveGoldReward takes nothing returns nothing
 local integer i= 0
 local string msg= "|c0000cdf9You recieved|r " + I2S(udg_FinishWaveGoldReward) + " |c0000cdf9extra gold for completing level|r " + I2S(udg_CreepLevel - 1)
 local string msgGrey= "|c0000cdf9You recieved|r " + I2S(2 * udg_FinishWaveGoldReward) + "|c0000cdf9 extra gold for completing level as the last defender|r " + I2S(udg_CreepLevel - 1)
	loop
		exitwhen i > 12
		
		if udg_CreepLevel == 15 then
			call AdjustPlayerStateBJ(1, Player(i), PLAYER_STATE_RESOURCE_LUMBER)
		endif

		if i == 8 then
			call AdjustPlayerStateBJ(2 * udg_FinishWaveGoldReward, Player(i), PLAYER_STATE_RESOURCE_GOLD)
			call WarcraftMaulLibrary_DisplayMessageToPlayer(msgGrey , i)
		else
			call AdjustPlayerStateBJ(udg_FinishWaveGoldReward, Player(i), PLAYER_STATE_RESOURCE_GOLD)
			call WarcraftMaulLibrary_DisplayMessageToPlayer(msg , i)
		endif

		set i=i + 1
	endloop
	set msg=null
	set msgGrey=null
endfunction

function CreepFoodConditions takes nothing returns boolean
	if not ( GetPlayerState(Player(13), PLAYER_STATE_RESOURCE_FOOD_USED) == 0 ) then
		return false
	endif
	if not ( GetPlayerState(Player(14), PLAYER_STATE_RESOURCE_FOOD_USED) == 0 ) then
		return false
	endif
	if not ( GetPlayerState(Player(15), PLAYER_STATE_RESOURCE_FOOD_USED) == 0 ) then
		return false
	endif
	if not ( GetPlayerState(Player(16), PLAYER_STATE_RESOURCE_FOOD_USED) == 0 ) then
		return false
	endif
	return true
endfunction

function SpamEffects takes nothing returns nothing
 local integer x= GetRandomInt(0, 10000) - 5000
 local integer y= GetRandomInt(0, 10000) - 5000
 local location loc= Location(x, y)
	call DestroyEffect(AddSpecialEffectLocBJ(loc, "Abilities\\Spells\\Human\\DispelMagic\\DispelMagicTarget.mdl"))
	call RemoveLocation(loc)
	set loc=null
endfunction

function GameWinEffects takes nothing returns nothing
 local timer t=CreateTimer()
	call TimerStart(t, 0.10, true, function SpamEffects)
	set t=null
endfunction

function GameWin takes nothing returns nothing
	if ( udg_TotalLives > 0 ) then
		call WarcraftMaulLibrary_UpdateBossKilled(1)
		call PlaySoundBJ(udg_VictorySound)
		call DisplayTimedTextToForce(GetPlayersAll(), 30, "|cFFF48C42YOU HAVE WON!|r")
		call DisplayTimedTextToForce(GetPlayersAll(), 15, "You can either leave the game or stay for bonus rounds")
		call GameWinEffects()
	endif
endfunction

function SpamBonusEffects takes nothing returns nothing
 local integer x= GetRandomInt(0, 10000) - 5000
 local integer y= GetRandomInt(0, 10000) - 5000
 local location loc= Location(x, y)
	call DestroyEffect(AddSpecialEffectLocBJ(loc, "Abilities\\Spells\\Human\\Flare\\FlareCaster.mdl"))
	call RemoveLocation(loc)
	set loc=null
endfunction

function BonusRoundEffects takes nothing returns nothing
 local timer t=CreateTimer()
	call TimerStart(t, 0.03, true, function SpamBonusEffects)
	set t=null
endfunction

function BonusRoundsOver takes nothing returns nothing
	call DisplayTextToForce(GetPlayersAll(), "|cFFF48C42That's all the bonus levels, well done!|r")
	set udg_IsWaveInProgress=false
	set udg_GameEndTimer=600
	set udg_HasGameEnded=true
	call IssuePointOrder(udg_Ship, "move", GetRectCenterX(udg_ShipDestination), GetRectCenterY(udg_ShipDestination))
	call BonusRoundEffects()
endfunction

function EndOfTurnTower takes nothing returns nothing
	if ( GetUnitAbilityLevel(GetEnumUnit(), 'A09Q') > 0 ) then
		call BlzSetUnitBaseDamage(GetEnumUnit(), 0, 1)
	endif
	if ( GetUnitAbilityLevel(GetEnumUnit(), 'A09S') > 0 ) then
		call BlzSetUnitBaseDamage(GetEnumUnit(), 4, 1)
	endif
	if ( GetUnitAbilityLevel(GetEnumUnit(), 'A09T') > 0 ) then
		call BlzSetUnitBaseDamage(GetEnumUnit(), 9, 1)
	endif
	if ( GetUnitAbilityLevel(GetEnumUnit(), 'A09U') > 0 ) then
		call BlzSetUnitBaseDamage(GetEnumUnit(), 19, 1)
	endif
	if ( GetUnitAbilityLevel(GetEnumUnit(), 'A09V') > 0 ) then
		call BlzSetUnitBaseDamage(GetEnumUnit(), 39, 1)
	endif
endfunction

function RoundEnd takes nothing returns nothing
	//call FlushParentHashtableBJ( udg_UnitToCheckpointTable )

	call DisableTrigger(gg_trg_WalkItOff)
	call DisableTrigger(gg_trg_DivineShield)
	call DisableTrigger(gg_trg_CrippleAura)
	call DisableTrigger(gg_trg_VampiricAura)

	if ( udg_CreepLevel == 36 ) then
		call BonusRoundsOver()
	else
		call SetCreepAbilities()
		// Increase creep level
		set udg_CreepLevel=udg_CreepLevel + 1
		set udg_FinishWaveGoldReward=udg_FinishWaveGoldReward + 2

		// Update Scoreboard
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 2, I2S(udg_CreepLevel))

		// Display lives lost
		if ( udg_LivesLost == 0 ) then
			call DisplayTimedTextToForce(GetPlayersAll(), 5, "|cFFF44242Co|r|cFFF47442ng|r|cFFF4A742ra|r|cFFEBF442tu|r|cFFC5F442la|r|cFF8FF442ti|r|cFF62F442on|r|cFF42F477s n|r|cFF42F4E5o l|r|cFF42A7F4iv|r|cFF425FF4es|r|cFF7A42F4 lo|r|cFFC542F4st!|r")
		else
			call DisplayTextToForce(GetPlayersAll(), ( I2S(udg_LivesLost) + " |cFFED0000Chances have been lost|r" ))
		endif

		// Reward players for finishing the wave
		call GiveWaveGoldReward()

		// Start new timers
		set udg_IsWaveInProgress=false
		set udg_StartWaveTimer=true

		// Heal every unit on the map (mostly for towers)
		call HealEverythingOnMap()

		if ( udg_CreepLevel == 35 ) then
			call PauseUnitBJ(false, udg_ArchimondeDummy)
			call IssueTargetDestructableOrder(udg_ArchimondeDummy, "attack", gg_dest_B000_0160)
		endif

		if ( udg_CreepLevel == 36 ) then
			call GameWin()
		endif
	endif

	call ForGroupBJ(udg_TowerEndOfTurnGroup, function EndOfTurnTower)
endfunction

function IsRedSpawnOpen takes nothing returns boolean
	if ( not ( udg_IsSpawnOpen[0] == 1 ) ) then
		return false
	endif
	return true
endfunction

function IsBlueSpawnOpen takes nothing returns boolean
	if ( not ( udg_IsSpawnOpen[1] == 1 ) ) then
		return false
	endif
	return true
endfunction

function IsTealSpawnOpen takes nothing returns boolean
	if ( not ( udg_IsSpawnOpen[2] == 1 ) ) then
		return false
	endif
	return true
endfunction

function IsPurpleSpawnOpen takes nothing returns boolean
	if ( not ( udg_IsSpawnOpen[3] == 1 ) ) then
		return false
	endif
	return true
endfunction

function IsYellowSpawnOpen takes nothing returns boolean
	if ( not ( udg_IsSpawnOpen[4] == 1 ) ) then
		return false
	endif
	return true
endfunction

function IsOrangeSpawnOpen takes nothing returns boolean
	if ( not ( udg_IsSpawnOpen[5] == 1 ) ) then
		return false
	endif
	return true
endfunction

function IsGreenSpawnOpen takes nothing returns boolean
	if ( not ( udg_IsSpawnOpen[6] == 1 ) ) then
		return false
	endif
	return true
endfunction

function IsPinkSpawnOpen takes nothing returns boolean
	if ( not ( udg_IsSpawnOpen[7] == 1 ) ) then
		return false
	endif
	return true
endfunction

function IsGreySpawnOpen takes nothing returns boolean
	if ( not ( udg_IsSpawnOpen[8] == 1 ) ) then
		return false
	endif
	return true
endfunction

function IsLightblueSpawnOpen takes nothing returns boolean
	if ( not ( udg_IsSpawnOpen[9] == 1 ) ) then
		return false
	endif
	return true
endfunction

function IsDarkgreenSpawnOpen takes nothing returns boolean
	if ( not ( udg_IsSpawnOpen[10] == 1 ) ) then
		return false
	endif
	return true
endfunction

function IsBrownSpawnOpen takes nothing returns boolean
	if ( not ( udg_IsSpawnOpen[11] == 1 ) ) then
		return false
	endif
	return true
endfunction

function IsMaroonSpawnOpen takes nothing returns boolean
	if ( not ( udg_IsSpawnOpen[12] == 1 ) ) then
		return false
	endif
	return true
endfunction

function AirWave takes nothing returns boolean
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

function MinibossWave takes nothing returns boolean
	if ( udg_CreepLevel == 9 ) then
		return true
	endif
	if ( udg_CreepLevel == 14 ) then
		return true
	endif
	if ( udg_CreepLevel == 19 ) then
		return true
	endif
	if ( udg_CreepLevel == 24 ) then
		return true
	endif
	if ( udg_CreepLevel == 29 ) then
		return true
	endif
	if ( udg_CreepLevel == 31 ) then
		return true
	endif
	return false
endfunction

function BossWave takes nothing returns boolean
	if ( udg_CreepLevel == 35 ) then
		return true
	endif
	if ( udg_CreepLevel == 36 ) then
		return true
	endif
	return false
endfunction

function StartSpawningAir takes nothing returns nothing
 local location red= GetRectCenter(udg_Redspawn)
 local location red2= GetRectCenter(udg_Redspawn2)
 local location blue= GetRectCenter(udg_Bluespawn)
 local location blue2= GetRectCenter(udg_Bluespawn2)
 local location teal= GetRectCenter(udg_Tealspawn)
 local location teal2= GetRectCenter(udg_Tealspawn2)
 local location purple= GetRectCenter(udg_Purplespawn)
 local location purple2= GetRectCenter(udg_Purplespawn2)
 local location orange= GetRectCenter(udg_Orangespawn)
 local location orange2= GetRectCenter(udg_Orangespawn2)
 local location pink= GetRectCenter(udg_Pinkspawn)
 local location pink2= GetRectCenter(udg_Pinkspawn2)
 local location green= GetRectCenter(udg_Greenspawn)
 local location green2= GetRectCenter(udg_Greenspawn2)
 local location yellow= GetRectCenter(udg_Yellowspawn)
 local location yellow2= GetRectCenter(udg_Yellowspawn2)
 local location grey= GetRectCenter(udg_Greyspawn)
 local location brown= GetRectCenter(udg_Brownspawn)
 local location brown2= GetRectCenter(udg_Brownspawn2)
 local location maroon= GetRectCenter(udg_Maroonspawn)
 local location maroon2= GetRectCenter(udg_Maroonspawn2)
 local location lightblue= GetRectCenter(udg_Lightbluespawn)
 local location lightblue2= GetRectCenter(udg_Lightbluespawn2)
 local location darkgreen= GetRectCenter(udg_Darkgreenspawn)
 local location darkgreen2= GetRectCenter(udg_Darkgreenspawn2)

	if ( IsRedSpawnOpen() ) then // Red
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(13), red, 180.0))
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(13), red2, 180.0))
	endif
	if ( IsBlueSpawnOpen() ) then // Blue
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(14), blue, 270.0))
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(14), blue2, 270.0))
	endif
	if ( IsTealSpawnOpen() ) then // Teal
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(15), teal, 0.0))
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(15), teal2, 0.0))
	endif
	if ( IsPurpleSpawnOpen() ) then // Purple
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(16), purple, 270.0))
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(16), purple2, 270.0))
	endif
	if ( IsYellowSpawnOpen() ) then // Yellow
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(14), yellow, 270.0))
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(14), yellow2, 270.0))
	endif
	if ( IsOrangeSpawnOpen() ) then // Orange
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(13), orange, 270.0))
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(13), orange2, 270.0))
	else
	endif
	if ( IsGreenSpawnOpen() ) then // Green
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(15), green, 0.0))
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(15), green2, 0.0))
	endif
	if ( IsPinkSpawnOpen() ) then // Pink
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(15), pink, 180.0))
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(15), pink2, 180.0))
	endif
	if ( IsGreySpawnOpen() ) then // Grey
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(16), grey, 270.0))
	endif
	if ( IsLightblueSpawnOpen() ) then // Lightblue
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(14), lightblue, 90.0))
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(14), lightblue2, 90.0))
	endif
	if ( IsDarkgreenSpawnOpen() ) then // Darkgreen
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(15), darkgreen, 90.0))
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(15), darkgreen2, 90.0))
	endif
	if ( IsBrownSpawnOpen() ) then // Brown
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(16), brown, 270.0))
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(16), brown2, 270.0))
	endif
	if ( IsMaroonSpawnOpen() ) then // Maroon
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(16), maroon, 270.0))
		call DestroyGroup(CreateNUnitsAtLoc(udg_Spawnamount, udg_Creeps[udg_CreepLevel], Player(16), maroon2, 270.0))
	endif

	call RemoveLocation(red)
	call RemoveLocation(red2)
	call RemoveLocation(blue)
	call RemoveLocation(blue2)
	call RemoveLocation(teal)
	call RemoveLocation(teal2)
	call RemoveLocation(purple)
	call RemoveLocation(purple2)
	call RemoveLocation(orange)
	call RemoveLocation(orange2)
	call RemoveLocation(pink)
	call RemoveLocation(pink2)
	call RemoveLocation(green)
	call RemoveLocation(green2)
	call RemoveLocation(yellow)
	call RemoveLocation(yellow2)
	call RemoveLocation(grey)
	call RemoveLocation(brown)
	call RemoveLocation(brown2)
	call RemoveLocation(maroon)
	call RemoveLocation(maroon2)
	call RemoveLocation(lightblue)
	call RemoveLocation(lightblue2)
	call RemoveLocation(darkgreen)
	call RemoveLocation(darkgreen2)

	set red=null
	set red2=null
	set blue=null
	set blue2=null
	set teal=null
	set teal2=null
	set purple=null
	set purple2=null
	set orange=null
	set orange2=null
	set pink=null
	set pink2=null
	set green=null
	set green2=null
	set yellow=null
	set yellow2=null
	set grey=null
	set brown=null
	set brown2=null
	set maroon=null
	set maroon2=null
	set lightblue=null
	set lightblue2=null
	set darkgreen=null
	set darkgreen2=null
endfunction

function StartSpawning takes nothing returns nothing
 local integer i= 1
	loop
		exitwhen i > udg_Spawnamount
		if ( IsRedSpawnOpen() ) then // Red
			call CreateUnit(Player(13), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Redspawn), GetRectCenterY(udg_Redspawn), 180.00)
			call CreateUnit(Player(13), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Redspawn2), GetRectCenterY(udg_Redspawn2), 180.00)
		endif
		if ( IsBlueSpawnOpen() ) then // Blue
			call CreateUnit(Player(14), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Bluespawn), GetRectCenterY(udg_Bluespawn), 270.00)
			call CreateUnit(Player(14), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Bluespawn2), GetRectCenterY(udg_Bluespawn2), 270.00)
		endif
		if ( IsTealSpawnOpen() ) then // Teal
			call CreateUnit(Player(15), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Tealspawn), GetRectCenterY(udg_Tealspawn), 0.00)
			call CreateUnit(Player(15), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Tealspawn2), GetRectCenterY(udg_Tealspawn2), 0.00)
		endif
		if ( IsPurpleSpawnOpen() ) then // Purple
			call CreateUnit(Player(16), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Purplespawn), GetRectCenterY(udg_Purplespawn), 270.00)
			call CreateUnit(Player(16), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Purplespawn2), GetRectCenterY(udg_Purplespawn2), 270.00)
		endif
		if ( IsYellowSpawnOpen() ) then // Yellow
			call CreateUnit(Player(14), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Yellowspawn), GetRectCenterY(udg_Yellowspawn), 270.00)
			call CreateUnit(Player(14), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Yellowspawn2), GetRectCenterY(udg_Yellowspawn2), 270.00)
		endif
		if ( IsOrangeSpawnOpen() ) then // Orange
			call CreateUnit(Player(13), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Orangespawn), GetRectCenterY(udg_Orangespawn), 270.00)
			call CreateUnit(Player(13), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Orangespawn2), GetRectCenterY(udg_Orangespawn2), 270.00)
		else
		endif
		if ( IsGreenSpawnOpen() ) then // Green
			call CreateUnit(Player(15), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Greenspawn), GetRectCenterY(udg_Greenspawn), 0.00)
			call CreateUnit(Player(15), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Greenspawn2), GetRectCenterY(udg_Greenspawn2), 0.00)
		endif
		if ( IsPinkSpawnOpen() ) then // Pink
			call CreateUnit(Player(15), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Pinkspawn), GetRectCenterY(udg_Pinkspawn), 180.00)
			call CreateUnit(Player(15), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Pinkspawn2), GetRectCenterY(udg_Pinkspawn2), 180.00)
		endif
		if ( IsGreySpawnOpen() ) then // Grey
			call CreateUnit(Player(16), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Greyspawn), GetRectCenterY(udg_Greyspawn), 270.00)
		endif
		if ( IsLightblueSpawnOpen() ) then // Lightblue
			call CreateUnit(Player(14), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Lightbluespawn), GetRectCenterY(udg_Lightbluespawn), 90.00)
			call CreateUnit(Player(14), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Lightbluespawn2), GetRectCenterY(udg_Lightbluespawn2), 90.00)
		endif
		if ( IsDarkgreenSpawnOpen() ) then // Darkgreen
			call CreateUnit(Player(15), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Darkgreenspawn), GetRectCenterY(udg_Darkgreenspawn), 90.00)
			call CreateUnit(Player(15), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Darkgreenspawn2), GetRectCenterY(udg_Darkgreenspawn2), 90.00)
		endif
		if ( IsBrownSpawnOpen() ) then // Brown
			call CreateUnit(Player(16), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Brownspawn), GetRectCenterY(udg_Brownspawn), 270.00)
			call CreateUnit(Player(16), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Brownspawn2), GetRectCenterY(udg_Brownspawn2), 270.00)
		endif
		if ( IsMaroonSpawnOpen() ) then // Maroon
			call CreateUnit(Player(16), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Maroonspawn), GetRectCenterY(udg_Maroonspawn), 270.00)
			call CreateUnit(Player(16), udg_Creeps[udg_CreepLevel], GetRectCenterX(udg_Maroonspawn2), GetRectCenterY(udg_Maroonspawn2), 270.00)
		endif
		call TriggerSleepAction(0.50)
		set i=i + 1
	endloop
endfunction

function SpawnCreeps takes nothing returns nothing
 local boolean IsAirWave= AirWave()

	call DisplayTextToForce(GetPlayersAll(), "Level " + I2S(udg_CreepLevel) + " - " + udg_CreepNames[udg_CreepLevel])

	if ( IsAirWave ) then
		set udg_Spawnamount=10 // Was 15
	elseif ( MinibossWave() ) then
		set udg_Spawnamount=4
	elseif ( BossWave() ) then
		set udg_Spawnamount=1
	else
		set udg_Spawnamount=10 // Was 20
	endif

	if ( udg_CreepLevel == 35 ) then
		call SetTimeOfDay(0.00)
		call SetWaterBaseColorBJ(100, 33.00, 33.00, 0)
	endif
	
	if ( IsAirWave ) then
		call StartSpawningAir()
	else
		call StartSpawning()
	endif
endfunction

function AddCreepAbilities takes nothing returns nothing
 local integer i= 0
	loop
		exitwhen i > udg_CurrentCreepAbilitiesSize
		call UnitAddAbilityBJ(udg_CurrentCreepAbilities[i], GetEnteringUnit())
		call SetUnitAbilityLevelSwapped(udg_CurrentCreepAbilities[i], GetEnteringUnit(), udg_CreepLevel)
		set i=i + 1
	endloop
endfunction

function SpawnAction takes integer checkpoint returns nothing
	call SaveIntegerBJ(checkpoint, GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable)
	call IssuePointOrder(GetEnteringUnit(), "move", GetRectCenterX(udg_Checkpoints[checkpoint]), GetRectCenterY(udg_Checkpoints[checkpoint]))
	call AddCreepAbilities()
endfunction

function RedSpawnAction takes nothing returns nothing
	call SpawnAction(1)
endfunction

function BrownSpawnAction takes nothing returns nothing
	call SpawnAction(27)
endfunction

function MaroonSpawnAction takes nothing returns nothing
	call SpawnAction(29)
endfunction

function BlueSpawnAction takes nothing returns nothing
	call SpawnAction(3)
endfunction

function YellowSpawnAction takes nothing returns nothing
	call SpawnAction(11)
endfunction

function BlueSpawnAction2 takes nothing returns nothing
	call SpawnAction(4)
endfunction


function YellowSpawnAction2 takes nothing returns nothing
	call SpawnAction(12)
endfunction

function TealSpawnAction takes nothing returns nothing
	call SpawnAction(7)
endfunction

function OrangeSpawnAction takes nothing returns nothing
	call SpawnAction(15)
endfunction

function PurpleSpawnAction takes nothing returns nothing
	call SpawnAction(9)
endfunction


function LightblueSpawnAction takes nothing returns nothing
	call SpawnAction(23)
endfunction

function DarkgreenSpawnAction takes nothing returns nothing
	call SpawnAction(25)
endfunction

function GreenSpawnAction takes nothing returns nothing
	call SpawnAction(17)
endfunction

function GreySpawnAction takes nothing returns nothing
	call SpawnAction(21)
endfunction

function PinkSpawnAction takes nothing returns nothing
	call SpawnAction(19)
endfunction

function YellowCheckpointCondition takes nothing returns boolean
	if ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) then // INLINED!!
		if ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 11 ) then
			return true
		endif
		if ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 12 ) then
			return true
		endif
	endif
	
	return false
endfunction

function YellowCheckpointAction takes nothing returns nothing
	if ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 11 ) then
		call SpawnAction(13)
	else
		call SpawnAction(14)
	endif
endfunction

function Yellow2CheckpointCondition takes nothing returns boolean
	if ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) then // INLINED!!
		if ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 13 ) then
			return true
		endif
		if ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 14 ) then
			return true
		endif
	endif
	
	return false
endfunction

function Yellow2CheckpointAction takes nothing returns nothing
	if ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 13 ) then
		call SpawnAction(43)
	else
		call SaveIntegerBJ(50, GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable)
		call IssuePointOrder(GetEnteringUnit(), "move", GetRectCenterX(udg_Checkpoints[43]), GetRectCenterY(udg_Checkpoints[43]))
		call AddCreepAbilities()
	endif
endfunction

function YellowTeleportCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif

	if ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 43 ) then
		return true
	endif

	if ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 50 ) then
		return true
	endif

	return false
endfunction

function LightblueTeleportCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 46 ) ) then
		return false
	endif
	return true
endfunction

function DarkgreenTeleportCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 48 ) ) then
		return false
	endif
	return true
endfunction

function RedTeleportCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 36 ) ) then
		return false
	endif

	return true
endfunction

function TeleportEnteringUnit takes integer checkpoint,real facing returns nothing
 local real x= GetRectCenterX(udg_Checkpoints[checkpoint])
 local real y= GetRectCenterY(udg_Checkpoints[checkpoint])

	call SaveIntegerBJ(checkpoint, GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable)
	call SetUnitPosition(GetEnteringUnit(), x, y)
	call SetUnitFacing(GetEnteringUnit(), facing)
	call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportCaster.mdl", x, y))
endfunction

function RedTeleportAction takes nothing returns nothing
	call TeleportEnteringUnit(35 , 270.00)
endfunction

function YellowRightTeleportAction takes nothing returns nothing
	call TeleportEnteringUnit(45 , 90.00)
endfunction

function LightblueTeleportAction takes nothing returns nothing
	call TeleportEnteringUnit(47 , 270.0)
endfunction

function DarkgreenTeleportAction takes nothing returns nothing
	call TeleportEnteringUnit(49 , 270.00)
endfunction

function YellowLeftTeleportAction takes nothing returns nothing
	call TeleportEnteringUnit(44 , 90.00)
endfunction

function YellowTeleportAction takes nothing returns nothing
	if ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 43 ) then
		call TeleportEnteringUnit(44 , 90.00) // INLINED!!
	else
		call TeleportEnteringUnit(45 , 90.00) // INLINED!!
	endif
endfunction

function OrangeTeleportAction takes nothing returns nothing
	call TeleportEnteringUnit(38 , 0.00)
endfunction

function TealTeleportAction takes nothing returns nothing
	call TeleportEnteringUnit(40 , 270.00)
endfunction

function PurpleTeleportAction takes nothing returns nothing
	call TeleportEnteringUnit(42 , 180.00)
endfunction

function RedCheckpointCondition takes nothing returns boolean
	if not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) then // INLINED!!
		return false
	endif
	if not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 1 ) then
		return false
	endif
	return true
endfunction

function MorningPerson takes nothing returns nothing
	call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl", GetUnitX(GetEnteringUnit()), GetUnitY(GetEnteringUnit())))
	call SetUnitLifePercentBJ(GetEnteringUnit(), GetUnitLifePercent(GetEnteringUnit()) + 0.50 * udg_CreepLevel)
endfunction

function CheckpointAction takes integer destinationid returns nothing
	call SaveIntegerBJ(destinationid, GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable)
	call IssuePointOrder(GetEnteringUnit(), "move", GetRectCenterX(udg_Checkpoints[destinationid]), GetRectCenterY(udg_Checkpoints[destinationid]))
	if ( UnitHasBuffBJ(GetEnteringUnit(), 'B028') ) then
		call MorningPerson()
	endif
endfunction

function RedCheckpointAction takes nothing returns nothing
	call CheckpointAction(2)
endfunction

function Red2CheckpointCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 2 ) ) then
		return false
	endif
	return true
endfunction

function Red2CheckpointAction takes nothing returns nothing
	call CheckpointAction(36)
endfunction

function TealTeleportCondition takes nothing returns boolean
	if not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) then // INLINED!!
		return false
	endif

	if not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 39 ) then
		return false
	endif

	return true
endfunction

function PurpleTeleportCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 41 ) ) then
		return false
	endif
	return true
endfunction

function OrangeTeleportCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 37 ) ) then
		return false
	endif
	return true
endfunction

function OrangeCheckpointCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 15 ) ) then
		return false
	endif
	return true
endfunction

function OrangeCheckpointAction takes nothing returns nothing
	call CheckpointAction(16)
endfunction

function Orange2CheckpointCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 16 ) ) then
		return false
	endif
	return true
endfunction

function Orange2CheckpointAction takes nothing returns nothing
	call CheckpointAction(37)
endfunction

function BlueCheckpointCondition takes nothing returns boolean
	if ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) then // INLINED!!
		if ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 3 ) then
			return true
		endif
		if ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 4 ) then
			return true
		endif
	endif

	return false
endfunction

function BlueCheckpointAction takes nothing returns nothing
	if ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 3 ) then
		call CheckpointAction(5)
	else
		call CheckpointAction(6)
	endif
endfunction

function Blue2CheckpointCondition takes nothing returns boolean
	if ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) then // INLINED!!
		if ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 5 ) then
			return true
		endif
		if ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 6 ) then
			return true
		endif
	endif

	return false
endfunction

function Blue2CheckpointAction takes nothing returns nothing
	if ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 5 ) then
		call CheckpointAction(11)
	else
		call CheckpointAction(12)
	endif
endfunction

function TealCheckpointCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 7 ) ) then
		return false
	endif
	return true
endfunction

function TealCheckpointAction takes nothing returns nothing
	call CheckpointAction(8)
endfunction

function Teal2CheckpointCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 8 ) ) then
		return false
	endif
	return true
endfunction

function Teal2CheckpointAction takes nothing returns nothing
	call CheckpointAction(39)
endfunction

function TeleportDestinationAction takes integer checkpoint returns nothing
	call SaveIntegerBJ(checkpoint, GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable)
	call IssuePointOrder(GetEnteringUnit(), "move", GetRectCenterX(udg_Checkpoints[checkpoint]), GetRectCenterY(udg_Checkpoints[checkpoint]))
endfunction

function OrangeTeleportDestAction takes nothing returns nothing
	call TeleportDestinationAction(17)
endfunction

function TealTeleportDestAction takes nothing returns nothing
	call TeleportDestinationAction(29)
endfunction

function PurpleTeleportDestAction takes nothing returns nothing
	call TeleportDestinationAction(19)
endfunction

function GreenCheckpointCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 17 ) ) then
		return false
	endif
	return true
endfunction

function DarkgreenTeleportDestAction takes nothing returns nothing
	call TeleportDestinationAction(9)
endfunction

function LightblueTeleportDestAction takes nothing returns nothing
	call TeleportDestinationAction(15)
endfunction

function YellowTeleportDestAction takes nothing returns nothing
	call TeleportDestinationAction(23)
endfunction

function Yellow2TeleportDestAction takes nothing returns nothing
	call TeleportDestinationAction(25)
endfunction

function RedTeleportDestAction takes nothing returns nothing
	call TeleportDestinationAction(27)
endfunction

function GreyTeleportAction takes nothing returns nothing
	call TeleportDestinationAction(21)
endfunction

function GreenCheckpointAction takes nothing returns nothing
	call CheckpointAction(18)
endfunction

function TealTeleportDestCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 40 ) ) then
		return false
	endif
	return true
endfunction

function PurpleTeleportDestCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 42 ) ) then
		return false
	endif
	return true
endfunction

function OrangeTeleportDestCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 38 ) ) then
		return false
	endif
	return true
endfunction

function LightblueTeleportDestCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 47 ) ) then
		return false
	endif
	return true
endfunction

function DarkgreenTeleportDestCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 49 ) ) then
		return false
	endif
	return true
endfunction

function YellowTeleportDestCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 44 ) ) then
		return false
	endif
	return true
endfunction

function Yellow2TeleportDestCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 45 ) ) then
		return false
	endif
	return true
endfunction

function RedTeleportDestCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 35 ) ) then
		return false
	endif
	return true
endfunction

function GreyTeleportCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 34 ) ) then
		return false
	endif
	return true
endfunction

function GreenTeleportCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 32 ) ) then
		return false
	endif
	return true
endfunction

function Green2CheckpointCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 18 ) ) then
		return false
	endif
	return true
endfunction

function GreenTeleportAction takes nothing returns nothing
	call TeleportEnteringUnit(34 , 270.00)
endfunction

function Green2CheckpointAction takes nothing returns nothing
	call CheckpointAction(32)
endfunction

function BrownCheckpointCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 27 ) ) then
		return false
	endif
	return true
endfunction

function BrownCheckpointAction takes nothing returns nothing
	call CheckpointAction(28)
endfunction

function Brown2CheckpointCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 28 ) ) then
		return false
	endif
	return true
endfunction

function Brown2CheckpointAction takes nothing returns nothing
	call CheckpointAction(15)
endfunction

function MaroonCheckpointCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 29 ) ) then
		return false
	endif
	return true
endfunction

function MaroonCheckpointAction takes nothing returns nothing
	call CheckpointAction(30)
endfunction

function Maroon2CheckpointCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 30 ) ) then
		return false
	endif
	return true
endfunction

function Maroon2CheckpointAction takes nothing returns nothing
	call CheckpointAction(9)
endfunction

function PurpleCheckpointCondition takes nothing returns boolean
	if not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) then // INLINED!!
		return false
	endif

	if not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 9 ) then
		return false
	endif

	return true
endfunction

function PurpleCheckpointAction takes nothing returns nothing
	call CheckpointAction(10)
endfunction

function Purple2CheckpointCondition takes nothing returns boolean
	if not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) then // INLINED!!
		return false
	endif

	if not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 10 ) then
		return false
	endif

	return true
endfunction

function Purple2CheckpointAction takes nothing returns nothing
	call CheckpointAction(41)
endfunction

function Darkgreen2CheckpointCondition takes nothing returns boolean
	if not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) then // INLINED!!
		return false
	endif

	if ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 26 ) then
		return true
	endif

	return false
endfunction

function Darkgreen2CheckpointAction takes nothing returns nothing
	call CheckpointAction(48)
endfunction

function GreyCheckpointCondition takes nothing returns boolean
	if not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) then // INLINED!!
		return false
	endif
	if not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 21 ) then
		return false
	endif
	return true
endfunction

function GreyCheckpointAction takes nothing returns nothing
	call CheckpointAction(22)
endfunction

function Grey2CheckpointCondition takes nothing returns boolean
	if not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) then // INLINED!!
		return false
	endif
	if not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 22 ) then
		return false
	endif
	return true
endfunction

function Grey2CheckpointAction takes nothing returns nothing
	call CheckpointAction(31)
endfunction

function LightblueCheckpointCondition takes nothing returns boolean
	if not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) then // INLINED!!
		return false
	endif
	if not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 23 ) then
		return false
	endif
	return true
endfunction

function LightblueCheckpointAction takes nothing returns nothing
	call CheckpointAction(24)
endfunction

function Lightblue2CheckpointCondition takes nothing returns boolean
	if not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) then // INLINED!!
		return false
	endif
	if not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 24 ) then
		return false
	endif
	return true
endfunction

function Lightblue2CheckpointAction takes nothing returns nothing
	call CheckpointAction(46)
endfunction

function DarkgreenCheckpointCondition takes nothing returns boolean
	if not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) then // INLINED!!
		return false
	endif
	if not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 25 ) then
		return false
	endif
	return true
endfunction

function DarkgreenCheckpointAction takes nothing returns nothing
	call CheckpointAction(26)
endfunction

function PinkCheckpointCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 19 ) ) then
		return false
	endif
	return true
endfunction

function PinkCheckpointAction takes nothing returns nothing
	call CheckpointAction(20)
endfunction

function PinkTeleportCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 33 ) ) then
		return false
	endif
	return true
endfunction

function Pink2CheckpointCondition takes nothing returns boolean
	if ( not ( ( WarcraftMaulLibrary_IsCreep(GetEnteringUnit()) ) ) ) then // INLINED!!
		return false
	endif
	if ( not ( LoadIntegerBJ(GetHandleIdBJ(GetEnteringUnit()), 0, udg_UnitToCheckpointTable) == 20 ) ) then
		return false
	endif
	return true
endfunction

function Pink2CheckpointAction takes nothing returns nothing
	call CheckpointAction(33)
endfunction

function PinkTeleportAction takes nothing returns nothing
	call TeleportEnteringUnit(34 , 270.00)
endfunction

function PrettifyGameTime takes integer time returns string
 local integer secs= ModuloInteger(time, 60)
 local integer mins= ModuloInteger(time / 60, 60)
 local integer hrs= time / 3600
 local string secsStr= I2S(secs)
 local string minsStr= I2S(mins)
 local string hrsStr= I2S(hrs)
	if ( mins < 10 ) then
		set minsStr="0" + minsStr
	endif
	if ( hrs < 10 ) then
		set hrsStr="0" + hrsStr
	endif
	if ( secs < 10 ) then
		set secsStr="0" + secsStr
	endif

	return "|cFF999999" + hrsStr + ":" + minsStr + ":" + secsStr + "|r"
endfunction

function UnarmoredWave takes nothing returns boolean
	if ( udg_CreepLevel == 1 ) then
		return true
	endif
	if ( udg_CreepLevel == 6 ) then
		return true
	endif
	if ( udg_CreepLevel == 9 ) then
		return true
	endif
	if ( udg_CreepLevel == 14 ) then
		return true
	endif
	if ( udg_CreepLevel == 21 ) then
		return true
	endif
	if ( udg_CreepLevel == 29 ) then
		return true
	endif
	if ( udg_CreepLevel == 34 ) then
		return true
	endif
	return false
endfunction

function LightWave takes nothing returns boolean
	if ( udg_CreepLevel == 4 ) then
		return true
	endif
	if ( udg_CreepLevel == 8 ) then
		return true
	endif
	if ( udg_CreepLevel == 11 ) then
		return true
	endif
	if ( udg_CreepLevel == 16 ) then
		return true
	endif
	if ( udg_CreepLevel == 19 ) then
		return true
	endif
	if ( udg_CreepLevel == 23 ) then
		return true
	endif
	if ( udg_CreepLevel == 27 ) then
		return true
	endif
	if ( udg_CreepLevel == 32 ) then
		return true
	endif
	return false
endfunction

function MediumWave takes nothing returns boolean
	if ( udg_CreepLevel == 3 ) then
		return true
	endif
	if ( udg_CreepLevel == 7 ) then
		return true
	endif
	if ( udg_CreepLevel == 12 ) then
		return true
	endif
	if ( udg_CreepLevel == 17 ) then
		return true
	endif
	if ( udg_CreepLevel == 24 ) then
		return true
	endif
	if ( udg_CreepLevel == 28 ) then
		return true
	endif
	if ( udg_CreepLevel == 33 ) then
		return true
	endif
	return false
endfunction

function HeavyWave takes nothing returns boolean
	if ( udg_CreepLevel == 2 ) then
		return true
	endif
	if ( udg_CreepLevel == 5 ) then
		return true
	endif
	if ( udg_CreepLevel == 13 ) then
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
	if ( udg_CreepLevel == 32 ) then
		return true
	endif
	if ( udg_CreepLevel == 35 ) then
		return true
	endif
	return false
endfunction

function FortifiedWave takes nothing returns boolean
	if ( udg_CreepLevel == 10 ) then
		return true
	endif
	if ( udg_CreepLevel == 18 ) then
		return true
	endif
	if ( udg_CreepLevel == 22 ) then
		return true
	endif
	if ( udg_CreepLevel == 26 ) then
		return true
	endif
	if ( udg_CreepLevel == 31 ) then
		return true
	endif
	return false
endfunction

function HeroWave takes nothing returns boolean
	if ( udg_CreepLevel == 36 ) then
		return true
	endif
	return false
endfunction

function UpdateScoreboardForWave takes nothing returns nothing
	call MultiboardSetItemValueBJ(udg_Scoreboard, 1, 1, "Starting in")

	if ( UnarmoredWave() ) then
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 5, udg_CreepTypes[0])
	elseif ( LightWave() ) then
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 5, udg_CreepTypes[1])
	elseif ( MediumWave() ) then
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 5, udg_CreepTypes[2])
	elseif ( HeavyWave() ) then
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 5, udg_CreepTypes[3])
	elseif ( FortifiedWave() ) then
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 5, udg_CreepTypes[4])
	elseif ( HeroWave() ) then
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 5, udg_CreepTypes[5])
	else
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 5, "")
	endif

	if ( AirWave() ) then
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 6, udg_CreepTypes[6])
	elseif ( MinibossWave() ) then
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 6, udg_CreepTypes[7])
	elseif ( BossWave() ) then
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 6, udg_CreepTypes[8])
	else
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 6, "")
	endif
endfunction

function DefeatAllPlayers takes nothing returns nothing
 local integer i= 0
	loop
		exitwhen i > 12
		call CustomDefeatBJ(Player(i), "Defeat!")
		set i=i + 1
	endloop
endfunction

function ShipEntersDestination takes nothing returns boolean
	if ( GetUnitTypeId(GetEnteringUnit()) == 'n05G' ) then
		return true
	endif

	return false
endfunction

function ShipEntersDestinationAction takes nothing returns nothing
	call RemoveUnit(GetEnteringUnit())
endfunction

function UpdateGameTime takes nothing returns nothing
	if ( udg_HasGameEnded ) then
		set udg_GameEndTimer=udg_GameEndTimer - 1
		call MultiboardSetItemValueBJ(udg_Scoreboard, 1, 1, "End Time")
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 1, PrettifyGameTime(udg_GameEndTimer))

		if ( udg_GameEndTimer <= 0 ) then
			call DefeatAllPlayers()
		endif
	else
		set udg_GameTime=udg_GameTime + 1
		if ( udg_StartWaveTimer ) then
			set udg_StartWaveTimer=false
			set udg_WaveTimer=udg_CreepWaveWaitTime + 1
			call UpdateScoreboardForWave()
		endif
		if ( udg_IsWaveInProgress ) then
			call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 1, PrettifyGameTime(udg_GameTime))
		else
			set udg_WaveTimer=udg_WaveTimer - 1
			call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 1, "|cFF999999" + I2S(udg_WaveTimer) + "|r")
		endif
		if ( GetBooleanAnd(udg_WaveTimer == 0, not ( udg_IsWaveInProgress )) ) then
			set udg_IsWaveInProgress=true
			call MultiboardSetItemValueBJ(udg_Scoreboard, 1, 1, "Game Time")
			call SpawnCreeps()
		endif
	endif
endfunction

//===========================================================================
function InitTrig_PathingSystem takes nothing returns nothing
	call MapInit_InitializeVariables()

	set udg_trigger04=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger04, udg_Checkpoints[1])
	call TriggerAddCondition(udg_trigger04, Condition(function RedCheckpointCondition))
	call TriggerAddAction(udg_trigger04, function RedCheckpointAction)
	set udg_trigger05=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger05, udg_Checkpoints[3])
	call TriggerAddCondition(udg_trigger05, Condition(function BlueCheckpointCondition))
	call TriggerAddAction(udg_trigger05, function BlueCheckpointAction)
	set udg_trigger06=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger06, udg_Checkpoints[7])
	call TriggerAddCondition(udg_trigger06, Condition(function TealCheckpointCondition))
	call TriggerAddAction(udg_trigger06, function TealCheckpointAction)
	set udg_trigger07=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger07, udg_Checkpoints[9])
	call TriggerAddCondition(udg_trigger07, Condition(function PurpleCheckpointCondition))
	call TriggerAddAction(udg_trigger07, function PurpleCheckpointAction)
	set udg_trigger08=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger08, udg_Checkpoints[11])
	call TriggerAddCondition(udg_trigger08, Condition(function YellowCheckpointCondition))
	call TriggerAddAction(udg_trigger08, function YellowCheckpointAction)
	set udg_trigger09=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger09, udg_Checkpoints[15])
	call TriggerAddCondition(udg_trigger09, Condition(function OrangeCheckpointCondition))
	call TriggerAddAction(udg_trigger09, function OrangeCheckpointAction)
	set udg_trigger10=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger10, udg_Checkpoints[17])
	call TriggerAddCondition(udg_trigger10, Condition(function GreenCheckpointCondition))
	call TriggerAddAction(udg_trigger10, function GreenCheckpointAction)
	set udg_trigger11=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger11, udg_Checkpoints[19])
	call TriggerAddCondition(udg_trigger11, Condition(function PinkCheckpointCondition))
	call TriggerAddAction(udg_trigger11, function PinkCheckpointAction)
	set udg_trigger12=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger12, udg_Checkpoints[21])
	call TriggerAddCondition(udg_trigger12, Condition(function GreyCheckpointCondition))
	call TriggerAddAction(udg_trigger12, function GreyCheckpointAction)
	set udg_trigger13=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger13, udg_Checkpoints[23])
	call TriggerAddCondition(udg_trigger13, Condition(function LightblueCheckpointCondition))
	call TriggerAddAction(udg_trigger13, function LightblueCheckpointAction)
	set udg_trigger14=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger14, udg_Checkpoints[25])
	call TriggerAddCondition(udg_trigger14, Condition(function DarkgreenCheckpointCondition))
	call TriggerAddAction(udg_trigger14, function DarkgreenCheckpointAction)
	set udg_trigger15=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger15, udg_Checkpoints[26])
	call TriggerAddCondition(udg_trigger15, Condition(function Darkgreen2CheckpointCondition))
	call TriggerAddAction(udg_trigger15, function Darkgreen2CheckpointAction)
	set udg_trigger16=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger16, udg_Checkpoints[13])
	call TriggerAddCondition(udg_trigger16, Condition(function Yellow2CheckpointCondition))
	call TriggerAddAction(udg_trigger16, function Yellow2CheckpointAction)
	set udg_trigger17=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger17, udg_Checkpoints[24])
	call TriggerAddCondition(udg_trigger17, Condition(function Lightblue2CheckpointCondition))
	call TriggerAddAction(udg_trigger17, function Lightblue2CheckpointAction)
	set udg_trigger18=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger18, udg_Checkpoints[18])
	call TriggerAddCondition(udg_trigger18, Condition(function Green2CheckpointCondition))
	call TriggerAddAction(udg_trigger18, function Green2CheckpointAction)
	set udg_trigger54=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger54, udg_Checkpoints[32])
	call TriggerAddCondition(udg_trigger54, Condition(function GreenTeleportCondition))
	call TriggerAddAction(udg_trigger54, function GreenTeleportAction)
	set udg_trigger78=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger78, udg_Checkpoints[34])
	call TriggerAddCondition(udg_trigger78, Condition(function GreyTeleportCondition))
	call TriggerAddAction(udg_trigger78, function GreyTeleportAction)
	set udg_trigger80=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger80, udg_Checkpoints[35])
	call TriggerAddCondition(udg_trigger80, Condition(function RedTeleportDestCondition))
	call TriggerAddAction(udg_trigger80, function RedTeleportDestAction)
	set udg_trigger81=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger81, udg_Checkpoints[37])
	call TriggerAddCondition(udg_trigger81, Condition(function OrangeTeleportCondition))
	call TriggerAddAction(udg_trigger81, function OrangeTeleportAction)
	set udg_trigger85=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger85, udg_Checkpoints[39])
	call TriggerAddCondition(udg_trigger85, Condition(function TealTeleportCondition))
	call TriggerAddAction(udg_trigger85, function TealTeleportAction)
	set udg_trigger86=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger86, udg_Checkpoints[41])
	call TriggerAddCondition(udg_trigger86, Condition(function PurpleTeleportCondition))
	call TriggerAddAction(udg_trigger86, function PurpleTeleportAction)
	set udg_trigger87=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger87, udg_Checkpoints[43])
	call TriggerAddCondition(udg_trigger87, Condition(function YellowTeleportCondition))
	call TriggerAddAction(udg_trigger87, function YellowTeleportAction)
	set udg_trigger88=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger88, udg_Checkpoints[46])
	call TriggerAddCondition(udg_trigger88, Condition(function LightblueTeleportCondition))
	call TriggerAddAction(udg_trigger88, function LightblueTeleportAction)
	set udg_trigger89=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger89, udg_Checkpoints[48])
	call TriggerAddCondition(udg_trigger89, Condition(function DarkgreenTeleportCondition))
	call TriggerAddAction(udg_trigger89, function DarkgreenTeleportAction)
	set udg_trigger90=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger90, udg_Checkpoints[44])
	call TriggerAddCondition(udg_trigger90, Condition(function YellowTeleportDestCondition))
	call TriggerAddAction(udg_trigger90, function YellowTeleportDestAction)
	set udg_trigger91=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger91, udg_Checkpoints[45])
	call TriggerAddCondition(udg_trigger91, Condition(function Yellow2TeleportDestCondition))
	call TriggerAddAction(udg_trigger91, function Yellow2TeleportDestAction)
	set udg_trigger92=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger92, udg_Checkpoints[49])
	call TriggerAddCondition(udg_trigger92, Condition(function DarkgreenTeleportDestCondition))
	call TriggerAddAction(udg_trigger92, function DarkgreenTeleportDestAction)
	set udg_trigger93=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger93, udg_Checkpoints[47])
	call TriggerAddCondition(udg_trigger93, Condition(function LightblueTeleportDestCondition))
	call TriggerAddAction(udg_trigger93, function LightblueTeleportDestAction)
	set udg_trigger82=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger82, udg_Checkpoints[38])
	call TriggerAddCondition(udg_trigger82, Condition(function OrangeTeleportDestCondition))
	call TriggerAddAction(udg_trigger82, function OrangeTeleportDestAction)
	set udg_trigger83=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger83, udg_Checkpoints[42])
	call TriggerAddCondition(udg_trigger83, Condition(function PurpleTeleportDestCondition))
	call TriggerAddAction(udg_trigger83, function PurpleTeleportDestAction)
	set udg_trigger84=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger84, udg_Checkpoints[40])
	call TriggerAddCondition(udg_trigger84, Condition(function TealTeleportDestCondition))
	call TriggerAddAction(udg_trigger84, function TealTeleportDestAction)
	set udg_trigger19=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger19, udg_Checkpoints[20])
	call TriggerAddCondition(udg_trigger19, Condition(function Pink2CheckpointCondition))
	call TriggerAddAction(udg_trigger19, function Pink2CheckpointAction)
	set udg_trigger77=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger77, udg_Checkpoints[33])
	call TriggerAddCondition(udg_trigger77, Condition(function PinkTeleportCondition))
	call TriggerAddAction(udg_trigger77, function PinkTeleportAction)
	set udg_trigger79=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger79, udg_Checkpoints[36])
	call TriggerAddCondition(udg_trigger79, Condition(function RedTeleportCondition))
	call TriggerAddAction(udg_trigger79, function RedTeleportAction)
	set udg_trigger20=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger20, udg_Checkpoints[22])
	call TriggerAddCondition(udg_trigger20, Condition(function Grey2CheckpointCondition))
	call TriggerAddAction(udg_trigger20, function Grey2CheckpointAction)
	set udg_trigger21=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger21, udg_Checkpoints[28])
	call TriggerAddCondition(udg_trigger21, Condition(function Brown2CheckpointCondition))
	call TriggerAddAction(udg_trigger21, function Brown2CheckpointAction)
	set udg_trigger22=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger22, udg_Checkpoints[27])
	call TriggerAddCondition(udg_trigger22, Condition(function BrownCheckpointCondition))
	call TriggerAddAction(udg_trigger22, function BrownCheckpointAction)
	set udg_trigger23=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger23, udg_Checkpoints[29])
	call TriggerAddCondition(udg_trigger23, Condition(function MaroonCheckpointCondition))
	call TriggerAddAction(udg_trigger23, function MaroonCheckpointAction)
	set udg_trigger53=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger53, udg_Checkpoints[10])
	call TriggerAddCondition(udg_trigger53, Condition(function Purple2CheckpointCondition))
	call TriggerAddAction(udg_trigger53, function Purple2CheckpointAction)
	set udg_trigger55=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger55, udg_Checkpoints[16])
	call TriggerAddCondition(udg_trigger55, Condition(function Orange2CheckpointCondition))
	call TriggerAddAction(udg_trigger55, function Orange2CheckpointAction)
	set udg_trigger69=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger69, udg_Checkpoints[2])
	call TriggerAddCondition(udg_trigger69, Condition(function Red2CheckpointCondition))
	call TriggerAddAction(udg_trigger69, function Red2CheckpointAction)
	set udg_trigger70=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger70, udg_Checkpoints[5])
	call TriggerRegisterEnterRectSimple(udg_trigger70, udg_Checkpoints[6])
	call TriggerAddCondition(udg_trigger70, Condition(function Blue2CheckpointCondition))
	call TriggerAddAction(udg_trigger70, function Blue2CheckpointAction)
	set udg_trigger71=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger71, udg_Checkpoints[8])
	call TriggerAddCondition(udg_trigger71, Condition(function Teal2CheckpointCondition))
	call TriggerAddAction(udg_trigger71, function Teal2CheckpointAction)
	set udg_trigger72=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger72, udg_Checkpoints[30])
	call TriggerAddCondition(udg_trigger72, Condition(function Maroon2CheckpointCondition))
	call TriggerAddAction(udg_trigger72, function Maroon2CheckpointAction)

	set udg_trigger24=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger24, udg_Redspawn)
	call TriggerRegisterEnterRectSimple(udg_trigger24, udg_Redspawn2)
	call TriggerAddCondition(udg_trigger24, Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
	call TriggerAddAction(udg_trigger24, function RedSpawnAction)
	set udg_trigger25=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger25, udg_Bluespawn)
	call TriggerAddCondition(udg_trigger25, Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
	call TriggerAddAction(udg_trigger25, function BlueSpawnAction)
	set udg_trigger26=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger26, udg_Tealspawn)
	call TriggerRegisterEnterRectSimple(udg_trigger26, udg_Tealspawn2)
	call TriggerAddCondition(udg_trigger26, Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
	call TriggerAddAction(udg_trigger26, function TealSpawnAction)
	set udg_trigger27=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger27, udg_Orangespawn)
	call TriggerRegisterEnterRectSimple(udg_trigger27, udg_Orangespawn2)
	call TriggerAddCondition(udg_trigger27, Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
	call TriggerAddAction(udg_trigger27, function OrangeSpawnAction)
	set udg_trigger28=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger28, udg_Yellowspawn)
	call TriggerAddCondition(udg_trigger28, Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
	call TriggerAddAction(udg_trigger28, function YellowSpawnAction)
	set udg_trigger29=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger29, udg_Purplespawn)
	call TriggerRegisterEnterRectSimple(udg_trigger29, udg_Purplespawn2)
	call TriggerAddCondition(udg_trigger29, Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
	call TriggerAddAction(udg_trigger29, function PurpleSpawnAction)
	set udg_trigger30=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger30, udg_Lightbluespawn)
	call TriggerRegisterEnterRectSimple(udg_trigger30, udg_Lightbluespawn2)
	call TriggerAddCondition(udg_trigger30, Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
	call TriggerAddAction(udg_trigger30, function LightblueSpawnAction)
	set udg_trigger31=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger31, udg_Darkgreenspawn)
	call TriggerRegisterEnterRectSimple(udg_trigger31, udg_Darkgreenspawn2)
	call TriggerAddCondition(udg_trigger31, Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
	call TriggerAddAction(udg_trigger31, function DarkgreenSpawnAction)
	set udg_trigger32=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger32, udg_Greenspawn)
	call TriggerRegisterEnterRectSimple(udg_trigger32, udg_Greenspawn2)
	call TriggerAddCondition(udg_trigger32, Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
	call TriggerAddAction(udg_trigger32, function GreenSpawnAction)
	set udg_trigger33=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger33, udg_Greyspawn)
	call TriggerAddCondition(udg_trigger33, Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
	call TriggerAddAction(udg_trigger33, function GreySpawnAction)
	set udg_trigger34=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger34, udg_Pinkspawn)
	call TriggerRegisterEnterRectSimple(udg_trigger34, udg_Pinkspawn2)
	call TriggerAddCondition(udg_trigger34, Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
	call TriggerAddAction(udg_trigger34, function PinkSpawnAction)
	set udg_trigger35=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger35, udg_Bluespawn2)
	call TriggerAddCondition(udg_trigger35, Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
	call TriggerAddAction(udg_trigger35, function BlueSpawnAction2)
	set udg_trigger36=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger36, udg_Yellowspawn2)
	call TriggerAddCondition(udg_trigger36, Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
	call TriggerAddAction(udg_trigger36, function YellowSpawnAction2)
	set udg_trigger37=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger37, udg_Brownspawn)
	call TriggerRegisterEnterRectSimple(udg_trigger37, udg_Brownspawn2)
	call TriggerAddCondition(udg_trigger37, Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
	call TriggerAddAction(udg_trigger37, function BrownSpawnAction)
	set udg_trigger38=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger38, udg_Maroonspawn)
	call TriggerRegisterEnterRectSimple(udg_trigger38, udg_Maroonspawn2)
	call TriggerAddCondition(udg_trigger38, Condition(function EnteringUnitIsCreepAndHasNoCheckpoint))
	call TriggerAddAction(udg_trigger38, function MaroonSpawnAction)

	set udg_trigger39=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger39, udg_Shipcheckpoint)
	call TriggerAddCondition(udg_trigger39, Condition(function WarcraftMaulLibrary_EnteringUnitIsCreep))
	call TriggerAddAction(udg_trigger39, function LoseALife)
	set udg_trigger40=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger40, udg_ShipDestination)
	call TriggerAddCondition(udg_trigger40, Condition(function ShipEntersDestination))
	call TriggerAddAction(udg_trigger40, function ShipEntersDestinationAction)

	set udg_trigger56=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger56, udg_PlayerRestrictionArea[0])
	call TriggerAddAction(udg_trigger56, function Player1RestrictionAction)
	set udg_trigger57=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger57, udg_PlayerRestrictionArea[1])
	call TriggerAddAction(udg_trigger57, function Player2RestrictionAction)
	set udg_trigger58=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger58, udg_PlayerRestrictionArea[2])
	call TriggerAddAction(udg_trigger58, function Player3RestrictionAction)
	set udg_trigger59=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger59, udg_PlayerRestrictionArea[3])
	call TriggerAddAction(udg_trigger59, function Player4RestrictionAction)
	set udg_trigger60=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger60, udg_PlayerRestrictionArea[4])
	call TriggerAddAction(udg_trigger60, function Player5RestrictionAction)
	set udg_trigger61=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger61, udg_PlayerRestrictionArea[5])
	call TriggerAddAction(udg_trigger61, function Player6RestrictionAction)
	set udg_trigger62=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger62, udg_PlayerRestrictionArea[6])
	call TriggerAddAction(udg_trigger62, function Player7RestrictionAction)
	set udg_trigger63=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger63, udg_PlayerRestrictionArea[7])
	call TriggerAddAction(udg_trigger63, function Player8RestrictionAction)
	set udg_trigger64=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger64, udg_PlayerRestrictionArea[8])
	call TriggerAddAction(udg_trigger64, function Player9RestrictionAction)
	set udg_trigger65=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger65, udg_PlayerRestrictionArea[9])
	call TriggerAddAction(udg_trigger65, function Player10RestrictionAction)
	set udg_trigger66=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger66, udg_PlayerRestrictionArea[10])
	call TriggerAddAction(udg_trigger66, function Player11RestrictionAction)
	set udg_trigger67=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger67, udg_PlayerRestrictionArea[11])
	call TriggerAddAction(udg_trigger67, function Player12RestrictionAction)
	set udg_trigger68=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger68, udg_PlayerRestrictionArea[12])
	call TriggerAddAction(udg_trigger68, function Player13RestrictionAction)


	set udg_trigger41=CreateTrigger()
	call TriggerRegisterTimerEventPeriodic(udg_trigger41, 1.00)
	call TriggerAddAction(udg_trigger41, function UpdateGameTime)
	
	set udg_trigger42=CreateTrigger()
	call TriggerRegisterPlayerStateEvent(udg_trigger42, Player(13), PLAYER_STATE_RESOURCE_FOOD_USED, EQUAL, 0.00)
	call TriggerRegisterPlayerStateEvent(udg_trigger42, Player(14), PLAYER_STATE_RESOURCE_FOOD_USED, EQUAL, 0.00)
	call TriggerRegisterPlayerStateEvent(udg_trigger42, Player(15), PLAYER_STATE_RESOURCE_FOOD_USED, EQUAL, 0.00)
	call TriggerRegisterPlayerStateEvent(udg_trigger42, Player(16), PLAYER_STATE_RESOURCE_FOOD_USED, EQUAL, 0.00)
	call TriggerAddCondition(udg_trigger42, Condition(function CreepFoodConditions))
	call TriggerAddAction(udg_trigger42, function RoundEnd)
endfunction//===========================================================================
// Trigger: Commands
//===========================================================================
function GetPlayerIdFromColorName takes string color returns integer
	if ( color == "red" ) then
		return 0
	elseif ( color == "blue" ) then
		return 1
	elseif ( color == "teal" ) then
		return 2
	elseif ( color == "purple" ) then
		return 3
	elseif ( color == "yellow" ) then
		return 4
	elseif ( color == "orange" ) then
		return 5
	elseif ( color == "green" ) then
		return 6
	elseif ( color == "pink" ) then
		return 7
	elseif ( color == "grey" ) then
		return 8
	elseif ( color == "lightblue" ) then
		return 9
	elseif ( color == "darkgreen" ) then
		return 10
	elseif ( color == "gray" ) then
		return 8
	elseif ( color == "lb" ) then
		return 9
	elseif ( color == "dg" ) then
		return 10
	elseif ( color == "brown" ) then
		return 11
	elseif ( color == "maroon" ) then
		return 12
	elseif ( color == "purp" ) then
		return 3
	else
		return - 1
	endif
endfunction

function HasCorrectUnitUserData takes nothing returns boolean
	if ( LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_PlayerLeavesTable) == GetConvertedPlayerId(GetTriggerPlayer()) ) then
		return true
	endif
	return false
endfunction

function EnumSpecialEffect takes nothing returns nothing
 local real x= GetUnitX(GetEnumUnit())
 local real y= GetUnitY(GetEnumUnit())
	call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\ResourceItems\\ResourceEffectTarget.mdl", x, y))
endfunction

function SellATower takes nothing returns nothing
	if ( HasCorrectUnitUserData() ) then
		call WarcraftMaulLibrary_SellTower(GetEnumUnit())
	endif
endfunction

function SellAllActions takes nothing returns nothing
 local group grp= GetUnitsOfPlayerAll(GetTriggerPlayer())
	call ForGroupBJ(grp, function SellATower)
	call DestroyGroup(grp)
endfunction

function RepickRemoveConditions takes nothing returns boolean
	if ( GetUnitTypeId(GetEnumUnit()) == 'h03S' ) then
		return false
	endif

	if ( GetUnitTypeId(GetEnumUnit()) == 'e00C' ) then
		return false
	endif

	return true
endfunction

function RemoveTriggeringPlayerUnits takes nothing returns nothing
	if ( GetOwningPlayer(GetEnumUnit()) == GetTriggerPlayer() ) then
		if ( RepickRemoveConditions() ) then
			call RemoveUnit(GetEnumUnit())
		endif
	endif
endfunction

function RepickActions takes nothing returns nothing
 local integer playerid= GetPlayerId(GetTriggerPlayer())
 local group grp= GetUnitsInRectAll(GetPlayableMapRect())
	if playerid == 8 then
		if ( GetPlayerState(Player(playerid), PLAYER_STATE_RESOURCE_GOLD) > 150 ) then
			call SetPlayerStateBJ(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD, 150)
		endif
	else
		if ( GetPlayerState(Player(playerid), PLAYER_STATE_RESOURCE_GOLD) > 100 ) then
			call SetPlayerStateBJ(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD, 100)
		endif
	endif
	call SetPlayerStateBJ(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER, 1)
	call ForGroupBJ(grp, function RemoveTriggeringPlayerUnits)
	call DestroyGroup(grp)
	set grp=null
endfunction

function RepickConditions takes nothing returns boolean
	if not ( udg_CreepLevel == 1 ) then
		return false
	endif

	if udg_IsWaveInProgress then
		return false
	endif

	if udg_HasHardcoreRandomed[GetPlayerId(GetTriggerPlayer())] then
		return false
	endif

	if udg_HasHybridRandomed[GetPlayerId(GetTriggerPlayer())] then
		return false
	endif

	return true
endfunction

function CloseAllSpawns takes nothing returns nothing
 local integer i= 0
	loop
		exitwhen i > 12
		set udg_IsSpawnOpen[i]=0
		set i=i + 1
	endloop
endfunction

function OpenAllSpawns takes nothing returns nothing
 local integer i= 0
	loop
		exitwhen i > 12
		set udg_IsSpawnOpen[i]=1
		set i=i + 1
	endloop
endfunction

function ChangeUnitOwnership takes nothing returns nothing
	if ( GetOwningPlayer(GetEnumUnit()) == GetTriggerPlayer() ) then
		if ( IsUnitIdType(GetUnitTypeId(GetEnumUnit()), UNIT_TYPE_TOWNHALL) == false ) then
			if ( IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE) == true ) then
				call SetUnitOwner(GetEnumUnit(), Player(udg_UnitOwnershipInt), true)
			endif
		endif
	endif
endfunction

function ChangeUnitOwnershipAction takes nothing returns nothing
 local group grp= GetUnitsSelectedAll(GetTriggerPlayer())
	call ForGroupBJ(grp, function ChangeUnitOwnership)
	call DestroyGroup(grp)
	set grp=null
endfunction

function ChangeRestrictionOfPlayer takes integer pidtrig,integer pid,boolean flag returns nothing
	set udg_PlayerRestrictions[13 * pidtrig + pid]=flag
endfunction

function IsPickedUnitOwnedByDeniedPlayer takes nothing returns boolean
	return udg_PlayerRestrictions[13 * GetPlayerId(GetTriggerPlayer()) + GetPlayerId(GetOwningPlayer(GetEnumUnit()))]
endfunction

function MoveEnumUnitBackToHisOwnSpawn takes nothing returns nothing
 local real x= GetRectCenterX(udg_PlayerRestrictionArea[GetPlayerId(GetOwningPlayer(GetEnumUnit()))])
 local real y= GetRectCenterY(udg_PlayerRestrictionArea[GetPlayerId(GetOwningPlayer(GetEnumUnit()))])
	call SetUnitPosition(GetEnumUnit(), x, y)
endfunction

function ChangeOwnershipOfDeniedPlayerTower takes nothing returns nothing
	if ( udg_PlayerRestrictions[13 * GetPlayerId(GetTriggerPlayer()) + GetPlayerId(GetOwningPlayer(GetEnumUnit()))] ) then // INLINED!!
		if IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE) then
			if not ( IsUnitType(GetEnumUnit(), UNIT_TYPE_TOWNHALL) ) then
				call SetUnitOwner(GetEnumUnit(), GetTriggerPlayer(), true)
			endif
		else
			call MoveEnumUnitBackToHisOwnSpawn()
		endif
	endif
endfunction

function SellDeniedPlayerTower takes nothing returns nothing
	if ( udg_PlayerRestrictions[13 * GetPlayerId(GetTriggerPlayer()) + GetPlayerId(GetOwningPlayer(GetEnumUnit()))] ) then // INLINED!!
		if IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE) then
			if not ( IsUnitType(GetEnumUnit(), UNIT_TYPE_TOWNHALL) ) then
				call SellATower()
			endif
		else
			call MoveEnumUnitBackToHisOwnSpawn()
		endif
	endif
endfunction

function SellAllDeniedAccessOwnersTowers takes integer pidtrig returns nothing
 local group grp= GetUnitsInRectAll(udg_PlayerRestrictionArea[pidtrig])
	call ForGroupBJ(grp, function SellDeniedPlayerTower)
	call DestroyGroup(grp)
	set grp=null
endfunction

function ChangeOwnershipOfAllDeniedAccessTowers takes integer pidtrig returns nothing
 local group grp=GetUnitsInRectAll(udg_PlayerRestrictionArea[pidtrig])
	call ForGroupBJ(grp, function ChangeOwnershipOfDeniedPlayerTower)
	call DestroyGroup(grp)
	set grp=null
endfunction

function DenyAllPlayers takes nothing returns nothing
 local integer i= 0
	loop
		exitwhen i > 12
		if ( i != GetPlayerId(GetTriggerPlayer()) ) then
			set udg_PlayerRestrictions[13 * ( GetPlayerId(GetTriggerPlayer()) ) + ( i )]=( true ) // INLINED!!
		endif
		set i=i + 1
	endloop
	
	call ChangeOwnershipOfAllDeniedAccessTowers(GetPlayerId(GetTriggerPlayer()))
endfunction

function AllowAllPlayers takes nothing returns nothing
 local integer i= 0
	loop
		exitwhen i > 12
		if ( i != GetPlayerId(GetTriggerPlayer()) ) then
			set udg_PlayerRestrictions[13 * ( GetPlayerId(GetTriggerPlayer()) ) + ( i )]=( false ) // INLINED!!
		endif
		set i=i + 1
	endloop
endfunction

function AllowSpecificPlayer takes nothing returns nothing
 local string colorname= SubStringBJ(GetEventPlayerChatString(), 8, StringLength(GetEventPlayerChatString()))
 local integer playerid= GetPlayerIdFromColorName(colorname)
	if ( playerid > - 1 ) then
		if ( playerid != GetPlayerId(GetTriggerPlayer()) ) then
			set udg_PlayerRestrictions[13 * ( GetPlayerId(GetTriggerPlayer()) ) + ( playerid )]=( false ) // INLINED!!
			call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, udg_PlayerColorCodes[playerid] + GetPlayerName(Player(playerid)) + "|r is now |cFF00FF00allowed|r to build in your spawn!")
		else
			call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "You are already allowed to to build in this spawn")
		endif
	else
		call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "Please enter a valid color!")
	endif
endfunction

function DenySpecificPlayer takes nothing returns nothing
 local string colorname= SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString()))
 local integer playerid= GetPlayerIdFromColorName(colorname)
	if ( playerid > - 1 ) then
		if ( playerid != GetPlayerId(GetTriggerPlayer()) ) then
			set udg_PlayerRestrictions[13 * ( GetPlayerId(GetTriggerPlayer()) ) + ( playerid )]=( true ) // INLINED!!
			call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, udg_PlayerColorCodes[playerid] + GetPlayerName(Player(playerid)) + "|r is now |cFFFF0000denied|r access to your spawn!")
			call ChangeOwnershipOfAllDeniedAccessTowers(GetPlayerId(GetTriggerPlayer()))
		else
			call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "You can't deny yourself access!")
		endif
	else
		call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "Please enter a valid color!")
	endif
endfunction

function FindNextSpaceCharacter takes string txt,integer startIndex returns integer
 local integer index= startIndex
 local integer stringLength= StringLength(txt)

	loop
		exitwhen index > stringLength
		if SubStringBJ(txt, index, index) == " " then
			return index
		endif
		set index=index + 1
	endloop
	return - 1
endfunction

function GiveGoldToPlayer takes string chatStr,integer spaceCharacterIndex returns nothing
 local string colorname= SubStringBJ(chatStr, 7, spaceCharacterIndex - 1)
 local integer playerid= GetPlayerIdFromColorName(colorname)
 local integer goldAmount
 local string goldAmountStr

	if playerid == - 1 then
		call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "Invalid player color")
	endif

	set goldAmount=S2I(SubStringBJ(chatStr, spaceCharacterIndex + 1, StringLength(chatStr)))
	set goldAmountStr=I2S(goldAmount)

	if goldAmount > 0 then
		if GetPlayerSlotState(Player(playerid)) == PLAYER_SLOT_STATE_PLAYING then
			if GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD) >= goldAmount then
				call SetPlayerStateBJ(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD) - goldAmount)
				call SetPlayerStateBJ(Player(playerid), PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(Player(playerid), PLAYER_STATE_RESOURCE_GOLD) + goldAmount)
				call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "You've sent |cFFFFCC00" + goldAmountStr + "|r gold to " + udg_PlayerColorCodes[playerid] + GetPlayerName(Player(playerid)) + "|r")
				call DisplayTimedTextToPlayer(Player(playerid), 0, 0, 5, "You've received |cFFFFCC00" + goldAmountStr + "|r gold from " + udg_PlayerColorCodes[GetPlayerId(GetTriggerPlayer())] + GetPlayerName(GetTriggerPlayer()) + "|r")
			else
				call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "You do not have this much gold")
			endif
		else
			call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "This player is not in-game")
		endif
	else
		call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "You can't give this amount")
	endif
endfunction

function GiveGold takes nothing returns nothing
 local string chatStr= GetEventPlayerChatString()
 local integer spaceCharacterIndex= FindNextSpaceCharacter(chatStr , 7)
	if spaceCharacterIndex > 0 then
		call GiveGoldToPlayer(chatStr , spaceCharacterIndex)
	else
		call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "Invalid command")
	endif
endfunction

function ZoomPlayerCamera takes string zoomval returns nothing
	call SetCameraFieldForPlayer(GetTriggerPlayer(), CAMERA_FIELD_ZOFFSET, S2I(zoomval), 0)
endfunction

function PlayerChatCommandActions takes nothing returns nothing
 local player p= GetTriggerPlayer()
	if ( GetEventPlayerChatString() == "-air" ) then
		call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "|cFF999999Air:|r 5 / 15 / 20 / 25 / 30")
	elseif ( GetEventPlayerChatString() == "-boss" ) then
		call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "|cFF3737F2Boss:|r 9 / 14 / 19 / 24 / 29 / 31")
	elseif ( GetEventPlayerChatString() == "-champ" ) then
		call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "|cFFF2A137Champion:|r 35 / 36")
	elseif ( GetEventPlayerChatString() == "-champion" ) then
		call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "|cFFF2A137Champion:|r 35 / 36")
	elseif ( GetEventPlayerChatString() == "-light" ) then
		call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "|cFF6d7c86Light:|r 4 / 8 / 11 / 16 / 19 / 23 / 27 / 32")
	elseif ( GetEventPlayerChatString() == "-medium" ) then
		call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "|cFF416073Medium:|r 3 / 7 / 12 / 17 / 24 / 28 / 33")
	elseif ( GetEventPlayerChatString() == "-heavy" ) then
		call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "|cFF154360Heavy:|r 2 / 5 / 13 / 15 / 20 / 25 / 30 / 32 / 35")
	elseif ( GetEventPlayerChatString() == "-fortified" ) then
		call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "|cFFCA8500Fortified:|r 10 / 18 / 22 / 26 / 31")
	elseif ( GetEventPlayerChatString() == "-hero" ) then
		call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "|cFF7525FFHero:|r 36")
	elseif ( GetEventPlayerChatString() == "-waves" ) then
		call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "|cFF999999Air:|r 5 / 15 / 20 / 25 / 30\n|cFF3737F2Boss:|r 9 / 14 / 19 / 24 / 29 / 31\n|cFFF2A137Champion:|r 35 / 36\n|cFF6d7c86Light:|r 4 / 8 / 11 / 16 / 19 / 23 / 27 / 32\n|cFF416073Medium:|r 3 / 7 / 12 / 17 / 24 / 28 / 33\n|cFF154360Heavy:|r 2 / 5 / 13 / 15 / 20 / 25 / 30 / 32 / 35\n|cFFCA8500Fortified:|r 10 / 18 / 22 / 26 / 31\n|cFF7525FFHero:|r 36")
	elseif ( GetEventPlayerChatString() == "-buffs" ) then
		call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 20, "|cFFFFCC00Hardened Skin:|r Creeps ignore 2x creep level incoming physical damage\n|cFFFFCC00Evasion:|r Creeps will have a 1x creep level chance to evade physical damage\n|cFFFFCC00Armor Bonus:|r Increases creep armor by creep level divided by 3\n|cFFFFCC00Cripple Aura:|r Whenever a creep takes damage it has a 10% chance to cripple the attacking tower, slowing attack speed by 1.5% times creep level\n|cFFFFCC00Spell Shield:|r Blocks targetting spells from casting every 4 (minus 0.1 times creep level) second\n|cFFFFCC00Tornado Aura:|r Nearby towers are slowed by 1% times creep level\n|cFFFFCC00Vampiric Aura:|r Creeps have a 10% chance to heal for 4x creep level\n|cFFFFCC00Divine Shield:|r Creeps ignore damage until they've been damaged 1x creep level times\n|cFFFFCC00Walk it Off:|r slowed down creeps take 0.5% times creep level less damage\n|cFFFFCC00Morning Person:|r creeps heal for 0.5% times creep level of their max health every time they reach a checkpoint (not teleports)")
	elseif ( GetEventPlayerChatString() == "-repick" ) then
		if ( RepickConditions() ) then
			call RepickActions()
		else
			call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "You can only repick before wave 1!")
		endif
	elseif ( SubStringBJ(GetEventPlayerChatString(), 1, 8) == "-sellall" ) then
		call SellAllActions()
	elseif ( SubStringBJ(GetEventPlayerChatString(), 1, 8) == "-sa" ) then
		call SellAllActions()
	elseif ( SubStringBJ(GetEventPlayerChatString(), 1, 8) == "-openall" ) then
		if udg_DebugMode then
			call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "All spawns are now open!")
			call OpenAllSpawns()
		endif
	elseif ( SubStringBJ(GetEventPlayerChatString(), 1, 6) == "-gold " ) then
		if udg_DebugMode then
			call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "Gold was set to |cFFFFCC00" + SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString())) + "|r")
			call SetPlayerStateBJ(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD, S2I(SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString()))))
		endif
	elseif ( SubStringBJ(GetEventPlayerChatString(), 1, 8) == "-lumber " ) then
		if udg_DebugMode then
			call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "Lumber was set to |cFF00C850" + SubStringBJ(GetEventPlayerChatString(), 9, StringLength(GetEventPlayerChatString())) + "|r")
			call SetPlayerStateBJ(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER, S2I(SubStringBJ(GetEventPlayerChatString(), 9, StringLength(GetEventPlayerChatString()))))
		endif
	elseif ( SubStringBJ(GetEventPlayerChatString(), 1, 9) == "-closeall" ) then
		if udg_DebugMode then
			call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "All spawns are now closed!")
			call CloseAllSpawns()
		endif
	elseif ( SubStringBJ(GetEventPlayerChatString(), 1, 6) == "-diff " ) then
		if udg_DebugMode then
				call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "Difficulty was set to " + SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString())) + "%")
				call SetPlayerHandicapBJ(Player(13), S2R(SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString()))))
				call SetPlayerHandicapBJ(Player(14), S2R(SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString()))))
				call SetPlayerHandicapBJ(Player(15), S2R(SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString()))))
				call SetPlayerHandicapBJ(Player(16), S2R(SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString()))))
		endif
	elseif ( SubStringBJ(GetEventPlayerChatString(), 1, 6) == "-give " ) then
		call GiveGold()
	elseif ( SubStringBJ(GetEventPlayerChatString(), 1, 6) == "-send " ) then
		call GiveGold()
	elseif ( SubStringBJ(GetEventPlayerChatString(), 1, 7) == "-allow " ) then
		call AllowSpecificPlayer()
	elseif ( SubStringBJ(GetEventPlayerChatString(), 1, 6) == "-deny " ) then
		call DenySpecificPlayer()
	elseif ( SubStringBJ(GetEventPlayerChatString(), 1, 9) == "-allowall" ) then
		call AllowAllPlayers()
		call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "ALL players are now |cFF00FF00allowed|r to build in your spawn!")
	elseif ( SubStringBJ(GetEventPlayerChatString(), 1, 8) == "-denyall" ) then
		call DenyAllPlayers()
		call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "ALL players are now |cFFFF0000denied|r access to your spawn!")
	elseif ( GetEventPlayerChatString() == "-claim" ) then
		call DenyAllPlayers()
		call AllowAllPlayers()
		call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "All towers in your spawn has now been claimed.")
	elseif ( SubStringBJ(GetEventPlayerChatString(), 1, 6) == "-zoom " ) then
		if ( GetLocalPlayer() == p ) then
			call SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, S2I(SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString()))), 1)
		endif
	elseif ( SubStringBJ(GetEventPlayerChatString(), 1, 5) == "-cam " ) then
		if ( GetLocalPlayer() == p ) then
			call SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, S2I(SubStringBJ(GetEventPlayerChatString(), 6, StringLength(GetEventPlayerChatString()))), 1)
		endif
	elseif ( SubStringBJ(GetEventPlayerChatString(), 1, 6) == "-wave " ) then
		if udg_DebugMode then
			set udg_CreepLevel=S2I(SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString())))
		endif
	endif
endfunction

//===========================================================================
function InitTrig_Commands takes nothing returns nothing
	set udg_trigger43=CreateTrigger()
	call TriggerRegisterPlayerChatEvent(udg_trigger43, Player(0), "-", false)
	call TriggerRegisterPlayerChatEvent(udg_trigger43, Player(1), "-", false)
	call TriggerRegisterPlayerChatEvent(udg_trigger43, Player(2), "-", false)
	call TriggerRegisterPlayerChatEvent(udg_trigger43, Player(3), "-", false)
	call TriggerRegisterPlayerChatEvent(udg_trigger43, Player(4), "-", false)
	call TriggerRegisterPlayerChatEvent(udg_trigger43, Player(5), "-", false)
	call TriggerRegisterPlayerChatEvent(udg_trigger43, Player(6), "-", false)
	call TriggerRegisterPlayerChatEvent(udg_trigger43, Player(7), "-", false)
	call TriggerRegisterPlayerChatEvent(udg_trigger43, Player(8), "-", false)
	call TriggerRegisterPlayerChatEvent(udg_trigger43, Player(9), "-", false)
	call TriggerRegisterPlayerChatEvent(udg_trigger43, Player(10), "-", false)
	call TriggerRegisterPlayerChatEvent(udg_trigger43, Player(11), "-", false)
	call TriggerRegisterPlayerChatEvent(udg_trigger43, Player(12), "-", false)
	call TriggerAddAction(udg_trigger43, function PlayerChatCommandActions)
endfunction

//===========================================================================
// Trigger: RaceSelection
//===========================================================================
function GetArrayIdFromItemSoldId takes nothing returns integer
	if ( GetItemTypeId(GetSoldItem()) == 'I001' ) then // Demon Portal
		return 1
	elseif ( GetItemTypeId(GetSoldItem()) == 'I002' ) then // Undead Necropolis
		return 2
	elseif ( GetItemTypeId(GetSoldItem()) == 'I003' ) then // Aviaries
		return 3
	elseif ( GetItemTypeId(GetSoldItem()) == 'I004' ) then // High Elf Barracks
		return 4
	elseif ( GetItemTypeId(GetSoldItem()) == 'I005' ) then // Chaos Orc Barracks
		return 5
	elseif ( GetItemTypeId(GetSoldItem()) == 'I006' ) then // Human Town Hall
		return 6
	elseif ( GetItemTypeId(GetSoldItem()) == 'I007' ) then // Orc Stronghold
		return 7
	elseif ( GetItemTypeId(GetSoldItem()) == 'I025' ) then // High Elf Farm
		return 8
	elseif ( GetItemTypeId(GetSoldItem()) == 'I009' ) then // Giant's Hall
		return 9
	//elseif(GetItemTypeId(GetSoldItem()) == '')then // The Unique
	//	return 10
	elseif ( GetItemTypeId(GetSoldItem()) == 'I00B' ) then // The Summons
		return 11
	elseif ( GetItemTypeId(GetSoldItem()) == 'I00C' ) then // Arachnid Hive
		return 12
	elseif ( GetItemTypeId(GetSoldItem()) == 'I00D' ) then // Dranei Haven
		return 13
	elseif ( GetItemTypeId(GetSoldItem()) == 'I00E' ) then // Dragon Roost
		return 14
	elseif ( GetItemTypeId(GetSoldItem()) == 'I00F' ) then // Night Elf
		return 15
	elseif ( GetItemTypeId(GetSoldItem()) == 'I00H' ) then // Tavern
		return 17
	elseif ( GetItemTypeId(GetSoldItem()) == 'I00I' ) then // Corrupted Night Elves
		return 18
	// elseif(GetItemTypeId(GetSoldItem()) == 'I00J')then // Goblin War Room
	//	return 19
	elseif ( GetItemTypeId(GetSoldItem()) == 'I000' ) then // Caerbannog
		return 21
	elseif ( GetItemTypeId(GetSoldItem()) == 'I00L' ) then // Critters UNITE
		return 22
	elseif ( GetItemTypeId(GetSoldItem()) == 'I00M' ) then // Gnoll Republic
		return 23
	elseif ( GetItemTypeId(GetSoldItem()) == 'I00N' ) then // Angel's Gateway
		return 24
	elseif ( GetItemTypeId(GetSoldItem()) == 'I00P' ) then // Alliance Of Blades
		return 25
	elseif ( GetItemTypeId(GetSoldItem()) == 'I00Q' ) then // Cavernous Creatures
		return 26
	elseif ( GetItemTypeId(GetSoldItem()) == 'I00O' ) then // Forest Troll Hut
		return 27
	elseif ( GetItemTypeId(GetSoldItem()) == 'I00R' ) then // Ice Troll Hut
		return 28
	elseif ( GetItemTypeId(GetSoldItem()) == 'I00T' ) then // Temple Of The Damned
		return 30
	elseif ( GetItemTypeId(GetSoldItem()) == 'I00U' ) then // Dwarven Mine
		return 31
	elseif ( GetItemTypeId(GetSoldItem()) == 'I00Z' ) then // Galaxy
		return 32
	elseif ( GetItemTypeId(GetSoldItem()) == 'I019' ) then // Void Cult
		return 33
	elseif ( GetItemTypeId(GetSoldItem()) == 'I01A' ) then // Worker's Union
		return 34
	endif
	
	return - 1
endfunction

function GiveBuyingPlayerBuilderWithId takes integer id returns nothing
 local real x= GetRectCenterX(udg_PlayerRestrictionArea[GetPlayerId(GetOwningPlayer(GetBuyingUnit()))])
 local real y= GetRectCenterY(udg_PlayerRestrictionArea[GetPlayerId(GetOwningPlayer(GetBuyingUnit()))])

	if ( id == 'h02T' ) then // Void
		set udg_VoidCultBuilder[GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit()))]=CreateUnit(GetOwningPlayer(GetBuyingUnit()), id, x, y, bj_UNIT_FACING)
		call UnitAddItemByIdSwapped('I01Y', udg_VoidCultBuilder[GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit()))])
		call UnitAddItemByIdSwapped('I01Z', udg_VoidCultBuilder[GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit()))])
		call UnitAddItemByIdSwapped('I020', udg_VoidCultBuilder[GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit()))])
		call UnitAddItemByIdSwapped('I01X', udg_VoidCultBuilder[GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit()))])
	else
		call CreateUnit(GetOwningPlayer(GetBuyingUnit()), id, x, y, bj_UNIT_FACING)
	endif

endfunction

function IsIndexDisabled takes integer indx returns boolean
	if ( indx == 16 ) then
		return true
	endif
	if ( indx == 19 ) then
		return true
	endif
	if ( indx == 20 ) then
		return true
	endif
	if ( indx == 29 ) then
		return true
	endif

	return false
endfunction

function PlayerAlreadyHasRace takes integer r returns boolean
local integer i= 0
loop
	exitwhen i > udg_PlayerRaceCounter
	if ( udg_PlayerRaceSelection[i] == r ) then
		return true
	endif
	set i=i + 1
endloop

return false
endfunction

function HardcoreRandomRace takes nothing returns nothing
 local integer Rng= GetRandomInt(0, udg_RacesCount)

	if ( IsIndexDisabled(Rng) ) then
		call HardcoreRandomRace()
		return
	endif
	
	if ( PlayerAlreadyHasRace(Rng) ) then
		call HardcoreRandomRace()
		return
	endif

	set udg_PlayerRaceSelection[udg_PlayerRaceCounter]=Rng
	set udg_PlayerRaceCounter=udg_PlayerRaceCounter + 1
	call GiveBuyingPlayerBuilderWithId(udg_RaceArray[Rng])
	call DisplayTextToForce(GetPlayersAll(), udg_PlayerColorCodes[GetPlayerId(GetOwningPlayer(GetBuyingUnit()))] + GetPlayerName(GetOwningPlayer(GetBuyingUnit())) + "|r has |cFFF13737ha|r|cFFF04C36rd|r|cFFEF6334co|r|cFFEF7833re|r randomed " + udg_RaceNameArray[Rng])
endfunction

function RandomRace takes nothing returns nothing
 local integer Rng= GetRandomInt(0, udg_RacesCount)

	if ( IsIndexDisabled(Rng) ) then
		call RandomRace()
		return
	endif
	
	if ( PlayerAlreadyHasRace(Rng) ) then
		call RandomRace()
		return
	endif
	
	set udg_PlayerRaceSelection[udg_PlayerRaceCounter]=Rng
	set udg_PlayerRaceCounter=udg_PlayerRaceCounter + 1
	call GiveBuyingPlayerBuilderWithId(udg_RaceArray[Rng])
	call DisplayTextToForce(GetPlayersAll(), udg_PlayerColorCodes[GetPlayerId(GetOwningPlayer(GetBuyingUnit()))] + GetPlayerName(GetOwningPlayer(GetBuyingUnit())) + "|r has |cFF375FF1ra|r|cFF364CF0nd|r|cFF3535EFom|r|cFF4A34EFed|r " + udg_RaceNameArray[Rng])
endfunction

function HybridRandomRace takes integer playerid returns nothing
 local integer TierOne= GetRandomInt(0, udg_TierOneSize)
 local integer TierTwo= GetRandomInt(0, udg_TierTwoSize)
 local integer TierThree= GetRandomInt(0, udg_TierThreeSize)
 local integer TierFour= GetRandomInt(0, udg_TierFourSize)
 local integer TierFive= GetRandomInt(0, udg_TierFiveSize)
 local integer TierSix= GetRandomInt(0, udg_TierSixSize)
 local integer TierSeven= GetRandomInt(0, udg_TierSevenSize)
 local integer TierEight= GetRandomInt(0, udg_TierEightSize)
 local integer TierNine= GetRandomInt(0, udg_TierNineSize)
 local integer i= 0
 local real x= GetRectCenterX(udg_PlayerRestrictionArea[playerid])
 local real y= GetRectCenterY(udg_PlayerRestrictionArea[playerid])
 local unit Builder
 local unit BuilderTwo
	if not ( udg_HasHybridRandomed[playerid] ) then
		set Builder=CreateUnit(Player(playerid), 'e00I', x, y, 0.0)
		set BuilderTwo=CreateUnit(Player(playerid), 'e001', x, y, 0.0)
	endif
	set udg_HasHybridRandomed[playerid]=true

	loop
		exitwhen i > udg_TierOneSize
		if ( i != TierOne ) then
			call SetPlayerUnitAvailableBJ(udg_TierOneTowers[i], false, Player(playerid))
		else
			call SetPlayerUnitAvailableBJ(udg_TierOneTowers[i], true, Player(playerid))
		endif
		set i=i + 1
	endloop

	set i=0
	loop
		exitwhen i > udg_TierTwoSize
		if ( i != TierTwo ) then
			call SetPlayerUnitAvailableBJ(udg_TierTwoTowers[i], false, Player(playerid))
		else
			call SetPlayerUnitAvailableBJ(udg_TierTwoTowers[i], true, Player(playerid))
		endif
		set i=i + 1
	endloop

	set i=0
	loop
		exitwhen i > udg_TierThreeSize
		if ( i != TierThree ) then
			call SetPlayerUnitAvailableBJ(udg_TierThreeTowers[i], false, Player(playerid))
		else
			call SetPlayerUnitAvailableBJ(udg_TierThreeTowers[i], true, Player(playerid))
		endif
		set i=i + 1
	endloop

	set i=0
	loop
		exitwhen i > udg_TierFourSize
		if ( i != TierFour ) then
			call SetPlayerUnitAvailableBJ(udg_TierFourTowers[i], false, Player(playerid))
		else
			call SetPlayerUnitAvailableBJ(udg_TierFourTowers[i], true, Player(playerid))
		endif
		set i=i + 1
	endloop

	set i=0
	loop
		exitwhen i > udg_TierFiveSize
		if ( i != TierFive ) then
			call SetPlayerUnitAvailableBJ(udg_TierFiveTowers[i], false, Player(playerid))
		else
			call SetPlayerUnitAvailableBJ(udg_TierFiveTowers[i], true, Player(playerid))
		endif
		set i=i + 1
	endloop

	set i=0
	loop
		exitwhen i > udg_TierSixSize
		if ( i != TierSix ) then
			call SetPlayerUnitAvailableBJ(udg_TierSixTowers[i], false, Player(playerid))
		else
			call SetPlayerUnitAvailableBJ(udg_TierSixTowers[i], true, Player(playerid))
		endif
		set i=i + 1
	endloop

	set i=0
	loop
		exitwhen i > udg_TierSevenSize
		if ( i != TierSeven ) then
			call SetPlayerUnitAvailableBJ(udg_TierSevenTowers[i], false, Player(playerid))
		else
			call SetPlayerUnitAvailableBJ(udg_TierSevenTowers[i], true, Player(playerid))
		endif
		set i=i + 1
	endloop

	set i=0
	loop
		exitwhen i > udg_TierEightSize
		if ( i != TierEight ) then
			call SetPlayerUnitAvailableBJ(udg_TierEightTowers[i], false, Player(playerid))
		else
			call SetPlayerUnitAvailableBJ(udg_TierEightTowers[i], true, Player(playerid))
		endif
		set i=i + 1
	endloop

	set i=0
	loop
		exitwhen i > udg_TierNineSize
		if ( i != TierNine ) then
			call SetPlayerUnitAvailableBJ(udg_TierNineTowers[i], false, Player(playerid))
		else
			call SetPlayerUnitAvailableBJ(udg_TierNineTowers[i], true, Player(playerid))
		endif
		set i=i + 1
	endloop

	call DisplayTextToForce(GetPlayersAll(), udg_PlayerColorCodes[GetPlayerId(GetOwningPlayer(GetBuyingUnit()))] + GetPlayerName(GetOwningPlayer(GetBuyingUnit())) + "|r has |cFFB0F442hy|r|cFF8CF442b|r|cFF42F4C5r|r|cFF42F4F1id|r randomed!")

	set Builder=null
	set BuilderTwo=null
endfunction

function GetSelectedRace takes nothing returns nothing
 local integer RaceIndex= GetArrayIdFromItemSoldId()

	if ( RaceIndex > 0 ) then
		set udg_PlayerRaceSelection[udg_PlayerRaceCounter]=RaceIndex
		set udg_PlayerRaceCounter=udg_PlayerRaceCounter + 1
		call GiveBuyingPlayerBuilderWithId(udg_RaceArray[RaceIndex])
		call DisplayTextToForce(GetPlayersAll(), udg_PlayerColorCodes[GetPlayerId(GetOwningPlayer(GetBuyingUnit()))] + GetPlayerName(GetOwningPlayer(GetBuyingUnit())) + "|r has chosen " + udg_RaceNameArray[RaceIndex])
	endif
endfunction

function OpenSpawnForPlayer takes integer i returns nothing
 local integer l= StringHash(GetPlayerName(Player(i)))
	if true then
		set udg_IsSpawnOpen[i]=1
	endif
endfunction

function RaceSelectionActions takes nothing returns nothing
 local integer playerid= GetPlayerId(GetOwningPlayer(GetBuyingUnit()))
	call OpenSpawnForPlayer(playerid)
	if ( GetItemTypeId(GetSoldItem()) == 'I00W' ) then // Hardcore random
		if ( udg_HasHybridRandomed[playerid] ) then
			call AdjustPlayerStateBJ(1, GetOwningPlayer(GetBuyingUnit()), PLAYER_STATE_RESOURCE_LUMBER)
			call WarcraftMaulLibrary_DisplayMessageToPlayer("You can only use Hybrid Random!" , playerid)
		else
			if ( not ( udg_HasHardcoreRandomed[playerid] ) ) then
				if ( udg_RepickCounter[playerid] == 0 ) then
					set udg_HasHardcoreRandomed[playerid]=true
					call HardcoreRandomRace()
					call AdjustPlayerStateBJ(50, GetOwningPlayer(GetBuyingUnit()), PLAYER_STATE_RESOURCE_GOLD)
				else
					call AdjustPlayerStateBJ(1, GetOwningPlayer(GetBuyingUnit()), PLAYER_STATE_RESOURCE_LUMBER)
					call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "You can't hardcore random after using normal random!")
				endif
			else
				call AdjustPlayerStateBJ(1, GetOwningPlayer(GetBuyingUnit()), PLAYER_STATE_RESOURCE_LUMBER)
			endif
		endif
	elseif ( GetItemTypeId(GetSoldItem()) == 'I00V' ) then // Normal Random
		if ( udg_HasHybridRandomed[playerid] ) then
			call AdjustPlayerStateBJ(1, GetOwningPlayer(GetBuyingUnit()), PLAYER_STATE_RESOURCE_LUMBER)
			call WarcraftMaulLibrary_DisplayMessageToPlayer("You can only use Hybrid Random!" , playerid)
		else
			if ( udg_RepickCounter[playerid] < 3 ) then
				set udg_RepickCounter[playerid]=udg_RepickCounter[playerid] + 1
			endif
			call AdjustPlayerStateBJ(40 - 10 * udg_RepickCounter[playerid], GetOwningPlayer(GetBuyingUnit()), PLAYER_STATE_RESOURCE_GOLD)
			call RandomRace()
		endif
	elseif ( GetItemTypeId(GetSoldItem()) == 'I00X' ) then // Hybrid Random
		if ( GetBooleanAnd(GetBooleanOr(udg_RepickCounter[playerid] == 0, udg_HasHardcoreRandomed[playerid]), not ( udg_HasNormalPicked[playerid] )) ) then
			call HybridRandomRace(playerid)
			call AdjustPlayerStateBJ(50, GetOwningPlayer(GetBuyingUnit()), PLAYER_STATE_RESOURCE_GOLD)
		else
			call AdjustPlayerStateBJ(1, GetOwningPlayer(GetBuyingUnit()), PLAYER_STATE_RESOURCE_LUMBER)
			call WarcraftMaulLibrary_DisplayMessageToPlayer("You can't hybrid random after using normal / hardcore random / selection!" , playerid)
		endif
	else
		if ( udg_HasHybridRandomed[playerid] ) then
			call AdjustPlayerStateBJ(1, GetOwningPlayer(GetBuyingUnit()), PLAYER_STATE_RESOURCE_LUMBER)
			call WarcraftMaulLibrary_DisplayMessageToPlayer("You can only use Hybrid Random!" , playerid)
		else
			set udg_HasNormalPicked[playerid]=true
			call GetSelectedRace()
		endif
	endif
endfunction

function RaceSelectionConditions takes nothing returns boolean
	if ( GetUnitTypeId(GetSellingUnit()) == 'h03Q' ) then
		return true
	endif
	if ( GetUnitTypeId(GetSellingUnit()) == 'h00H' ) then
		return true
	endif
	if ( GetUnitTypeId(GetSellingUnit()) == 'h00O' ) then
		return true
	endif
	if ( GetUnitTypeId(GetSellingUnit()) == 'h03C' ) then
		return true
	endif
	if ( GetUnitTypeId(GetSellingUnit()) == 'h03K' ) then
		return true
	endif
	return false
endfunction

function SetTierActions takes nothing returns nothing
 local integer playerid= 1
 local integer TierOne= GetRandomInt(0, udg_TierOneSize)
 local integer TierTwo= GetRandomInt(0, udg_TierTwoSize)
 local integer TierThree= GetRandomInt(0, udg_TierThreeSize)
 local integer TierFour= GetRandomInt(0, udg_TierFourSize)
 local integer TierFive= S2I(SubStringBJ(GetEventPlayerChatString(), 4, StringLength(GetEventPlayerChatString())))
 local integer TierSix= GetRandomInt(0, udg_TierSixSize)
 local integer TierSeven= GetRandomInt(0, udg_TierSevenSize)
 local integer TierEight= GetRandomInt(0, udg_TierEightSize)
 local integer TierNine= GetRandomInt(0, udg_TierNineSize)
 local integer i= 0
 local real x= GetRectCenterX(udg_PlayerRestrictionArea[playerid])
 local real y= GetRectCenterY(udg_PlayerRestrictionArea[playerid])
 local unit Builder
 local unit BuilderTwo
	if ( not ( udg_HasHybridRandomed[playerid] ) ) then
		set Builder=CreateUnit(Player(playerid), 'e00I', x, y, 0.0)
		set BuilderTwo=CreateUnit(Player(playerid), 'e001', x, y, 0.0)
	endif
	call DisplayTextToForce(GetPlayersAll(), "Chatstring(" + SubStringBJ(GetEventPlayerChatString(), 4, StringLength(GetEventPlayerChatString())) + ")")
	set udg_HasHybridRandomed[playerid]=true

	loop
		exitwhen i > udg_TierOneSize
		if ( i != TierOne ) then
			call SetPlayerUnitAvailableBJ(udg_TierOneTowers[i], false, Player(playerid))
		else
			call SetPlayerUnitAvailableBJ(udg_TierOneTowers[i], true, Player(playerid))
		endif
		set i=i + 1
	endloop

	set i=0
	loop
		exitwhen i > udg_TierTwoSize
		if ( i != TierTwo ) then
			call SetPlayerUnitAvailableBJ(udg_TierTwoTowers[i], false, Player(playerid))
		else
			call SetPlayerUnitAvailableBJ(udg_TierTwoTowers[i], true, Player(playerid))
		endif
		set i=i + 1
	endloop

	set i=0
	loop
		exitwhen i > udg_TierThreeSize
		if ( i != TierThree ) then
			call SetPlayerUnitAvailableBJ(udg_TierThreeTowers[i], false, Player(playerid))
		else
			call SetPlayerUnitAvailableBJ(udg_TierThreeTowers[i], true, Player(playerid))
		endif
		set i=i + 1
	endloop

	set i=0
	loop
		exitwhen i > udg_TierFourSize
		if ( i != TierFour ) then
			call SetPlayerUnitAvailableBJ(udg_TierFourTowers[i], false, Player(playerid))
		else
			call SetPlayerUnitAvailableBJ(udg_TierFourTowers[i], true, Player(playerid))
		endif
		set i=i + 1
	endloop

	set i=0
	loop
		exitwhen i > udg_TierFiveSize
		if ( i != TierFive ) then
			call SetPlayerUnitAvailableBJ(udg_TierFiveTowers[i], false, Player(playerid))
		else
			call SetPlayerUnitAvailableBJ(udg_TierFiveTowers[i], true, Player(playerid))
		endif
		set i=i + 1
	endloop

	set i=0
	loop
		exitwhen i > udg_TierSixSize
		if ( i != TierSix ) then
			call SetPlayerUnitAvailableBJ(udg_TierSixTowers[i], false, Player(playerid))
		else
			call SetPlayerUnitAvailableBJ(udg_TierSixTowers[i], true, Player(playerid))
		endif
		set i=i + 1
	endloop

	set i=0
	loop
		exitwhen i > udg_TierSevenSize
		if ( i != TierSeven ) then
			call SetPlayerUnitAvailableBJ(udg_TierSevenTowers[i], false, Player(playerid))
		else
			call SetPlayerUnitAvailableBJ(udg_TierSevenTowers[i], true, Player(playerid))
		endif
		set i=i + 1
	endloop

	set i=0
	loop
		exitwhen i > udg_TierEightSize
		if ( i != TierEight ) then
			call SetPlayerUnitAvailableBJ(udg_TierEightTowers[i], false, Player(playerid))
		else
			call SetPlayerUnitAvailableBJ(udg_TierEightTowers[i], true, Player(playerid))
		endif
		set i=i + 1
	endloop

	set i=0
	loop
		exitwhen i > udg_TierNineSize
		if ( i != TierNine ) then
			call SetPlayerUnitAvailableBJ(udg_TierNineTowers[i], false, Player(playerid))
		else
			call SetPlayerUnitAvailableBJ(udg_TierNineTowers[i], true, Player(playerid))
		endif
		set i=i + 1
	endloop

	call DisplayTextToForce(GetPlayersAll(), udg_PlayerColorCodes[GetPlayerId(GetOwningPlayer(GetBuyingUnit()))] + GetPlayerName(GetOwningPlayer(GetBuyingUnit())) + "|r has |cFFB0F442hy|r|cFF8CF442b|r|cFF42F4C5r|r|cFF42F4F1id|r randomed!")

	set Builder=null
	set BuilderTwo=null
endfunction

//===========================================================================
function InitTrig_RaceSelection takes nothing returns nothing
	set udg_trigger45=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(udg_trigger45, EVENT_PLAYER_UNIT_SELL_ITEM)
	call TriggerAddCondition(udg_trigger45, Condition(function RaceSelectionConditions))
	call TriggerAddAction(udg_trigger45, function RaceSelectionActions)

	//set udg_trigger76 = CreateTrigger()
	//call TriggerRegisterPlayerChatEvent(udg_trigger76,Player(0),"-t ",false)
	//call TriggerAddAction(udg_trigger76, function SetTierActions)
endfunction

//===========================================================================
// Trigger: Quests
//===========================================================================
function InitializeQuests takes nothing returns nothing
	call CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "Reimagined v4.1.0b1", "Updates:\n-Updated the damage engine from v3.8.0.0 to v4.0\n-Made the checkpoints unbuildable, there was far too many people abusing the buildable checkpoints\n-Hopefully fixed the Divine Shield\n-Changed a lot of the tower missiles to prevent desync issues\n-Fixed the spam Stop on Naga Slave abuse\n-Increased the cost of the Night Elf Ancient Protector from 150 to 250\n-Added descriptive text to Countess' buildings\n-Added the send command as an alias for give\n-Fixed a bug where darkgreen could block his spawn\n-Rebalanced the Gnoll race\n-Buffed Marine's damage from 5-5 to 7-7\n-Disabled Goblin War Room", "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp")
	call CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "Reimagined v4.0.8", "Updates:\n-Space Runner now has the correct attack speed\n-the -dt command no longer disables upgraded Arachnid towers\n-Alliance of Blades can no longer trade items with non-Alliance towers\n-Fixed some memory leaks\n-Flying units should no longer be detected by the anti-juggle system\n-Created the -give <color> <amount> command\n-Reworked Obsidian Statue\n-Slightly buffed the Human Cold Tower\n-Reworked the Ice Troll Tribe\n-Disabled the Dragon Turtle as it caused desyncs\n-Cripple Aura should lag a bit less now", "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp")
	call CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "Bot Mod v4.0.8", "Updates:\n-Calmed down the desync and lag issues\n-Fixed a few anti-block problems\n-Fixed Adult Green Dragon and Wyvern not working on wave 32", "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp")
	call CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "Bot Mod v4.0.7", "Updates:\n-Various tooltip corrections\n-Changed Cavernous Creatures mana transfer slightly\n-Removed Arachnes roar ability\n-Fixed an exploit with ents spawned by corrupted ancient tower\n-Fixed fallen archer hitting friendly air units\n-Chaos Blademaster is now affected by Forest Troll Emp aura\n-The goblin tesla coil no longer has a BOOM factor\n(GenoHacker)\n-Fixed hybrid someitmes missing a tower", "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp")
	call CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "Bot Mod v4.0.6", "Updates:\n-Fixed Cavern Hydra attack\n-Fixed Cavern Hydra sell value\n-Lazy Fix for cavern turtle using all its mana on its ability\n-Angel Warrior hotkey is now Q\n(GenoHacker)", "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp")
	call CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "Bot Mod v4.0.5", "Updates:\n-The disable tower system has been re-enabled and works properly\n-Replaced Hydra Swamp race with Cavernous Creatures race\n-Increased Death Tower Death Strike chance to 20%\n-Increased Wisp Explosion Aoe to 800\n-Buffed Forest Troll Joker aura slightly\n-Buffed Summons Avatar of Vengeance\n-Buffed Gnolls Tier 1 tower\n-Changed the hotkey of all Tier 1 hotkeys that werent Q, to Q\n-Disabled Shrine of Ultron race\n-Disabled Dark Troll race\n(GenoHacker)", "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp")
	call CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "Bot Mod v4.0.4", "Updates:\n-Changes to the Ancient Protector and items generated by it\n-Changed the icons of several buffs\n-Changed the icon for Mazing Tower\n-Changed Spirit Hawk attack speed to correct value\n-Changed price of Hydra Hatchling to 8 gold\n-Gave Sylvanus Windrunner [High Elves] a projectile, also reduced projectile speed and slightly increased attack speed\n-Fixed Naga Slave spells not triggering\n-Fixed Arachnid Regen Aura and Roar not affecting spiders\n-Corrected coloring and level indicator on God Wand and God Luck items\n-Cracked Barrel will now spawn 2 spiderlings\n-Buffed Rexxar and his summons\n(GenoHacker)", "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp")
	call CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "Bot Mod v4.0.3", "Updates:\n-Fixed not getting a builder when picking Night Elf\n(GenoHacker)", "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp")
	call CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "Bot Mod v4.0.2", "Updates:\n-reworked Night Elves\n-increased range of Thrall's forked lightning\n-decreased Draenei Seer's damage\n-fixed Worker's Union Wisp not autocasting\n-fixed Mild Mannered Chris not autocasting\n-fixed Felguard's autocasting\n-changed Cold Tower's attack to magic\n-(thanks GenoHacker)\n-fixed Morning Person and Walk it Off (effects were 10x stronger than intended, ooops!)", "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp")
	call CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "Bot Mod v4.0.1", "Updates:\n-Alliance of Blades and the Void Cult should now work better\n-fixed Spirit Bear's cost\n-fixed Worker's Union's Orc Peon\n-fixed Forest Troll Emperor's damage boost\n-fixed Dark Green's spawn\n-fixed Maroon's block detection\n-fixed several broken creep buffs\n-added new creep buffs", "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp")
	call CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "Bot Mod v4.0.0", "Updates:\n-fixed Green and Teal's broken spawns\n-created a simple anti-juggle\n-created a script that detects rogue enemies then tries to correct their bad behaviour", "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp")
	call CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "Bot Mod v4.0.0", "Updates:\n-reworked Orc Stronghold\n-reworked Dwarf King tower\n-(GenoHacker)\n-fixed God's Book\n-changed God's Luck description\n-Alliance of Blades attack speed and damage auras of different levels should now stack\n-added effects to all Alliance of Blades items\n-fixed a bug where grey's Fel Hounds didn't spawn\n-made it easier to level up items later for Alliance of Blades\n-buffed Moonlight's Moonstorm ability\n-removed damage boost from Massive Blow\n-nerfed Ogre Magi's damage from 500 to 350 and splash was lowered from 500 to 400\n-lowered Ancient Golem's damage increase from +100 damage every minute to +75\n-heavily nerfed the Chaos Boar's damage\n-fixed Chaos Grunt's damage (his DPS was way below average due to a calculation error I made when I reworked the race)\n-reduced Chaos Pool's attackspeed buff from 100% to 60%\n-massive pathing update and flawed block detection added", "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp")

	call CreateQuestBJ(bj_QUESTTYPE_OPT_DISCOVERED, "Commands", "List of in-game commands\n\n|cffffcc00-waves|r (shows you information about every wave)\n|cffffcc00-air|r (tells you when air waves are coming)\n|cffffcc00-boss|r (Tells you when boss waves are coming)\n|cffffcc00-champion|r (tells you when champion waves are coming)\n|cffffcc00-light|r (tells you when light armored waves are coming)\n|cffffcc00-medium|r (tells you when medium armored waves are coming)\n|cffffcc00-heavy|r (tells you when heavy armored waves are coming)\n|cffffcc00-fortified|r (tells you when fortified armor waves are coming)\n|cffffcc00-hero|r (tells you when hero armored waves are coming)\n|cffffcc00-sellall|r or |cffffcc00-sa|r (sells all towers given to you when a player left)\n|cffffcc00-claim|r (claims ownership of all towers built in your area.)", "ReplaceableTextures\\CommandButtons\\BTNReplay-Loop.blp")
	call CreateQuestBJ(bj_QUESTTYPE_OPT_DISCOVERED, "Commands 2", "List of in-game commands\n\n|cffffcc00-deny <color>|r (denies the specified color access to your spawn and gives their towers to you)\n|cffffcc00-allow <color>|r (allows the specified color access to your spawn)\n|cffffcc00-denyall|r (denies access to your spawn for all players)\n|cffffcc00-allowall|r (allows access to your spawn for all players)\n|cffffcc00-zoom <value>|r (zooms your camera out)\n|cffffcc00-buffs|r (gives detailed information about creep buffs)\n|cffffcc00-dt/-disabletowers|r (disables your basic tier 1 tower that sell for 10 or less gold)\n|cffffcc00-give <color> <amount>|r (gives the specified color a specified amount of gold)", "ReplaceableTextures\\CommandButtons\\BTNReplay-Loop.blp")
	call CreateQuestBJ(bj_QUESTTYPE_OPT_DISCOVERED, "Bugs & Suggestions", "If you find a bug or want to suggest a change or feature for our map please post it on maulbot.com and our developers will happily look into it!\n(Please make your post detailed so it's easier for us to find the bug or implement your feature)", "ReplaceableTextures\\CommandButtons\\BTNReplay-Play.blp")
endfunction

//===========================================================================
function InitTrig_Quests takes nothing returns nothing
	set udg_trigger46=CreateTrigger()
	call TriggerRegisterTimerEventSingle(udg_trigger46, 1.00)
	call TriggerAddAction(udg_trigger46, function InitializeQuests)
endfunction

//===========================================================================
// Trigger: UnitDies
//===========================================================================
function OwnerOfDyingUnitIsCreep takes nothing returns boolean
	if ( GetOwningPlayer(GetDyingUnit()) == Player(13) ) then
		return true
	endif
	if ( GetOwningPlayer(GetDyingUnit()) == Player(14) ) then
		return true
	endif
	if ( GetOwningPlayer(GetDyingUnit()) == Player(15) ) then
		return true
	endif
	if ( GetOwningPlayer(GetDyingUnit()) == Player(16) ) then
		return true
	endif
	return false
endfunction

function UpdateScoreboard takes nothing returns nothing
 local integer playerid= GetPlayerId(GetOwningPlayer(GetKillingUnitBJ()))
	set udg_PlayerKills[playerid]=udg_PlayerKills[playerid] + 1
	if ( udg_PlayerScorePosition[playerid] > 0 ) then
		call MultiboardSetItemValueBJ(udg_Scoreboard, 2, 7 + udg_PlayerScorePosition[playerid], I2S(udg_PlayerKills[playerid]))
	endif
endfunction

function DevourEnemy takes nothing returns nothing
	call BlzSetUnitBaseDamage(GetKillingUnitBJ(), ( BlzGetUnitBaseDamage(GetKillingUnitBJ(), 1) + 1 ), 1)
endfunction

function RockGiantKill takes nothing returns nothing
 local real mana= GetUnitStateSwap(UNIT_STATE_MANA, GetKillingUnitBJ()) + 1.00
	call SetUnitManaBJ(GetKillingUnitBJ(), mana)

	if ( mana > 39 ) then
		call SetUnitManaBJ(GetKillingUnitBJ(), 0.00)
		call ReplaceUnitBJ(GetKillingUnitBJ(), 'h00A', 0)
	endif
endfunction

function Flood takes nothing returns nothing
 local real x= GetUnitX(GetTriggerUnit())
 local real y= GetUnitY(GetTriggerUnit())
 local integer rand= GetRandomInt(0, 359)
 local unit dummyOne= CreateUnit(GetOwningPlayer(GetKillingUnit()), 'u008', x + 10 * CosBJ(rand + 45), y + 10 * SinBJ(rand + 45), 0)
 local unit dummyTwo= CreateUnit(GetOwningPlayer(GetKillingUnit()), 'u008', x + 10 * CosBJ(rand + 135), y + 10 * SinBJ(rand + 135), 0)
 local unit dummyThree= CreateUnit(GetOwningPlayer(GetKillingUnit()), 'u008', x + 10 * CosBJ(rand + 225), y + 10 * SinBJ(rand + 225), 0)
 local unit dummyFour= CreateUnit(GetOwningPlayer(GetKillingUnit()), 'u008', x + 10 * CosBJ(rand + 315), y + 10 * SinBJ(rand + 315), 0)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummyOne)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummyTwo)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummyThree)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummyFour)
	call UnitAddAbilityBJ('A03T', dummyOne)
	call UnitAddAbilityBJ('A03T', dummyTwo)
	call UnitAddAbilityBJ('A03T', dummyThree)
	call UnitAddAbilityBJ('A03T', dummyFour)
	call IssuePointOrder(dummyOne, "carrionswarm", x + 150 * CosBJ(rand + 45), y + 150 * SinBJ(rand + 45))
	call IssuePointOrder(dummyTwo, "carrionswarm", x + 150 * CosBJ(rand + 135), y + 150 * SinBJ(rand + 135))
	call IssuePointOrder(dummyThree, "carrionswarm", x + 150 * CosBJ(rand + 225), y + 150 * SinBJ(rand + 225))
	call IssuePointOrder(dummyFour, "carrionswarm", x + 150 * CosBJ(rand + 315), y + 150 * SinBJ(rand + 315))
	set dummyOne=null
	set dummyTwo=null
	set dummyThree=null
	set dummyFour=null
endfunction

function LootLevelOne takes nothing returns nothing
 local integer rng= GetRandomInt(0, udg_ItemLootLevelOneSize)
 local item tierone= UnitAddItemByIdSwapped(udg_ItemLootLevelOne[rng], GetKillingUnit())
	call SetItemUserData(tierone, rng)
	set tierone=null
endfunction

function DyingUnitIsSpider takes nothing returns boolean
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'n00X' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'n00Y' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'n00Z' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'n00T' ) ) then
        return true
    endif
    return false
endfunction

function RemoveDeadCreeps takes nothing returns nothing
	if ( DyingUnitIsSpider() ) then
		call RemoveUnit(GetDyingUnit())

		return
	endif

	if ( GetUnitAbilityLevel(GetKillingUnit(), 'A067') > 0 ) then
		call BlzSetUnitBaseDamage(GetKillingUnitBJ(), ( BlzGetUnitBaseDamage(GetKillingUnitBJ(), 1) + 1 ), 1) // INLINED!!
	endif
	if ( GetUnitAbilityLevel(GetKillingUnit(), 'A02T') > 0 ) then
		call RockGiantKill()
	endif
	if ( GetUnitAbilityLevel(GetKillingUnit(), 'A03S') > 0 ) then
		call Flood()
	endif
	if ( GetUnitAbilityLevel(GetKillingUnit(), 'A03G') > 0 ) then
		if ( UnitItemInSlotBJ(GetKillingUnitBJ(), 1) == null ) then
			call LootLevelOne()
		endif
	endif
	
	//call RemoveSavedInteger(udg_UnitToCheckpointTable, GetHandleIdBJ(GetDyingUnit()), 0)
	if ( OwnerOfDyingUnitIsCreep() ) then
		call SaveIntegerBJ(0, GetHandleIdBJ(GetDyingUnit()), 0, udg_UnitToCheckpointTable)
		call UpdateScoreboard()
	else
		if GetUnitAbilityLevel(GetDyingUnit(), 'A031') > 0 then
			call WarcraftMaulLibrary_RemoveFromTickArray(GetDyingUnit())
		endif
		
		if GetUnitAbilityLevel(GetDyingUnit(), 'A0A1') > 0 then
			call WarcraftMaulLibrary_RemoveFromEndOfTurnArray(GetDyingUnit())
		endif

		if ( LoadIntegerBJ(0, GetHandleIdBJ(GetDyingUnit()), udg_PlayerLeavesTable) > 0 ) then
			call FlushChildHashtableBJ(GetHandleIdBJ(GetDyingUnit()), udg_PlayerLeavesTable)
		endif
	endif
	
	call TriggerSleepAction(3.00)
	call RemoveUnit(GetDyingUnit())
endfunction

//===========================================================================
function InitTrig_UnitDies takes nothing returns nothing
	set udg_trigger47=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(udg_trigger47, EVENT_PLAYER_UNIT_DEATH)
	call TriggerAddAction(udg_trigger47, function RemoveDeadCreeps)
endfunction

//===========================================================================
// Trigger: TowerAttackTrigger
//===========================================================================
function CastSpellOnAttackedUnitLocation takes string spell returns nothing
 local real x= GetUnitX(GetAttackedUnitBJ())
 local real y= GetUnitY(GetAttackedUnitBJ())
	call IssuePointOrder(GetAttacker(), spell, x, y)
endfunction

function GenericTowerAttackTrigger takes nothing returns nothing
	if ( GetUnitTypeId(GetAttacker()) == 'h014' ) then // PoopOnUrPorch
		call IssueTargetOrderBJ(GetAttacker(), "chainlightning", GetAttackedUnitBJ())
	elseif ( GetUnitTypeId(GetAttacker()) == 'h01K' ) then // Goblin Tinker
		call CastSpellOnAttackedUnitLocation("clusterrockets")
	elseif ( GetUnitTypeId(GetAttacker()) == 'h027' ) then // Prawn
		call CastSpellOnAttackedUnitLocation("carrionswarm")
	elseif ( GetUnitTypeId(GetAttacker()) == 'h04M' ) then // Cavern Hermit
		call CastSpellOnAttackedUnitLocation("carrionswarm")
	elseif ( GetUnitTypeId(GetAttacker()) == 'h04T' ) then // Cavern Mushroom
		call IssueImmediateOrderBJ(GetAttacker(), "Locustswarm")
	elseif ( GetUnitTypeId(GetAttacker()) == 'e00E' ) then // Wisp [Night Elf]
		call IssueImmediateOrderBJ(GetAttacker(), "thunderclap")
	// elseif(GetUnitTypeId(GetAttacker())=='h00V')then // Arachne
		// call IssueImmediateOrderBJ(GetAttacker(),"roar")
	elseif ( GetUnitTypeId(GetAttacker()) == 'h02F' ) then // Void Priest
		call IssueTargetOrderBJ(GetAttacker(), "frostnova", GetAttackedUnitBJ())
	elseif ( GetUnitTypeId(GetAttacker()) == 'oC58' ) then // Kodo Beast
		call IssueTargetOrderBJ(GetAttacker(), "devour", GetAttackedUnitBJ())
	elseif ( GetUnitTypeId(GetAttacker()) == 'o00E' ) then // Berserker
		call IssueImmediateOrderBJ(GetAttacker(), "berserk")
	elseif ( GetUnitTypeId(GetAttacker()) == 'h00F' ) then // Demonized Dreadlord
		call IssueImmediateOrderBJ(GetAttacker(), "berserk")
	elseif ( GetUnitTypeId(GetAttacker()) == 'eC93' ) then // Kil'jaeden
		call CastSpellOnAttackedUnitLocation("rainofchaos")
	elseif ( GetUnitTypeId(GetAttacker()) == 'h03H' ) then // Wisp (Union)
		call IssueImmediateOrderBJ(GetAttacker(), "stomp")
	elseif ( GetUnitTypeId(GetAttacker()) == 'h01M' ) then // Void Fissure
		call IssueImmediateOrderBJ(GetAttacker(), "roar")
	elseif ( GetUnitTypeId(GetAttacker()) == 'o01A' ) then // Parasitic Broodmother
		call IssueTargetOrderBJ(GetAttacker(), "parasite", GetAttackedUnitBJ())
	elseif ( GetUnitTypeId(GetAttacker()) == 'h01I' ) then // Fire Pandaren
		call CastSpellOnAttackedUnitLocation("breathoffire")
	elseif ( GetUnitTypeId(GetAttacker()) == 'h01F' ) then // Earth Pandaren
		call IssueTargetOrderBJ(GetAttacker(), "drunkenhaze", GetAttackedUnitBJ())
	elseif ( GetUnitTypeId(GetAttacker()) == 'h04F' ) then // Draenei Seer
		call IssueTargetOrderBJ(GetAttacker(), "lightningshield", GetAttackedUnitBJ())
	elseif ( GetUnitTypeId(GetAttacker()) == 'h00I' ) then // Akama
		call IssueImmediateOrderBJ(GetAttacker(), "spiritwolf")
	elseif ( GetUnitTypeId(GetAttacker()) == 'h04I' ) then // Salamander Lord
		call IssueImmediateOrderBJ(GetAttacker(), "stomp")
	elseif ( GetUnitTypeId(GetAttacker()) == 'h02P' ) then // Diablo Kart
		call CastSpellOnAttackedUnitLocation("shockwave")
	elseif ( GetUnitTypeId(GetAttacker()) == 'h02N' ) then // Undead Kart
		call IssueTargetOrderBJ(GetAttacker(), "lightningshield", GetAttackedUnitBJ())
	elseif ( GetUnitTypeId(GetAttacker()) == 'hC87' ) then // Blue Dragon Whelp
		call IssueTargetOrderBJ(GetAttacker(), "slow", GetAttackedUnitBJ())
	elseif ( GetUnitTypeId(GetAttacker()) == 'hC36' ) then // Gyrocopter
		call IssueTargetOrderBJ(GetAttacker(), "chainlightning", GetAttackedUnitBJ())
	elseif ( GetUnitTypeId(GetAttacker()) == 'n010' ) then // Orc Juggernaut
		call CastSpellOnAttackedUnitLocation("clusterrockets")
	elseif ( GetUnitTypeId(GetAttacker()) == 'o00G' ) then // Flesh Golem
		call IssueImmediateOrderBJ(GetAttacker(), "berserk")
	elseif ( GetUnitTypeId(GetAttacker()) == 'o00T' ) then // Blademaster
		call IssueImmediateOrderBJ(GetAttacker(), "whirlwind")
	elseif ( GetUnitTypeId(GetAttacker()) == 'o00N' ) then // Kael
		call IssueImmediateOrderBJ(GetAttacker(), "Locustswarm")
	elseif ( GetUnitTypeId(GetAttacker()) == 'h00P' ) then // Queen Alexstrasza
		call CastSpellOnAttackedUnitLocation("breathoffrost")
	elseif ( GetUnitTypeId(GetAttacker()) == 'e008' ) then // Warden
		call IssueImmediateOrderBJ(GetAttacker(), "fanofknives")
	elseif ( GetUnitTypeId(GetAttacker()) == 'h026' ) then // Lava Spawn
		call IssueImmediateOrderBJ(GetAttacker(), "thunderclap")
	elseif ( GetUnitTypeId(GetAttacker()) == 'h03B' ) then // Pit Lord
		call CastSpellOnAttackedUnitLocation("rainoffire")
	elseif ( GetUnitTypeId(GetAttacker()) == 'e00P' ) then // Star Chaser
		call IssueImmediateOrderBJ(GetAttacker(), "starfall")
	elseif ( GetUnitTypeId(GetAttacker()) == 'e00R' ) then // Celestial Mist
		call IssueImmediateOrderBJ(GetAttacker(), "starfall")
	elseif ( GetUnitTypeId(GetAttacker()) == 'h037' ) then // Crypt Lord
		call CastSpellOnAttackedUnitLocation("impale")
	elseif ( GetUnitTypeId(GetAttacker()) == 'n054' ) then // MissyisVERYPissy
		call IssueTargetOrderBJ(GetAttacker(), "bloodlust", GetAttacker())
	elseif ( GetUnitTypeId(GetAttacker()) == 'n04R' ) then // MissyisPissy
		call IssueTargetOrderBJ(GetAttacker(), "bloodlust", GetAttacker())
	elseif ( GetUnitTypeId(GetAttacker()) == 'n04X' ) then // Yah Trick Yah
		call IssueTargetOrderBJ(GetAttacker(), "bloodlust", GetAttacker())
	elseif ( GetUnitTypeId(GetAttacker()) == 'n04K' ) then // Mild-Mannered Chris
		call IssueTargetOrderBJ(GetAttacker(), "bloodlust", GetAttacker())
	elseif ( GetUnitTypeId(GetAttacker()) == 'n052' ) then // Duke CrustyKrab
		call IssueTargetOrderBJ(GetAttacker(), "chainlightning", GetAttackedUnitBJ())
	elseif ( GetUnitTypeId(GetAttacker()) == 'n04Z' ) then // Lord A.O.E
		call IssueTargetOrderBJ(GetAttacker(), "frostnova", GetAttackedUnitBJ()) // GenericTow
	elseif ( GetUnitTypeId(GetAttacker()) == 'n053' ) then // OhMyEFFTW
		call IssueImmediateOrderBJ(GetAttacker(), "roar")
	elseif ( GetUnitTypeId(GetAttacker()) == 'n04S' ) then // BrandTheOne
		call IssueTargetOrderBJ(GetAttacker(), "transmute", GetAttackedUnitBJ())
	elseif ( GetUnitTypeId(GetAttacker()) == 'n04P' ) then // OhMyWTEFF
		call IssueImmediateOrderBJ(GetAttacker(), "roar")
	elseif ( GetUnitTypeId(GetAttacker()) == 'n04W' ) then // Th3 B3AST
		call IssueImmediateOrderBJ(GetAttacker(), "stomp")
	elseif ( GetUnitTypeId(GetAttacker()) == 'n04V' ) then // The B3ast
		call IssueImmediateOrderBJ(GetAttacker(), "stomp")
	elseif ( GetUnitTypeId(GetAttacker()) == 'n04J' ) then // TH3 B34ST
		call IssueImmediateOrderBJ(GetAttacker(), "stomp")
	elseif ( GetUnitTypeId(GetAttacker()) == 'n04M' ) then // Lord D.O.T
		call CastSpellOnAttackedUnitLocation("rainoffire")
	elseif ( GetUnitTypeId(GetAttacker()) == 'h031' ) then // Priestess Of The Moon
		call IssueImmediateOrderBJ(GetAttacker(), "starfall")
	elseif ( GetUnitTypeId(GetAttacker()) == 'n05N' ) then // Flying Dwarf
		call CastSpellOnAttackedUnitLocation("clusterrockets")
	elseif ( GetUnitTypeId(GetAttacker()) == 'n05C' ) then // Sir Galahad the Pure
		call IssueImmediateOrderBJ(GetAttacker(), "spiritwolf")
	elseif ( GetUnitTypeId(GetAttacker()) == 'h042' ) then // Arrow Tower
		call IssueTargetOrderBJ(GetAttacker(), "slow", GetAttackedUnitBJ())
	elseif ( GetUnitTypeId(GetAttacker()) == 'n03I' ) then // Forest Troll High Priest
		call CastSpellOnAttackedUnitLocation("monsoon")
	endif
endfunction

//===========================================================================
function InitTrig_TowerAttackTrigger takes nothing returns nothing
	set udg_trigger49=CreateTrigger()
	call TriggerRegisterPlayerUnitEventSimple(udg_trigger49, Player(13), EVENT_PLAYER_UNIT_ATTACKED)
	call TriggerRegisterPlayerUnitEventSimple(udg_trigger49, Player(14), EVENT_PLAYER_UNIT_ATTACKED)
	call TriggerRegisterPlayerUnitEventSimple(udg_trigger49, Player(15), EVENT_PLAYER_UNIT_ATTACKED)
	call TriggerRegisterPlayerUnitEventSimple(udg_trigger49, Player(16), EVENT_PLAYER_UNIT_ATTACKED)
	call TriggerAddAction(udg_trigger49, function GenericTowerAttackTrigger)
endfunction

//===========================================================================
// Trigger: Construction
//===========================================================================
function AddElementalistAbilities takes nothing returns nothing
 local integer rng= GetRandomInt(0, udg_ElementalistAbilitiesSize)
 local integer array nums
 local integer i= 0
 local integer currentability
	
	loop
		exitwhen i > udg_ElementalistAbilitiesSize
		set nums[i]=i
		set i=i + 1
	endloop

	set i=0
	loop
		exitwhen i > 2
		set currentability=GetRandomInt(0, udg_ElementalistAbilitiesSize - i)
		call UnitAddAbilityBJ(udg_ElementalistAbilities[nums[currentability]], GetTriggerUnit())
		// call DisplayTextToForce( GetPlayersAll(), GetAbilityName(udg_ElementalistAbilities[nums[currentability]]) )
		set nums[udg_ElementalistAbilitiesSize - i]=nums[udg_ElementalistAbilitiesSize - i] + nums[currentability]
		set nums[currentability]=nums[udg_ElementalistAbilitiesSize - i] - nums[currentability]
		set nums[udg_ElementalistAbilitiesSize - i]=nums[udg_ElementalistAbilitiesSize - i] - nums[currentability]
		set i=i + 1
	endloop
endfunction

function InitializeCriticalStrikeGroupConditions takes nothing returns nothing
	if not IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) then
		return
	endif

	if GetFilterUnit() == GetTriggerUnit() then
		return
	endif

	if ( GetUnitAbilityLevel(GetFilterUnit(), 'A0CN') > 0 ) then
		return
	endif

	call UnitAddAbilityBJ('A0CN', GetFilterUnit())
endfunction

function InitializeCriticalStrike takes nothing returns nothing
 local location loc= GetUnitLoc(GetTriggerUnit())
 local group grp= GetUnitsInRangeOfLocMatching(182.00, loc, Condition(function InitializeCriticalStrikeGroupConditions))

	call RemoveLocation(loc)
	call DestroyGroup(grp)
	set loc=null
	set grp=null
endfunction

function ContructionFinishedActions takes nothing returns nothing
	call UnitRemoveAbilityBJ('ARal', GetTriggerUnit())

	if ( GetUnitTypeId(GetTriggerUnit()) == 'h03O' ) then
		call IssueImmediateOrderBJ(GetTriggerUnit(), "chemicalrage")
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'n00A' ) then
		call AddElementalistAbilities()
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'n04O' ) then
		call SetUnitVertexColorBJ(GetTriggerUnit(), GetRandomReal(0, 100.00), GetRandomReal(0, 100.00), GetRandomReal(0, 100.00), 0)
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'n01B' ) then
		call InitializeCriticalStrike()
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h01D' ) then
		if udg_ForestTrollShadowPriest == 0 then
			call EnableTrigger(gg_trg_BattleRoar)
		endif
		set udg_ForestTrollShadowPriest=udg_ForestTrollShadowPriest + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h01F' ) then
		if udg_EarthPandaren == 0 then
			call EnableTrigger(gg_trg_DrunkenHaze)
		endif
		set udg_EarthPandaren=udg_EarthPandaren + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h00R' ) then
		if udg_SacrificialPit == 0 then
			call EnableTrigger(gg_trg_SacrificeDamage)
		endif
		set udg_SacrificialPit=udg_SacrificialPit + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'n00N' ) then
		if udg_CorruptedAncientofWar == 0 then
			call EnableTrigger(gg_trg_ForceOfNature)
		endif
		set udg_CorruptedAncientofWar=udg_CorruptedAncientofWar + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'e00S' ) then
		if udg_Moonlight == 0 then
			call EnableTrigger(gg_trg_Moonstorm)
		endif
		set udg_Moonlight=udg_Moonlight + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h00W' ) then
		if udg_NerubianBehemoth == 0 then
			call EnableTrigger(gg_trg_CrushedDamage)
		endif
		set udg_NerubianBehemoth=udg_NerubianBehemoth + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h03E' ) then
		if udg_OrcPeon == 0 then
			call EnableTrigger(gg_trg_WorkersUnionOrcPeon)
		endif
		set udg_OrcPeon=udg_OrcPeon + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h03F' ) then
		if udg_HumanPeasant == 0 then
			call EnableTrigger(gg_trg_WorkersUnionHumanPeasant)
		endif
		set udg_HumanPeasant=udg_HumanPeasant + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h03G' ) then
		if udg_NagaSlave == 0 then
			call EnableTrigger(gg_trg_WorkersUnionNagaSlave)
		endif
		set udg_NagaSlave=udg_NagaSlave + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h03I' ) then
		if udg_UndeadAcolyte == 0 then
			call EnableTrigger(gg_trg_WorkersUnionUndeadAcolyte)
		endif
		set udg_UndeadAcolyte=udg_UndeadAcolyte + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h03H' ) then
		if udg_NightElfWisp == 0 then
			call EnableTrigger(gg_trg_WorkersUnionNightElfWisp)
		endif
		set udg_NightElfWisp=udg_NightElfWisp + 1
	elseif ( GetUnitAbilityLevelSwapped('A08X', GetTriggerUnit()) == 1 ) then
		if udg_FrostAttack == 0 then
			call EnableTrigger(gg_trg_FrostAttack)
		endif
		set udg_FrostAttack=udg_FrostAttack + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'n00P' ) then
		if udg_CorruptedTreeofLife == 0 then
			call EnableTrigger(gg_trg_ChainLightningAttack)
		endif
		set udg_CorruptedTreeofLife=udg_CorruptedTreeofLife + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'hC89' ) then
		if udg_AdultGreenDragon == 0 then
			call EnableTrigger(gg_trg_AdultGreenDragon)
		endif
		set udg_AdultGreenDragon=udg_AdultGreenDragon + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'oC60' ) then
		if udg_Wyvern == 0 then
			call EnableTrigger(gg_trg_Wyvern)
		endif
		set udg_Wyvern=udg_Wyvern + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'hC55' ) then
		if udg_Knight == 0 then
			call EnableTrigger(gg_trg_Knight)
		endif
		set udg_Knight=udg_Knight + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'hC92' ) then
		if udg_NetherDragon == 0 then
			call EnableTrigger(gg_trg_AncientNetherDragon)
		endif
		set udg_NetherDragon=udg_NetherDragon + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h01J' ) then
		if udg_StormPandaren == 0 then
			call EnableTrigger(gg_trg_DrunkenBrawler)
		endif
		set udg_StormPandaren=udg_StormPandaren + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'oC35' ) then
		if udg_OgreWarrior == 0 then
			call EnableTrigger(gg_trg_MassiveBlow)
		endif
		set udg_OgreWarrior=udg_OgreWarrior + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h045' ) then
		if udg_VenomTower == 0 then
			call EnableTrigger(gg_trg_VenomTower)
		endif
		set udg_VenomTower=udg_VenomTower + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'e00K' ) then
		if udg_MoonDancer == 0 then
			call EnableTrigger(gg_trg_MoonDancer)
		endif
		set udg_MoonDancer=udg_MoonDancer + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h04Q' ) then
		if udg_CavernDruid == 0 then
			call EnableTrigger(gg_trg_Cavern_Druid_Ability)
		endif
		set udg_CavernDruid=udg_CavernDruid + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h002' ) then
		if udg_Rokhan == 0 then
			call EnableTrigger(gg_trg_Rokhan)
		endif
		set udg_Rokhan=udg_Rokhan + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'oC65' ) then
		if udg_WarchiefThrall == 0 then
			call EnableTrigger(gg_trg_WarchiefThrall)
		endif
		set udg_WarchiefThrall=udg_WarchiefThrall + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'n05Q' ) then
		if udg_DwarfStatue == 0 then
			call EnableTrigger(gg_trg_DwarfStatue)
		endif
		set udg_DwarfStatue=udg_DwarfStatue + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h01A' ) then
		if udg_VoidCorruptor == 0 then
			call EnableTrigger(gg_trg_VoidCorrupter)
		endif
		set udg_VoidCorruptor=udg_VoidCorruptor + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h00T' ) then
		if udg_VoidBeing == 0 then
			call EnableTrigger(gg_trg_VoidBeing)
		endif
		set udg_VoidBeing=udg_VoidBeing + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'o019' ) then
		if udg_AcidSpittingSpider == 0 then
			call EnableTrigger(gg_trg_AcidSpittingSpider)
		endif
		set udg_AcidSpittingSpider=udg_AcidSpittingSpider + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h03W' ) then
		if udg_FelGuard == 0 then
			call EnableTrigger(gg_trg_FelGuard)
		endif
		set udg_FelGuard=udg_FelGuard + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'o00L' ) then
		if udg_Mannoroth == 0 then
			call EnableTrigger(gg_trg_Mannoroth)
		endif
		set udg_Mannoroth=udg_Mannoroth + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'n00U' ) then
		if udg_SummoningShrine == 0 then
			call EnableTrigger(gg_trg_SummoningShrine)
		endif
		set udg_SummoningShrine=udg_SummoningShrine + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h00G' ) then
		if udg_Warden == 0 then
			call EnableTrigger(gg_trg_Warden)
		endif
		set udg_Warden=udg_Warden + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'eC83' ) then
		if udg_Illidan == 0 then
			call EnableTrigger(gg_trg_DemonicIllidan)
		endif
		set udg_Illidan=udg_Illidan + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h00S' ) then
		if udg_CorruptedIllidan == 0 then
			call EnableTrigger(gg_trg_CorruptedIllidan)
		endif
		set udg_CorruptedIllidan=udg_CorruptedIllidan + 1
		set udg_Illidan=udg_Illidan - 1
		if udg_Illidan == 0 then
			call DisableTrigger(gg_trg_CorruptedIllidan)
		endif
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h04M' ) then
		if udg_CavernHermit == 0 then
			call EnableTrigger(gg_trg_CavernHermit)
		endif
		set udg_CavernHermit=udg_CavernHermit + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h04N' ) then
		if udg_CavernTurtle == 0 then
			call EnableTrigger(gg_trg_CavernTurtle)
		endif
		set udg_CavernTurtle=udg_CavernTurtle + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'h04O' ) then
		if udg_CavernRevenant == 0 then
			call EnableTrigger(gg_trg_CavernRevenant)
		endif
		set udg_CavernRevenant=udg_CavernRevenant + 1
	elseif ( GetUnitTypeId(GetTriggerUnit()) == 'n01A' ) then
		if udg_IceTrollJoker == 0 then
			call EnableTrigger(gg_trg_IceTrollJoker)
		endif
		set udg_IceTrollJoker=udg_IceTrollJoker + 1
	endif
	if ( GetUnitAbilityLevel(GetTriggerUnit(), 'A031') > 0 ) then
		call WarcraftMaulLibrary_AddToTickArray(GetTriggerUnit())
	endif
	if GetUnitAbilityLevel(GetTriggerUnit(), 'A0A1') > 0 then
		call WarcraftMaulLibrary_AddToEndOfTurnArray(GetTriggerUnit())
	endif
	if ( udg_PlayerHasBuilt[GetPlayerId(GetOwningPlayer(GetTriggerUnit()))] ) then
		set udg_PlayerHasBuilt[GetPlayerId(GetOwningPlayer(GetTriggerUnit()))]=true
	endif
	
endfunction

//===========================================================================
function InitTrig_Construction takes nothing returns nothing
	set udg_trigger48=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(udg_trigger48, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
	call TriggerRegisterAnyUnitEventBJ(udg_trigger48, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
	call TriggerAddAction(udg_trigger48, function ContructionFinishedActions)
endfunction

//===========================================================================
// Trigger: RemoveBuilder
//===========================================================================
function RemoveBuilderAction takes nothing returns nothing
	call RemoveUnit(GetTriggerUnit())
endfunction

function RemoveBuilderCondition takes nothing returns boolean
	if ( GetSpellAbilityId() == 'A076' ) then
		return true
	endif
	return false
endfunction

//===========================================================================
function InitTrig_RemoveBuilder takes nothing returns nothing
	set udg_trigger51=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(udg_trigger51, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(udg_trigger51, Condition(function RemoveBuilderCondition))
	call TriggerAddAction(udg_trigger51, function RemoveBuilderAction)
endfunction//===========================================================================
// Trigger: PlayerLeaves
//===========================================================================
function IsPickedUnitNotATower takes nothing returns boolean
	if IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE) then
		return false
	endif

	return true
endfunction

function IsPickedUnitOwnedByTriggeringPlayer takes nothing returns boolean
	if not ( GetOwningPlayer(GetEnumUnit()) == GetTriggerPlayer() ) then
		return false
	endif

	if not ( GetUnitTypeId(GetEnumUnit()) != 'h03S' ) then
		return false
	endif

	return true
endfunction

function GetRandomPlayerNumber takes nothing returns integer
 local integer Rng= GetRandomInt(0, udg_PlayerCount - 1)
 local integer i= 0
 local integer Count= 0
	loop
		exitwhen i > 12
		if ( GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING ) then
			if ( Count == Rng ) then
				return i
			endif
			set Count=Count + 1
		endif
		set i=i + 1
	endloop
		
	return - 1
endfunction

function GiveRandomTower takes nothing returns nothing
 local integer Rng= GetRandomPlayerNumber()

	if ( Rng != - 1 ) then
		if not IsUnitType(GetEnumUnit(), UNIT_TYPE_TOWNHALL) then
			call SaveIntegerBJ(Rng + 1, 0, GetHandleIdBJ(GetEnumUnit()), udg_PlayerLeavesTable)
		endif
		call SetUnitOwner(GetEnumUnit(), Player(Rng), true)
	endif
endfunction

function DistributeLeavingPlayersTowers takes nothing returns nothing
	if IsPickedUnitOwnedByTriggeringPlayer() then
		if IsPickedUnitNotATower() then
			call RemoveUnit(GetEnumUnit())
		else
			call GiveRandomTower()
		endif
	endif
endfunction

function DistributePlayerTowers takes nothing returns nothing
 local group grp= GetUnitsInRectAll(GetPlayableMapRect())
	call ForGroupBJ(GetUnitsInRectAll(GetPlayableMapRect()), function DistributeLeavingPlayersTowers)
	call DestroyGroup(grp)
	set grp=null
endfunction

function GiveGoldToPlayersInGame takes integer gold returns nothing
 local integer i= 0
	loop
		exitwhen i > 12
		if ( GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING ) then
			call AdjustPlayerStateBJ(gold, Player(i), PLAYER_STATE_RESOURCE_GOLD)
		endif
		set i=i + 1
	endloop
endfunction

function DistributePlayerGold takes nothing returns nothing
 local integer LeavingPlayerGold= GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD)
 local integer GoldDistribution= LeavingPlayerGold / udg_PlayerCount
 local integer i= 0

	// Make leaving players weak!
	set GoldDistribution=GoldDistribution / 10
	call GiveGoldToPlayersInGame(GoldDistribution)
	loop
		exitwhen i > 12
		if ( GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING ) then
			call DisplayTimedTextToPlayer(Player(i), 0, 0, 5, "You have received |cffffcc00" + I2S(GoldDistribution) + "|r gold from the leaving player!")
		endif
		set i=i + 1
	endloop
endfunction

function ResetSpawnRestrictions takes nothing returns nothing
 local integer i= 0
	loop
		exitwhen i > 168
		set udg_PlayerRestrictions[i]=false
		set i=i + 1
	endloop
endfunction

function PlayerLeftTheGame takes nothing returns nothing
 local integer i= 0

	loop
		exitwhen i > 12
		if ( GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING ) then
			call DisplayTimedTextToPlayer(Player(i), 0, 0, 5, udg_PlayerColorCodes[GetPlayerId(GetTriggerPlayer())] + GetPlayerName(GetTriggerPlayer()) + "|r has left the game!")
		endif
		set i=i + 1
	endloop

	call ResetSpawnRestrictions()
	call TriggerSleepAction(2.00)

	set udg_IsSpawnOpen[GetPlayerId(GetTriggerPlayer())]=0
	
	// Update scoreboard
	call MultiboardSetItemValueBJ(udg_Scoreboard, 1, 7 + udg_PlayerScorePosition[GetPlayerId(GetTriggerPlayer())], udg_PlayerColorCodes[GetPlayerId(GetTriggerPlayer())] + "<Quit>|r")
	
	// Set new player count
	set udg_PlayerCount=udg_PlayerCount - 1

	call DistributePlayerGold()
	call DistributePlayerTowers()
endfunction

function PlayerLeftTheGameConditions takes nothing returns boolean
	if ( udg_TotalLives > 0 ) then
		return true
	endif

	return false
endfunction

//===========================================================================
function InitTrig_PlayerLeaves takes nothing returns nothing
	set udg_trigger52=CreateTrigger()
	call TriggerRegisterPlayerEventLeave(udg_trigger52, Player(0))
	call TriggerRegisterPlayerEventLeave(udg_trigger52, Player(1))
	call TriggerRegisterPlayerEventLeave(udg_trigger52, Player(2))
	call TriggerRegisterPlayerEventLeave(udg_trigger52, Player(3))
	call TriggerRegisterPlayerEventLeave(udg_trigger52, Player(4))
	call TriggerRegisterPlayerEventLeave(udg_trigger52, Player(5))
	call TriggerRegisterPlayerEventLeave(udg_trigger52, Player(6))
	call TriggerRegisterPlayerEventLeave(udg_trigger52, Player(7))
	call TriggerRegisterPlayerEventLeave(udg_trigger52, Player(8))
	call TriggerRegisterPlayerEventLeave(udg_trigger52, Player(9))
	call TriggerRegisterPlayerEventLeave(udg_trigger52, Player(10))
	call TriggerRegisterPlayerEventLeave(udg_trigger52, Player(11))
	call TriggerRegisterPlayerEventLeave(udg_trigger52, Player(12))
	call TriggerAddCondition(udg_trigger52, Condition(function PlayerLeftTheGameConditions))
	call TriggerAddAction(udg_trigger52, function PlayerLeftTheGame)
endfunction

//===========================================================================
// Trigger: SellTower
//===========================================================================
function SellTowerCondition takes nothing returns boolean
	if not ( GetSpellAbilityId() == 'A02D' ) then
		return false
	endif

	return true
endfunction

function SellTowerActions takes nothing returns nothing
	call WarcraftMaulLibrary_SellTower(GetTriggerUnit())
endfunction

//===========================================================================
function InitTrig_SellTower takes nothing returns nothing
	set udg_trigger50=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(udg_trigger50, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(udg_trigger50, Condition(function SellTowerCondition))
	call TriggerAddAction(udg_trigger50, function SellTowerActions)
endfunction

//===========================================================================
// Trigger: MoveArchimonde
//===========================================================================
function ArchimondeBreaksGateActions takes nothing returns nothing
 local real x= 1000.00
 local real y= - 5050.00
	call IssuePointOrder(udg_ArchimondeDummy, "move", x, y)
endfunction

function ArchimondeEntersDestinationCondition takes nothing returns boolean
	if ( GetUnitTypeId(GetEnteringUnit()) == 'u000' ) then
		return true
	endif

	return false
endfunction

function ArchimondeReachesDestinationAction takes nothing returns nothing
	call RemoveUnit(GetEnteringUnit())
endfunction

//===========================================================================
function InitTrig_MoveArchimonde takes nothing returns nothing
 local rect reg= Rect(992.0, - 5216.0, 1056.0, - 4992.0)

	set udg_trigger73=CreateTrigger()
	call TriggerRegisterDeathEvent(udg_trigger73, gg_dest_B000_0160)
	call TriggerAddAction(udg_trigger73, function ArchimondeBreaksGateActions)

	set udg_trigger74=CreateTrigger()
	call TriggerRegisterEnterRectSimple(udg_trigger74, reg)
	call TriggerAddCondition(udg_trigger74, Condition(function ArchimondeEntersDestinationCondition))
	call TriggerAddAction(udg_trigger74, function ArchimondeReachesDestinationAction)
endfunction

//===========================================================================
// Trigger: Artifacts
//===========================================================================
function CursePickedTower takes nothing returns nothing
 local real x= GetUnitX(GetEnumUnit())
 local real y= GetUnitY(GetEnumUnit())
 local unit dummy= CreateUnit(GetOwningPlayer(GetBuyingUnit()), 'u008', x, y, bj_UNIT_FACING)
	call UnitAddAbilityBJ('A01J', dummy) // Artifact Curse
	call IssueTargetOrderBJ(dummy, "cripple", GetEnumUnit())
	call UnitApplyTimedLifeBJ(3.00, 'BTLF', dummy)
	
	set dummy=null
endfunction

function CurseASpawn takes nothing returns nothing
 local real x= GetRectCenterX(udg_PlayerRestrictionArea[GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit()))])
 local real y= GetRectCenterY(udg_PlayerRestrictionArea[GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit()))])
	call CreateUnit(GetOwningPlayer(GetBuyingUnit()), 'u003', x, y, bj_UNIT_FACING)
	call WarcraftMaulLibrary_DisplayMessageToPlayer("You have been |cFFAF2323cursed|r!" , GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit())))
endfunction

function CurseGroupCondition takes nothing returns boolean
	return IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE)
endfunction

function CursePickedTowerMulti takes nothing returns nothing
 local real x= GetUnitX(GetEnumUnit())
 local real y= GetUnitY(GetEnumUnit())
 local unit dummy= CreateUnit(GetOwningPlayer(GetBuyingUnit()), 'u008', x, y, bj_UNIT_FACING)
	call UnitAddAbilityBJ('A064', dummy) // Artifact Curse
	call IssueTargetOrderBJ(dummy, "curse", GetEnumUnit())
	call UnitApplyTimedLifeBJ(3.00, 'BTLF', dummy)
	
	set dummy=null
endfunction

function CurseMultipleTowers takes nothing returns nothing
 local group grp= GetUnitsInRectMatching(udg_PlayerRestrictionArea[GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit()))], Condition(function CurseGroupCondition))
 local group subgrp= GetRandomSubGroup(5, grp)
	call ForGroupBJ(subgrp, function CursePickedTowerMulti)
	call WarcraftMaulLibrary_DisplayMessageToPlayer("You have been |cFFAF2323cursed|r!" , GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit())))
	
	call DestroyGroup(subgrp)
	call DestroyGroup(grp)
	set subgrp=null
	set grp=null
endfunction

function CurseATower takes nothing returns nothing
 local group grp= GetUnitsInRectMatching(udg_PlayerRestrictionArea[GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit()))], Condition(function CurseGroupCondition))
 local group subgrp= GetRandomSubGroup(1, grp)
	call ForGroupBJ(subgrp, function CursePickedTower)
	call WarcraftMaulLibrary_DisplayMessageToPlayer("You have been |cFFAF2323cursed|r!" , GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit())))
	
	call DestroyGroup(subgrp)
	call DestroyGroup(grp)
	set subgrp=null
	set grp=null
endfunction

function ArtifactsActions takes nothing returns nothing
 local integer rng= GetRandomInt(1, 3)
	if ( rng == 1 ) then
		call CurseATower()
	elseif ( rng == 2 ) then
		call CurseASpawn()
	elseif ( rng == 3 ) then
		call CurseMultipleTowers()
	endif

	// call MMD_UpdateValueInt("BUBBLES", GetOwningPlayer(GetBuyingUnit()), MMD_OP_SET, 1)
endfunction

function ArtifactsConditions takes nothing returns boolean
	if ( GetItemTypeId(GetSoldItem()) == 'I00Y' ) then
		return true
	endif

	return false
endfunction

//===========================================================================
function InitTrig_Artifacts takes nothing returns nothing
	set udg_trigger75=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(udg_trigger75, EVENT_PLAYER_UNIT_SELL_ITEM)
	call TriggerAddCondition(udg_trigger75, Condition(function ArtifactsConditions))
	call TriggerAddAction(udg_trigger75, function ArtifactsActions)
endfunction

//===========================================================================
// Trigger: TowerTick
//===========================================================================
function CultActivity takes nothing returns nothing
	call BlzSetUnitBaseDamage(GetEnumUnit(), 14 + IMinBJ(30, R2I(0.10 * udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))])), 1)
endfunction

function GrowingMoss takes nothing returns nothing
 local real mana= GetUnitStateSwap(UNIT_STATE_MANA, GetEnumUnit())
	set mana=mana + 1
	call SetUnitManaBJ(GetEnumUnit(), mana)
	call BlzSetUnitBaseDamage(GetEnumUnit(), BlzGetUnitBaseDamage(GetEnumUnit(), 1) + 75, 1)
	call SaveRealBJ(LoadRealBJ(1, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) + 10.0, 1, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
	call SaveIntegerBJ(LoadIntegerBJ(2, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) + 1, 2, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
	call SetUnitScalePercent(GetEnumUnit(), 30.0 + LoadRealBJ(1, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable), 30.0 + LoadRealBJ(1, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable), 30.0 + LoadRealBJ(1, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable))
	if LoadIntegerBJ(2, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) > 6 then
		call WarcraftMaulLibrary_RemoveFromTickArray(GetEnumUnit())
	endif
endfunction

function Scavenge takes nothing returns nothing
 local integer rng= GetRandomInt(0, udg_ItemLootLevelOneSize)
 local item tierone= UnitAddItemByIdSwapped(udg_ItemLootLevelOne[rng], GetEnumUnit())
	call SetItemUserData(tierone, rng)
	set tierone=null
endfunction

function CursedBook takes nothing returns nothing
 local real x= GetUnitX(GetEnumUnit())
 local real y= GetUnitY(GetEnumUnit())
 local unit dummy= CreateUnit(GetOwningPlayer(GetEnumUnit()), 'u008', x, y, 0)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummy)
	call UnitAddAbilityBJ('A036', dummy)
	call IssueImmediateOrderBJ(dummy, "battleroar")
	set dummy=null
endfunction

function CorruptedAncientProtectorStarfall takes nothing returns nothing
 local real x= GetUnitX(GetEnumUnit())
 local real y= GetUnitY(GetEnumUnit())
 local unit dummy= CreateUnit(GetOwningPlayer(GetEnumUnit()), 'u008', x, y, 0)
	call UnitApplyTimedLifeBJ(11.00, 'BTLF', dummy)
	call UnitAddAbilityBJ('A010', dummy)
	call IssueImmediateOrderBJ(dummy, "starfall")
	set dummy=null
endfunction

function CastBlizzard takes nothing returns nothing
 local real unitX= GetUnitX(GetEnumUnit())
 local real unitY= GetUnitY(GetEnumUnit())
 local real x= unitX + GetRandomReal(0.00, 500.00) - 250.00
 local real y= unitY + GetRandomReal(0.00, 500.00) - 250.00
 local unit dummy= CreateUnit(GetOwningPlayer(GetEnumUnit()), 'u008', x, y, 0)
	call UnitApplyTimedLifeBJ(2.00, 'BTLF', dummy)
	call UnitAddAbilityBJ('A0CO', dummy)
	call IssuePointOrder(dummy, "blizzard", x, y)

	set dummy=null
endfunction

function CastFrostNovaOnFilterUnit takes nothing returns nothing
 local real x= GetUnitX(GetFilterUnit())
 local real y= GetUnitY(GetFilterUnit())
 local unit dummy= CreateUnit(GetOwningPlayer(GetEnumUnit()), 'u008', x, y, 0)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummy)
	call UnitAddAbilityBJ('A08J', dummy)
	call IssueTargetOrderBJ(dummy, "frostnova", GetFilterUnit())

	set dummy=null
endfunction

function FrostNovaGroupConditions takes nothing returns boolean
	if LoadIntegerBJ(1, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) > 0 then
		return false
	endif

	if not IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(GetEnumUnit())) then
		return false
	endif

	if not IsUnitAliveBJ(GetFilterUnit()) then
		return false
	endif

	return true
endfunction

function FrostNovaGroupAction takes nothing returns nothing
	if FrostNovaGroupConditions() then
		call SaveIntegerBJ(1, 1, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
		call CastFrostNovaOnFilterUnit()
	endif
endfunction

function FrostNova takes nothing returns nothing
 local location loc= GetUnitLoc(GetEnumUnit())
 local group grp= GetUnitsInRangeOfLocMatching(500.00, loc, Condition(function FrostNovaGroupAction))
	call SaveIntegerBJ(0, 1, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)

	call RemoveLocation(loc)
	call DestroyGroup(grp)
	set loc=null
	set grp=null
endfunction

function StatueImpale takes nothing returns nothing
 local real x= GetUnitX(GetEnumUnit())
 local real y= GetUnitY(GetEnumUnit())
 local unit dummyOne= CreateUnit(GetOwningPlayer(GetEnumUnit()), 'u008', x + 100 * CosBJ(45), y + 100 * SinBJ(45), 0)
 local unit dummyTwo= CreateUnit(GetOwningPlayer(GetEnumUnit()), 'u008', x + 100 * CosBJ(135), y + 100 * SinBJ(135), 0)
 local unit dummyThree= CreateUnit(GetOwningPlayer(GetEnumUnit()), 'u008', x + 100 * CosBJ(225), y + 100 * SinBJ(225), 0)
 local unit dummyFour= CreateUnit(GetOwningPlayer(GetEnumUnit()), 'u008', x + 100 * CosBJ(315), y + 100 * SinBJ(315), 0)
 local unit dummyFive= CreateUnit(GetOwningPlayer(GetEnumUnit()), 'u008', x + 100 * CosBJ(0), y + 100 * SinBJ(0), 0)
 local unit dummySix= CreateUnit(GetOwningPlayer(GetEnumUnit()), 'u008', x + 100 * CosBJ(90), y + 100 * SinBJ(90), 0)
 local unit dummySeven= CreateUnit(GetOwningPlayer(GetEnumUnit()), 'u008', x + 100 * CosBJ(180), y + 100 * SinBJ(180), 0)
 local unit dummyEight= CreateUnit(GetOwningPlayer(GetEnumUnit()), 'u008', x + 100 * CosBJ(270), y + 100 * SinBJ(270), 0)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummyOne)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummyTwo)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummyThree)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummyFour)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummyFive)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummySix)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummySeven)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummyEight)
	call UnitAddAbilityBJ('A030', dummyOne)
	call UnitAddAbilityBJ('A030', dummyTwo)
	call UnitAddAbilityBJ('A030', dummyThree)
	call UnitAddAbilityBJ('A030', dummyFour)
	call UnitAddAbilityBJ('A030', dummyFive)
	call UnitAddAbilityBJ('A030', dummySix)
	call UnitAddAbilityBJ('A030', dummySeven)
	call UnitAddAbilityBJ('A030', dummyEight)
	
	call IssuePointOrder(dummyOne, "impale", x + 150 * CosBJ(45), y + 150 * SinBJ(45))
	call IssuePointOrder(dummyTwo, "impale", x + 150 * CosBJ(135), y + 150 * SinBJ(135))
	call IssuePointOrder(dummyThree, "impale", x + 150 * CosBJ(225), y + 150 * SinBJ(225))
	call IssuePointOrder(dummyFour, "impale", x + 150 * CosBJ(315), y + 150 * SinBJ(315))
	call IssuePointOrder(dummyFive, "impale", x + 150 * CosBJ(0), y + 150 * SinBJ(0))
	call IssuePointOrder(dummySix, "impale", x + 150 * CosBJ(90), y + 150 * SinBJ(90))
	call IssuePointOrder(dummySeven, "impale", x + 150 * CosBJ(180), y + 150 * SinBJ(180))
	call IssuePointOrder(dummyEight, "impale", x + 150 * CosBJ(270), y + 150 * SinBJ(270))
	set dummyOne=null
	set dummyTwo=null
	set dummyThree=null
	set dummyFour=null
	set dummyFive=null
	set dummySix=null
	set dummySeven=null
	set dummyEight=null
endfunction

function CriticalStrikeGroupConditions takes nothing returns nothing
	if not IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) then
		return
	endif

	if GetFilterUnit() == GetEnumUnit() then
		return
	endif

	if ( GetUnitAbilityLevel(GetFilterUnit(), 'A0CN') > 0 ) then
		return
	endif

	call UnitAddAbilityBJ('A0CN', GetFilterUnit())
endfunction

function AddCriticalStrike takes nothing returns nothing
 local location loc= GetUnitLoc(GetEnumUnit())
 local group grp= GetUnitsInRangeOfLocMatching(182.00, loc, Condition(function CriticalStrikeGroupConditions))

	call RemoveLocation(loc)
	call DestroyGroup(grp)
	set loc=null
	set grp=null
endfunction

function TickTower takes nothing returns nothing
	if GetUnitAbilityLevel(GetEnumUnit(), 'A032') > 0 then
		if LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) > 49 then
			call SaveIntegerBJ(0, 0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
			call StatueImpale()
		else
			call SaveIntegerBJ(LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) + 1, 0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
		endif
	endif
	if GetUnitAbilityLevel(GetEnumUnit(), 'A033') > 0 then
		if LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) > 599 then
			call SaveIntegerBJ(0, 0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
			call GrowingMoss()
		else
			call SaveIntegerBJ(LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) + 1, 0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
		endif
	endif
	if GetUnitAbilityLevel(GetEnumUnit(), 'A035') > 0 then
		if LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) > 99 then
			call SaveIntegerBJ(0, 0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
			call CursedBook()
		else
			call SaveIntegerBJ(LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) + 1, 0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
		endif
	endif
	if GetUnitAbilityLevel(GetEnumUnit(), 'A011') > 0 then
		if LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) > 300 then
			call SaveIntegerBJ(0, 0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
			call CorruptedAncientProtectorStarfall()
		else
			call SaveIntegerBJ(LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) + 1, 0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
		endif
	endif
	if ( GetUnitAbilityLevel(GetEnumUnit(), 'A09M') > 0 ) then
		if LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) > 9 then
			call SaveIntegerBJ(0, 0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
			call BlzSetUnitBaseDamage(GetEnumUnit(), 14 + IMinBJ(30, R2I(0.10 * udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))])), 1) // INLINED!!
		else
			call SaveIntegerBJ(LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) + 1, 0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
		endif
	endif
	if ( GetUnitAbilityLevel(GetEnumUnit(), 'A0AI') > 0 ) then
		if LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) > 300 then
			call SaveIntegerBJ(0, 0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
			if ( UnitItemInSlotBJ(GetEnumUnit(), 1) == null ) then
				call Scavenge()
			endif
		else
			call SaveIntegerBJ(LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) + 1, 0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
		endif
	endif
	if ( GetUnitAbilityLevel(GetEnumUnit(), 'A03O') > 0 ) then
		if LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) > 49 then
			call SaveIntegerBJ(0, 0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
			call FrostNova()
		else
			call SaveIntegerBJ(LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) + 1, 0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
		endif
	endif
	if ( GetUnitAbilityLevel(GetEnumUnit(), 'A0CL') > 0 ) then
		if LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) > 599 then
			call SaveIntegerBJ(0, 0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
			call AddCriticalStrike()
		else
			call SaveIntegerBJ(LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) + 1, 0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
		endif
	endif

	if ( GetUnitAbilityLevel(GetEnumUnit(), 'A0CP') > 0 ) then
		if LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) > 10 then
			call SaveIntegerBJ(0, 0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
			call CastBlizzard()
		else
			call SaveIntegerBJ(LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable) + 1, 0, GetHandleIdBJ(GetEnumUnit()), udg_TowerTickTable)
		endif
	endif
endfunction

function Trig_TowerTick_Actions takes nothing returns nothing
	call ForGroupBJ(udg_TowerTickGroup, function TickTower)
endfunction

//===========================================================================
function InitTrig_TowerTick takes nothing returns nothing
	set gg_trg_TowerTick=CreateTrigger()
	call TriggerRegisterTimerEventPeriodic(gg_trg_TowerTick, 0.10)
	call TriggerAddAction(gg_trg_TowerTick, function Trig_TowerTick_Actions)
endfunction

//===========================================================================
// Trigger: Channel Item
//===========================================================================
function TargetIsAllianceOfBlades takes nothing returns boolean
	if GetUnitTypeId(GetSpellTargetUnit()) == 'n02T' then
		return true
	endif

	if GetUnitTypeId(GetSpellTargetUnit()) == 'n02X' then
		return true
	endif

	if GetUnitTypeId(GetSpellTargetUnit()) == 'n02V' then
		return true
	endif

	if GetUnitTypeId(GetSpellTargetUnit()) == 'n02U' then
		return true
	endif

	if GetUnitTypeId(GetSpellTargetUnit()) == 'n007' then
		return true
	endif

	if GetUnitTypeId(GetSpellTargetUnit()) == 'n02W' then
		return true
	endif

	if GetUnitTypeId(GetSpellTargetUnit()) == 'n012' then
		return true
	endif

	return false
endfunction

function Trig_Channel_Item_Conditions takes nothing returns boolean
	if not ( GetSpellAbilityId() == 'A05H' ) then
		return false
	endif
	
	if not TargetIsAllianceOfBlades() then
		return false
	endif

	return true
endfunction

function Trig_Channel_Item_Actions takes nothing returns nothing
	call UnitAddItemSwapped(UnitItemInSlotBJ(GetTriggerUnit(), 1), GetSpellTargetUnit())
endfunction

//===========================================================================
function InitTrig_Channel_Item takes nothing returns nothing
	set gg_trg_Channel_Item=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(gg_trg_Channel_Item, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(gg_trg_Channel_Item, Condition(function Trig_Channel_Item_Conditions))
	call TriggerAddAction(gg_trg_Channel_Item, function Trig_Channel_Item_Actions)
endfunction

//===========================================================================
// Trigger: Trade
//===========================================================================
function Trig_Trade_Conditions takes nothing returns boolean
	if not ( GetSpellAbilityId() == 'A016' ) then
		return false
	endif

	return true
endfunction

function GiveLevelOneItem takes integer itemdata returns nothing
 local integer rng= GetRandomInt(0, udg_ItemLootLevelOneSize - 1)
	
	if ( rng >= itemdata ) then
		set rng=rng + 1
	endif

	call UnitAddItemByIdSwapped(udg_ItemLootLevelOne[rng], GetTriggerUnit())
endfunction

function TradeItem takes nothing returns nothing
 local integer itemdata= GetItemUserData(UnitItemInSlotBJ(GetTriggerUnit(), 1))
 local real mana= GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) + 1.00
	call SetUnitManaBJ(GetTriggerUnit(), mana)
	call RemoveItem(UnitItemInSlotBJ(GetTriggerUnit(), 1))
	if ( mana > 1 ) then
		call GiveLevelOneItem(itemdata)
		call SetUnitManaBJ(GetTriggerUnit(), 0)
	endif
endfunction

function Trig_Trade_Actions takes nothing returns nothing
	if ( GetItemLevel(UnitItemInSlotBJ(GetTriggerUnit(), 1)) == 1 ) then
		call TradeItem()
	endif
endfunction

//===========================================================================
function InitTrig_Trade takes nothing returns nothing
	set gg_trg_Trade=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(gg_trg_Trade, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(gg_trg_Trade, Condition(function Trig_Trade_Conditions))
	call TriggerAddAction(gg_trg_Trade, function Trig_Trade_Actions)
endfunction

//===========================================================================
// Trigger: Enchantment
//===========================================================================
function Trig_Enchantment_Conditions takes nothing returns boolean
	if not ( GetSpellAbilityId() == 'A03F' ) then
		return false
	endif

	return true
endfunction

function GiveLevelTwoItem takes integer index returns nothing
	call SetItemUserData(UnitAddItemByIdSwapped(udg_ItemLootLevelTwo[index], GetTriggerUnit()), index)
endfunction

function EnchantLevelOneItem takes nothing returns nothing
 local integer itemdata= GetItemUserData(UnitItemInSlotBJ(GetTriggerUnit(), 1))

	call RemoveItem(UnitItemInSlotBJ(GetTriggerUnit(), 1))
	call GiveLevelTwoItem(itemdata)
endfunction

function Trig_Enchantment_Actions takes nothing returns nothing
	if ( GetItemLevel(UnitItemInSlotBJ(GetTriggerUnit(), 1)) == 1 ) then
		call EnchantLevelOneItem()
	else
		call AdjustPlayerStateBJ(5, GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_GOLD)
	endif
endfunction

//===========================================================================
function InitTrig_Enchantment takes nothing returns nothing
	set gg_trg_Enchantment=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(gg_trg_Enchantment, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(gg_trg_Enchantment, Condition(function Trig_Enchantment_Conditions))
	call TriggerAddAction(gg_trg_Enchantment, function Trig_Enchantment_Actions)
endfunction

//===========================================================================
// Trigger: Transfuse
//===========================================================================
function Trig_Transfuse_Conditions takes nothing returns boolean
	if not ( GetSpellAbilityId() == 'A03A' ) then
		return false
	endif

	return true
endfunction

function Trig_Transfuse_Actions takes nothing returns nothing
	if ( GetItemLevel(UnitItemInSlotBJ(GetTriggerUnit(), 1)) == 2 ) then
		call RemoveItem(UnitItemInSlotBJ(GetTriggerUnit(), 1))
		call SetUnitManaBJ(GetTriggerUnit(), GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) + 1.00)
	endif
endfunction

//===========================================================================
function InitTrig_Transfuse takes nothing returns nothing
    set gg_trg_Transfuse=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Transfuse, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Transfuse, Condition(function Trig_Transfuse_Conditions))
    call TriggerAddAction(gg_trg_Transfuse, function Trig_Transfuse_Actions)
endfunction

//===========================================================================
// Trigger: Infuse
//===========================================================================
function Trig_Infuse_Conditions takes nothing returns boolean
    if not ( GetSpellAbilityId() == 'A0A7' ) then
        return false
    endif
    return true
endfunction

function GiveLevelThreeItem takes integer index returns nothing
	call SetItemUserData(UnitAddItemByIdSwapped(udg_ItemLootLevelThree[index], GetTriggerUnit()), index)
endfunction

function Infuse takes nothing returns nothing
 local integer itemdata= GetItemUserData(UnitItemInSlotBJ(GetTriggerUnit(), 1))
 local real mana= GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit())
 local integer rng= GetRandomInt(0, 99)
	call RemoveItem(UnitItemInSlotBJ(GetTriggerUnit(), 1))
	call SetUnitManaBJ(GetTriggerUnit(), 0.00)
	if ( 10.0 * mana > rng ) then
		call GiveLevelThreeItem(itemdata)
	endif
endfunction

function Trig_Infuse_Actions takes nothing returns nothing
	if ( GetItemLevel(UnitItemInSlotBJ(GetTriggerUnit(), 1)) == 2 ) then
		call Infuse()
	endif
endfunction

//===========================================================================
function InitTrig_Infuse takes nothing returns nothing
    set gg_trg_Infuse=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Infuse, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Infuse, Condition(function Trig_Infuse_Conditions))
    call TriggerAddAction(gg_trg_Infuse, function Trig_Infuse_Actions)
endfunction

//===========================================================================
// Trigger: Sacrifice
//===========================================================================
function Trig_Sacrifice_Conditions takes nothing returns boolean
    if not ( GetSpellAbilityId() == 'A0AJ' ) then
        return false
    endif

    return true
endfunction

function GiveLevelFourItem takes integer index returns nothing
	call SetItemUserData(UnitAddItemByIdSwapped(udg_ItemLootLevelFour[index], GetTriggerUnit()), index)
endfunction

function Sacrifice takes nothing returns nothing
 local integer itemdata= GetItemUserData(UnitItemInSlotBJ(GetTriggerUnit(), 1))
 local real mana= GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) + 1.00
	call SetUnitManaBJ(GetTriggerUnit(), mana)
	call RemoveItem(UnitItemInSlotBJ(GetTriggerUnit(), 1))
	if ( mana > 1 ) then
		call GiveLevelFourItem(itemdata)
		call SetUnitManaBJ(GetTriggerUnit(), 0)
	endif
endfunction

function Trig_Sacrifice_Actions takes nothing returns nothing
	if ( GetItemLevel(UnitItemInSlotBJ(GetTriggerUnit(), 1)) == 3 ) then
		call Sacrifice()
	endif
endfunction

//===========================================================================
function InitTrig_Sacrifice takes nothing returns nothing
    set gg_trg_Sacrifice=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Sacrifice, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Sacrifice, Condition(function Trig_Sacrifice_Conditions))
    call TriggerAddAction(gg_trg_Sacrifice, function Trig_Sacrifice_Actions)
endfunction

//===========================================================================
// Trigger: AlchemicalTransmutation
//===========================================================================
function Trig_AlchemicalTransmutation_Conditions takes nothing returns boolean
	if not ( GetSpellAbilityId() == 'A0B0' ) then
		return false
	endif
	return true
endfunction

function GiveLevelThreeItemForTransmutator takes integer index returns nothing
	call SetItemUserData(UnitAddItemByIdSwapped(udg_ItemLootLevelThree[index], GetTriggerUnit()), index)
endfunction

function TransmuteLevelOneItem takes nothing returns nothing
 local integer itemdata= GetItemUserData(UnitItemInSlotBJ(GetTriggerUnit(), 1))

	call RemoveItem(UnitItemInSlotBJ(GetTriggerUnit(), 1))
	call GiveLevelThreeItemForTransmutator(itemdata)
endfunction

function Trig_AlchemicalTransmutation_Actions takes nothing returns nothing
	if ( GetItemLevel(UnitItemInSlotBJ(GetTriggerUnit(), 1)) == 1 ) then
		call TransmuteLevelOneItem()
	else
		call AdjustPlayerStateBJ(75, GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_GOLD)
	endif
endfunction

//===========================================================================
function InitTrig_AlchemicalTransmutation takes nothing returns nothing
    set gg_trg_AlchemicalTransmutation=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AlchemicalTransmutation, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_AlchemicalTransmutation, Condition(function Trig_AlchemicalTransmutation_Conditions))
    call TriggerAddAction(gg_trg_AlchemicalTransmutation, function Trig_AlchemicalTransmutation_Actions)
endfunction

//===========================================================================
// Trigger: BattleRoar
//===========================================================================
function Trig_BattleRoar_Conditions takes nothing returns boolean
	return UnitHasBuffBJ(udg_DamageEventTarget, 'B015')
endfunction

function Trig_BattleRoar_Actions takes nothing returns nothing
	set udg_DamageEventAmount=udg_DamageEventAmount * 1.5
endfunction

//===========================================================================
function InitTrig_BattleRoar takes nothing returns nothing
    set gg_trg_BattleRoar=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_BattleRoar, "udg_DamageModifierEvent", EQUAL, 2.00)
    call TriggerAddCondition(gg_trg_BattleRoar, Condition(function Trig_BattleRoar_Conditions))
    call TriggerAddAction(gg_trg_BattleRoar, function Trig_BattleRoar_Actions)
endfunction

//===========================================================================
// Trigger: DrunkenHaze
//===========================================================================
function Trig_DrunkenHaze_Conditions takes nothing returns boolean
	return UnitHasBuffBJ(udg_DamageEventTarget, 'B018')
endfunction

function Trig_DrunkenHaze_Actions takes nothing returns nothing
	set udg_DamageEventAmount=udg_DamageEventAmount * 1.25
endfunction

//===========================================================================
function InitTrig_DrunkenHaze takes nothing returns nothing
    set gg_trg_DrunkenHaze=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_DrunkenHaze, "udg_DamageModifierEvent", EQUAL, 2.00)
    call TriggerAddCondition(gg_trg_DrunkenHaze, Condition(function Trig_DrunkenHaze_Conditions))
    call TriggerAddAction(gg_trg_DrunkenHaze, function Trig_DrunkenHaze_Actions)
endfunction

//===========================================================================
// Trigger: SacrificeDamage
//===========================================================================
function Trig_SacrificeDamage_Conditions takes nothing returns boolean
	if not UnitHasBuffBJ(udg_DamageEventTarget, 'B014') then
		return false
	endif

	if udg_DamageEventAmount < GetUnitStateSwap(UNIT_STATE_LIFE, udg_DamageEventTarget) then
		return false
	endif

	return true
endfunction

function Trig_SacrificeDamage_Actions takes nothing returns nothing
 local location loc=GetUnitLoc(udg_DamageEventTarget)
 local unit dummy=CreateUnitAtLoc(GetOwningPlayer(udg_DamageEventSource), 'u008', loc, bj_UNIT_FACING)
	call UnitAddAbilityBJ('A08P', dummy)
	call IssuePointOrderLocBJ(dummy, "rainoffire", loc)
	call UnitApplyTimedLifeBJ(3.00, 'BTLF', dummy)
	call RemoveLocation(loc)
	set loc=null
	set dummy=null
endfunction

//===========================================================================
function InitTrig_SacrificeDamage takes nothing returns nothing
    set gg_trg_SacrificeDamage=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_SacrificeDamage, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_SacrificeDamage, Condition(function Trig_SacrificeDamage_Conditions))
    call TriggerAddAction(gg_trg_SacrificeDamage, function Trig_SacrificeDamage_Actions)
endfunction

//===========================================================================
// Trigger: ForceOfNature
//===========================================================================
function Trig_ForceOfNature_Conditions takes nothing returns boolean
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

function Trig_ForceOfNature_Actions takes nothing returns nothing
 local unit dummy=CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u005', GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget), bj_UNIT_FACING)
	call UnitApplyTimedLifeBJ(10.00, 'BTLF', dummy)
	set dummy=null
endfunction

//===========================================================================
function InitTrig_ForceOfNature takes nothing returns nothing
    set gg_trg_ForceOfNature=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_ForceOfNature, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_ForceOfNature, Condition(function Trig_ForceOfNature_Conditions))
    call TriggerAddAction(gg_trg_ForceOfNature, function Trig_ForceOfNature_Actions)
endfunction

//===========================================================================
// Trigger: Moonstorm
//===========================================================================
function Trig_Moonstorm_Conditions takes nothing returns boolean
	if not UnitHasBuffBJ(udg_DamageEventTarget, 'B01E') then
		return false
	endif

	if GetRandomInt(1, 100) > 10 then
		return false
	endif

	return true
endfunction

function Trig_Moonstorm_Actions takes nothing returns nothing
	call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Other\\Monsoon\\MonsoonBoltTarget.mdl", GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget)))
	set udg_DamageEventAmount=udg_DamageEventAmount + 800
	// call BlzSetEventDamage(GetEventDamage() + 800)
endfunction

//===========================================================================
function InitTrig_Moonstorm takes nothing returns nothing
    set gg_trg_Moonstorm=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Moonstorm, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_Moonstorm, Condition(function Trig_Moonstorm_Conditions))
    call TriggerAddAction(gg_trg_Moonstorm, function Trig_Moonstorm_Actions)
endfunction

//===========================================================================
// Trigger: Crushed
//===========================================================================
function Trig_Crushed_Conditions takes nothing returns boolean
	if not ( GetUnitAbilityLevelSwapped('A0AG', udg_DamageEventSource) == 1 ) then
		return false
	endif

	if UnitHasBuffBJ(udg_DamageEventTarget, 'B006') then
		return false
	endif

	return true
endfunction

function Trig_Crushed_Actions takes nothing returns nothing
 local location loc=GetUnitLoc(udg_DamageEventTarget)
 local unit dummy=CreateUnitAtLoc(GetOwningPlayer(udg_DamageEventSource), 'u008', loc, bj_UNIT_FACING)
	// call DestroyEffectBJ(AddSpecialEffectLocBJ( loc, "Abilities\\Spells\\Human\\ThunderClap\\ThunderClapCaster.mdl" ))
	call UnitAddAbilityBJ('A0AH', dummy) // Crushed
	call IssueTargetOrderBJ(dummy, "cripple", udg_DamageEventTarget)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummy)
	call RemoveLocation(loc)
	set loc=null
	set dummy=null
endfunction

//===========================================================================
function InitTrig_Crushed takes nothing returns nothing
    set gg_trg_Crushed=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Crushed, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_Crushed, Condition(function Trig_Crushed_Conditions))
    call TriggerAddAction(gg_trg_Crushed, function Trig_Crushed_Actions)
endfunction

//===========================================================================
// Trigger: CrushedDamage
//===========================================================================
function Trig_CrushedDamage_Conditions takes nothing returns boolean
	return UnitHasBuffBJ(udg_DamageEventTarget, 'B006')
endfunction

function Trig_CrushedDamage_Actions takes nothing returns nothing
	set udg_DamageEventAmount=udg_DamageEventAmount * 1.25
endfunction

//===========================================================================
function InitTrig_CrushedDamage takes nothing returns nothing
    set gg_trg_CrushedDamage=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_CrushedDamage, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_CrushedDamage, Condition(function Trig_CrushedDamage_Conditions))
    call TriggerAddAction(gg_trg_CrushedDamage, function Trig_CrushedDamage_Actions)
endfunction

//===========================================================================
// Trigger: WorkersUnionOrcPeon
//===========================================================================
function Trig_WorkersUnionOrcPeon_Conditions takes nothing returns boolean
	return GetUnitAbilityLevel(udg_DamageEventSource, 'A09Q') > 0
endfunction

function Trig_WorkersUnionOrcPeon_Actions takes nothing returns nothing
	call BlzSetUnitBaseDamage(udg_DamageEventSource, BlzGetUnitBaseDamage(udg_DamageEventSource, 1) + 1, 1)
endfunction

//===========================================================================
function InitTrig_WorkersUnionOrcPeon takes nothing returns nothing
    set gg_trg_WorkersUnionOrcPeon=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_WorkersUnionOrcPeon, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_WorkersUnionOrcPeon, Condition(function Trig_WorkersUnionOrcPeon_Conditions))
    call TriggerAddAction(gg_trg_WorkersUnionOrcPeon, function Trig_WorkersUnionOrcPeon_Actions)
endfunction

//===========================================================================
// Trigger: WorkersUnionHumanPeasant
//===========================================================================
function Trig_WorkersUnionHumanPeasant_Conditions takes nothing returns boolean
	return GetUnitAbilityLevel(udg_DamageEventSource, 'A09T') > 0
endfunction

function Trig_WorkersUnionHumanPeasant_Actions takes nothing returns nothing
	call BlzSetUnitBaseDamage(udg_DamageEventSource, BlzGetUnitBaseDamage(udg_DamageEventSource, 1) + 2, 1)
endfunction

//===========================================================================
function InitTrig_WorkersUnionHumanPeasant takes nothing returns nothing
    set gg_trg_WorkersUnionHumanPeasant=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_WorkersUnionHumanPeasant, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_WorkersUnionHumanPeasant, Condition(function Trig_WorkersUnionHumanPeasant_Conditions))
    call TriggerAddAction(gg_trg_WorkersUnionHumanPeasant, function Trig_WorkersUnionHumanPeasant_Actions)
endfunction

//===========================================================================
// Trigger: WorkersUnionNagaSlave
//===========================================================================
function Trig_WorkersUnionNagaSlave_Conditions takes nothing returns boolean
	return GetUnitAbilityLevel(udg_DamageEventSource, 'A09U') > 0
endfunction

function Trig_WorkersUnionNagaSlave_Actions takes nothing returns nothing
	call BlzSetUnitBaseDamage(udg_DamageEventSource, BlzGetUnitBaseDamage(udg_DamageEventSource, 1) + 20, 1)

	set udg_WorkerSlaveSpell=GetRandomInt(1, 4)
	if ( udg_WorkerSlaveSpell == 1 ) then
            set udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(udg_DamageEventSource))]=GetUnitLoc(udg_DamageEventSource)
            call CreateNUnitsAtLoc(1, 'u008', GetOwningPlayer(udg_DamageEventSource), udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(udg_DamageEventSource))], bj_UNIT_FACING)
            call UnitApplyTimedLifeBJ(3.00, 'BTLF', GetLastCreatedUnit())
            call UnitAddAbilityBJ('A09W', GetLastCreatedUnit())
            call IssueTargetOrderBJ(GetLastCreatedUnit(), "thunderbolt", udg_DamageEventTarget)
            call RemoveLocation(udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(udg_DamageEventSource))])
        elseif ( udg_WorkerSlaveSpell == 2 ) then
            set udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(udg_DamageEventSource))]=GetUnitLoc(udg_DamageEventSource)
            call CreateNUnitsAtLoc(1, 'u008', GetOwningPlayer(udg_DamageEventSource), udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(udg_DamageEventSource))], bj_UNIT_FACING)
            call UnitApplyTimedLifeBJ(3.00, 'BTLF', GetLastCreatedUnit())
            call UnitAddAbilityBJ('A09X', GetLastCreatedUnit())
            call IssueTargetOrderBJ(GetLastCreatedUnit(), "forkedlightning", udg_DamageEventTarget)
            call RemoveLocation(udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(udg_DamageEventSource))])
        endif
endfunction

//===========================================================================
function InitTrig_WorkersUnionNagaSlave takes nothing returns nothing
    set gg_trg_WorkersUnionNagaSlave=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_WorkersUnionNagaSlave, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_WorkersUnionNagaSlave, Condition(function Trig_WorkersUnionNagaSlave_Conditions))
    call TriggerAddAction(gg_trg_WorkersUnionNagaSlave, function Trig_WorkersUnionNagaSlave_Actions)
endfunction

//===========================================================================
// Trigger: WorkersUnionUndeadAcolyte
//===========================================================================
function Trig_WorkersUnionUndeadAcolyte_Conditions takes nothing returns boolean
	if udg_DamageEventAOE != 1.00 then
		return false
	endif

	if not ( GetUnitAbilityLevel(udg_DamageEventSource, 'A09S') > 0 ) then
		return false
	endif

	return true
endfunction

function Trig_WorkersUnionUndeadAcolyte_Actions takes nothing returns nothing
	call BlzSetUnitBaseDamage(udg_DamageEventSource, BlzGetUnitBaseDamage(udg_DamageEventSource, 1) + 5, 1)
endfunction

//===========================================================================
function InitTrig_WorkersUnionUndeadAcolyte takes nothing returns nothing
    set gg_trg_WorkersUnionUndeadAcolyte=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_WorkersUnionUndeadAcolyte, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_WorkersUnionUndeadAcolyte, Condition(function Trig_WorkersUnionUndeadAcolyte_Conditions))
    call TriggerAddAction(gg_trg_WorkersUnionUndeadAcolyte, function Trig_WorkersUnionUndeadAcolyte_Actions)
endfunction

//===========================================================================
// Trigger: WorkersUnionNightElfWisp
//===========================================================================
function Trig_WorkersUnionNightElfWisp_Conditions takes nothing returns boolean
	if udg_DamageEventAOE != 1.00 then
		return false
	endif

	if not ( GetUnitAbilityLevel(udg_DamageEventSource, 'A09V') > 0 ) then
		return false
	endif

	return true
endfunction

function Trig_WorkersUnionNightElfWisp_Actions takes nothing returns nothing
	call BlzSetUnitBaseDamage(udg_DamageEventSource, BlzGetUnitBaseDamage(udg_DamageEventSource, 1) + 40, 1)
endfunction

//===========================================================================
function InitTrig_WorkersUnionNightElfWisp takes nothing returns nothing
    set gg_trg_WorkersUnionNightElfWisp=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_WorkersUnionNightElfWisp, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_WorkersUnionNightElfWisp, Condition(function Trig_WorkersUnionNightElfWisp_Conditions))
    call TriggerAddAction(gg_trg_WorkersUnionNightElfWisp, function Trig_WorkersUnionNightElfWisp_Actions)
endfunction

//===========================================================================
// Trigger: FrostAttack
//===========================================================================
function Trig_FrostAttack_Conditions takes nothing returns boolean
	if not ( GetUnitAbilityLevelSwapped('A08X', udg_DamageEventSource) > 0 ) then
		return false
	endif

	if UnitHasBuffBJ(udg_DamageEventTarget, 'B017') then
		return false
	endif

	return true
endfunction

function Trig_FrostAttack_Actions takes nothing returns nothing
 local unit dummy=CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget), bj_UNIT_FACING)
	call UnitAddAbilityBJ('A02U', dummy) // Slow
	call IssueTargetOrderBJ(dummy, "slow", udg_DamageEventTarget)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummy)
	set dummy=null
endfunction

//===========================================================================
function InitTrig_FrostAttack takes nothing returns nothing
    set gg_trg_FrostAttack=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_FrostAttack, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_FrostAttack, Condition(function Trig_FrostAttack_Conditions))
    call TriggerAddAction(gg_trg_FrostAttack, function Trig_FrostAttack_Actions)
endfunction

//===========================================================================
// Trigger: ChainLightningAttack
//===========================================================================
function Trig_ChainLightningAttack_Conditions takes nothing returns boolean
	return GetUnitAbilityLevelSwapped('A091', udg_DamageEventSource) > 0
endfunction

function Trig_ChainLightningAttack_Actions takes nothing returns nothing
 local unit dummy=CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget), bj_UNIT_FACING)
	call UnitAddAbilityBJ('A090', dummy) // Chain Lightning
	call IssueTargetOrderBJ(dummy, "chainlightning", udg_DamageEventTarget)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummy)
	set dummy=null
endfunction

//===========================================================================
function InitTrig_ChainLightningAttack takes nothing returns nothing
    set gg_trg_ChainLightningAttack=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_ChainLightningAttack, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_ChainLightningAttack, Condition(function Trig_ChainLightningAttack_Conditions))
    call TriggerAddAction(gg_trg_ChainLightningAttack, function Trig_ChainLightningAttack_Actions)
endfunction

//===========================================================================
// Trigger: AdultGreenDragon
//===========================================================================
function Trig_AdultGreenDragon_Conditions takes nothing returns boolean
	if udg_CreepLevel == 35 then
		return false
	endif

	if udg_CreepLevel == 36 then
		return false
	endif

	return GetUnitTypeId(udg_DamageEventSource) == 'hC89'
endfunction

function Trig_AdultGreenDragon_Actions takes nothing returns nothing
	call SetUnitLifeBJ(udg_DamageEventTarget, ( GetUnitStateSwap(UNIT_STATE_LIFE, udg_DamageEventTarget) * 0.70 ))
endfunction

//===========================================================================
function InitTrig_AdultGreenDragon takes nothing returns nothing
    set gg_trg_AdultGreenDragon=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_AdultGreenDragon, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_AdultGreenDragon, Condition(function Trig_AdultGreenDragon_Conditions))
    call TriggerAddAction(gg_trg_AdultGreenDragon, function Trig_AdultGreenDragon_Actions)
endfunction

//===========================================================================
// Trigger: Wyvern
//===========================================================================
function Trig_Wyvern_Conditions takes nothing returns boolean
	if udg_CreepLevel == 35 then
		return false
	endif

	if udg_CreepLevel == 36 then
		return false
	endif

	return GetUnitTypeId(udg_DamageEventSource) == 'oC60'
endfunction

function WyvernAttackGroupCondition takes nothing returns boolean
	if ( GetOwningPlayer(GetEnumUnit()) == Player(13) ) then
		return true
	endif
	if ( GetOwningPlayer(GetEnumUnit()) == Player(14) ) then
		return true
	endif
	if ( GetOwningPlayer(GetEnumUnit()) == Player(15) ) then
		return true
	endif
	if ( GetOwningPlayer(GetEnumUnit()) == Player(16) ) then
		return true
	endif

	return false
endfunction

function WyvernAttackGroup takes nothing returns nothing
	if ( WyvernAttackGroupCondition() ) then
		call SetUnitLifeBJ(GetEnumUnit(), RMaxBJ(1.00, GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()) * 0.85))
		call DestroyEffect(AddSpecialEffectTargetUnitBJ("origin", GetEnumUnit(), "Abilities\\Spells\\Orc\\LightningShield\\LightningShieldTarget.mdl"))
	endif
endfunction

function Trig_Wyvern_Actions takes nothing returns nothing
 local location loc=GetUnitLoc(udg_DamageEventSource)
 local group grp=GetUnitsInRangeOfLocAll(128, loc)
	call ForGroupBJ(grp, function WyvernAttackGroup)
	call DestroyGroup(grp)
	call RemoveLocation(loc)
	set grp=null
	set loc=null
endfunction

//===========================================================================
function InitTrig_Wyvern takes nothing returns nothing
    set gg_trg_Wyvern=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Wyvern, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_Wyvern, Condition(function Trig_Wyvern_Conditions))
    call TriggerAddAction(gg_trg_Wyvern, function Trig_Wyvern_Actions)
endfunction

//===========================================================================
// Trigger: Knight
//===========================================================================
function Trig_Knight_Conditions takes nothing returns boolean
	if not ( GetUnitTypeId(udg_DamageEventSource) == 'hC55' ) then
		return false
	endif

	if not ( GetUnitStateSwap(UNIT_STATE_LIFE, udg_DamageEventTarget) + udg_DamageEventAmount > 500.00 ) then
		return false
	endif

	return true
endfunction

function Trig_Knight_Actions takes nothing returns nothing
	call DestroyEffect(AddSpecialEffectTargetUnitBJ("origin", udg_DamageEventTarget, "Abilities\\Spells\\NightElf\\ReviveNightElf\\ReviveNightElf.mdl"))
	call SetUnitLifeBJ(udg_DamageEventTarget, ( GetUnitStateSwap(UNIT_STATE_LIFE, udg_DamageEventTarget) - 500.00 ))
endfunction

//===========================================================================
function InitTrig_Knight takes nothing returns nothing
    set gg_trg_Knight=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Knight, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_Knight, Condition(function Trig_Knight_Conditions))
    call TriggerAddAction(gg_trg_Knight, function Trig_Knight_Actions)
endfunction

//===========================================================================
// Trigger: AncientNetherDragon
//===========================================================================
function Trig_AncientNetherDragon_Conditions takes nothing returns boolean
	if not ( GetUnitStateSwap(UNIT_STATE_LIFE, udg_DamageEventTarget) + udg_DamageEventAmount > 500.00 ) then
		return false
	endif

	return GetUnitTypeId(udg_DamageEventSource) == 'hC92'
endfunction

function EnumUnitLocationSpecialEffect takes nothing returns nothing
	call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Undead\\DarkRitual\\DarkRitualCaster.mdl", GetUnitX(GetEnumUnit()), GetUnitY(GetEnumUnit())))
endfunction

function AncientNetherDragonAttackGroup takes nothing returns nothing
	if ( WyvernAttackGroupCondition() ) then
		call SetUnitLifeBJ(GetEnumUnit(), GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()) - 550)
		call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Undead\\DarkRitual\\DarkRitualCaster.mdl", GetUnitX(GetEnumUnit()), GetUnitY(GetEnumUnit()))) // INLINED!!
	endif
endfunction

function Trig_AncientNetherDragon_Actions takes nothing returns nothing
 local location loc=GetUnitLoc(udg_DamageEventSource)
 local group grp= GetUnitsInRangeOfLocAll(300, loc)
	call ForGroupBJ(grp, function AncientNetherDragonAttackGroup)
	call DestroyGroup(grp)
	call RemoveLocation(loc)
	set grp=null
	set loc=null
endfunction

//===========================================================================
function InitTrig_AncientNetherDragon takes nothing returns nothing
    set gg_trg_AncientNetherDragon=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_AncientNetherDragon, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_AncientNetherDragon, Condition(function Trig_AncientNetherDragon_Conditions))
    call TriggerAddAction(gg_trg_AncientNetherDragon, function Trig_AncientNetherDragon_Actions)
endfunction

//===========================================================================
// Trigger: DrunkenBrawler
//===========================================================================
function Trig_DrunkenBrawler_Conditions takes nothing returns boolean
	return GetUnitAbilityLevelSwapped('A08U', udg_DamageEventSource) == 1
endfunction

function Trig_DrunkenBrawler_Actions takes nothing returns nothing
 local location loc=GetUnitLoc(udg_DamageEventTarget)
 local location spelloc=GetUnitLoc(udg_DamageEventSource)
 local unit dummy=CreateUnitAtLoc(GetOwningPlayer(udg_DamageEventSource), 'u008', spelloc, bj_UNIT_FACING)
 local integer rng= GetRandomInt(1, 6)
	if ( rng == 1 ) then
		call UnitAddAbilityBJ('A078', dummy) // Dazzle
		call IssuePointOrderLocBJ(dummy, "clusterrockets", loc)
	elseif ( rng == 2 ) then
		call UnitAddAbilityBJ('A00F', dummy) // Flame Strike
		call IssuePointOrderLocBJ(dummy, "flamestrike", loc)
	elseif ( rng == 3 ) then
		call UnitAddAbilityBJ('A02N', dummy) // Impale
		call IssuePointOrderLocBJ(dummy, "impale", loc)
	elseif ( rng == 4 ) then
		call UnitAddAbilityBJ('A02M', dummy) // Carrion Swarm
		call IssuePointOrderLocBJ(dummy, "carrionswarm", loc)
	elseif ( rng == 5 ) then
		call UnitAddAbilityBJ('A08P', dummy) // Rain of Fire
		call IssuePointOrderLocBJ(dummy, "rainoffire", loc)
	else
		call UnitAddAbilityBJ('A00J', dummy) // Fan of Knives
		call IssueImmediateOrderBJ(dummy, "fanofknives")
	endif
	call UnitApplyTimedLifeBJ(3.00, 'BTLF', dummy)
	call RemoveLocation(loc)
	call RemoveLocation(spelloc)
	set loc=null
	set spelloc=null
	set dummy=null
endfunction

//===========================================================================
function InitTrig_DrunkenBrawler takes nothing returns nothing
    set gg_trg_DrunkenBrawler=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_DrunkenBrawler, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_DrunkenBrawler, Condition(function Trig_DrunkenBrawler_Conditions))
    call TriggerAddAction(gg_trg_DrunkenBrawler, function Trig_DrunkenBrawler_Actions)
endfunction

//===========================================================================
// Trigger: MassiveBlow
//===========================================================================
function Trig_MassiveBlow_Conditions takes nothing returns boolean
	if not ( GetUnitAbilityLevelSwapped('A00Y', udg_DamageEventSource) == 1 ) then
		return false
	endif

	if UnitHasBuffBJ(udg_DamageEventTarget, 'B01J') then
		return false
	endif

	return true
endfunction

function Trig_MassiveBlow_Actions takes nothing returns nothing
 local location loc=GetUnitLoc(udg_DamageEventTarget)
 local unit dummy=CreateUnitAtLoc(GetOwningPlayer(udg_DamageEventSource), 'u008', loc, bj_UNIT_FACING)
	// call DestroyEffectBJ(AddSpecialEffectLocBJ( loc, "Abilities\\Spells\\Human\\ThunderClap\\ThunderClapCaster.mdl" ))
	call UnitAddAbilityBJ('A029', dummy) // Massive Blow Slow
	call IssueTargetOrderBJ(dummy, "slow", udg_DamageEventTarget)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummy)
	call RemoveLocation(loc)
	set loc=null
	set dummy=null
endfunction

//===========================================================================
function InitTrig_MassiveBlow takes nothing returns nothing
    set gg_trg_MassiveBlow=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_MassiveBlow, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_MassiveBlow, Condition(function Trig_MassiveBlow_Conditions))
    call TriggerAddAction(gg_trg_MassiveBlow, function Trig_MassiveBlow_Actions)
endfunction

//===========================================================================
// Trigger: VenomTower
//===========================================================================
function Trig_VenomTower_Conditions takes nothing returns boolean
	return GetUnitTypeId(udg_DamageEventSource) == 'h045'
endfunction

function Trig_VenomTower_Actions takes nothing returns nothing
	call IssueImmediateOrderBJ(udg_DamageEventSource, "stop")
endfunction

//===========================================================================
function InitTrig_VenomTower takes nothing returns nothing
    set gg_trg_VenomTower=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_VenomTower, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_VenomTower, Condition(function Trig_VenomTower_Conditions))
    call TriggerAddAction(gg_trg_VenomTower, function Trig_VenomTower_Actions)
endfunction

//===========================================================================
// Trigger: MoonDancer
//===========================================================================
function Trig_MoonDancer_Conditions takes nothing returns boolean
	return GetUnitTypeId(udg_DamageEventSource) == 'e00K'
endfunction

function MoonDancerCastSpell takes nothing returns nothing
 local location loc= GetUnitLoc(udg_DamageEventTarget)
 local unit dummy= CreateUnitAtLoc(GetOwningPlayer(udg_DamageEventSource), 'u008', loc, bj_UNIT_FACING)
	call UnitAddAbilityBJ('A022', dummy) // Star Wave
	call IssuePointOrderLocBJ(dummy, "blizzard", loc)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummy)
	call RemoveLocation(loc)
	set loc=null
	set dummy=null
endfunction

function Trig_MoonDancer_Actions takes nothing returns nothing
 local real mana= GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventSource) + 1.00
	call SetUnitManaBJ(udg_DamageEventSource, mana)

	if ( mana > 4 ) then
		call SetUnitManaBJ(udg_DamageEventSource, 0.00)
		call MoonDancerCastSpell()
	endif
endfunction

//===========================================================================
function InitTrig_MoonDancer takes nothing returns nothing
    set gg_trg_MoonDancer=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_MoonDancer, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_MoonDancer, Condition(function Trig_MoonDancer_Conditions))
    call TriggerAddAction(gg_trg_MoonDancer, function Trig_MoonDancer_Actions)
endfunction

//===========================================================================
// Trigger: Cavern Druid Ability
//===========================================================================
function Trig_Cavern_Druid_Ability_Func001C takes nothing returns boolean
	return GetUnitTypeId(udg_DamageEventSource) == 'h04Q'
endfunction

function Trig_Cavern_Druid_Ability_Actions takes nothing returns nothing
	set udg_DamageEventAmount=udg_DamageEventAmount + GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventSource) * 25.00
	call SetUnitManaBJ(udg_DamageEventSource, 0.00)
endfunction

//===========================================================================
function InitTrig_Cavern_Druid_Ability takes nothing returns nothing
    set gg_trg_Cavern_Druid_Ability=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Cavern_Druid_Ability, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_Cavern_Druid_Ability, Condition(function Trig_Cavern_Druid_Ability_Func001C))
    call TriggerAddAction(gg_trg_Cavern_Druid_Ability, function Trig_Cavern_Druid_Ability_Actions)
endfunction

//===========================================================================
// Trigger: Rokhan
//===========================================================================
function Trig_Rokhan_Conditions takes nothing returns boolean
	return GetUnitTypeId(udg_DamageEventSource) == 'h002'
endfunction

function Trig_Rokhan_Actions takes nothing returns nothing
 local unit u= CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'o00H', GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget), bj_UNIT_FACING)
	call UnitApplyTimedLifeBJ(5.00, 'BTLF', u)

	set u=null
endfunction

//===========================================================================
function InitTrig_Rokhan takes nothing returns nothing
    set gg_trg_Rokhan=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Rokhan, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_Rokhan, Condition(function Trig_Rokhan_Conditions))
    call TriggerAddAction(gg_trg_Rokhan, function Trig_Rokhan_Actions)
endfunction

//===========================================================================
// Trigger: WarchiefThrall
//===========================================================================
function Trig_WarchiefThrall_Conditions takes nothing returns boolean
	if not ( GetUnitTypeId(udg_DamageEventSource) == 'oC65' ) then
		return false
	endif

	if ( GetRandomInt(1, 100) > 5 ) then
		return false
	endif

	return true
endfunction

function Trig_WarchiefThrall_Actions takes nothing returns nothing
 local unit u= CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING)
	call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
	call UnitAddAbilityBJ('A03J', u)
	call IssueTargetOrderBJ(u, "forkedlightning", udg_DamageEventTarget)

	set u=null
endfunction

//===========================================================================
function InitTrig_WarchiefThrall takes nothing returns nothing
    set gg_trg_WarchiefThrall=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_WarchiefThrall, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_WarchiefThrall, Condition(function Trig_WarchiefThrall_Conditions))
    call TriggerAddAction(gg_trg_WarchiefThrall, function Trig_WarchiefThrall_Actions)
endfunction

//===========================================================================
// Trigger: DwarfStatue
//===========================================================================
function Trig_DwarfStatue_Conditions takes nothing returns boolean
	if not ( GetUnitTypeId(udg_DamageEventSource) == 'n05Q' ) then
		return false
	endif

	if ( GetRandomInt(1, 100) > 3 ) then
		return false
	endif

	return true
endfunction

function Trig_DwarfStatue_Actions takes nothing returns nothing
 local unit u= CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING)
	call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
	call UnitAddAbilityBJ('A0AT', u)
	call IssuePointOrder(u, "shockwave", GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget))

	set u=null
endfunction

//===========================================================================
function InitTrig_DwarfStatue takes nothing returns nothing
    set gg_trg_DwarfStatue=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_DwarfStatue, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_DwarfStatue, Condition(function Trig_DwarfStatue_Conditions))
    call TriggerAddAction(gg_trg_DwarfStatue, function Trig_DwarfStatue_Actions)
endfunction

//===========================================================================
// Trigger: VoidCorrupter
//===========================================================================
function Trig_VoidCorrupter_Conditions takes nothing returns boolean
	return GetUnitTypeId(udg_DamageEventSource) == 'h01A'
endfunction

function Trig_VoidCorrupter_Actions takes nothing returns nothing
	call BlzSetUnitArmor(udg_DamageEventTarget, BlzGetUnitArmor(udg_DamageEventTarget) - 0.25)
endfunction

//===========================================================================
function InitTrig_VoidCorrupter takes nothing returns nothing
    set gg_trg_VoidCorrupter=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_VoidCorrupter, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_VoidCorrupter, Condition(function Trig_VoidCorrupter_Conditions))
    call TriggerAddAction(gg_trg_VoidCorrupter, function Trig_VoidCorrupter_Actions)
endfunction

//===========================================================================
// Trigger: VoidBeing
//===========================================================================
function Trig_VoidBeing_Conditions takes nothing returns boolean
	return GetUnitTypeId(udg_DamageEventSource) == 'h00T'
endfunction

function Trig_VoidBeing_Actions takes nothing returns nothing
	call SetUnitLifeBJ(udg_DamageEventSource, GetUnitStateSwap(UNIT_STATE_LIFE, udg_DamageEventSource) + 2.00)
endfunction

//===========================================================================
function InitTrig_VoidBeing takes nothing returns nothing
    set gg_trg_VoidBeing=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_VoidBeing, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_VoidBeing, Condition(function Trig_VoidBeing_Conditions))
    call TriggerAddAction(gg_trg_VoidBeing, function Trig_VoidBeing_Actions)
endfunction

//===========================================================================
// Trigger: AcidSpittingSpider
//===========================================================================
function Trig_AcidSpittingSpider_Conditions takes nothing returns boolean
	if not ( GetUnitTypeId(udg_DamageEventSource) == 'o019' ) then
		return false
	endif

	if ( GetRandomInt(1, 4) != 1 ) then
		return false
	endif

	return true
endfunction

function Trig_AcidSpittingSpider_Actions takes nothing returns nothing
 local unit u= CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING)
	call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
	call UnitAddAbilityBJ('A073', u)
	call IssueTargetOrderBJ(u, "acidbomb", udg_DamageEventTarget)

	set u=null
endfunction

//===========================================================================
function InitTrig_AcidSpittingSpider takes nothing returns nothing
    set gg_trg_AcidSpittingSpider=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_AcidSpittingSpider, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_AcidSpittingSpider, Condition(function Trig_AcidSpittingSpider_Conditions))
    call TriggerAddAction(gg_trg_AcidSpittingSpider, function Trig_AcidSpittingSpider_Actions)
endfunction

//===========================================================================
// Trigger: FelGuard
//===========================================================================
function Trig_FelGuard_Conditions takes nothing returns boolean
	if not ( GetUnitTypeId(udg_DamageEventSource) == 'h03W' ) then
		return false
	endif

	if ( GetRandomInt(1, 4) != 1 ) then
		return false
	endif

	return true
endfunction

function Trig_FelGuard_Actions takes nothing returns nothing
 local unit u= CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING)
	call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
	call UnitAddAbilityBJ('A06W', u)
	call IssuePointOrder(u, "breathoffrost", GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget))

	set u=null
endfunction

//===========================================================================
function InitTrig_FelGuard takes nothing returns nothing
    set gg_trg_FelGuard=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_FelGuard, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_FelGuard, Condition(function Trig_FelGuard_Conditions))
    call TriggerAddAction(gg_trg_FelGuard, function Trig_FelGuard_Actions)
endfunction

//===========================================================================
// Trigger: Mannoroth
//===========================================================================
function Trig_Mannoroth_Conditions takes nothing returns boolean
	if not ( GetUnitTypeId(udg_DamageEventSource) == 'o00L' ) then
		return false
	endif

	if ( GetRandomInt(1, 3) != 1 ) then
		return false
	endif

	return true
endfunction

function Trig_Mannoroth_Actions takes nothing returns nothing
 local unit u= CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING)
	call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
	call UnitAddAbilityBJ('A06V', u)
	call IssueImmediateOrderBJ(u, "howlofterror")

	set u=null
endfunction

//===========================================================================
function InitTrig_Mannoroth takes nothing returns nothing
    set gg_trg_Mannoroth=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Mannoroth, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_Mannoroth, Condition(function Trig_Mannoroth_Conditions))
    call TriggerAddAction(gg_trg_Mannoroth, function Trig_Mannoroth_Actions)
endfunction

//===========================================================================
// Trigger: SummoningShrine
//===========================================================================
function Trig_SummoningShrine_Conditions takes nothing returns boolean
	return GetUnitTypeId(udg_DamageEventSource) == 'n00U'
endfunction

function Trig_SummoningShrine_Actions takes nothing returns nothing
 local real x= GetUnitX(udg_DamageEventTarget)
 local real y= GetUnitY(udg_DamageEventTarget)
 local unit u= CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', x, y, bj_UNIT_FACING)
	call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
	call UnitAddAbilityBJ('A06P', u)
	call IssuePointOrder(u, "dreadlordinferno", x, y)

	set u=null
endfunction

//===========================================================================
function InitTrig_SummoningShrine takes nothing returns nothing
    set gg_trg_SummoningShrine=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_SummoningShrine, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_SummoningShrine, Condition(function Trig_SummoningShrine_Conditions))
    call TriggerAddAction(gg_trg_SummoningShrine, function Trig_SummoningShrine_Actions)
endfunction

//===========================================================================
// Trigger: Warden
//===========================================================================
function Trig_Warden_Conditions takes nothing returns boolean
	return GetUnitTypeId(udg_DamageEventSource) == 'h00G'
endfunction

function Trig_Warden_Actions takes nothing returns nothing
 local unit u= CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING)
	call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
	call UnitAddAbilityBJ('A0BM', u)
	call IssueTargetOrderBJ(u, "shadowstrike", udg_DamageEventTarget)

	set u=null
endfunction

//===========================================================================
function InitTrig_Warden takes nothing returns nothing
    set gg_trg_Warden=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Warden, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_Warden, Condition(function Trig_Warden_Conditions))
    call TriggerAddAction(gg_trg_Warden, function Trig_Warden_Actions)
endfunction

//===========================================================================
// Trigger: DemonicIllidan
//===========================================================================
function Trig_Illidan_Conditions takes nothing returns boolean
	if not udg_IsDamageSpell then
		return false
	endif

	if not ( GetUnitTypeId(udg_DamageEventSource) == 'h00S' ) then
		return false
	endif

	return true
endfunction

function Trig_Illidan_Actions takes nothing returns nothing
 local unit u= CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget), bj_UNIT_FACING)
	call UnitApplyTimedLifeBJ(4.00, 'BTLF', u)
	call UnitAddAbilityBJ('A0BZ', u)
	call IssueTargetOrderBJ(u, "soulburn", udg_DamageEventTarget)
	set u=null
endfunction

//===========================================================================
function InitTrig_DemonicIllidan takes nothing returns nothing
	set gg_trg_DemonicIllidan=CreateTrigger()
	call TriggerRegisterVariableEvent(gg_trg_DemonicIllidan, "udg_DamageEvent", EQUAL, 1.00)
	call TriggerAddCondition(gg_trg_DemonicIllidan, Condition(function Trig_Illidan_Conditions))
	call TriggerAddAction(gg_trg_DemonicIllidan, function Trig_Illidan_Actions)
endfunction

//===========================================================================
// Trigger: CorruptedIllidan
//===========================================================================
function Trig_CorruptedIllidan_Conditions takes nothing returns boolean
	if not udg_IsDamageSpell then
		return false
	endif

	if not ( GetUnitTypeId(udg_DamageEventSource) == 'eC83' ) then
		return true
	endif

	return true
endfunction

function Trig_CorruptedIllidan_Actions takes nothing returns nothing
 local unit u= CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING)
	call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
	call UnitAddAbilityBJ('A0BZ', u)
	call IssueTargetOrderBJ(u, "soulburn", udg_DamageEventTarget)

	set u=null
endfunction

//===========================================================================
function InitTrig_CorruptedIllidan takes nothing returns nothing
	set gg_trg_CorruptedIllidan=CreateTrigger()
	call TriggerRegisterVariableEvent(gg_trg_CorruptedIllidan, "udg_DamageEvent", EQUAL, 1.00)
	call TriggerAddCondition(gg_trg_CorruptedIllidan, Condition(function Trig_CorruptedIllidan_Conditions))
	call TriggerAddAction(gg_trg_CorruptedIllidan, function Trig_CorruptedIllidan_Actions)
endfunction

//===========================================================================
// Trigger: CavernHermit
//===========================================================================
function Trig_CavernHermin_Conditions takes nothing returns boolean
	if not ( GetUnitTypeId(udg_DamageEventSource) == 'h04M' ) then
		return false
	endif

	if not udg_IsDamageSpell then
		return false
	endif

	if ( GetRandomInt(1, 3) != 1 ) then
		return false
	endif

	return true
endfunction

function Trig_CavernHermin_Actions takes nothing returns nothing
 local unit u= CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING)
	call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
	call UnitAddAbilityBJ('A0CC', u)
	call IssueTargetOrderBJ(u, "lightningshield", udg_DamageEventTarget)

	set u=null
endfunction

//===========================================================================
function InitTrig_CavernHermit takes nothing returns nothing
    set gg_trg_CavernHermit=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_CavernHermit, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_CavernHermit, Condition(function Trig_CavernHermin_Conditions))
    call TriggerAddAction(gg_trg_CavernHermit, function Trig_CavernHermin_Actions)
endfunction

//===========================================================================
// Trigger: CavernTurtle
//===========================================================================
function Trig_CavernTurtle_Conditions takes nothing returns boolean
	if not ( GetUnitTypeId(udg_DamageEventSource) == 'h04N' ) then
		return false
	endif

	if not ( udg_AOEDamageEvent == 0.00 ) then
		return false
	endif

	if not ( GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventSource) >= 100.00 ) then
		return false
	endif

	return true
endfunction

function Trig_CavernTurtle_Actions takes nothing returns nothing
 local unit u= CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget), bj_UNIT_FACING)
	call SetUnitManaBJ(udg_DamageEventSource, ( GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventSource) - 100.00 ))
	call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
	call UnitAddAbilityBJ('A0BY', u)
	call IssueImmediateOrderBJ(u, "fanofknives")

	set u=null
endfunction

//===========================================================================
function InitTrig_CavernTurtle takes nothing returns nothing
    set gg_trg_CavernTurtle=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_CavernTurtle, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_CavernTurtle, Condition(function Trig_CavernTurtle_Conditions))
    call TriggerAddAction(gg_trg_CavernTurtle, function Trig_CavernTurtle_Actions)
endfunction

//===========================================================================
// Trigger: CavernRevenant
//===========================================================================
function Trig_CavernRevenant_Conditions takes nothing returns boolean
	if not ( GetUnitTypeId(udg_DamageEventSource) == 'h04O' ) then
		return false
	endif

	if not ( udg_AOEDamageEvent == 0.00 ) then
		return false
	endif

	if not ( GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventSource) >= 25.00 ) then
		return false
	endif

	return true
endfunction

function Trig_CavernRevenant_Actions takes nothing returns nothing
 local unit u= CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'n00D', GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget), bj_UNIT_FACING)
	call SetUnitManaBJ(udg_DamageEventSource, ( GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventSource) - 25.00 ))
	call UnitApplyTimedLifeBJ(60.00, 'BTLF', u)

	set u=null
endfunction

//===========================================================================
function InitTrig_CavernRevenant takes nothing returns nothing
    set gg_trg_CavernRevenant=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_CavernRevenant, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_CavernRevenant, Condition(function Trig_CavernRevenant_Conditions))
    call TriggerAddAction(gg_trg_CavernRevenant, function Trig_CavernRevenant_Actions)
endfunction

//===========================================================================
// Trigger: IceTrollJoker
//===========================================================================
function Trig_IceTrollJoker_Conditions takes nothing returns boolean
	if not UnitHasBuffBJ(udg_DamageEventTarget, 'B02M') then
		return false
	endif

	if not ( GetUnitMoveSpeed(udg_DamageEventTarget) < GetUnitDefaultMoveSpeed(udg_DamageEventTarget) ) then
		return false
	endif

	return true
endfunction

function Trig_IceTrollJoker_Actions takes nothing returns nothing
	set udg_DamageEventAmount=3.00 * udg_DamageEventAmount
endfunction

//===========================================================================
function InitTrig_IceTrollJoker takes nothing returns nothing
    set gg_trg_IceTrollJoker=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_IceTrollJoker, "udg_DamageModifierEvent", EQUAL, 2.00)
    call TriggerAddCondition(gg_trg_IceTrollJoker, Condition(function Trig_IceTrollJoker_Conditions))
    call TriggerAddAction(gg_trg_IceTrollJoker, function Trig_IceTrollJoker_Actions)
endfunction

//===========================================================================
// Trigger: WalkItOff
//===========================================================================
function Trig_WalkItOff_Conditions takes nothing returns boolean
	if not ( GetUnitAbilityLevel(udg_DamageEventTarget, 'A01T') > 0 ) then
		return false
	endif

	if not ( GetUnitMoveSpeed(udg_DamageEventTarget) < GetUnitDefaultMoveSpeed(udg_DamageEventTarget) ) then
		return false
	endif

	return true
endfunction

function Trig_WalkItOff_Actions takes nothing returns nothing
	set udg_DamageEventAmount=udg_DamageEventAmount * ( 1.00 - 0.50 * udg_CreepLevel * 0.01 )
endfunction

//===========================================================================
function InitTrig_WalkItOff takes nothing returns nothing
	set gg_trg_WalkItOff=CreateTrigger()
	call TriggerRegisterVariableEvent(gg_trg_WalkItOff, "udg_DamageEvent", EQUAL, 1.00)
	call TriggerAddCondition(gg_trg_WalkItOff, Condition(function Trig_WalkItOff_Conditions))
	call TriggerAddAction(gg_trg_WalkItOff, function Trig_WalkItOff_Actions)
endfunction

//===========================================================================
// Trigger: DivineShield
//===========================================================================
function Trig_DivineShield_Conditions takes nothing returns boolean
	return GetUnitAbilityLevel(udg_DamageEventTarget, 'A01E') > 0
endfunction

function Trig_DivineShield_Actions takes nothing returns nothing
 local integer abilvl= GetUnitAbilityLevel(udg_DamageEventTarget, 'A01E')
	set udg_DamageEventAmount=0.00
	// call BlzSetEventDamage(0)
	if ( abilvl <= 1 ) then
		call UnitRemoveAbility(udg_DamageEventTarget, 'A01E')
	else
		call SetUnitAbilityLevel(udg_DamageEventTarget, 'A01E', abilvl - 1)
	endif
endfunction

//===========================================================================
function InitTrig_DivineShield takes nothing returns nothing
    set gg_trg_DivineShield=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_DivineShield, "udg_DamageModifierEvent", EQUAL, 4.00)
    call TriggerAddCondition(gg_trg_DivineShield, Condition(function Trig_DivineShield_Conditions))
    call TriggerAddAction(gg_trg_DivineShield, function Trig_DivineShield_Actions)
endfunction

//===========================================================================
// Trigger: CrippleAura
//===========================================================================
function Trig_CrippleAura_Conditions takes nothing returns boolean
	if UnitHasBuffBJ(udg_DamageEventSource, 'B01C') then
		return false
	endif

	if not UnitHasBuffBJ(udg_DamageEventTarget, 'B01D') then
		return false
	endif

	if GetRandomInt(1, 100) > 10 then
		return false
	endif

	return true
endfunction

function Trig_CrippleAura_Actions takes nothing returns nothing
 local unit dummy= CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'u008', 0.0, - 5300.0, bj_UNIT_FACING)
	call UnitAddAbilityBJ('A06B', dummy) // Cripple
	call SetUnitAbilityLevel(dummy, 'A06B', udg_CreepLevel + 1)
	call IssueTargetOrderBJ(dummy, "cripple", udg_DamageEventSource)
	call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummy)
	set dummy=null
endfunction

//===========================================================================
function InitTrig_CrippleAura takes nothing returns nothing
    set gg_trg_CrippleAura=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_CrippleAura, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_CrippleAura, Condition(function Trig_CrippleAura_Conditions))
    call TriggerAddAction(gg_trg_CrippleAura, function Trig_CrippleAura_Actions)
endfunction

//===========================================================================
// Trigger: VampiricAura
//===========================================================================
function Trig_VampiricAura_Conditions takes nothing returns boolean
	if not UnitHasBuffBJ(udg_DamageEventTarget, 'B01H') then
		return false
	endif

	if GetRandomInt(1, 100) > 10 then
		return false
	endif

	return true
endfunction

function Trig_VampiricAura_Actions takes nothing returns nothing
	call DestroyEffectBJ(AddSpecialEffect("Abilities\\Spells\\Undead\\VampiricAura\\VampiricAuraTarget.mdl", GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget)))
	call SetUnitLifeBJ(udg_DamageEventTarget, GetUnitStateSwap(UNIT_STATE_LIFE, udg_DamageEventTarget) + 4 * udg_CreepLevel)
endfunction

//===========================================================================
function InitTrig_VampiricAura takes nothing returns nothing
    set gg_trg_VampiricAura=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_VampiricAura, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_VampiricAura, Condition(function Trig_VampiricAura_Conditions))
    call TriggerAddAction(gg_trg_VampiricAura, function Trig_VampiricAura_Actions)
endfunction

//===========================================================================
// Trigger: Disable Tower Create UG
//===========================================================================
function Trig_Disable_Tower_Create_UG_Actions takes nothing returns nothing
    set bj_forLoopAIndex=2
    set bj_forLoopAIndexEnd=13
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_TowerUnitGroup[GetForLoopIndexA()]=CreateGroup()
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
endfunction

//===========================================================================
function InitTrig_Disable_Tower_Create_UG takes nothing returns nothing
    set gg_trg_Disable_Tower_Create_UG=CreateTrigger()
    call TriggerAddAction(gg_trg_Disable_Tower_Create_UG, function Trig_Disable_Tower_Create_UG_Actions)
endfunction

//===========================================================================
// Trigger: Disable Towers Command
//===========================================================================
function Trig_Disable_Towers_Command_Func001Func003A takes nothing returns nothing
    call PauseUnitBJ(false, GetEnumUnit())
endfunction

function Trig_Disable_Towers_Command_Func001Func005A takes nothing returns nothing
    call PauseUnitBJ(true, GetEnumUnit())
endfunction

function Trig_Disable_Towers_Command_Func001C takes nothing returns boolean
    if ( not ( udg_DisableOnOff[GetConvertedPlayerId(GetTriggerPlayer())] == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Disable_Towers_Command_Actions takes nothing returns nothing
    if ( Trig_Disable_Towers_Command_Func001C() ) then
        set udg_DisableOnOff[GetConvertedPlayerId(GetTriggerPlayer())]=1
        call ForGroupBJ(udg_TowerUnitGroup[GetConvertedPlayerId(GetTriggerPlayer())], function Trig_Disable_Towers_Command_Func001Func005A)
    else
        set udg_DisableOnOff[GetConvertedPlayerId(GetTriggerPlayer())]=0
        call ForGroupBJ(udg_TowerUnitGroup[GetConvertedPlayerId(GetTriggerPlayer())], function Trig_Disable_Towers_Command_Func001Func003A)
    endif
endfunction

//===========================================================================
function InitTrig_Disable_Towers_Command takes nothing returns nothing
    set gg_trg_Disable_Towers_Command=CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(0), "-dt", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(1), "-dt", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(2), "-dt", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(3), "-dt", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(4), "-dt", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(5), "-dt", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(6), "-dt", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(7), "-dt", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(8), "-dt", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(9), "-dt", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(10), "-dt", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(11), "-dt", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(12), "-dt", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(0), "-disabletowers", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(1), "-disabletowers", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(2), "-disabletowers", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(3), "-disabletowers", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(4), "-disabletowers", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(5), "-disabletowers", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(6), "-disabletowers", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(7), "-disabletowers", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(8), "-disabletowers", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(9), "-disabletowers", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(10), "-disabletowers", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(11), "-disabletowers", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Disable_Towers_Command, Player(12), "-disabletowers", true)
    call TriggerAddAction(gg_trg_Disable_Towers_Command, function Trig_Disable_Towers_Command_Actions)
endfunction

//===========================================================================
// Trigger: Disable Towers Add
//===========================================================================
function Trig_Disable_Towers_Add_Func001C takes nothing returns boolean
    if ( not ( GetUnitPointValue(GetConstructedStructure()) <= 10 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Disable_Towers_Add_Actions takes nothing returns nothing
    if ( Trig_Disable_Towers_Add_Func001C() ) then
        call GroupAddUnitSimple(GetTriggerUnit(), udg_TowerUnitGroup[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))])
    else
    endif
endfunction

//===========================================================================
function InitTrig_Disable_Towers_Add takes nothing returns nothing
    set gg_trg_Disable_Towers_Add=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Disable_Towers_Add, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
    call TriggerAddAction(gg_trg_Disable_Towers_Add, function Trig_Disable_Towers_Add_Actions)
endfunction

//===========================================================================
// Trigger: Disable Towers Select
//===========================================================================
function Trig_Disable_Towers_Select_Func001C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetTriggerUnit()) == GetTriggerPlayer() ) ) then
        return false
    endif
    return true
endfunction

function Trig_Disable_Towers_Select_Actions takes nothing returns nothing
    if ( Trig_Disable_Towers_Select_Func001C() ) then
        call PauseUnitBJ(false, GetTriggerUnit())
    else
    endif
endfunction

//===========================================================================
function InitTrig_Disable_Towers_Select takes nothing returns nothing
    set gg_trg_Disable_Towers_Select=CreateTrigger()
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Disable_Towers_Select, Player(0), true)
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Disable_Towers_Select, Player(1), true)
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Disable_Towers_Select, Player(2), true)
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Disable_Towers_Select, Player(3), true)
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Disable_Towers_Select, Player(4), true)
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Disable_Towers_Select, Player(5), true)
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Disable_Towers_Select, Player(6), true)
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Disable_Towers_Select, Player(7), true)
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Disable_Towers_Select, Player(8), true)
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Disable_Towers_Select, Player(9), true)
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Disable_Towers_Select, Player(10), true)
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Disable_Towers_Select, Player(11), true)
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Disable_Towers_Select, Player(12), true)
    call TriggerAddAction(gg_trg_Disable_Towers_Select, function Trig_Disable_Towers_Select_Actions)
endfunction

//===========================================================================
// Trigger: Disable Towers Remove
//===========================================================================
function Trig_Disable_Towers_Remove_Func001C takes nothing returns boolean
	if GetUnitTypeId(GetTriggerUnit()) == 'h00V' then
		return true
	endif

	if GetUnitTypeId(GetTriggerUnit()) == 'h00W' then
		return true
	endif

	if GetUnitTypeId(GetTriggerUnit()) == 'o01A' then
		return true
	endif

	if GetUnitTypeId(GetTriggerUnit()) == 'h00Y' then
		return true
	endif

	if GetUnitTypeId(GetTriggerUnit()) == 'h00X' then
		return true
	endif

	if GetUnitTypeId(GetTriggerUnit()) == 'n00K' then
		return true
	endif

	if GetUnitTypeId(GetTriggerUnit()) == 'o019' then
		return true
	endif

	return false
endfunction

function Trig_Disable_Towers_Remove_Actions takes nothing returns nothing
	call GroupRemoveUnitSimple(GetTriggerUnit(), udg_TowerUnitGroup[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))])
endfunction

//===========================================================================
function InitTrig_Disable_Towers_Remove takes nothing returns nothing
    set gg_trg_Disable_Towers_Remove=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Disable_Towers_Remove, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
    call TriggerAddCondition(gg_trg_Disable_Towers_Remove, Condition(function Trig_Disable_Towers_Remove_Func001C))
    call TriggerAddAction(gg_trg_Disable_Towers_Remove, function Trig_Disable_Towers_Remove_Actions)
endfunction

//===========================================================================
// Trigger: Growth Aura Level Up
//===========================================================================
function Trig_Growth_Aura_Level_Up_Func001C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'h04S' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Growth_Aura_Level_Up_Func002C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'h04L' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Growth_Aura_Level_Up_Actions takes nothing returns nothing
    if ( Trig_Growth_Aura_Level_Up_Func001C() ) then
        call SetUnitAbilityLevelSwapped('A0CG', GetTriggerUnit(), 2)
        call SetUnitAbilityLevelSwapped('S00A', GetTriggerUnit(), 2)
    else
    endif
    if ( Trig_Growth_Aura_Level_Up_Func002C() ) then
        call SetUnitAbilityLevelSwapped('A0CG', GetTriggerUnit(), 3)
        call SetUnitAbilityLevelSwapped('S00A', GetTriggerUnit(), 3)
    else
    endif
endfunction

//===========================================================================
function InitTrig_Growth_Aura_Level_Up takes nothing returns nothing
    set gg_trg_Growth_Aura_Level_Up=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Growth_Aura_Level_Up, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
    call TriggerAddAction(gg_trg_Growth_Aura_Level_Up, function Trig_Growth_Aura_Level_Up_Actions)
endfunction

//===========================================================================
// Trigger: Ancient Protector Ability
//===========================================================================
function Trig_Ancient_Protector_Ability_Func001Func003C takes nothing returns boolean
    if ( not ( udg_NaturesNourishChance[GetConvertedPlayerId(GetOwningPlayer(GetAttacker()))] == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Ancient_Protector_Ability_Func001Func004C takes nothing returns boolean
    if ( not ( udg_NaturesNourishChance[GetConvertedPlayerId(GetOwningPlayer(GetAttacker()))] == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Ancient_Protector_Ability_Func001Func005C takes nothing returns boolean
    if ( not ( udg_NaturesNourishChance[GetConvertedPlayerId(GetOwningPlayer(GetAttacker()))] == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Ancient_Protector_Ability_Func001Func006C takes nothing returns boolean
    if ( not ( udg_NaturesNourishChance[GetConvertedPlayerId(GetOwningPlayer(GetAttacker()))] == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Ancient_Protector_Ability_Func001C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetAttacker()) == 'hC82' ) ) then
        return false
    endif
    if ( not ( GetUnitStateSwap(UNIT_STATE_MANA, GetAttacker()) >= 30.00 ) ) then
        return false
    endif
    if ( not ( UnitInventoryCount(GetAttacker()) <= 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Ancient_Protector_Ability_Actions takes nothing returns nothing
    if ( Trig_Ancient_Protector_Ability_Func001C() ) then
        call SetUnitManaPercentBJ(GetAttacker(), 0.00)
        set udg_NaturesNourishChance[GetConvertedPlayerId(GetOwningPlayer(GetAttacker()))]=GetRandomInt(1, 4)
        if ( Trig_Ancient_Protector_Ability_Func001Func003C() ) then
            call UnitAddItemByIdSwapped('I024', GetAttacker())
        else
        endif
        if ( Trig_Ancient_Protector_Ability_Func001Func004C() ) then
            call UnitAddItemByIdSwapped('I023', GetAttacker())
        else
        endif
        if ( Trig_Ancient_Protector_Ability_Func001Func005C() ) then
            call UnitAddItemByIdSwapped('I021', GetAttacker())
        else
        endif
        if ( Trig_Ancient_Protector_Ability_Func001Func006C() ) then
            call UnitAddItemByIdSwapped('I022', GetAttacker())
        else
        endif
    else
    endif
endfunction

//===========================================================================
function InitTrig_Ancient_Protector_Ability takes nothing returns nothing
    set gg_trg_Ancient_Protector_Ability=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Ancient_Protector_Ability, EVENT_PLAYER_UNIT_ATTACKED)
    call TriggerAddAction(gg_trg_Ancient_Protector_Ability, function Trig_Ancient_Protector_Ability_Actions)
endfunction

//===========================================================================
// Trigger: Chim Int Reduce
//===========================================================================
function Trig_Chim_Int_Reduce_Func002C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'e004' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'e009' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'e00U' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'e00V' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'e000' ) ) then
        return true
    endif
    return false
endfunction

function Trig_Chim_Int_Reduce_Conditions takes nothing returns boolean
    if ( not Trig_Chim_Int_Reduce_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_Chim_Int_Reduce_Actions takes nothing returns nothing
    set udg_ChimaeraCount[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))]=( udg_ChimaeraCount[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] - 1 )
endfunction

//===========================================================================
function InitTrig_Chim_Int_Reduce takes nothing returns nothing
    set gg_trg_Chim_Int_Reduce=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Chim_Int_Reduce, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_Chim_Int_Reduce, Condition(function Trig_Chim_Int_Reduce_Conditions))
    call TriggerAddAction(gg_trg_Chim_Int_Reduce, function Trig_Chim_Int_Reduce_Actions)
endfunction

//===========================================================================
// Trigger: Chim Spawn
//===========================================================================
function Trig_Chim_Spawn_Func001Func001C takes nothing returns boolean
    if ( not ( udg_ChimaeraCount[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] <= 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Chim_Spawn_Func001A takes nothing returns nothing
    if ( Trig_Chim_Spawn_Func001Func001C() ) then
        set udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]=GetUnitLoc(GetEnumUnit())
        set udg_ChimaeraCount[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))]=( udg_ChimaeraCount[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] + 1 )
        call CreateNUnitsAtLoc(1, 'e004', GetOwningPlayer(GetEnumUnit()), udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))], bj_UNIT_FACING)
    else
    endif
endfunction

function Trig_Chim_Spawn_Actions takes nothing returns nothing
    call ForGroupBJ(udg_ChimaeraRoost, function Trig_Chim_Spawn_Func001A)
endfunction

//===========================================================================
function InitTrig_Chim_Spawn takes nothing returns nothing
    set gg_trg_Chim_Spawn=CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_Chim_Spawn, 15.00)
    call TriggerAddAction(gg_trg_Chim_Spawn, function Trig_Chim_Spawn_Actions)
endfunction

//===========================================================================
// Trigger: Chim Add to Grp
//===========================================================================
function Trig_Chim_Add_to_Grp_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetConstructedStructure()) == 'hC86' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Chim_Add_to_Grp_Actions takes nothing returns nothing
    call GroupAddUnitSimple(GetConstructedStructure(), udg_ChimaeraRoost)
endfunction

//===========================================================================
function InitTrig_Chim_Add_to_Grp takes nothing returns nothing
    set gg_trg_Chim_Add_to_Grp=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Chim_Add_to_Grp, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
    call TriggerAddCondition(gg_trg_Chim_Add_to_Grp, Condition(function Trig_Chim_Add_to_Grp_Conditions))
    call TriggerAddAction(gg_trg_Chim_Add_to_Grp, function Trig_Chim_Add_to_Grp_Actions)
endfunction

//===========================================================================
// Trigger: Chim Rem from Grp
//===========================================================================
function Trig_Chim_Rem_from_Grp_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02D' ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'hC86' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Chim_Rem_from_Grp_Actions takes nothing returns nothing
    call GroupRemoveUnitSimple(GetSpellAbilityUnit(), udg_ChimaeraRoost)
endfunction

//===========================================================================
function InitTrig_Chim_Rem_from_Grp takes nothing returns nothing
    set gg_trg_Chim_Rem_from_Grp=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Chim_Rem_from_Grp, EVENT_PLAYER_UNIT_SPELL_CAST)
    call TriggerAddCondition(gg_trg_Chim_Rem_from_Grp, Condition(function Trig_Chim_Rem_from_Grp_Conditions))
    call TriggerAddAction(gg_trg_Chim_Rem_from_Grp, function Trig_Chim_Rem_from_Grp_Actions)
endfunction

//===========================================================================
// Trigger: Natures Nourishment Item
//===========================================================================
function Trig_Natures_Nourishment_Item_Func001Func001C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A0BW', GetSpellTargetUnit()) >= 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Natures_Nourishment_Item_Func001C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0B2' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Natures_Nourishment_Item_Func002Func001Func001C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('S007', GetSpellTargetUnit()) >= 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Natures_Nourishment_Item_Func002Func001C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('S007', GetSpellTargetUnit()) >= 10 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Natures_Nourishment_Item_Func002C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0B4' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Natures_Nourishment_Item_Func003Func001Func001C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A0C4', GetSpellTargetUnit()) >= 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Natures_Nourishment_Item_Func003Func001C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A0C4', GetSpellTargetUnit()) >= 10 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Natures_Nourishment_Item_Func003C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0BG' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Natures_Nourishment_Item_Func004Func001Func001C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A0BX', GetSpellTargetUnit()) >= 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Natures_Nourishment_Item_Func004Func001C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A0BX', GetSpellTargetUnit()) >= 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Natures_Nourishment_Item_Func004C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0BI' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Natures_Nourishment_Item_Func005Func001Func001C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('S009', GetSpellTargetUnit()) >= 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Natures_Nourishment_Item_Func005Func001C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('S009', GetSpellTargetUnit()) >= 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Natures_Nourishment_Item_Func005C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0BI' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Natures_Nourishment_Item_Actions takes nothing returns nothing
    if ( Trig_Natures_Nourishment_Item_Func001C() ) then
        if ( Trig_Natures_Nourishment_Item_Func001Func001C() ) then
            call IncUnitAbilityLevelSwapped('A0BW', GetSpellTargetUnit())
        else
            call UnitAddAbilityBJ('A0BW', GetSpellTargetUnit())
        endif
    else
    endif
    if ( Trig_Natures_Nourishment_Item_Func002C() ) then
        if ( Trig_Natures_Nourishment_Item_Func002Func001C() ) then
        else
            if ( Trig_Natures_Nourishment_Item_Func002Func001Func001C() ) then
                call IncUnitAbilityLevelSwapped('S007', GetSpellTargetUnit())
            else
                call UnitAddAbilityBJ('S007', GetSpellTargetUnit())
            endif
        endif
    else
    endif
    if ( Trig_Natures_Nourishment_Item_Func003C() ) then
        if ( Trig_Natures_Nourishment_Item_Func003Func001C() ) then
        else
            if ( Trig_Natures_Nourishment_Item_Func003Func001Func001C() ) then
                call IncUnitAbilityLevelSwapped('A0C4', GetSpellTargetUnit())
            else
                call UnitAddAbilityBJ('A0C4', GetSpellTargetUnit())
            endif
        endif
    else
    endif
    if ( Trig_Natures_Nourishment_Item_Func004C() ) then
        if ( Trig_Natures_Nourishment_Item_Func004Func001C() ) then
        else
            if ( Trig_Natures_Nourishment_Item_Func004Func001Func001C() ) then
                call IncUnitAbilityLevelSwapped('A0BX', GetSpellTargetUnit())
            else
                call UnitAddAbilityBJ('A0BX', GetSpellTargetUnit())
            endif
        endif
    else
    endif
    if ( Trig_Natures_Nourishment_Item_Func005C() ) then
        if ( Trig_Natures_Nourishment_Item_Func005Func001C() ) then
        else
            if ( Trig_Natures_Nourishment_Item_Func005Func001Func001C() ) then
                call IncUnitAbilityLevelSwapped('S009', GetSpellTargetUnit())
            else
                call UnitAddAbilityBJ('S009', GetSpellTargetUnit())
            endif
        endif
    else
    endif
endfunction

//===========================================================================
function InitTrig_Natures_Nourishment_Item takes nothing returns nothing
    set gg_trg_Natures_Nourishment_Item=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Natures_Nourishment_Item, EVENT_PLAYER_UNIT_SPELL_CAST)
    call TriggerAddAction(gg_trg_Natures_Nourishment_Item, function Trig_Natures_Nourishment_Item_Actions)
endfunction

//===========================================================================
// Trigger: Void Lord Ability
//===========================================================================
function Trig_Void_Lord_Ability_Func003C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A09E' ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'h01O' ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetSpellTargetUnit()) == 'h02G' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Lord_Ability_Conditions takes nothing returns boolean
    if ( not Trig_Void_Lord_Ability_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Lord_Ability_Actions takes nothing returns nothing
    call BlzSetUnitBaseDamage(GetTriggerUnit(), ( BlzGetUnitBaseDamage(GetTriggerUnit(), 1) + 250 ), 1)
    call ReplaceUnitBJ(GetSpellTargetUnit(), 'h02S', bj_UNIT_STATE_METHOD_DEFAULTS)
endfunction

//===========================================================================
function InitTrig_Void_Lord_Ability takes nothing returns nothing
    set gg_trg_Void_Lord_Ability=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Void_Lord_Ability, EVENT_PLAYER_UNIT_SPELL_CAST)
    call TriggerAddCondition(gg_trg_Void_Lord_Ability, Condition(function Trig_Void_Lord_Ability_Conditions))
    call TriggerAddAction(gg_trg_Void_Lord_Ability, function Trig_Void_Lord_Ability_Actions)
endfunction

//===========================================================================
// Trigger: Void Fissure Ability
//===========================================================================
function Trig_Void_Fissure_Ability_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetAttacker()) == 'h01M' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fissure_Ability_Func006Func001Func001Func001C takes nothing returns boolean
    if ( not ( udg_VoidFissureSpell == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fissure_Ability_Func006Func001Func001C takes nothing returns boolean
    if ( not ( udg_VoidFissureSpell == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fissure_Ability_Func006Func001C takes nothing returns boolean
    if ( not ( udg_VoidFissureSpell == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fissure_Ability_Func006C takes nothing returns boolean
    if ( not ( udg_VoidFissureSpell == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fissure_Ability_Actions takes nothing returns nothing
    set udg_VoidFissureSpell=GetRandomInt(1, 4)
    set udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(GetAttacker()))]=GetUnitLoc(GetAttackedUnitBJ())
    call CreateNUnitsAtLoc(1, 'u008', GetOwningPlayer(GetAttacker()), udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(GetAttacker()))], bj_UNIT_FACING)
    call UnitApplyTimedLifeBJ(3.00, 'BTLF', GetLastCreatedUnit())
    if ( Trig_Void_Fissure_Ability_Func006C() ) then
        call UnitAddAbilityBJ('A09I', GetLastCreatedUnit())
        call IssuePointOrderLocBJ(GetLastCreatedUnit(), "blizzard", udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(GetAttacker()))])
    else
        if ( Trig_Void_Fissure_Ability_Func006Func001C() ) then
            call UnitAddAbilityBJ('A09N', GetLastCreatedUnit())
            call IssuePointOrderLocBJ(GetLastCreatedUnit(), "flamestrike", udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(GetAttacker()))])
        else
            if ( Trig_Void_Fissure_Ability_Func006Func001Func001C() ) then
                call UnitAddAbilityBJ('A09K', GetLastCreatedUnit())
                call IssuePointOrderLocBJ(GetLastCreatedUnit(), "monsoon", udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(GetAttacker()))])
            else
                if ( Trig_Void_Fissure_Ability_Func006Func001Func001Func001C() ) then
                    call UnitAddAbilityBJ('A09J', GetLastCreatedUnit())
                    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "rainoffire", udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(GetAttacker()))])
                else
                endif
            endif
        endif
    endif
    call RemoveLocation(udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(GetAttacker()))])
endfunction

//===========================================================================
function InitTrig_Void_Fissure_Ability takes nothing returns nothing
    set gg_trg_Void_Fissure_Ability=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Void_Fissure_Ability, EVENT_PLAYER_UNIT_ATTACKED)
    call TriggerAddCondition(gg_trg_Void_Fissure_Ability, Condition(function Trig_Void_Fissure_Ability_Conditions))
    call TriggerAddAction(gg_trg_Void_Fissure_Ability, function Trig_Void_Fissure_Ability_Actions)
endfunction

//===========================================================================
// Trigger: Void Worshipper Limit
//===========================================================================
function Trig_Void_Worshipper_Limit_Func001A takes nothing returns nothing
    call SetPlayerTechMaxAllowedSwap('h02G', 30, GetEnumPlayer())
endfunction

function Trig_Void_Worshipper_Limit_Actions takes nothing returns nothing
    call ForForce(GetPlayersAll(), function Trig_Void_Worshipper_Limit_Func001A)
endfunction

//===========================================================================
function InitTrig_Void_Worshipper_Limit takes nothing returns nothing
    set gg_trg_Void_Worshipper_Limit=CreateTrigger()
    call TriggerAddAction(gg_trg_Void_Worshipper_Limit, function Trig_Void_Worshipper_Limit_Actions)
endfunction

//===========================================================================
// Trigger: Void Fragment Die
//===========================================================================
function Trig_Void_Fragment_Die_Func002C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetKillingUnitBJ()) == 'h01A' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fragment_Die_Actions takes nothing returns nothing
    // Gives players void fragments when Void Corrupter kills unit
    if ( Trig_Void_Fragment_Die_Func002C() ) then
        call CreateTextTagUnitBJ("TRIGSTR_7925", GetKillingUnitBJ(), 0, 10, 100, 100, 100, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 40.00, 90)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 4.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 2.00)
        set udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))]=( udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))] + 5 )
        call SetUnitManaBJ(udg_VoidCultBuilder[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))], I2R(udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))]))
    else
    endif
endfunction

//===========================================================================
function InitTrig_Void_Fragment_Die takes nothing returns nothing
    set gg_trg_Void_Fragment_Die=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Void_Fragment_Die, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddAction(gg_trg_Void_Fragment_Die, function Trig_Void_Fragment_Die_Actions)
endfunction

//===========================================================================
// Trigger: Void Fragment Construction
//===========================================================================
function Trig_Void_Fragment_Construction_Func002Func002C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'h01M' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fragment_Construction_Func002C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'h02G' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fragment_Construction_Actions takes nothing returns nothing
    // Increases VoidFragmentTick when building is completed
    if ( Trig_Void_Fragment_Construction_Func002C() ) then
        set udg_VoidFragmentTick[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))]=( udg_VoidFragmentTick[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] + 1 )
    else
        if ( Trig_Void_Fragment_Construction_Func002Func002C() ) then
            set udg_VoidFragmentTick[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))]=( udg_VoidFragmentTick[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] + 50 )
        else
        endif
    endif
endfunction

//===========================================================================
function InitTrig_Void_Fragment_Construction takes nothing returns nothing
    set gg_trg_Void_Fragment_Construction=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Void_Fragment_Construction, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
    call TriggerAddAction(gg_trg_Void_Fragment_Construction, function Trig_Void_Fragment_Construction_Actions)
endfunction

//===========================================================================
// Trigger: Void Fragment Ability
//===========================================================================
function Trig_Void_Fragment_Ability_Func004Func001C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02D' ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'h01M' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fragment_Ability_Func004Func004C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'h02S' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'h02G' ) ) then
        return true
    endif
    return false
endfunction

function Trig_Void_Fragment_Ability_Func004C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02D' ) ) then
        return false
    endif
    if ( not Trig_Void_Fragment_Ability_Func004Func004C() ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fragment_Ability_Func008C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A095' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fragment_Ability_Actions takes nothing returns nothing
    // -------------------
    // Decrease VoidFragmentTick via Sell Ability
    // -------------------
    if ( Trig_Void_Fragment_Ability_Func004C() ) then
        set udg_VoidFragmentTick[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))]=( udg_VoidFragmentTick[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] - 1 )
    else
        if ( Trig_Void_Fragment_Ability_Func004Func001C() ) then
            set udg_VoidFragmentTick[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))]=( udg_VoidFragmentTick[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] - 50 )
        else
        endif
    endif
    // -------------------
    // Increase VoidFragmentTotal via Void Restoration Ability
    // -------------------
    if ( Trig_Void_Fragment_Ability_Func008C() ) then
        call CreateTextTagUnitBJ("TRIGSTR_7924", GetSpellTargetUnit(), 0, 10, 100, 100, 100, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 40.00, 90)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 4.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 2.00)
        set udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))]=( udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] + 10 )
        call SetUnitManaBJ(udg_VoidCultBuilder[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))], I2R(udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))]))
    else
    endif
endfunction

//===========================================================================
function InitTrig_Void_Fragment_Ability takes nothing returns nothing
    set gg_trg_Void_Fragment_Ability=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Void_Fragment_Ability, EVENT_PLAYER_UNIT_SPELL_CAST)
    call TriggerAddAction(gg_trg_Void_Fragment_Ability, function Trig_Void_Fragment_Ability_Actions)
endfunction

//===========================================================================
// Trigger: Void Fragment Tick
//===========================================================================
function Trig_Void_Fragment_Tick_Func001Func003C takes nothing returns boolean
    if ( not ( udg_VoidFragmentTotal[GetForLoopIndexA()] > 2000 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fragment_Tick_Actions takes nothing returns nothing
    set bj_forLoopAIndex=1
    set bj_forLoopAIndexEnd=13
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_VoidFragmentTotal[GetForLoopIndexA()]=( udg_VoidFragmentTotal[GetForLoopIndexA()] + udg_VoidFragmentTick[GetForLoopIndexA()] )
        call SetUnitManaBJ(udg_VoidCultBuilder[GetForLoopIndexA()], I2R(udg_VoidFragmentTotal[GetForLoopIndexA()]))
        if ( Trig_Void_Fragment_Tick_Func001Func003C() ) then
            set udg_VoidFragmentTotal[GetForLoopIndexA()]=2000
        else
        endif
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
endfunction

//===========================================================================
function InitTrig_Void_Fragment_Tick takes nothing returns nothing
    set gg_trg_Void_Fragment_Tick=CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_Void_Fragment_Tick, 30.00)
    call TriggerAddAction(gg_trg_Void_Fragment_Tick, function Trig_Void_Fragment_Tick_Actions)
endfunction

//===========================================================================
// Trigger: Void Fragment Spend
//===========================================================================
function Trig_Void_Fragment_Spend_Func004Func001C takes nothing returns boolean
    if ( not ( udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] >= 100 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fragment_Spend_Func004C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0BB' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fragment_Spend_Func008Func001C takes nothing returns boolean
    if ( not ( udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] >= 400 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fragment_Spend_Func008C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0BJ' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fragment_Spend_Func012Func001C takes nothing returns boolean
    if ( not ( udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] >= 800 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fragment_Spend_Func012C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0BK' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fragment_Spend_Func016Func001C takes nothing returns boolean
    if ( not ( udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] >= 1200 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fragment_Spend_Func016C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0BL' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Void_Fragment_Spend_Actions takes nothing returns nothing
    // -------------------
    // Void Being
    // -------------------
    if ( Trig_Void_Fragment_Spend_Func004C() ) then
        if ( Trig_Void_Fragment_Spend_Func004Func001C() ) then
            set udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))]=( udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] - 100 )
        else
        endif
    else
    endif
    // -------------------
    // Void Beast
    // -------------------
    if ( Trig_Void_Fragment_Spend_Func008C() ) then
        if ( Trig_Void_Fragment_Spend_Func008Func001C() ) then
            set udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))]=( udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] - 400 )
        else
        endif
    else
    endif
    // -------------------
    // Void Monstrosity
    // -------------------
    if ( Trig_Void_Fragment_Spend_Func012C() ) then
        if ( Trig_Void_Fragment_Spend_Func012Func001C() ) then
            set udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))]=( udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] - 800 )
        else
        endif
    else
    endif
    // -------------------
    // Void Lord
    // -------------------
    if ( Trig_Void_Fragment_Spend_Func016C() ) then
        if ( Trig_Void_Fragment_Spend_Func016Func001C() ) then
            set udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))]=( udg_VoidFragmentTotal[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] - 1200 )
        else
        endif
    else
    endif
endfunction

//===========================================================================
function InitTrig_Void_Fragment_Spend takes nothing returns nothing
    set gg_trg_Void_Fragment_Spend=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Void_Fragment_Spend, EVENT_PLAYER_UNIT_SPELL_CAST)
    call TriggerAddAction(gg_trg_Void_Fragment_Spend, function Trig_Void_Fragment_Spend_Actions)
endfunction

//===========================================================================
// Trigger: SiphonEnergy
//===========================================================================
function Trig_SiphonEnergy_Conditions takes nothing returns boolean
	return GetSpellAbilityId() == 'A0CT'
endfunction

function CheckForCombination takes integer trigType,integer targType,integer typeOne,integer typeTwo returns boolean
	if GetBooleanOr(trigType == typeOne, targType == typeOne) then
		if GetBooleanOr(trigType == typeTwo, targType == typeTwo) then
			return true
		endif
	endif

	return false
endfunction

function Trig_SiphonEnergy_Actions takes nothing returns nothing
 local unit trig= GetTriggerUnit()
 local unit targ= GetSpellTargetUnit()
 local integer trigType= GetUnitTypeId(trig)
 local integer targType= GetUnitTypeId(targ)

	if CheckForCombination(trigType , targType , 'n025' , 'n024') then // Life + Death
		call ReplaceUnitBJ(trig, 'n026', bj_UNIT_STATE_METHOD_DEFAULTS)
		call ReplaceUnitBJ(targ, 'n027', bj_UNIT_STATE_METHOD_DEFAULTS)
	elseif CheckForCombination(trigType , targType , 'n01S' , 'n024') then // Fire + Death
		call ReplaceUnitBJ(trig, 'n028', bj_UNIT_STATE_METHOD_DEFAULTS)
		call ReplaceUnitBJ(targ, 'n027', bj_UNIT_STATE_METHOD_DEFAULTS)
	elseif CheckForCombination(trigType , targType , 'n01R' , 'n024') then // Water + Death
		call ReplaceUnitBJ(trig, 'n030', bj_UNIT_STATE_METHOD_DEFAULTS)
		call ReplaceUnitBJ(targ, 'n027', bj_UNIT_STATE_METHOD_DEFAULTS)
	endif

	set trig=null
	set targ=null
endfunction

//===========================================================================
function InitTrig_SiphonEnergy takes nothing returns nothing
    set gg_trg_SiphonEnergy=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_SiphonEnergy, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_SiphonEnergy, Condition(function Trig_SiphonEnergy_Conditions))
    call TriggerAddAction(gg_trg_SiphonEnergy, function Trig_SiphonEnergy_Actions)
endfunction

//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig_Unit_Indexer()
    call InitTrig_Damage_Engine_Config()
    call InitTrig_Damage_Engine()
    //Function not found: call InitTrig_WarcraftMaulLibrary()
    //Function not found: call InitTrig_MapInit()
    call InitTrig_UnchargedRune()
    call InitTrig_AntiBlockAndJuggle()
    call InitTrig_DifficultyVoteSystem()
    call InitTrig_PathingSystem()
    call InitTrig_Commands()
    call InitTrig_RaceSelection()
    call InitTrig_Quests()
    call InitTrig_UnitDies()
    call InitTrig_TowerAttackTrigger()
    call InitTrig_Construction()
    call InitTrig_RemoveBuilder()
    call InitTrig_PlayerLeaves()
    call InitTrig_SellTower()
    call InitTrig_MoveArchimonde()
    call InitTrig_Artifacts()
    call InitTrig_TowerTick()
    call InitTrig_Channel_Item()
    call InitTrig_Trade()
    call InitTrig_Enchantment()
    call InitTrig_Transfuse()
    call InitTrig_Infuse()
    call InitTrig_Sacrifice()
    call InitTrig_AlchemicalTransmutation()
    call InitTrig_BattleRoar()
    call InitTrig_DrunkenHaze()
    call InitTrig_SacrificeDamage()
    call InitTrig_ForceOfNature()
    call InitTrig_Moonstorm()
    call InitTrig_Crushed()
    call InitTrig_CrushedDamage()
    call InitTrig_WorkersUnionOrcPeon()
    call InitTrig_WorkersUnionHumanPeasant()
    call InitTrig_WorkersUnionNagaSlave()
    call InitTrig_WorkersUnionUndeadAcolyte()
    call InitTrig_WorkersUnionNightElfWisp()
    call InitTrig_FrostAttack()
    call InitTrig_ChainLightningAttack()
    call InitTrig_AdultGreenDragon()
    call InitTrig_Wyvern()
    call InitTrig_Knight()
    call InitTrig_AncientNetherDragon()
    call InitTrig_DrunkenBrawler()
    call InitTrig_MassiveBlow()
    call InitTrig_VenomTower()
    call InitTrig_MoonDancer()
    call InitTrig_Cavern_Druid_Ability()
    call InitTrig_Rokhan()
    call InitTrig_WarchiefThrall()
    call InitTrig_DwarfStatue()
    call InitTrig_VoidCorrupter()
    call InitTrig_VoidBeing()
    call InitTrig_AcidSpittingSpider()
    call InitTrig_FelGuard()
    call InitTrig_Mannoroth()
    call InitTrig_SummoningShrine()
    call InitTrig_Warden()
    call InitTrig_DemonicIllidan()
    call InitTrig_CorruptedIllidan()
    call InitTrig_CavernHermit()
    call InitTrig_CavernTurtle()
    call InitTrig_CavernRevenant()
    call InitTrig_IceTrollJoker()
    call InitTrig_WalkItOff()
    call InitTrig_DivineShield()
    call InitTrig_CrippleAura()
    call InitTrig_VampiricAura()
    call InitTrig_Disable_Tower_Create_UG()
    call InitTrig_Disable_Towers_Command()
    call InitTrig_Disable_Towers_Add()
    call InitTrig_Disable_Towers_Select()
    call InitTrig_Disable_Towers_Remove()
    call InitTrig_Growth_Aura_Level_Up()
    call InitTrig_Ancient_Protector_Ability()
    call InitTrig_Chim_Int_Reduce()
    call InitTrig_Chim_Spawn()
    call InitTrig_Chim_Add_to_Grp()
    call InitTrig_Chim_Rem_from_Grp()
    call InitTrig_Natures_Nourishment_Item()
    call InitTrig_Void_Lord_Ability()
    call InitTrig_Void_Fissure_Ability()
    call InitTrig_Void_Worshipper_Limit()
    call InitTrig_Void_Fragment_Die()
    call InitTrig_Void_Fragment_Construction()
    call InitTrig_Void_Fragment_Ability()
    call InitTrig_Void_Fragment_Tick()
    call InitTrig_Void_Fragment_Spend()
    call InitTrig_SiphonEnergy()
endfunction

//===========================================================================
function RunInitializationTriggers takes nothing returns nothing
    call ConditionalTriggerExecute(gg_trg_Unit_Indexer)
    call ConditionalTriggerExecute(gg_trg_Disable_Tower_Create_UG)
    call ConditionalTriggerExecute(gg_trg_Void_Worshipper_Limit)
endfunction

//***************************************************************************
//*
//*  Upgrades
//*
//***************************************************************************

function InitUpgrades_Player0 takes nothing returns nothing
    call SetPlayerTechResearched(Player(0), 'Remg', 1)
    call SetPlayerTechResearched(Player(0), 'Rune', 2)
    call SetPlayerTechResearched(Player(0), 'Rows', 1)
endfunction

function InitUpgrades_Player1 takes nothing returns nothing
    call SetPlayerTechResearched(Player(1), 'Remg', 1)
    call SetPlayerTechResearched(Player(1), 'Rune', 2)
    call SetPlayerTechResearched(Player(1), 'Rows', 1)
endfunction

function InitUpgrades_Player2 takes nothing returns nothing
    call SetPlayerTechResearched(Player(2), 'Remg', 1)
    call SetPlayerTechResearched(Player(2), 'Rune', 2)
    call SetPlayerTechResearched(Player(2), 'Rows', 1)
endfunction

function InitUpgrades_Player3 takes nothing returns nothing
    call SetPlayerTechResearched(Player(3), 'Remg', 1)
    call SetPlayerTechResearched(Player(3), 'Rune', 2)
    call SetPlayerTechResearched(Player(3), 'Rows', 1)
endfunction

function InitUpgrades_Player4 takes nothing returns nothing
    call SetPlayerTechResearched(Player(4), 'Remg', 1)
    call SetPlayerTechResearched(Player(4), 'Rune', 2)
    call SetPlayerTechResearched(Player(4), 'Rows', 1)
endfunction

function InitUpgrades_Player5 takes nothing returns nothing
    call SetPlayerTechResearched(Player(5), 'Remg', 1)
    call SetPlayerTechResearched(Player(5), 'Rune', 2)
    call SetPlayerTechResearched(Player(5), 'Rows', 1)
endfunction

function InitUpgrades_Player6 takes nothing returns nothing
    call SetPlayerTechResearched(Player(6), 'Remg', 1)
    call SetPlayerTechResearched(Player(6), 'Rune', 2)
    call SetPlayerTechResearched(Player(6), 'Rows', 1)
endfunction

function InitUpgrades_Player7 takes nothing returns nothing
    call SetPlayerTechResearched(Player(7), 'Remg', 1)
    call SetPlayerTechResearched(Player(7), 'Rune', 2)
    call SetPlayerTechResearched(Player(7), 'Rows', 1)
endfunction

function InitUpgrades_Player8 takes nothing returns nothing
    call SetPlayerTechResearched(Player(8), 'Remg', 1)
    call SetPlayerTechResearched(Player(8), 'Rune', 2)
    call SetPlayerTechResearched(Player(8), 'Rows', 1)
endfunction

function InitUpgrades takes nothing returns nothing
    call InitUpgrades_Player0()
    call InitUpgrades_Player1()
    call InitUpgrades_Player2()
    call InitUpgrades_Player3()
    call InitUpgrades_Player4()
    call InitUpgrades_Player5()
    call InitUpgrades_Player6()
    call InitUpgrades_Player7()
    call InitUpgrades_Player8()
endfunction

//***************************************************************************
//*
//*  TechTree
//*
//***************************************************************************

function InitTechTree_Player0 takes nothing returns nothing
    call SetPlayerTechMaxAllowed(Player(0), 'ostr', 0)
    call SetPlayerTechMaxAllowed(Player(0), 'hC63', 0)
endfunction

function InitTechTree_Player1 takes nothing returns nothing
    call SetPlayerTechMaxAllowed(Player(1), 'ostr', 0)
    call SetPlayerTechMaxAllowed(Player(1), 'hC63', 0)
endfunction

function InitTechTree_Player2 takes nothing returns nothing
    call SetPlayerTechMaxAllowed(Player(2), 'ostr', 0)
    call SetPlayerTechMaxAllowed(Player(2), 'hC63', 0)
endfunction

function InitTechTree_Player3 takes nothing returns nothing
    call SetPlayerTechMaxAllowed(Player(3), 'ostr', 0)
    call SetPlayerTechMaxAllowed(Player(3), 'hC63', 0)
endfunction

function InitTechTree_Player4 takes nothing returns nothing
    call SetPlayerTechMaxAllowed(Player(4), 'ostr', 0)
    call SetPlayerTechMaxAllowed(Player(4), 'hC63', 0)
endfunction

function InitTechTree_Player5 takes nothing returns nothing
    call SetPlayerTechMaxAllowed(Player(5), 'ostr', 0)
    call SetPlayerTechMaxAllowed(Player(5), 'hC63', 0)
endfunction

function InitTechTree_Player6 takes nothing returns nothing
    call SetPlayerTechMaxAllowed(Player(6), 'ostr', 0)
endfunction

function InitTechTree_Player7 takes nothing returns nothing
    call SetPlayerTechMaxAllowed(Player(7), 'ostr', 0)
endfunction

function InitTechTree_Player8 takes nothing returns nothing
    call SetPlayerTechMaxAllowed(Player(8), 'ostr', 0)
endfunction

function InitTechTree_Player11 takes nothing returns nothing
    call SetPlayerTechMaxAllowed(Player(11), 'ostr', 0)
endfunction

function InitTechTree takes nothing returns nothing
    call InitTechTree_Player0()
    call InitTechTree_Player1()
    call InitTechTree_Player2()
    call InitTechTree_Player3()
    call InitTechTree_Player4()
    call InitTechTree_Player5()
    call SetPlayerTechMaxAllowed(Player(6), 'ostr', 0) // INLINED!!
    call SetPlayerTechMaxAllowed(Player(7), 'ostr', 0) // INLINED!!
    call SetPlayerTechMaxAllowed(Player(8), 'ostr', 0) // INLINED!!
    call SetPlayerTechMaxAllowed(Player(11), 'ostr', 0) // INLINED!!
endfunction

//***************************************************************************
//*
//*  Players
//*
//***************************************************************************

function InitCustomPlayerSlots takes nothing returns nothing

    // Player 0
    call SetPlayerStartLocation(Player(0), 0)
    call ForcePlayerStartLocation(Player(0), 0)
    call SetPlayerColor(Player(0), ConvertPlayerColor(0))
    call SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(0), false)
    call SetPlayerController(Player(0), MAP_CONTROL_USER)

    // Player 1
    call SetPlayerStartLocation(Player(1), 1)
    call ForcePlayerStartLocation(Player(1), 1)
    call SetPlayerColor(Player(1), ConvertPlayerColor(1))
    call SetPlayerRacePreference(Player(1), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(1), false)
    call SetPlayerController(Player(1), MAP_CONTROL_USER)

    // Player 2
    call SetPlayerStartLocation(Player(2), 2)
    call ForcePlayerStartLocation(Player(2), 2)
    call SetPlayerColor(Player(2), ConvertPlayerColor(2))
    call SetPlayerRacePreference(Player(2), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(2), false)
    call SetPlayerController(Player(2), MAP_CONTROL_USER)

    // Player 3
    call SetPlayerStartLocation(Player(3), 3)
    call ForcePlayerStartLocation(Player(3), 3)
    call SetPlayerColor(Player(3), ConvertPlayerColor(3))
    call SetPlayerRacePreference(Player(3), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(3), false)
    call SetPlayerController(Player(3), MAP_CONTROL_USER)

    // Player 4
    call SetPlayerStartLocation(Player(4), 4)
    call ForcePlayerStartLocation(Player(4), 4)
    call SetPlayerColor(Player(4), ConvertPlayerColor(4))
    call SetPlayerRacePreference(Player(4), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(4), false)
    call SetPlayerController(Player(4), MAP_CONTROL_USER)

    // Player 5
    call SetPlayerStartLocation(Player(5), 5)
    call ForcePlayerStartLocation(Player(5), 5)
    call SetPlayerColor(Player(5), ConvertPlayerColor(5))
    call SetPlayerRacePreference(Player(5), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(5), false)
    call SetPlayerController(Player(5), MAP_CONTROL_USER)

    // Player 6
    call SetPlayerStartLocation(Player(6), 6)
    call ForcePlayerStartLocation(Player(6), 6)
    call SetPlayerColor(Player(6), ConvertPlayerColor(6))
    call SetPlayerRacePreference(Player(6), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(6), false)
    call SetPlayerController(Player(6), MAP_CONTROL_USER)

    // Player 7
    call SetPlayerStartLocation(Player(7), 7)
    call ForcePlayerStartLocation(Player(7), 7)
    call SetPlayerColor(Player(7), ConvertPlayerColor(7))
    call SetPlayerRacePreference(Player(7), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(7), false)
    call SetPlayerController(Player(7), MAP_CONTROL_USER)

    // Player 8
    call SetPlayerStartLocation(Player(8), 8)
    call ForcePlayerStartLocation(Player(8), 8)
    call SetPlayerColor(Player(8), ConvertPlayerColor(8))
    call SetPlayerRacePreference(Player(8), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(8), false)
    call SetPlayerController(Player(8), MAP_CONTROL_USER)

    // Player 9
    call SetPlayerStartLocation(Player(9), 9)
    call ForcePlayerStartLocation(Player(9), 9)
    call SetPlayerColor(Player(9), ConvertPlayerColor(9))
    call SetPlayerRacePreference(Player(9), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(9), false)
    call SetPlayerController(Player(9), MAP_CONTROL_USER)

    // Player 10
    call SetPlayerStartLocation(Player(10), 10)
    call ForcePlayerStartLocation(Player(10), 10)
    call SetPlayerColor(Player(10), ConvertPlayerColor(10))
    call SetPlayerRacePreference(Player(10), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(10), false)
    call SetPlayerController(Player(10), MAP_CONTROL_USER)

    // Player 11
    call SetPlayerStartLocation(Player(11), 11)
    call ForcePlayerStartLocation(Player(11), 11)
    call SetPlayerColor(Player(11), ConvertPlayerColor(11))
    call SetPlayerRacePreference(Player(11), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(11), false)
    call SetPlayerController(Player(11), MAP_CONTROL_USER)

    // Player 12
    call SetPlayerStartLocation(Player(12), 12)
    call ForcePlayerStartLocation(Player(12), 12)
    call SetPlayerColor(Player(12), ConvertPlayerColor(12))
    call SetPlayerRacePreference(Player(12), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(12), false)
    call SetPlayerController(Player(12), MAP_CONTROL_USER)

    // Player 13
    call SetPlayerStartLocation(Player(13), 13)
    call SetPlayerColor(Player(13), ConvertPlayerColor(13))
    call SetPlayerRacePreference(Player(13), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(13), false)
    call SetPlayerController(Player(13), MAP_CONTROL_COMPUTER)

endfunction

function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_6510
    call SetPlayerTeam(Player(0), 0)
    call SetPlayerState(Player(0), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(1), 0)
    call SetPlayerState(Player(1), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(2), 0)
    call SetPlayerState(Player(2), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(3), 0)
    call SetPlayerState(Player(3), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(4), 0)
    call SetPlayerState(Player(4), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(5), 0)
    call SetPlayerState(Player(5), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(6), 0)
    call SetPlayerState(Player(6), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(7), 0)
    call SetPlayerState(Player(7), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(8), 0)
    call SetPlayerState(Player(8), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(9), 0)
    call SetPlayerState(Player(9), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(10), 0)
    call SetPlayerState(Player(10), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(11), 0)
    call SetPlayerState(Player(11), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(12), 0)
    call SetPlayerState(Player(12), PLAYER_STATE_ALLIED_VICTORY, 1)

    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(12), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(12), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(12), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(12), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(12), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(12), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(12), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(12), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(12), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(12), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(12), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(12), true)
    call SetPlayerAllianceStateAllyBJ(Player(12), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(12), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(12), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(12), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(12), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(12), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(12), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(12), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(12), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(12), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(12), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(12), Player(11), true)

    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(12), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(12), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(12), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(12), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(12), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(12), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(12), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(12), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(12), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(12), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(12), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(12), true)
    call SetPlayerAllianceStateVisionBJ(Player(12), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(12), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(12), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(12), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(12), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(12), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(12), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(12), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(12), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(12), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(12), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(12), Player(11), true)

    // Force: TRIGSTR_6511
    call SetPlayerTeam(Player(13), 1)
    call SetPlayerState(Player(13), PLAYER_STATE_ALLIED_VICTORY, 1)

endfunction

function InitAllyPriorities takes nothing returns nothing

    call SetStartLocPrioCount(0, 2)
    call SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 1, 11, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(1, 3)
    call SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 1, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 2, 4, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(2, 2)
    call SetStartLocPrio(2, 0, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 1, 12, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(3, 3)
    call SetStartLocPrio(3, 0, 7, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(3, 1, 10, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 2, 12, MAP_LOC_PRIO_LOW)

    call SetStartLocPrioCount(4, 6)
    call SetStartLocPrio(4, 0, 0, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(4, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 2, 2, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(4, 3, 8, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(4, 4, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 5, 10, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(5, 3)
    call SetStartLocPrio(5, 0, 6, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(5, 1, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 2, 11, MAP_LOC_PRIO_LOW)

    call SetStartLocPrioCount(6, 3)
    call SetStartLocPrio(6, 0, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 1, 8, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(6, 2, 9, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(7, 3)
    call SetStartLocPrio(7, 0, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 1, 8, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(7, 2, 10, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(8, 5)
    call SetStartLocPrio(8, 0, 4, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(8, 1, 6, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(8, 2, 7, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(8, 3, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(8, 4, 10, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(9, 4)
    call SetStartLocPrio(9, 0, 4, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(9, 1, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 2, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 3, 8, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(10, 4)
    call SetStartLocPrio(10, 0, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(10, 1, 4, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(10, 2, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(10, 3, 8, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(11, 2)
    call SetStartLocPrio(11, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(11, 1, 5, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(12, 2)
    call SetStartLocPrio(12, 0, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(12, 1, 3, MAP_LOC_PRIO_HIGH)
endfunction

//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************

//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds(- 5376.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 5632.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 5376.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 5632.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 5376.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 5632.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 5376.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 5632.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call SetWaterBaseColor(128, 128, 255, 255)
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("IceCrownDay")
    call SetAmbientNightSound("IceCrownNight")
    call SetMapMusic("Music", true, 0)
    call InitUpgrades()
    call InitTechTree()
    call CreateAllDestructables()
    call InitBlizzard()








    call InitGlobals()
    call InitCustomTriggers()
    call RunInitializationTriggers()

endfunction

//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************

function config takes nothing returns nothing
    call SetMapName("TRIGSTR_6276")
    call SetMapDescription("TRIGSTR_9414")
    call SetPlayers(14)
    call SetTeams(14)
    call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)

    call DefineStartLocation(0, - 2432.0, 4736.0)
    call DefineStartLocation(1, 0.0, 4096.0)
    call DefineStartLocation(2, 2432.0, 4736.0)
    call DefineStartLocation(3, 4352.0, - 512.0)
    call DefineStartLocation(4, 0.0, 1024.0)
    call DefineStartLocation(5, - 4352.0, - 512.0)
    call DefineStartLocation(6, - 3840.0, - 3456.0)
    call DefineStartLocation(7, 3840.0, - 3456.0)
    call DefineStartLocation(8, 0.0, - 3072.0)
    call DefineStartLocation(9, - 2176.0, - 1280.0)
    call DefineStartLocation(10, 2176.0, - 1280.0)
    call DefineStartLocation(11, - 4352.0, 2560.0)
    call DefineStartLocation(12, 4352.0, 2560.0)
    call DefineStartLocation(13, 0.0, - 4736.0)

    // Player setup
    call InitCustomPlayerSlots()
    call InitCustomTeams()
    call InitAllyPriorities()
endfunction




//Struct method generated initializers/callers:




//Struct method generated initializers/callers:




//Struct method generated initializers/callers:




//Struct method generated initializers/callers:

