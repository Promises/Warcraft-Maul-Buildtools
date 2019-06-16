import { WarcraftMaul } from '../WarcraftMaul';
import { COLOUR_CODES, enemies, players } from '../GlobalSettings';
import { Trigger } from '../../JassOverrides/Trigger';
import { Defender } from '../Entity/Players/Defender';

export class Commands {

    commandTrigger: Trigger;
    game: WarcraftMaul;
    private voteKickInProgress: boolean = false;
    private voteAgainstPlayer: Defender | undefined;
    private hasVotedToKick: boolean[] = [];
    private voteKickTimer: timer = CreateTimer();

    constructor(game: WarcraftMaul) {
        this.game = game;
        this.commandTrigger = new Trigger();
        for (let player of players.values()) {
            this.commandTrigger.RegisterPlayerChatEvent(player.wcPlayer, '-', false);
        }
        this.commandTrigger.AddAction(() => this.handleCommand());
        for (let i = 0; i < 24; i++) {
            this.hasVotedToKick[i] = false;
        }
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
                if (this.RepickConditions(player)) {
                    this.RepickActions(player);
                } else {
                    DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, 'You can only repick before wave 1!');
                }
                break;
            case 'sa':
            case 'sellall':
                print('Command not implemented yet');
                //TODO: implement command

