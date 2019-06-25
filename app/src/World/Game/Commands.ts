/* tslint:disable:prefer-template */                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                // TODO: Fix this linting error and remove the exception
import { WarcraftMaul } from '../WarcraftMaul';
import { COLOUR_CODES, enemies, players } from '../GlobalSettings';
import { Trigger } from '../../JassOverrides/Trigger';
import { Defender } from '../Entity/Players/Defender';
import { Log } from '../../lib/Serilog/Serilog';
import { CheckPoint } from '../Entity/CheckPoint';
import { AdvancedHoloMaze } from '../Holograms/AdvancedHoloMaze';
import { SimpleHoloMaze } from '../Holograms/SimpleHoloMaze';
import { CircleHoloMaze } from '../Holograms/CircleHoloMaze';
import { Rectangle } from '../../JassOverrides/Rectangle';

export class Commands {

    public commandTrigger: Trigger;
    public game: WarcraftMaul;
    private voteKickInProgress: boolean = false;
    private voteAgainstPlayer: Defender | undefined;
    private hasVotedToKick: boolean[] = [];
    private voteKickTimer: timer = CreateTimer();
    private drawings: any[] = [];

    constructor(game: WarcraftMaul) {
        this.game = game;
        this.commandTrigger = new Trigger();
        for (const player of players.values()) {
            this.commandTrigger.RegisterPlayerChatEvent(player.wcPlayer, '-', false);
        }
        this.commandTrigger.AddAction(() => this.handleCommand());
        for (let i: number = 0; i < 24; i++) {
            this.hasVotedToKick[i] = false;
        }
    }

    private handleDebugCommand(player: Defender, command: string[]): void {
        Log.Debug(Util.ArraysToString(command));
        let amount: number = 0;
        switch (command[0]) {
            case 'ui':
                let bool: boolean = BlzLoadTOCFile('uiImport\\MyBar.toc');
                player.sendMessage(`ui! ${bool}`);
                this.TestUi();
                break;
            case 'openall':
                player.sendMessage('All spawns are not open!');
                this.OpenAllSpawns();
                break;
            case 'gold':
                amount = Util.ParseInt(command[1]);
                if (!amount) {
                    player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                    return;
                }
                player.sendMessage(`Gold was set to |cFFFFCC00${amount}|r`);
                player.setGold(amount);
                break;
            case 'lumber':
                amount = Util.ParsePositiveInt(command[1]);
                if (!amount) {
                    player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                    return;

                }
                player.sendMessage(`Lumber was set to |cFF00C850${amount}|r`);
                player.setLumber(amount);
                break;
            case 'lives':
                amount = Util.ParseInt(command[1]);
                if (!amount) {
                    player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                    return;

                }
                this.game.gameLives = amount;
                this.game.startLives = amount;
                player.sendMessage('Lives were set to |cFFFFCC00' + amount + '|r');
                break;
            case 'closeall':
                player.sendMessage('All spawns are now closed!');
                this.CloseAllSpawns();

                break;
            case 'diff':
                amount = Util.ParsePositiveInt(command[1]);
                if (!amount) {
                    player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                    return;

                }
                player.sendMessage(`Difficulty was set to ${amount}%`);

                for (const enemy of enemies) {
                    enemy.setHandicap(amount);
                }
                break;
            case 'wave':
                amount = Util.ParsePositiveInt(command[1]);
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
                break;
            case 'draw':
                const arr: Rectangle[] = [];
                switch (command[1]) {
                    case 'ab':
                    case 'antiblock':
                        break;
                }
                for (let i: number = 0; i < command.length - 2; i++) {
                    if (!command[2 + i]) {
                        Log.Error('Missing arguments');
                        return;
                    }
                    if (!arr) {
                        Log.Error('invalid array');
                        return;
                    }

                    if (!arr[+command[2 + i]]) {
                        Log.Error('invalid index');
                        return;
                    }
                    this.DrawRect(arr[+command[2 + i]]);

                }

                break;
            case 'undraw':

                this.DestroyDrawings();
                break;
            case 'towers':
                this.DrawRect(player.getRectangle());

                for (const tower of player.towers.values()) {
                    player.sendMessage(tower.GetName());
                    this.DrawRect(tower.GetRectangle());
                    player.sendMessage(tower.GetRectangle().toString());
                }
                break;
        }
    }

