import { Defender } from './Entity/Players/Defender';
import * as settings from './GlobalSettings';
import { Attacker } from './Entity/Players/Attacker';
import { WorldMap } from './WorldMap';
import { Commands } from './Game/Commands';
import { AbstractGameRound } from './Game/BaseMaul/AbstractGameRound';
import { Vote } from './Game/Vote';
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
import { ItemHandler } from './Entity/Item/ItemHandler';
import { GenericAbilityHandler } from './Entity/GenericAbilities/GenericAbilityHandler';
import { CreepAbilityHandler } from './Entity/CreepAbilities/CreepAbilityHandler';
import { VoidTicker } from './Game/VoidTicker';
import { EventQueue } from '../lib/WCEventQueue/EventQueue';
import { SafeEventQueue } from '../lib/WCEventQueue/SafeEventQueue';
import { TimedEventQueue } from '../lib/WCEventQueue/TimedEventQueue';
import { MMD, MMDGoal, MMDSuggest, MMDType } from '../lib/MMD';
import { AntiBlock } from './Antiblock/AntiBlock';
import { Item } from '../lib/common/item';

export class WarcraftMaul {

    public debugMode: boolean = false;
    public gameEnded: boolean = false;
    public waveTimer: number = settings.GAME_TIME_BEFORE_START;
    public gameTime: number = 0;
    public gameEndTimer: number = settings.GAME_END_TIME;
    public gameLives: number = settings.INITIAL_LIVES;
    public startLives: number = settings.INITIAL_LIVES;
    public worldMap: WorldMap;
    // public gameRoundHandler: AbstractGameRound;
    public gameCommandHandler: Commands;
    public gameDamageEngineGlobals: DamageEngineGlobals;
    public gameDamageEngine: DamageEngine;
    public diffVote: Vote;
    public readonly towerTicker: TowerTicker;
    public buffHandler: BuffHandler;
    public scoreBoard: MultiBoard | undefined;
    private itemHandler: ItemHandler;
    public sellTower: SellTower;
    public abilityHandler: GenericAbilityHandler;


    public players: Map<number, Defender> = new Map<number, Defender>();

    public enemies: Attacker[] = [];
    private readonly _creepAbilityHandler: CreepAbilityHandler;
    private voidTicker: VoidTicker;
    public eventQueue: EventQueue;
    public safeEventQueue: SafeEventQueue;
    public timedEventQueue: TimedEventQueue;
    public racePicking: RacePicking;

    // public mmd: MMD;

    constructor(creepAbilityHandler: CreepAbilityHandler/*, mmd: MMD*/) {
        // this.mmd = mmd;
        // Should we enable debug mode?
        if (GetPlayerName(Player(COLOUR.RED)) === 'WorldEdit') {
            this.debugMode = true;
        }
        if (this.debugMode) {
            Log.Init([
                         new StringSink(LogLevel.Debug, SendMessageUnlogged),
                         // new PreloadSink(LogLevel.Message, `WCMAUL\\${os.time()}.txt`),
                     ]);
            Log.Debug('Debug mode enabled');
        }
        // this.mmd.DefineSettingBoolean('debug_mode', this.debugMode);
        this.gameCommandHandler = new Commands(this);
        // Set up all players
        for (let i: number = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            if (GetPlayerSlotState(Player(i)) === PLAYER_SLOT_STATE_PLAYING) {
                if (GetPlayerController(Player(i)) === MAP_CONTROL_USER) {
                    this.players.set(i, new Defender(i, this));
                }
            }
        }
        // Set up enemies
        this.enemies.push(new Attacker(COLOUR.NAVY, this));
        this.enemies.push(new Attacker(COLOUR.TURQUOISE, this));
        this.enemies.push(new Attacker(COLOUR.VOILET, this));
        this.enemies.push(new Attacker(COLOUR.WHEAT, this));


        // All enemies should be allied with each other
        for (const enemy of this.enemies) {
            for (const enemyAlly of this.enemies) {
                enemy.makeAlliance(enemyAlly);
            }
        }

        // Initialise sounds
        settings.InitializeStaticSounds();

        // Create the map
        this.worldMap = new WorldMap(this);
        this.eventQueue = new EventQueue();
        this.safeEventQueue = new SafeEventQueue(this);
        this.timedEventQueue = new TimedEventQueue(this);
        this.gameDamageEngineGlobals = new DamageEngineGlobals();
        this.towerTicker = new TowerTicker();
        this.voidTicker = new VoidTicker(this);
        this.gameDamageEngine = new DamageEngine(this.gameDamageEngineGlobals);
        this.buffHandler = new BuffHandler(this);
        this.abilityHandler = new GenericAbilityHandler(this);
        this.itemHandler = new ItemHandler(this);

        this._creepAbilityHandler = creepAbilityHandler;
        creepAbilityHandler.SetupGame(this);


        this.diffVote = new Vote(this);
        this.racePicking = new RacePicking(this);
        this.sellTower = new SellTower(this);

        // this.gameRoundHandler = new AbstractGameRound(this);


        for (const quest of Quests) {
            CreateQuestBJ(quest.stype, quest.title, quest.body, quest.icon);
        }

        SendMessage('Welcome to Warcraft Maul Reimagined');
        SendMessage(`This is build: ${BUILD_NUMBER}, built ${BUILD_DATE}.`);
    }

    public DefeatAllPlayers(): void {
        for (const player of this.players.values()) {
            player.defeatPlayer();
        }
    }

    public GameWin(): void {
        if (this.gameLives > 0) {
            PlaySoundBJ(settings.Sounds.victorySound);
            SendMessage('|cFFF48C42YOU HAVE WON!|r');
            SendMessage('You can either leave the game or stay for bonus rounds');
            this.GameWinEffects();
        }
    }

    public GameWinEffects(): void {
        this.eventQueue.AddLow(() => this.SpamEffects());
    }

    private SpamEffects(): boolean {
        const x: number = GetRandomInt(0, 10000) - 5000;
        const y: number = GetRandomInt(0, 10000) - 5000;
        DestroyEffect(AddSpecialEffect('Abilities\\Spells\\Human\\DispelMagic\\DispelMagicTarget.mdl', x, y));
        this.eventQueue.AddLow(() => this.SpamEffects());
        return true;
    }

    public PrettifyGameTime(sec: number): string {
        const hrs: number = Math.floor(sec / 3600);
        const min: number = Math.floor((sec - (hrs * 3600)) / 60);
        let seconds: number = sec - (hrs * 3600) - (min * 60);
        seconds = Math.round(seconds * 100) / 100;

        const prettyMinutes: string = (min < 10 ? `0${min}` : `${min}`);
        const prettySeconds: string = (seconds < 10 ? `0${Math.floor(seconds)}` : `${Math.floor(seconds)}`);
        let result: string = (hrs < 10 ? `0${hrs}` : `${hrs}`);
        result += `:${prettyMinutes}`;
        result += `:${prettySeconds}`;
        return Util.ColourString('#999999', `${result}`);
    }

    public GameOver(): void {
        this.gameEndTimer = settings.GAME_END_TIME;
        this.gameEnded = true;
        PlaySoundBJ(settings.Sounds.defeatSound);
        SendMessage('|cFFFF0000GAME OVER|r');
        this.worldMap.RemoveEveryUnit();
    }

    get creepAbilityHandler(): CreepAbilityHandler {
        return this._creepAbilityHandler;
    }
}
