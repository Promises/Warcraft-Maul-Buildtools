import { WarcraftMaul } from '../WarcraftMaul';
import { COLOUR_CODES, enemies, players } from '../GlobalSettings';

export class Commands {

    commandTrigger: trigger;
    game: WarcraftMaul;

    constructor(game: WarcraftMaul) {
        this.game = game;
        this.commandTrigger = CreateTrigger();
        for (let player of players.values()) {
            TriggerRegisterPlayerChatEvent(this.commandTrigger, player.wcPlayer, '-', false);
        }
        TriggerAddAction(this.commandTrigger, () => this.handleCommand());
    }

    private handleCommand() {
        const player = players.get(GetPlayerId(GetTriggerPlayer()));
        if (!player) {
            return;
        }
        const playerCommand = GetEventPlayerChatString().substr(1).toLowerCase();
        const command = playerCommand.split(' ');
        print(Util.ArraysToString(command));
        switch (command[0]) {
            case 'air':
                player.sendMessage('|cFF999999Air:|r 5 / 15 / 20 / 25 / 30');
                break;
            case 'boss':
                player.sendMessage('|cFF3737F2Boss:|r 9 / 14 / 19 / 24 / 29 / 31');
                break;
            case 'champ':
            case 'champion':
                player.sendMessage('|cFFF2A137Champion:|r 35 / 36');
                break;
            case 'light':
                player.sendMessage('|cFF6d7c86Light:|r 4 / 8 / 11 / 16 / 19 / 23 / 27 / 32');
                break;
            case 'medium':
                player.sendMessage('|cFF416073Medium:|r 3 / 7 / 12 / 17 / 24 / 28 / 33');
                break;
            case 'heavy':
                player.sendMessage('|cFF154360Heavy:|r 2 / 5 / 13 / 15 / 20 / 25 / 30 / 32 / 35');
                break;
            case 'fortified':
                player.sendMessage('|cFFCA8500Fortified:|r 10 / 18 / 22 / 26 / 31');
                break;
            case 'hero':
                player.sendMessage('|cFF7525FFHero:|r 36');
                break;
            case 'waves':
                player.sendMessage(
                    '|cFF999999Air:|r 5 / 15 / 20 / 25 / 30\n' +
                    '|cFF3737F2Boss:|r 9 / 14 / 19 / 24 / 29 / 31\n' +
                    '|cFFF2A137Champion:|r 35 / 36\n' +
                    '|cFF6d7c86Light:|r 4 / 8 / 11 / 16 / 19 / 23 / 27 / 32\n' +
                    '|cFF416073Medium:|r 3 / 7 / 12 / 17 / 24 / 28 / 33\n' +
                    '|cFF154360Heavy:|r 2 / 5 / 13 / 15 / 20 / 25 / 30 / 32 / 35\n' +
                    '|cFFCA8500Fortified:|r 10 / 18 / 22 / 26 / 31\n' +
                    '|cFF7525FFHero:|r 36');
                break;
            case 'buffs':
                player.sendMessage(
                    '|cFFFFCC00Hardened Skin:|r Creeps ignore 2x creep level incoming physical damage\n' +
                    '|cFFFFCC00Evasion:|r Creeps will have a 1x creep level chance to evade physical damage\n' +
                    '|cFFFFCC00Armor Bonus:|r Increases creep armor by creep level divided by 3\n' +
                    '|cFFFFCC00Cripple Aura:|r Whenever a creep takes damage it has a 10% chance to cripple the attacking tower, slowing attack speed by 1.5% times creep level\n' +
                    '|cFFFFCC00Spell Shield:|r Blocks targetting spells from casting every 4 (minus 0.1 times creep level) second\n' +
                    '|cFFFFCC00Tornado Aura:|r Nearby towers are slowed by 1% times creep level\n' +
                    '|cFFFFCC00Vampiric Aura:|r Creeps have a 10% chance to heal for 4x creep level\n' +
                    '|cFFFFCC00Divine Shield:|r Creeps ignore damage until they\'ve been damaged 1x creep level times\n' +
                    '|cFFFFCC00Walk it Off:|r slowed down creeps take 0.5% times creep level less damage\n' +
                    '|cFFFFCC00Morning Person:|r creeps heal for 0.5% times creep level of their max health every time they reach a checkpoint (not teleports)');
                break;
            case 'repick':
                print('Command not implemented yet');
                //TODO: implement command

                // if(RepickConditions()){
                //     RepickActions();
                // } else{
                //     DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,  "You can only repick before wave 1!" );
                // }
                break;
            case 'sa':
            case 'sellall':
                print('Command not implemented yet');
                //TODO: implement command

                // SellAllActions()
                break;
            case 'y':
            case 'yes':
                print('Command not implemented yet');
                //TODO: implement command

                // VoteYes()
                break;
            case 'openall':
                print('Command not implemented yet');
                //TODO: implement command
                if (this.game.debugMode) {
                    player.sendMessage('All spawns are not open!');
                    // OpenAllSpawns()

                }
                break;
            case 'gold':
                if (this.game.debugMode) {
                    let amount = Util.ParsePositiveInt(command[1]);
                    if (!amount) {
                        player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                        return;

                    }
                    player.sendMessage(`Gold was set to |cFFFFCC00${amount}|r`);
                    player.setGold(amount);
                }
                break;
            case 'lumber':
                if (this.game.debugMode) {
                    let amount = Util.ParsePositiveInt(command[1]);
                    if (!amount) {
                        player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                        return;

                    }
                    player.sendMessage(`Lumber was set to |cFF00C850${amount}|r`);
                    player.setLumber(amount);
                }
                break;
            case 'lives':
                print('Command not implemented yet');
                //TODO: implement command
                if (this.game.debugMode) {
                    let amount = Util.ParseInt(command[1]);
                    if (!amount) {
                        player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                        return;

                    }
                    // SET LIVES TO AMOUNT
                }
                break;
            case 'closeall':
                print('Command not implemented yet');
                //TODO: implement command
                if (this.game.debugMode) {
                    player.sendMessage('All spawns are now closed!');
                    // CloseAllSpawns()

                }
                break;
            case 'diff':
                if (this.game.debugMode) {
                    let amount = Util.ParsePositiveInt(command[1]);
                    if (!amount) {
                        player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                        return;

                    }
                    player.sendMessage(`Difficulty was set to ${amount}%`);

                    for (let enemy of enemies) {
                        enemy.setHandicap(amount);
                    }
                }
                break;
            case 'votekick':
                print('Command not implemented yet');
                // VoteKick();
                break;
            case 'give':
            case 'send':
                print('Command not implemented yet');
                // GiveGold();
                break;
            case 'allow':
                print('Command not implemented yet');
                // AllowSpecificPlayer();
                break;
            case 'deny':
                print('Command not implemented yet');
                // DenySpecificPlayer();
                break;
            case 'allowall':
                print('Command not implemented yet');
                // AllowAllPlayers();
                player.sendMessage('ALL players are now |cFF00FF00allowed|r to build in your spawn!');
                break;
            case 'denyall':
                print('Command not implemented yet');
                // DenyAllPlayers();
                player.sendMessage('ALL players are now |cFFFF0000denied|r access to your spawn!');
                break;
            case 'claim':
                print('Command not implemented yet');
                // AllowAllPlayers();
                // DenyAllPlayers();
                player.sendMessage('All towers in your spawn has now been claimed.');
                break;
            case 'zoom':
            case 'cam':
                if (GetLocalPlayer() == player.wcPlayer) {
                    let amount = Util.ParsePositiveInt(command[1]);
                    if (!amount) {
                        player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                        return;

                    }
                    SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, amount, 1);
                }
                break;
            case 'wave':
                print('Command not implemented yet');
                //TODO: implement command
                if (this.game.debugMode) {
                    let amount = Util.ParsePositiveInt(command[1]);
                    if (!amount) {
                        player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                        return;

                    }
                    if(amount >= this.game.worldMap.waveCreeps.length){
                        player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                        return;
                    }
                    // SET WAVE
                }
                break;
            case 'maze':
                print('Command not implemented yet');
                //TODO: implement command

                // ShowMazeAll()
                break;

        }


    }

    getPlayerIdFromColourName(color: string): number {
        return Util.COLOUR_IDS[color.toUpperCase()];
    }

    // private function HasCorrectUnitUserData takes nothing returns boolean
    // if(LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_PlayerLeavesTable) == GetConvertedPlayerId(GetTriggerPlayer()))then
    // return true
    // endif
    // return false
    // endfunction
    //
    // private function EnumSpecialEffect takes nothing returns nothing
    // local real x = GetUnitX(GetEnumUnit())
    // local real y = GetUnitY(GetEnumUnit())
    // call DestroyEffect(AddSpecialEffect("Abilities/Spells/Items/ResourceItems/ResourceEffectTarget.mdl", x, y))
    // endfunction
    //
    // private function SellATower takes nothing returns nothing
    // if(HasCorrectUnitUserData())then
    // call SharedWorld_SellTower(GetEnumUnit())
    // endif
    // endfunction
    //
    // private function SellAllActions takes nothing returns nothing
    // local group grp = GetUnitsOfPlayerAll(GetTriggerPlayer())
    // call ForGroupBJ(grp, function SellATower)
    // call DestroyGroup(grp)
    // endfunction
    //
    // private function RepickRemoveConditions takes nothing returns boolean
    // if(GetUnitTypeId(GetEnumUnit()) == 'h03S')then
    // return false
    // endif
    //
    // if(GetUnitTypeId(GetEnumUnit()) == 'e00C')then
    // return false
    // endif
    //
    // return true
    // endfunction
    //
    // private function RemoveTriggeringPlayerUnits takes nothing returns nothing
    // if(GetOwningPlayer(GetEnumUnit()) == GetTriggerPlayer()) then
    // if(RepickRemoveConditions())then
    // call RemoveUnit(GetEnumUnit())
    // endif
    // endif
    // endfunction
    //
    // private function RepickActions takes nothing returns nothing
    // local integer playerid = GetPlayerId(GetTriggerPlayer())
    // local group grp = GetUnitsInRectAll(GetPlayableMapRect())
    // if playerid == 8 then
    // if (GetPlayerState(Player(playerid), PLAYER_STATE_RESOURCE_GOLD) > 150) then
    // call SetPlayerStateBJ(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD, 150)
    // endif
    // else
    // if (GetPlayerState(Player(playerid), PLAYER_STATE_RESOURCE_GOLD) > 100) then
    // call SetPlayerStateBJ(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD, 100)
    // endif
    // endif
    // call SetPlayerStateBJ(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER, 1)
    // call ForGroupBJ(grp, function RemoveTriggeringPlayerUnits)
    // call DestroyGroup(grp)
    // set grp=null
    // endfunction
    //
    // private function RepickConditions takes nothing returns boolean
    // if not(udg_CreepLevel==1) then
    // return false
    // endif
    //
    // if udg_IsWaveInProgress then
    // return false
    // endif
    //
    // if udg_HasHardcoreRandomed[GetPlayerId(GetTriggerPlayer())] then
    // return false
    // endif
    //
    // if udg_HasHybridRandomed[GetPlayerId(GetTriggerPlayer())] then
    // return false
    // endif
    //
    // return true
    // endfunction
    //
    // private function CloseAllSpawns takes nothing returns nothing
    // local integer i = 0
    // loop
    // exitwhen i > 12
    // set udg_IsSpawnOpen[i] = 0
    // set i = i + 1
    // endloop
    // endfunction
    //
    // private function OpenAllSpawns takes nothing returns nothing
    // local integer i = 0
    // loop
    // exitwhen i > 12
    // set udg_IsSpawnOpen[i] = 1
    // set i = i + 1
    // endloop
    // endfunction
    //
    // private function ChangeUnitOwnership takes nothing returns nothing
    // if(GetOwningPlayer(GetEnumUnit()) == GetTriggerPlayer())then
    // if(IsUnitIdType(GetUnitTypeId(GetEnumUnit()), UNIT_TYPE_TOWNHALL) == false)then
    // if(IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE) == true )then
    // call SetUnitOwner( GetEnumUnit(), Player(udg_UnitOwnershipInt), true )
    // endif
    // endif
    // endif
    // endfunction
    //
    // private function ChangeUnitOwnershipAction takes nothing returns nothing
    // local group grp = GetUnitsSelectedAll(GetTriggerPlayer())
    // call ForGroupBJ(grp, function ChangeUnitOwnership)
    // call DestroyGroup(grp)
    // set grp = null
    // endfunction
    //
    // private function ChangeRestrictionOfPlayer takes integer pidtrig, integer pid, boolean flag returns nothing
    // set udg_PlayerRestrictions[13 * pidtrig + pid] = flag
    // endfunction
    //
    // private function IsPickedUnitOwnedByDeniedPlayer takes nothing returns boolean
    // return udg_PlayerRestrictions[13 * GetPlayerId(GetTriggerPlayer()) + GetPlayerId(GetOwningPlayer(GetEnumUnit()))]
    // endfunction
    //
    // private function MoveEnumUnitBackToHisOwnSpawn takes nothing returns nothing
    // local real x = GetRectCenterX(udg_PlayerRestrictionArea[GetPlayerId(GetOwningPlayer(GetEnumUnit()))])
    // local real y = GetRectCenterY(udg_PlayerRestrictionArea[GetPlayerId(GetOwningPlayer(GetEnumUnit()))])
    // call SetUnitPosition(GetEnumUnit(), x, y)
    // endfunction
    //
    // private function ChangeOwnershipOfDeniedPlayerTower takes nothing returns nothing
    // if IsPickedUnitOwnedByDeniedPlayer() then
    // if IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE) then
    // if not(IsUnitType(GetEnumUnit(), UNIT_TYPE_TOWNHALL)) then
    // call SetUnitOwner(GetEnumUnit(), GetTriggerPlayer(), true)
    // endif
    // else
    // call MoveEnumUnitBackToHisOwnSpawn()
    // endif
    // endif
    // endfunction
    //
    // private function SellDeniedPlayerTower takes nothing returns nothing
    // if IsPickedUnitOwnedByDeniedPlayer() then
    // if IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE) then
    // if not(IsUnitType(GetEnumUnit(), UNIT_TYPE_TOWNHALL)) then
    // call SellATower()
    // endif
    // else
    // call MoveEnumUnitBackToHisOwnSpawn()
    // endif
    // endif
    // endfunction
    //
    // private function SellAllDeniedAccessOwnersTowers takes integer pidtrig returns nothing
    // local group grp = GetUnitsInRectAll(udg_PlayerRestrictionArea[pidtrig])
    // call ForGroupBJ(grp, function SellDeniedPlayerTower)
    // call DestroyGroup(grp)
    // set grp=null
    // endfunction
    //
    // private function ChangeOwnershipOfAllDeniedAccessTowers takes integer pidtrig returns nothing
    // local group grp=GetUnitsInRectAll(udg_PlayerRestrictionArea[pidtrig])
    // call ForGroupBJ(grp, function ChangeOwnershipOfDeniedPlayerTower)
    // call DestroyGroup(grp)
    // set grp=null
    // endfunction
    //
    // private function DenyAllPlayers takes nothing returns nothing
    // local integer i = 0
    // loop
    // exitwhen i > 12
    // if(i != GetPlayerId(GetTriggerPlayer()))then
    // call ChangeRestrictionOfPlayer(GetPlayerId(GetTriggerPlayer()), i, true)
    // endif
    // set i = i + 1
    // endloop
    //
    // call ChangeOwnershipOfAllDeniedAccessTowers(GetPlayerId(GetTriggerPlayer()))
    // endfunction
    //
    // private function AllowAllPlayers takes nothing returns nothing
    // local integer i = 0
    // loop
    // exitwhen i > 12
    // if (i != GetPlayerId(GetTriggerPlayer())) then
    // call ChangeRestrictionOfPlayer(GetPlayerId(GetTriggerPlayer()), i, false)
    // endif
    // set i = i + 1
    // endloop
    // endfunction
    //
    // private function AllowSpecificPlayer takes nothing returns nothing
    // local string colorname = SubStringBJ(GetEventPlayerChatString(), 8, StringLength(GetEventPlayerChatString()))
    // local integer playerid = GetPlayerIdFromColorName(colorname)
    // if (playerid > -1) then
    // if (playerid != GetPlayerId(GetTriggerPlayer())) then
    // call ChangeRestrictionOfPlayer(GetPlayerId(GetTriggerPlayer()), playerid, false)
    // call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,udg_PlayerColorCodes[playerid] + GetPlayerName(Player(playerid)) + "|r is now |cFF00FF00allowed|r to build in your spawn!")
    // else
    // call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,"You are already allowed to to build in this spawn")
    // endif
    // else
    // call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,"Please enter a valid color!")
    // endif
    // endfunction
    //
    // private function DenySpecificPlayer takes nothing returns nothing
    // local string colorname = SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString()))
    // local integer playerid = GetPlayerIdFromColorName(colorname)
    // if (playerid > -1) then
    // if (playerid != GetPlayerId(GetTriggerPlayer())) then
    // call ChangeRestrictionOfPlayer(GetPlayerId(GetTriggerPlayer()), playerid, true)
    // call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,udg_PlayerColorCodes[playerid] + GetPlayerName(Player(playerid)) + "|r is now |cFFFF0000denied|r access to your spawn!")
    // call ChangeOwnershipOfAllDeniedAccessTowers(GetPlayerId(GetTriggerPlayer()))
    // else
    // call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,"You can't deny yourself access!")
    // endif
    // else
    // call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,"Please enter a valid color!")
    // endif
    // endfunction
    //
    // private function FindNextSpaceCharacter takes string txt, integer startIndex returns integer
    // local integer index = startIndex
    // local integer stringLength = StringLength(txt)
    //
    // loop
    // exitwhen index > stringLength
    // if SubStringBJ(txt, index, index) == " " then
    // return index
    // endif
    // set index = index + 1
    // endloop
    // return -1
    // endfunction
    //
    // private function GiveGoldToPlayer takes string chatStr, integer spaceCharacterIndex returns nothing
    // local string colorname = SubStringBJ(chatStr, 7, spaceCharacterIndex - 1)
    // local integer playerid = GetPlayerIdFromColorName(colorname)
    // local integer goldAmount
    // local string goldAmountStr
    //
    // if playerid == -1 then
    // call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "Invalid player color")
    // return
    // endif
    //
    // set goldAmount = S2I(SubStringBJ(chatStr, spaceCharacterIndex + 1, StringLength(chatStr)))
    // set goldAmountStr = I2S(goldAmount)
    //
    // if goldAmount > 0 then
    // if GetPlayerSlotState(Player(playerid)) == PLAYER_SLOT_STATE_PLAYING then
    // if GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD) >= goldAmount then
    // call SetPlayerStateBJ(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD) - goldAmount)
    // call SetPlayerStateBJ(Player(playerid ), PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(Player(playerid), PLAYER_STATE_RESOURCE_GOLD) + goldAmount)
    // call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "You've sent |cFFFFCC00" + goldAmountStr + "|r gold to " + udg_PlayerColorCodes[playerid] + GetPlayerName(Player(playerid)) + "|r")
    // call DisplayTimedTextToPlayer(Player(playerid), 0, 0, 5, "You've received |cFFFFCC00" + goldAmountStr + "|r gold from " + udg_PlayerColorCodes[GetPlayerId(GetTriggerPlayer())] + GetPlayerName(GetTriggerPlayer()) + "|r")
    // else
    // call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "You do not have this much gold")
    // endif
    // else
    // call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "This player is not in-game")
    // endif
    // else
    // call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "You can't give this amount")
    // endif
    // endfunction
    //
    // private function GiveGold takes nothing returns nothing
    // local string chatStr = GetEventPlayerChatString()
    // local integer spaceCharacterIndex = FindNextSpaceCharacter(chatStr, 7)
    // if spaceCharacterIndex > 0 then
    // call GiveGoldToPlayer(chatStr, spaceCharacterIndex)
    // else
    // call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "Invalid command")
    // endif
    // endfunction
    //
    // private function CountCurrentVotes takes nothing returns integer
    // local integer i = 0
    // local integer totalCount = 0
    // loop
    // exitwhen i > 13
    // if (udg_HasVotedToKick[i]) then
    // set totalCount = totalCount + 1
    // endif
    // set i = i + 1
    // endloop
    //
    // return totalCount
    // endfunction
    //
    // private function VotekickExpire takes nothing returns nothing
    // local integer i = 0
    // local integer totalCount = 0
    //
    // loop
    // exitwhen i > 13
    // if (udg_HasVotedToKick[i]) then
    // set totalCount = totalCount + 1
    // endif
    // set udg_HasVotedToKick[i] = false
    // set i = i + 1
    // endloop
    //
    // call DisplayTextToForce(GetPlayersAll(), "Votekick for " + udg_PlayerColorCodes[udg_VotekickPlayerId] + GetPlayerName(Player(udg_VotekickPlayerId)) + "|r has ended with " + I2S(totalCount) + " votes")
    //
    // set udg_VotekickInProgress = false
    // endfunction
    //
    // private function IsPickedUnitOwnedByKickedPlayer takes nothing returns boolean
    // if not(GetPlayerId(GetOwningPlayer(GetEnumUnit())) == udg_VotekickPlayerId) then
    // return false
    // endif
    //
    // if not(GetUnitTypeId(GetEnumUnit()) != 'h03S') then
    // return false
    // endif
    //
    // return true
    // endfunction
    //
    // private function RemoveKickedPlayerTowers takes nothing returns nothing
    // if IsPickedUnitOwnedByKickedPlayer() then
    // call RemoveUnit(GetEnumUnit())
    // endif
    // endfunction
    //
    // private function RemoveAllKickedPlayerTowers takes nothing returns nothing
    // local group grp = GetUnitsInRectAll(GetPlayableMapRect())
    // call ForGroupBJ(GetUnitsInRectAll(GetPlayableMapRect()),function RemoveKickedPlayerTowers)
    // call DestroyGroup(grp)
    // set grp=null
    // endfunction
    //
    // private function CheckVotes takes nothing returns nothing
    // local integer currentVotes = CountCurrentVotes()
    // local integer requiredVotes = (udg_PlayerCount / 2) + 1
    // local integer missingVotes = requiredVotes - currentVotes
    // if (currentVotes >= requiredVotes) then
    // set udg_IsSpawnOpen[udg_VotekickPlayerId] = 0
    //
    // // Remove all towers and units
    // call RemoveAllKickedPlayerTowers()
    //
    // // Update scoreboard
    // call MultiboardSetItemValueBJ(udg_Scoreboard, 1, 7 + udg_PlayerScorePosition[udg_VotekickPlayerId], udg_PlayerColorCodes[udg_VotekickPlayerId] + "<Kicked>|r")
    //
    // // Set new player count
    // set udg_PlayerCount = udg_PlayerCount - 1
    //
    // call DisplayTextToForce(GetPlayersAll(), "Votekick for " + udg_PlayerColorCodes[udg_VotekickPlayerId] + GetPlayerName(Player(udg_VotekickPlayerId)) + "|r has succeeded!")
    // call CustomDefeatBJ(Player(udg_VotekickPlayerId), "Kicked!")
    // else
    // call DisplayTextToForce(GetPlayersAll(), "You'll need " + I2S(missingVotes) + " more votes to kick")
    // endif
    // endfunction
    //
    // private function VoteYes takes nothing returns nothing
    // local integer votingPlayerId = GetPlayerId(GetTriggerPlayer())
    // if udg_VotekickInProgress then
    // if not (udg_HasVotedToKick[votingPlayerId]) then
    // if votingPlayerId != udg_VotekickPlayerId then
    // set udg_HasVotedToKick[votingPlayerId] = true
    // call CheckVotes()
    // else
    // call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,"You can't votekick yourself!")
    // endif
    // else
    // call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "You have already voted to kick this player")
    // endif
    // else
    // call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "There is no votekick in progress")
    // endif
    // endfunction
    //
    // private function Votekick takes nothing returns nothing
    // local integer votingPlayerId = GetPlayerId(GetTriggerPlayer())
    // local string chatStr = GetEventPlayerChatString()
    // local string colorname = SubStringBJ(GetEventPlayerChatString(), 11, StringLength(GetEventPlayerChatString()))
    // local integer playerid = GetPlayerIdFromColorName(colorname)
    // if playerid != -1 then
    // if GetPlayerSlotState(Player(playerid)) == PLAYER_SLOT_STATE_PLAYING then
    // if not (udg_VotekickInProgress) then
    // if votingPlayerId != playerid then
    // call DisplayTextToForce(GetPlayersAll(), udg_PlayerColorCodes[votingPlayerId] + GetPlayerName(GetTriggerPlayer()) + "|r has started a votekick for " + udg_PlayerColorCodes[playerid] + GetPlayerName(Player(playerid)) + "|r (say -y to vote)")
    // set udg_VotekickInProgress = true
    // set udg_VotekickPlayerId = playerid
    // set udg_HasVotedToKick[votingPlayerId] = true
    // call TimerStart(udg_VotekickTimer, 30.00, false, function VotekickExpire)
    // else
    // call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,"You can't votekick yourself!")
    // endif
    // else
    // call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,"Votekick already in progress")
    // endif
    // else
    // call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,"This player is no longer in game!")
    // endif
    // else
    // call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,"Please enter a valid color!")
    // endif
    // endfunction
    //
    // private function ZoomPlayerCamera takes string zoomval returns nothing
    // call SetCameraFieldForPlayer( GetTriggerPlayer(), CAMERA_FIELD_ZOFFSET, S2I(zoomval), 0 )
    // endfunction
    //
    // private function CreateImageEx takes string imagePath, real size, real x, real y, real z, boolean showImage returns image
    // local image i = CreateImage(imagePath, size, size, 0, x - (size / 2), y - (size / 2), z, 0, 0, 0, 2)
    // call SetImageRenderAlways(i, true)
    // call ShowImage(i, showImage)
    // return i
    // endfunction
    //
    // private function OutlineBuilding takes string imagePath, real x, real y returns nothing
    // call CreateImageEx(imagePath, 192, x, y, 0.00, true)
    // endfunction
    //
    // /*
    // private function OutlineBuilding takes string effectModel, real x, real y returns nothing
    //     local integer i = 0
    //     local integer maxIndex = 96
    //     local real halfIndex = maxIndex / 2.00
    //     loop
    //         exitwhen i > maxIndex
    //         call AddSpecialEffect(effectModel, x - halfIndex + i, y + halfIndex)
    //         call AddSpecialEffect(effectModel, x + halfIndex, y + halfIndex - i)
    //         call AddSpecialEffect(effectModel, x + halfIndex - i, y - halfIndex)
    //         call AddSpecialEffect(effectModel, x - halfIndex, y - halfIndex + i)
    //         set i = i + 32
    //     endloop
    // endfunction
    // */
    //
    // private function ShowMaze takes real x, real y, real x2, real y2 returns nothing
    // local string effectModel = ""
    // local real towardsX2 = x2 - x
    // local real towardsY2 = y2 - y
    // local real towardsX2Div9 = (towardsX2 / 9)
    // local real towardsX2Div18 = (towardsX2 / 18)
    // local real towardsY2Div9 = (towardsY2 / 9)
    // local real towardsY2Div18 = (towardsY2 / 18)
    //
    // if (GetTriggerPlayer() == GetLocalPlayer()) then
    // // set effectModel = "Abilities/Spells/Undead/AbsorbMana/AbsorbManaBirthMissile.mdl"
    // // set effectModel = "ReplaceableTextures/Splats/HumanUbersplat.blp"
    // set effectModel = "ReplaceableTextures/Splats/SuggestedPlacementSplat.blp"
    // endif
    //
    // // Between Checkpoints
    // call OutlineBuilding(effectModel, x + towardsX2Div9, y + towardsY2Div9)
    // call OutlineBuilding(effectModel, x + 2 * towardsX2Div9, y + 2 * towardsY2Div9)
    // call OutlineBuilding(effectModel, x + 3 * towardsX2Div9, y + 3 * towardsY2Div9)
    // call OutlineBuilding(effectModel, x + 4 * towardsX2Div9, y + 4 * towardsY2Div9)
    // call OutlineBuilding(effectModel, x + 5 * towardsX2Div9, y + 5 * towardsY2Div9)
    // call OutlineBuilding(effectModel, x + 6 * towardsX2Div9, y + 6 * towardsY2Div9)
    // call OutlineBuilding(effectModel, x + 7 * towardsX2Div9, y + 7 * towardsY2Div9)
    //
    // // Around first checkpoint
    // call OutlineBuilding(effectModel, x - towardsY2Div9, y - towardsX2Div9)
    // call OutlineBuilding(effectModel, x - towardsX2Div9, y - towardsY2Div9)
    // call OutlineBuilding(effectModel, x + towardsY2Div9 - towardsX2Div18, y - towardsY2Div18 + towardsX2Div9)
    // call OutlineBuilding(effectModel, x + towardsY2Div9 + towardsY2Div18 + towardsX2Div18, y + towardsY2Div18 + towardsX2Div9 + towardsX2Div18)
    //
    // // Around second checkpoint
    // call OutlineBuilding(effectModel, x + 8 * towardsX2Div9, y + 8 * towardsY2Div9)
    // call OutlineBuilding(effectModel, x + towardsY2Div9 + 9 * towardsX2Div9, y + 9 * towardsY2Div9 + towardsX2Div9)
    // call OutlineBuilding(effectModel, x + 10 * towardsX2Div9, y + 10 * towardsY2Div9)
    // call OutlineBuilding(effectModel, x - towardsY2Div9 + 9 * towardsX2Div9 + towardsX2Div18, y + 9 * towardsY2Div9 + towardsY2Div18 - towardsX2Div9)
    //
    // // Left side
    // call OutlineBuilding(effectModel, x + towardsY2Div18 + towardsY2Div9 + towardsX2Div18, y + towardsY2Div18 + towardsX2Div18 + towardsX2Div9)
    // call OutlineBuilding(effectModel, x + towardsY2Div18 + towardsY2Div9 + towardsX2Div18 + towardsX2Div9, y + towardsY2Div18 + towardsY2Div9 + towardsX2Div18 + towardsX2Div9)
    // call OutlineBuilding(effectModel, x + towardsY2Div18 + towardsY2Div9 + towardsX2Div18 + 2 * towardsX2Div9, y + towardsY2Div18 + 2 * towardsY2Div9 + towardsX2Div18 + towardsX2Div9)
    // call OutlineBuilding(effectModel, x + towardsY2Div18 + towardsY2Div9 + towardsX2Div18 + 3 * towardsX2Div9, y + towardsY2Div18 + 3 * towardsY2Div9 + towardsX2Div18 + towardsX2Div9)
    // call OutlineBuilding(effectModel, x + towardsY2Div18 + towardsY2Div9 + towardsX2Div18 + 4 * towardsX2Div9, y + towardsY2Div18 + 4 * towardsY2Div9 + towardsX2Div18 + towardsX2Div9)
    // call OutlineBuilding(effectModel, x + towardsY2Div18 + towardsY2Div9 + towardsX2Div18 + 5 * towardsX2Div9, y + towardsY2Div18 + 5 * towardsY2Div9 + towardsX2Div18 + towardsX2Div9)
    // call OutlineBuilding(effectModel, x + towardsY2Div18 + towardsY2Div9 + towardsX2Div18 + 6 * towardsX2Div9, y + towardsY2Div18 + 6 * towardsY2Div9 + towardsX2Div18 + towardsX2Div9)
    // call OutlineBuilding(effectModel, x + towardsY2Div18 + towardsY2Div9 + towardsX2Div18 + 7 * towardsX2Div9, y + towardsY2Div18 + 7 * towardsY2Div9 + towardsX2Div18 + towardsX2Div9)
    //
    // // Right side
    // call OutlineBuilding(effectModel, x - towardsY2Div18 - towardsY2Div9 + towardsX2Div18 + 8 * towardsX2Div9, y + towardsY2Div18 + 8 * towardsY2Div9 - towardsX2Div18 - towardsX2Div9)
    // call OutlineBuilding(effectModel, x - towardsY2Div18 - towardsY2Div9 + towardsX2Div18 + 7 * towardsX2Div9, y + towardsY2Div18 + 7 * towardsY2Div9 - towardsX2Div18 - towardsX2Div9)
    // call OutlineBuilding(effectModel, x - towardsY2Div18 - towardsY2Div9 + towardsX2Div18 + 6 * towardsX2Div9, y + towardsY2Div18 + 6 * towardsY2Div9 - towardsX2Div18 - towardsX2Div9)
    // call OutlineBuilding(effectModel, x - towardsY2Div18 - towardsY2Div9 + towardsX2Div18 + 5 * towardsX2Div9, y + towardsY2Div18 + 5 * towardsY2Div9 - towardsX2Div18 - towardsX2Div9)
    // call OutlineBuilding(effectModel, x - towardsY2Div18 - towardsY2Div9 + towardsX2Div18 + 4 * towardsX2Div9, y + towardsY2Div18 + 4 * towardsY2Div9 - towardsX2Div18 - towardsX2Div9)
    // call OutlineBuilding(effectModel, x - towardsY2Div18 - towardsY2Div9 + towardsX2Div18 + 3 * towardsX2Div9, y + towardsY2Div18 + 3 * towardsY2Div9 - towardsX2Div18 - towardsX2Div9)
    // call OutlineBuilding(effectModel, x - towardsY2Div18 - towardsY2Div9 + towardsX2Div18 + 2 * towardsX2Div9, y + towardsY2Div18 + 2 * towardsY2Div9 - towardsX2Div18 - towardsX2Div9)
    // call OutlineBuilding(effectModel, x - towardsY2Div18 - towardsY2Div9 + towardsX2Div18 + towardsX2Div9, y + towardsY2Div18 + towardsY2Div9 - towardsX2Div18 - towardsX2Div9)
    // endfunction
    //
    // private function ShowMazeAll takes nothing returns nothing
    // local integer i = 0
    // loop
    // exitwhen i > 13
    // call ShowMaze(GetRectCenterX(udg_Checkpoints[2 * i]), GetRectCenterY(udg_Checkpoints[2 * i]), GetRectCenterX(udg_Checkpoints[2 * i + 1]), GetRectCenterY(udg_Checkpoints[2 * i + 1]))
    // set i = i + 1
    // endloop
    // endfunction
    //



}
