import { Defender } from './Entity/Players/Defender';
import * as settings from './GlobalSettings';
import { Attacker } from './Entity/Players/Attacker';
import { WorldMap } from './WorldMap';
import { SpawnedCreeps } from './Entity/SpawnedCreeps';
import { Commands } from './Game/Commands';
import { GameRound } from './Game/GameRound';
import { DifficultyVote } from './Game/DifficultyVote';
import { RacePicking } from './Game/RacePicking';
import { MultiBoard } from './Game/MultiBoard';
import { COLOUR_CODES, players } from './GlobalSettings';
import { Quests } from '../Generated/questsGEN';
import { BUILD_DATE, BUILD_NUMBER } from '../Generated/Version';
import { Log, LogLevel } from '../lib/Serilog/Serilog';
import { StringSink } from '../lib/Serilog/Sinks/StringSink';
import { AntiBlock } from './AntiBlock';

export class WarcraftMaul {

    debugMode: boolean = false;

    waveTimer: number = settings.GAME_TIME_BEFORE_START;

    worldMap: WorldMap;


    gameTime: number = 0;
    gameEnded: boolean = false;
    gameEndTimer: number = settings.GAME_END_TIME;

    gameLives: number = settings.INITIAL_LIVES;
    startLives: number = settings.INITIAL_LIVES;


    gameRoundHandler: GameRound;
    gameCommandHandler: Commands;
    scoreBoard: MultiBoard | undefined;


    constructor() {
        let players = settings.players;
        let enemies = settings.enemies;


        // Should we enable debug mode?
        if (GetPlayerName(Player(COLOUR.RED)) === 'WorldEdit') {
            this.debugMode = true;

        }
        if (this.debugMode) {
            this.waveTimer = 15;
            Log.Init([
                new StringSink(LogLevel.Debug, BJDebugMsg),
            ]);
            Log.Debug("Debug mode enabled");
        }


        // Set up all players
        for (let i = 0; i < 24; i++) {
            if (GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING) {
                if (GetPlayerController(Player(i)) == MAP_CONTROL_USER) {
                    players.set(i, new Defender(i));

                }
            }
        }

        // Set up enemies
        enemies.push(new Attacker(COLOUR.NAVY));
        enemies.push(new Attacker(COLOUR.TURQUOISE));
        enemies.push(new Attacker(COLOUR.VOILET));
        enemies.push(new Attacker(COLOUR.WHEAT));

        // Set Enemies should be allied with eachother

        for (let enemy of enemies) {
            for (let enemyAlly of enemies) {
                enemy.makeAlliance(enemyAlly);
            }
        }

        //Initialise sounds
        settings.InitializeStaticSounds();

        // Create the map
        this.worldMap = new WorldMap(this);
        this.gameCommandHandler = new Commands(this);
        // this.gameCommandHandler.OpenAllSpawns();

        new DifficultyVote(this);
        new RacePicking(this);

        this.gameRoundHandler = new GameRound(this);

        // Spawn testing units when in debug mode
        if (this.debugMode) {
            CreateUnit(Player(COLOUR.RED), FourCC('e00B'), 0.00, 0.00, bj_UNIT_FACING);
            CreateUnit(Player(COLOUR.RED), FourCC('hC07'), 0.00, 0.00, bj_UNIT_FACING);
        }

        for (let quest of Quests) {
            CreateQuestBJ(quest.stype, quest.title, quest.body, quest.icon);
        }

        print('Welcome to Warcraft Maul Reimagined');
        print(`This is build: ${BUILD_NUMBER}, built ${BUILD_DATE}.`);


    }

    DefeatAllPlayers() {
        for (let player of settings.players.values()) {
            player.defeatPlayer();
        }
    }


    GameWin() {
        if (this.gameLives > 0) {
            PlaySoundBJ(settings.Sounds.victorySound);
            print('|cFFF48C42YOU HAVE WON!|r');
            print('You can either leave the game or stay for bonus rounds');
            this.GameWinEffects();
        }
    }


    GameWinEffects() {
        let timer1 = CreateTimer();
        TimerStart(timer1, 0.10, true, () => this.SpamEffects());
    }


    SpamEffects() {
        let x = GetRandomInt(0, 10000) - 5000;
        let y = GetRandomInt(0, 10000) - 5000;
        let loc = Location(x, y);
        DestroyEffect(AddSpecialEffectLocBJ(loc, 'Abilities\\Spells\\Human\\DispelMagic\\DispelMagicTarget.mdl'));
        RemoveLocation(loc);
    }


    PrettifyGameTime(sec: number): string {
        let hrs = Math.floor(sec / 3600);
        let min = Math.floor((sec - (hrs * 3600)) / 60);
        let seconds = sec - (hrs * 3600) - (min * 60);
        seconds = Math.round(seconds * 100) / 100;

        let result = (hrs < 10 ? '0' + hrs : hrs);
        result += ':' + (min < 10 ? '0' + min : min);
        result += ':' + (seconds < 10 ? '0' + Math.floor(seconds) : Math.floor(seconds));
        return Util.ColourString('999999', '' + result);

    }





}