    private handleCommand(): void {
        const player: Defender | undefined = players.get(GetPlayerId(GetTriggerPlayer()));
        if (!player) {
            return;
        }
        const playerCommand: string = GetEventPlayerChatString().substr(1).toLowerCase();
        const command: string[] = playerCommand.split(' ');
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
                    '|cFFFFCC00Cripple Aura:|r Whenever a creep takes damage it has a 10% chance to cripple the attacking tower,' +
                    'slowing attack speed by 1.5% times creep level\n' +
                    '|cFFFFCC00Spell Shield:|r Blocks targetting spells from casting every 4 (minus 0.1 times creep level) second\n' +
                    '|cFFFFCC00Tornado Aura:|r Nearby towers are slowed by 1% times creep level\n' +
                    '|cFFFFCC00Vampiric Aura:|r Creeps have a 10% chance to heal for 4x creep level\n' +
                    '|cFFFFCC00Divine Shield:|r Creeps ignore damage until they\'ve been damaged 1x creep level times\n' +
                    '|cFFFFCC00Walk it Off:|r slowed down creeps take 0.5% times creep level less damage\n' +
                    '|cFFFFCC00Morning Person:|r creeps heal for 0.5% times creep level of their max health every time they ' +
                    'reach a checkpoint (not teleports)');
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
                Log.Error('Command not implemented yet');
                // TODO: implement command

                // SellAllActions()
                break;
            case 'y':
            case 'yes':
                this.VoteYes(player);
                break;

