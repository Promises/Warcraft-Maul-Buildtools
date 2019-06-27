import { Defender } from './Entity/Players/Defender';
import * as settings from './GlobalSettings';
import { Attacker } from './Entity/Players/Attacker';
import { WorldMap } from './WorldMap';
import { Commands } from './Game/Commands';
import { GameRound } from './Game/GameRound';
import { DifficultyVote } from './Game/DifficultyVote';
import { RacePicking } from './Game/RacePicking';
import { MultiBoard } from './Game/MultiBoard';
import { Quests } from '../Generated/questsGEN';
import { BUILD_DATE, BUILD_NUMBER } from '../Generated/Version';
import { Log, LogLevel } from '../lib/Serilog/Serilog';
import { StringSink } from '../lib/Serilog/Sinks/StringSink';
import { SellTower } from './Entity/Tower/SellTower';
import { DamageEngine } from './Game/DamageEngine';
import { DamageEngineGlobals } from './Game/DamageEngineGlobals';
import { TowerTicker } from './Game/TowerTicker';
import { BuffHandler } from './Entity/Buff/BuffHandler';

export class WarcraftMaul {
    debugMode: boolean = false;
    gameEnded: boolean = false;
    waveTimer: number = settings.GAME_TIME_BEFORE_START;
    gameTime: number = 0;
    gameEndTimer: number = settings.GAME_END_TIME;
    gameLives: number = settings.INITIAL_LIVES;
    startLives: number = settings.INITIAL_LIVES;
    worldMap: WorldMap;
    gameRoundHandler: GameRound;
    gameCommandHandler: Commands;
    gameDamageEngineGlobals: DamageEngineGlobals;
    gameDamageEngine: DamageEngine;
    public readonly towerTicker: TowerTicker;
    buffHandler: BuffHandler;
    scoreBoard: MultiBoard | undefined;

    constructor() {
        const players: Map<number, Defender> = settings.players;
        const enemies: Attacker[] = settings.enemies;

        // Should we enable debug mode?
        if (GetPlayerName(Player(COLOUR.RED)) === 'WorldEdit') {
            this.debugMode = true;
        }

        if (this.debugMode) {
            this.waveTimer = 15;
            Log.Init([
                new StringSink(LogLevel.Debug, SendMessage),
            ]);
            Log.Debug('Debug mode enabled');
        }

        // Set up all players
        for (let i: number = 0; i < 24; i++) {
            if (GetPlayerSlotState(Player(i)) === PLAYER_SLOT_STATE_PLAYING) {
                if (GetPlayerController(Player(i)) === MAP_CONTROL_USER) {
                    players.set(i, new Defender(i, this));
                }
            }
        }

        // Set up enemies
        enemies.push(new Attacker(COLOUR.NAVY));
        enemies.push(new Attacker(COLOUR.TURQUOISE));
        enemies.push(new Attacker(COLOUR.VOILET));
        enemies.push(new Attacker(COLOUR.WHEAT));

        // All enemies should be allied with each other
        for (const enemy of enemies) {
            for (const enemyAlly of enemies) {
                enemy.makeAlliance(enemyAlly);
            }
        }

        // Initialise sounds
        settings.InitializeStaticSounds();

        // Create the map
        this.worldMap = new WorldMap(this);
        this.gameDamageEngineGlobals = new DamageEngineGlobals();
        this.towerTicker = new TowerTicker();
        this.gameDamageEngine = new DamageEngine(this.gameDamageEngineGlobals);
        this.gameCommandHandler = new Commands(this);
        this.buffHandler = new BuffHandler(this);

        // this.gameCommandHandler.OpenAllSpawns();

        const diffVote: DifficultyVote = new DifficultyVote(this);
        const racePicking: RacePicking = new RacePicking(this);
        const sellTower: SellTower = new SellTower(this);

        this.gameRoundHandler = new GameRound(this);

        // Spawn testing units when in debug mode
        if (this.debugMode) {
            CreateUnit(Player(COLOUR.RED), FourCC('e00B'), 0.00, 0.00, bj_UNIT_FACING);
            CreateUnit(Player(COLOUR.RED), FourCC('uC98'), 0.00, 0.00, bj_UNIT_FACING);
        }

        for (const quest of Quests) {
            CreateQuestBJ(quest.stype, quest.title, quest.body, quest.icon);
        }

        SendMessage('Welcome to Warcraft Maul Reimagined');
        SendMessage(`This is build: ${BUILD_NUMBER}, built ${BUILD_DATE}.`);
    }

    DefeatAllPlayers(): void {
        for (const player of settings.players.values()) {
            player.defeatPlayer();
        }
    }

    GameWin(): void {
        if (this.gameLives > 0) {
            PlaySoundBJ(settings.Sounds.victorySound);
            SendMessage('|cFFF48C42YOU HAVE WON!|r');
            SendMessage('You can either leave the game or stay for bonus rounds');
            this.GameWinEffects();
        }
    }

    // FIXME: This function leaks!
    GameWinEffects(): void {
        const timer: timer = CreateTimer();
        TimerStart(timer, 0.10, true, () => this.SpamEffects());
    }

    // FIXME: This function leaks!
    SpamEffects(): void {
        const x: number = GetRandomInt(0, 10000) - 5000;
        const y: number = GetRandomInt(0, 10000) - 5000;
        const loc: location = Location(x, y);
        DestroyEffect(AddSpecialEffectLocBJ(loc, 'Abilities\\Spells\\Human\\DispelMagic\\DispelMagicTarget.mdl'));
        RemoveLocation(loc);
    }

    PrettifyGameTime(sec: number): string {
        const hrs: number = Math.floor(sec / 3600);
        const min: number = Math.floor((sec - (hrs * 3600)) / 60);
        let seconds: number = sec - (hrs * 3600) - (min * 60);
        seconds = Math.round(seconds * 100) / 100;

        const prettyMinutes: string = (min < 10 ? `0${min}` : `${min}`);
        const prettySeconds: string = (seconds < 10 ? `0${Math.floor(seconds)}` : `${Math.floor(seconds)}`);
        let result: string = (hrs < 10 ? `0${hrs}` : `${hrs}`);
        result += `:${prettyMinutes}`;
        result += `:${prettySeconds}`;
        return Util.ColourString('999999', `${result}`);
    }

    GameOver(): void {
        this.gameEndTimer = settings.GAME_END_TIME;
        this.gameEnded = true;
        PlaySoundBJ(settings.Sounds.defeatSound);
        SendMessage('|cFFFF0000GAME OVER|r');
        this.worldMap.RemoveEveryUnit();
    }
}