                // SellAllActions()
                break;
            case 'y':
            case 'yes':
                this.VoteYes(player);
                break;
            case 'openall':
                if (this.game.debugMode) {
                    player.sendMessage('All spawns are not open!');
                    this.OpenAllSpawns();

                }
                break;
            case 'gold':
                if (this.game.debugMode) {
                    let amount = Util.ParseInt(command[1]);
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
                if (this.game.debugMode) {
                    let amount = Util.ParseInt(command[1]);
                    if (!amount) {
                        player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                        return;

                    }
                    this.game.gameLives = amount;
                    this.game.startLives = amount;
                    player.sendMessage('Lives were set to |cFFFFCC00' + amount + '|r');
                }
                break;
            case 'closeall':
                if (this.game.debugMode) {
                    player.sendMessage('All spawns are now closed!');
                    this.CloseAllSpawns();

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
            case 'kick':
            case 'votekick':
                print('Command not implemented yet');
                if (command[1]) {
                    let receiver = this.getPlayerIdFromColourName(command[1]);
                    const receivingPlayer = players.get(receiver);
                    if (receivingPlayer) {
                        this.VoteKick(player, receivingPlayer);
                    } else {
                        player.sendMessage('Player not available');
                    }
                }
                break;
            case 'give':
            case 'send':
                print('Command not implemented yet');
                if (command[1] && command[2]) {
                    let receiver = this.getPlayerIdFromColourName(command[1]);
                    const receivingPlayer = players.get(receiver);

                    let amount = Util.ParsePositiveInt(command[2]);
                    if (!amount) {
                        player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                        return;
                    }
                    this.giveGoldToPlayer(receivingPlayer, player, amount);
                }
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
                if (this.game.debugMode) {
                    let amount = Util.ParsePositiveInt(command[1]);
                    if (!amount) {
                        player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                        return;

                    }
                    if (amount >= this.game.worldMap.waveCreeps.length) {
                        player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                        return;
                    }
                    player.sendMessage(`Current wave was set to ${amount}`);

                    this.game.gameRoundHandler.currentWave = amount;
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


    RepickActions(player: Defender) {
        let grp = GetUnitsInRectAll(GetPlayableMapRect());
        let maxgold = player.id == COLOUR.GRAY ? 150 : 100;
        if (player.getGold() > maxgold) {
            player.setGold(maxgold);
        }
        player.setLumber(1);
        ForGroupBJ(grp, () => this.RemovePlayerUnits(player));
        DestroyGroup(grp);


    }

    RepickConditions(player: Defender) {
        if (!(this.game.gameRoundHandler.currentWave == 1)) {
            return false;
        }
        if (this.game.gameRoundHandler.isWaveInProgress) {
            return false;
        }
        if (player.hasHardcoreRandomed) {
            return false;
        }
        if (player.hasHybridRandomed) {
            return false;
        }
        return true;
    }

    RemovePlayerUnits(player: Defender) {
        if (GetOwningPlayer(GetEnumUnit()) == player.wcPlayer) {
            if (this.RepickRemoveConditions(GetEnumUnit())) {
                RemoveUnit(GetEnumUnit());
            }
        }
    }

    private RepickRemoveConditions(Unit: unit) {
        if (GetUnitTypeId(Unit) == FourCC('h03S')) {
            return false;
        }

        if (GetUnitTypeId(Unit) == FourCC('e00C')) {
            return false;
        }

        return true;
    }

    OpenAllSpawns() {
        for (let spawn of this.game.worldMap.playerSpawns) {
            spawn.isOpen = true;
        }
    }


    CloseAllSpawns() {
        for (let spawn of this.game.worldMap.playerSpawns) {
            spawn.isOpen = false;
        }
    }


    private giveGoldToPlayer(receivingPlayer: Defender | undefined, player: Defender, amount: number) {
        if (receivingPlayer) {
            if (player.getGold() >= amount) {
                player.setGold(player.getGold() - amount);
                receivingPlayer.setGold(receivingPlayer.getGold() + amount);
                player.sendMessage(`You've sent ${Util.ColourString('FFCC00', '' + amount)} gold to ${receivingPlayer.getNameWithColour()}`);
                receivingPlayer.sendMessage(`You've received ${Util.ColourString('FFCC00', '' + amount)} gold from ${player.getNameWithColour()}`);

            } else {
                player.sendMessage('You do not have this much gold');
            }
        } else {
            player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Receiver'));
        }
    }

    private VoteKick(player: Defender, receivingPlayer: Defender) {

        if (!this.voteKickInProgress) {
            if (player != receivingPlayer) {
                DisplayTextToForce(GetPlayersAll(), `${player.getNameWithColour()} has started a votekick for ${receivingPlayer.getNameWithColour()} (say -y to vote)`);
                this.voteKickInProgress = true;
                this.voteAgainstPlayer = receivingPlayer;
                this.hasVotedToKick[player.id] = true;
            } else {
                player.sendMessage('You idiot, you cannot stomp your own ass with the front of your own foot.');
                TimerStart(this.voteKickTimer, 30.00, false, () => this.VotekickExpire());
            }
        } else {
            player.sendMessage('There is already a votekick in progress');
        }

    }

    private VotekickExpire() {
        let count = this.CountCurrentVotes();
        if (this.voteAgainstPlayer) {
            DisplayTextToForce(GetPlayersAll(), `Votekick for ${this.voteAgainstPlayer.getNameWithColour()} has ended with ${count} votes`);
        }
        this.voteKickInProgress = false;


    }

    private VoteYes(player: Defender) {
        if (this.voteKickInProgress) {
            if (!this.hasVotedToKick[player.id]) {
                if (!(this.voteAgainstPlayer == player)) {
                    this.hasVotedToKick[player.id] = true;
                    this.CheckVotes();
                } else {
                    player.sendMessage('You can not kick yourself');

                }
            } else {
                player.sendMessage('You have already voted to kick this player');
            }
        } else {
            player.sendMessage('There is no votekick in progress');
        }
    }

    private CheckVotes() {
        let currentVotes = this.CountCurrentVotes();
        let neededVotes = (players.size / 2) + 1;
        let missingVotes = neededVotes - currentVotes;


        if (currentVotes >= neededVotes) {
            if (this.voteAgainstPlayer) {
                this.game.worldMap.playerSpawns[this.voteAgainstPlayer.id].isOpen = true;


                this.RemoveAllKickedPlayerTowers();
                if (this.game.scoreBoard) {
                    MultiboardSetItemValueBJ(this.game.scoreBoard.board, 1, 7 + this.voteAgainstPlayer.scoreSlot,
                        Util.ColourString(this.voteAgainstPlayer.getColourCode(), '<Kicked>'));
                }
                players.delete(this.voteAgainstPlayer.id);


                DisplayTextToForce(GetPlayersAll(), `Votekick for ${this.voteAgainstPlayer.getNameWithColour()} has succeeded!`);
                CustomDefeatBJ(this.voteAgainstPlayer.wcPlayer, 'Kicked!');

                DestroyTimer(this.voteKickTimer);
                this.voteKickInProgress = false

            }
        } else {
            DisplayTextToForce(GetPlayersAll(), 'You\'ll need ' + missingVotes + ' more votes to kick');
        }
    }

    private CountCurrentVotes(): number {
        let count = 0;
        for (let i = 0; i < this.hasVotedToKick.length; i++) {
            if (this.hasVotedToKick) {
                count++;
            }
        }
        return count;
    }

    private RemoveAllKickedPlayerTowers() {

        let grp = GetUnitsInRectAll(GetPlayableMapRect());

        ForGroupBJ(GetUnitsInRectAll(GetPlayableMapRect()), () => this.RemoveKickedPlayerTowers());
        DestroyGroup(grp);

    }

    private RemoveKickedPlayerTowers() {
        if (this.IsPickedUnitOwnedByKickedPlayer()) {
            RemoveUnit(GetEnumUnit());
        }
    }

    private IsPickedUnitOwnedByKickedPlayer() {
        if (!this.voteAgainstPlayer) {
            return false;
        }
        if (!(GetPlayerId(GetOwningPlayer(GetEnumUnit())) == this.voteAgainstPlayer.id)) {
            return false;
        }

        if (!(GetUnitTypeId(GetEnumUnit()) != FourCC('h03S'))) {
            return false;

        }

        return true
    }
}