            case 'kick':
            case 'votekick':
                Log.Error('Command not implemented yet');
                if (command[1]) {
                    const receiver: number = this.getPlayerIdFromColourName(command[1]);
                    const receivingPlayer: Defender | undefined = players.get(receiver);
                    if (receivingPlayer) {
                        this.VoteKick(player, receivingPlayer);
                    } else {
                        player.sendMessage('Player not available');
                    }
                }
                break;
            case 'give':
            case 'send':
                if (command[1] && command[2]) {
                    const receiver: number = this.getPlayerIdFromColourName(command[1]);
                    const receivingPlayer: Defender | undefined = players.get(receiver);

                    const amount: number = Util.ParsePositiveInt(command[2]);
                    if (!amount) {
                        player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                        return;
                    }
                    this.giveGoldToPlayer(receivingPlayer, player, amount);
                }
                break;
            case 'allow':
                Log.Error('Command not implemented yet');
                // AllowSpecificPlayer();
                break;
            case 'deny':
                Log.Error('Command not implemented yet');
                // DenySpecificPlayer();
                break;
            case 'allowall':
                Log.Error('Command not implemented yet');
                // AllowAllPlayers();
                player.sendMessage('ALL players are now |cFF00FF00allowed|r to build in your spawn!');
                break;
            case 'denyall':
                Log.Error('Command not implemented yet');
                // DenyAllPlayers();
                player.sendMessage('ALL players are now |cFFFF0000denied|r access to your spawn!');
                break;
            case 'claim':
                Log.Error('Command not implemented yet');
                // AllowAllPlayers();
                // DenyAllPlayers();
                player.sendMessage('All towers in your spawn has now been claimed.');
                break;
            case 'zoom':
            case 'cam':
                if (GetLocalPlayer() === player.wcPlayer) {
                    const amount: number = Util.ParsePositiveInt(command[1]);
                    if (!amount) {
                        player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Amount'));
                        return;

                    }
                    SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, amount, 1);
                }
                break;

            case 'maze':
                let invalidMaze: boolean = false;
                if (command.length === 2) {
                    const playerId: number = GetPlayerId(GetTriggerPlayer());
                    const firstSpawn: CheckPoint | undefined = this.game.worldMap.playerSpawns[playerId].spawnOne;
                    if (firstSpawn === undefined) {
                        return;
                    }

                    const firstCheckpoint: CheckPoint | undefined = firstSpawn.next;
                    if (firstCheckpoint === undefined) {
                        return;
                    }

                    const secondCheckpoint: CheckPoint | undefined = firstCheckpoint.next;
                    if (secondCheckpoint === undefined) {
                        return;
                    }

                    let imagePath: string = '';
                    if (GetTriggerPlayer() === GetLocalPlayer()) {
                        imagePath = 'ReplaceableTextures\\Splats\\SuggestedPlacementSplat.blp';
                    }

                    switch (command[1]) {
                        case 'none':
                            player.setHoloMaze(undefined);
                            break;
                        case '1':
                            player.setHoloMaze(new CircleHoloMaze(imagePath,
                                                                  GetRectCenterX(firstCheckpoint.rectangle),
                                                                  GetRectCenterY(firstCheckpoint.rectangle),
                                                                  GetRectCenterX(secondCheckpoint.rectangle),
                                                                  GetRectCenterY(secondCheckpoint.rectangle)));
                            break;
                        case '2':
                            player.setHoloMaze(new SimpleHoloMaze(imagePath,
                                                                  GetRectCenterX(firstCheckpoint.rectangle),
                                                                  GetRectCenterY(firstCheckpoint.rectangle),
                                                                  GetRectCenterX(secondCheckpoint.rectangle),
                                                                  GetRectCenterY(secondCheckpoint.rectangle)));
                            break;
                        case '3':
                            player.setHoloMaze(new AdvancedHoloMaze(imagePath,
                                                                    GetRectCenterX(firstCheckpoint.rectangle),
                                                                    GetRectCenterY(firstCheckpoint.rectangle),
                                                                    GetRectCenterX(secondCheckpoint.rectangle),
                                                                    GetRectCenterY(secondCheckpoint.rectangle)));
                            break;
                        default:
                            invalidMaze = true;
                            break;
                    }
                } else {
                    invalidMaze = true;
                }

                if (invalidMaze === true) {
                    player.sendMessage(
                        'Unknown maze selected, please try one of the mazes shown below\n' +
                        '|cFFFFCC00-maze none|r: removes the current maze\n' +
                        '|cFFFFCC00-maze 1|r: shows a very simple circled maze\n' +
                        '|cFFFFCC00-maze 2|r: shows a basic maze\n' +
                        '|cFFFFCC00-maze 3|r: shows a more advanced maze');
                }
                break;

        }
        if (this.game.debugMode) {
            this.handleDebugCommand(player, command);
        }
    }

    public getPlayerIdFromColourName(color: string): number {
        return Util.COLOUR_IDS[color.toUpperCase()];
    }

    public RepickActions(player: Defender): void {
        const grp: group = GetUnitsInRectAll(GetPlayableMapRect());
        const maxGold: number = player.id === COLOUR.GRAY ? 150 : 100;
        if (player.getGold() > maxGold) {
            player.setGold(maxGold);
        }
        player.setLumber(1);
        ForGroupBJ(grp, () => this.RemovePlayerUnits(player));
        DestroyGroup(grp);
    }

    public RepickConditions(player: Defender): boolean {
        if (!(this.game.gameRoundHandler.currentWave === 1)) {
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

    public RemovePlayerUnits(player: Defender): void {
        if (GetOwningPlayer(GetEnumUnit()) === player.wcPlayer) {
            if (this.RepickRemoveConditions(GetEnumUnit())) {
                RemoveUnit(GetEnumUnit());
            }
        }
    }

    private RepickRemoveConditions(Unit: unit): boolean {
        if (GetUnitTypeId(Unit) === FourCC('h03S')) {
            return false;
        }

        if (GetUnitTypeId(Unit) === FourCC('e00C')) {
            return false;
        }

        return true;
    }

    public OpenAllSpawns(): void {
        for (const spawn of this.game.worldMap.playerSpawns) {
            spawn.isOpen = true;
        }
    }

    public CloseAllSpawns(): void {
        for (const spawn of this.game.worldMap.playerSpawns) {
            spawn.isOpen = false;
        }
    }

    private giveGoldToPlayer(receivingPlayer: Defender | undefined, player: Defender, amount: number): void {
        if (receivingPlayer) {
            if (player.getGold() >= amount) {
                player.setGold(player.getGold() - amount);
                receivingPlayer.setGold(receivingPlayer.getGold() + amount);
                player.sendMessage(
                    `You've sent ${Util.ColourString('FFCC00', '' + amount)} gold to ${receivingPlayer.getNameWithColour()}`);
                receivingPlayer.sendMessage(
                    `You've received ${Util.ColourString('FFCC00', '' + amount)} gold from ${player.getNameWithColour()}`);

            } else {
                player.sendMessage('You do not have this much gold');
            }
        } else {
            player.sendMessage(Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Invalid Receiver'));
        }
    }

    private VoteKick(player: Defender, receivingPlayer: Defender): void {
        if (!this.voteKickInProgress) {
            if (player !== receivingPlayer) {
                SendMessage(
                    `${player.getNameWithColour()} has started a votekick for ${receivingPlayer.getNameWithColour()} (say -y to vote)`);
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

    private VotekickExpire(): void {
        const count: number = this.CountCurrentVotes();
        if (this.voteAgainstPlayer) {
            SendMessage(`Votekick for ${this.voteAgainstPlayer.getNameWithColour()} has ended with ${count} votes`);
        }
        this.voteKickInProgress = false;
    }

    private VoteYes(player: Defender): void {
        if (this.voteKickInProgress) {
            if (!this.hasVotedToKick[player.id]) {
                if (!(this.voteAgainstPlayer === player)) {
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

    private CheckVotes(): void {
        const currentVotes: number = this.CountCurrentVotes();
        const neededVotes: number = (players.size / 2) + 1;
        const missingVotes: number = neededVotes - currentVotes;


        if (currentVotes >= neededVotes) {
            if (this.voteAgainstPlayer) {
                this.game.worldMap.playerSpawns[this.voteAgainstPlayer.id].isOpen = true;

                this.RemoveAllKickedPlayerTowers();
                if (this.game.scoreBoard) {
                    MultiboardSetItemValueBJ(this.game.scoreBoard.board, 1, 7 + this.voteAgainstPlayer.scoreSlot,
                                             Util.ColourString(this.voteAgainstPlayer.getColourCode(), '<Kicked>'));
                }
                players.delete(this.voteAgainstPlayer.id);

                SendMessage(`Votekick for ${this.voteAgainstPlayer.getNameWithColour()} has succeeded!`);
                CustomDefeatBJ(this.voteAgainstPlayer.wcPlayer, 'Kicked!');

                DestroyTimer(this.voteKickTimer);
                this.voteKickInProgress = false;
            }
        } else {
            SendMessage('You\'ll need ' + missingVotes + ' more votes to kick');
        }
    }

    private CountCurrentVotes(): number {
        let count: number = 0;
        for (let i: number = 0; i < this.hasVotedToKick.length; i++) {
            if (this.hasVotedToKick) {
                count++;
            }
        }
        return count;
    }

    private RemoveAllKickedPlayerTowers(): void {
        const grp: group = GetUnitsInRectAll(GetPlayableMapRect());
        ForGroupBJ(GetUnitsInRectAll(GetPlayableMapRect()), () => this.RemoveKickedPlayerTowers());
        DestroyGroup(grp);
    }

    private RemoveKickedPlayerTowers(): void {
        if (this.IsPickedUnitOwnedByKickedPlayer()) {
            RemoveUnit(GetEnumUnit());
        }
    }

    private IsPickedUnitOwnedByKickedPlayer(): boolean {
        if (!this.voteAgainstPlayer) {
            return false;
        }
        if (!(GetPlayerId(GetOwningPlayer(GetEnumUnit())) === this.voteAgainstPlayer.id)) {
            return false;
        }

        if (!(GetUnitTypeId(GetEnumUnit()) !== FourCC('h03S'))) {
            return false;
        }

        return true;
    }

    private DrawRect(rectangle: Rectangle): void {
        const x1: number = rectangle.minX;
        const y1: number = rectangle.minY;
        const x2: number = rectangle.maxX;
        const y2: number = rectangle.maxY;

        const model: string = 'Doodads\\Cinematic\\DemonFootPrint\\DemonFootPrint0.mdl';
        const sfx: effect[] = [];
        for (let x: number = x1; x < x2; x = x + 16) {
            sfx.push(AddSpecialEffect(model, x, y1));
        }

        for (let y: number = y1; y < y2; y = y + 16) {
            sfx.push(AddSpecialEffect(model, x2, y));
        }

        for (let x: number = x1; x < x2; x = x + 16) {
            sfx.push(AddSpecialEffect(model, x, y2));
        }
        for (let y: number = y1; y < y2; y = y + 16) {
            sfx.push(AddSpecialEffect(model, x1, y));
        }
        this.drawings.push(sfx);
    }

    private DestroyDrawings(): void {
        for (const drawing of this.drawings) {
            for (const sfx of  drawing) {
                DestroyEffect(sfx);
            }
        }
        this.drawings = [];
    }

    private TestUi(): void {
        const fh: framehandle = BlzCreateSimpleFrame('TestPanel', BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0), 0);
        // const fh: framehandle = BlzGetFrameByName('SimpleUnitStatsPanel', 0);
        BlzFrameClearAllPoints(fh);
        BlzFrameSetAbsPoint(fh, FRAMEPOINT_TOP, 0.4, 0.23);
        // BlzFrameSetPoint(fh, FRAMEPOINT_TOP, BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0), FRAMEPOINT_TOP, 0, -0.3);
        Log.Debug(ToString(BlzFrameGetValue(fh)));
        // BlzFrameSetAbsPoint(fh, FRAMEPOINT_TOP, 0.0, 0.1);
        // BlzFrameSetValue(fh, 100);
        // BlzFrameSetText(BlzGetFrameByName('MyBarText', 0), '');
        // BlzFrameSetTexture(BlzGetFrameByName('MyBarBackground', 0), 'Replaceabletextures\\CommandButtons\\BTNHeroDeathKnight.blp', 0, true);
        // BlzFrameSetTexture(fh, 'Replaceabletextures\\CommandButtons\\BTNArthas.blp', 0, false);
        // BlzFrameSetSize(fh, 0.02, 0.02);
        // TimerStart(CreateTimer(), 0.08, true, () => this.ChangeUI());
    }


    private ChangeUI(): void {
        const fh: framehandle = BlzGetFrameByName('MyBar', 0);
        BlzFrameSetValue(fh, BlzFrameGetValue(fh) + GetRandomReal(-3, 3));

    }
}
