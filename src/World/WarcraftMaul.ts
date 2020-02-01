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
import { Trigger } from '../JassOverrides/Trigger';
import { Group } from '../lib/common/unit';
import { ActionBar } from './Game/Ui/ActionBar';

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
    private TeleportMovement: boolean = false;

    // public mmd: MMD;

    constructor(creepAbilityHandler: CreepAbilityHandler/*, mmd: MMD*/) {
        // this.mmd = mmd;
        this.eventQueue = new EventQueue();
        this.safeEventQueue = new SafeEventQueue(this);
        this.timedEventQueue = new TimedEventQueue(this);
        // Should we enable debug mode?
        if (FourCC(GetPlayerName(Player(COLOUR.RED))) === 1466921580 || FourCC(GetPlayerName(Player(COLOUR.RED))) === 1282368353) {
            this.debugMode = true;
        }
        if (this.debugMode) {
            Log.Init([
                new StringSink(LogLevel.Debug, SendMessageUnlogged),
                // new PreloadSink(LogLevel.Message, `WCMAUL\\${os.time()}.txt`),
            ]);
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
        new ActionBar(this);
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

    private startDebugUI(): void {
        Log.Debug('Launching debug UI');
        const goldButton: framehandle = BlzCreateFrameByType(
            'BUTTON',
            'goldButton',
            BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0),
            'StandardButtonTemplate',
            0,
        );
        const goldBackdrop: framehandle = BlzCreateFrameByType('BACKDROP', 'goldBackdrop', goldButton, 'ButtonBackdropTemplate', 0);
        const lumberButton: framehandle = BlzCreateFrameByType(
            'BUTTON',
            'lumberButton',
            BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0),
            'StandardButtonTemplate',
            0,
        );
        const lumberBackdrop: framehandle = BlzCreateFrameByType('BACKDROP', 'lumberBackdrop', lumberButton, 'ButtonBackdropTemplate', 0);
        const teleportButton: framehandle = BlzCreateFrameByType(
            'BUTTON',
            'teleportButton',
            BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0),
            'StandardButtonTemplate',
            0,
        );
        const teleportBackdrop: framehandle = BlzCreateFrameByType(
            'BACKDROP',
            'teleportBackdrop',
            teleportButton,
            'ButtonBackdropTemplate',
            0,
        );
        const healHitpointsButton: framehandle = BlzCreateFrameByType(
            'BUTTON',
            'healHitpointsButton',
            BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0),
            'StandardButtonTemplate',
            0,
        );
        const healHitpointsBackdrop: framehandle = BlzCreateFrameByType(
            'BACKDROP',
            'healHitpointsBackdrop',
            healHitpointsButton,
            'ButtonBackdropTemplate',
            0,
        );
        const healManaButton: framehandle = BlzCreateFrameByType(
            'BUTTON',
            'healManaButton',
            BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0),
            'StandardButtonTemplate',
            0,
        );
        const healManaBackdrop: framehandle = BlzCreateFrameByType(
            'BACKDROP',
            'healManaBackdrop',
            healManaButton,
            'ButtonBackdropTemplate',
            0,
        );
        const resetCooldownButton: framehandle = BlzCreateFrameByType(
            'BUTTON',
            'resetCooldownButton',
            BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0),
            'StandardButtonTemplate',
            0,
        );
        const resetCooldownBackdrop: framehandle = BlzCreateFrameByType(
            'BACKDROP',
            'resetCooldownBackdrop',
            resetCooldownButton,
            'ButtonBackdropTemplate',
            0,
        );
        const levelUpButton: framehandle = BlzCreateFrameByType(
            'BUTTON',
            'levelUpButton',
            BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0),
            'StandardButtonTemplate',
            0,
        );
        const levelUpBackdrop: framehandle = BlzCreateFrameByType(
            'BACKDROP',
            'levelUpBackdrop',
            levelUpButton,
            'ButtonBackdropTemplate',
            0,
        );
        BlzFrameSetSize(goldButton, 0.02, 0.02);
        BlzFrameSetSize(goldBackdrop, 0.02, 0.02);
        BlzFrameSetSize(lumberButton, 0.02, 0.02);
        BlzFrameSetSize(lumberBackdrop, 0.02, 0.02);
        BlzFrameSetSize(teleportButton, 0.02, 0.02);
        BlzFrameSetSize(teleportBackdrop, 0.02, 0.02);
        BlzFrameSetSize(healHitpointsButton, 0.02, 0.02);
        BlzFrameSetSize(healHitpointsBackdrop, 0.02, 0.02);
        BlzFrameSetSize(healManaButton, 0.02, 0.02);
        BlzFrameSetSize(healManaBackdrop, 0.02, 0.02);
        BlzFrameSetSize(resetCooldownButton, 0.02, 0.02);
        BlzFrameSetSize(resetCooldownBackdrop, 0.02, 0.02);
        BlzFrameSetSize(levelUpButton, 0.02, 0.02);
        BlzFrameSetSize(levelUpBackdrop, 0.02, 0.02);
        BlzFrameSetTexture(goldBackdrop, 'UI\\Feedback\\Resources\\ResourceGold.blp', 0, true);
        BlzFrameSetTexture(lumberBackdrop, 'UI\\Feedback\\Resources\\ResourceLumber.blp', 0, true);
        BlzFrameSetTexture(teleportBackdrop, 'uiImport\\CommandButtons\\BTNUnloadCrossed.blp', 0, true);
        BlzFrameSetTexture(healHitpointsBackdrop, 'uiImport\\CommandButtons\\BTNPotionGreenNoBorder.blp', 0, true);
        BlzFrameSetTexture(healManaBackdrop, 'uiImport\\CommandButtons\\BTNPotionBlueNoBorder.blp', 0, true);
        BlzFrameSetTexture(resetCooldownBackdrop, 'uiImport\\CommandButtons\\BTNSelectUnitNoBorder.blp', 0, true);
        BlzFrameSetTexture(levelUpBackdrop, 'uiImport\\CommandButtons\\BTNStatUpNoBorder.blp', 0, true);
        BlzFrameSetAbsPoint(goldButton, FRAMEPOINT_CENTER, 0.215, 0.15);
        BlzFrameSetAbsPoint(lumberButton, FRAMEPOINT_CENTER, 0.24, 0.15);
        BlzFrameSetAbsPoint(teleportButton, FRAMEPOINT_CENTER, 0.265, 0.15);
        BlzFrameSetAbsPoint(healHitpointsButton, FRAMEPOINT_CENTER, 0.505, 0.15);
        BlzFrameSetAbsPoint(healManaButton, FRAMEPOINT_CENTER, 0.53, 0.15);
        BlzFrameSetAbsPoint(resetCooldownButton, FRAMEPOINT_CENTER, 0.555, 0.15);
        BlzFrameSetAbsPoint(levelUpButton, FRAMEPOINT_CENTER, 0.58, 0.15);
        BlzFrameSetPoint(goldBackdrop, FRAMEPOINT_CENTER, goldButton, FRAMEPOINT_CENTER, 0.0, 0.0);
        BlzFrameSetPoint(lumberBackdrop, FRAMEPOINT_CENTER, lumberButton, FRAMEPOINT_CENTER, 0.0, 0.0);
        BlzFrameSetPoint(teleportBackdrop, FRAMEPOINT_CENTER, teleportButton, FRAMEPOINT_CENTER, 0.0, 0.0);
        BlzFrameSetPoint(healHitpointsBackdrop, FRAMEPOINT_CENTER, healHitpointsButton, FRAMEPOINT_CENTER, 0.0, 0.0);
        BlzFrameSetPoint(healManaBackdrop, FRAMEPOINT_CENTER, healManaButton, FRAMEPOINT_CENTER, 0.0, 0.0);
        BlzFrameSetPoint(resetCooldownBackdrop, FRAMEPOINT_CENTER, resetCooldownButton, FRAMEPOINT_CENTER, 0.0, 0.0);
        BlzFrameSetPoint(levelUpBackdrop, FRAMEPOINT_CENTER, levelUpButton, FRAMEPOINT_CENTER, 0.0, 0.0);

        const createButtonTrigger: (frame: framehandle, event: () => void) => void = (frame: framehandle, event: () => void) => {
            const trig: Trigger = new Trigger();
            trig.addAction(() => event());
            trig.registerFrameEvent(frame, FRAMEEVENT_CONTROL_CLICK);
        };
        createButtonTrigger(goldButton, () => {
            BlzFrameSetEnable(goldButton, false);
            SetPlayerState(Player(0), PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_GOLD) + 1000);
            BlzFrameSetEnable(goldButton, true);
        });
        createButtonTrigger(lumberButton, () => {
            BlzFrameSetEnable(lumberButton, false);
            SetPlayerState(Player(0), PLAYER_STATE_RESOURCE_LUMBER, GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_LUMBER) + 1000);
            BlzFrameSetEnable(lumberButton, true);
        });
        createButtonTrigger(teleportButton, () => {
            BlzFrameSetEnable(teleportButton, false);
            const teleportMovement: boolean = this.TeleportMovement;

            if (teleportMovement) {
                this.TeleportMovement = false;
                BlzFrameSetTexture(teleportBackdrop, 'ReplaceableTextures\\CommandButtons\\BTNUnloadCrossed.blp', 0, true);
            } else {
                this.TeleportMovement = true;
                BlzFrameSetTexture(teleportBackdrop, 'ReplaceableTextures\\CommandButtons\\BTNUnloadNoBorder.blp', 0, true);
            }
            BlzFrameSetEnable(teleportButton, true);
        });
        createButtonTrigger(healHitpointsButton, () => {
            BlzFrameSetEnable(healHitpointsButton, false);
            const grp: Group = new Group(GetUnitsSelectedAll(Player(0)));
            grp.for((u: unit) => {
                SetUnitLifePercentBJ(u, 100);
            });

            grp.destroy();
            BlzFrameSetEnable(healHitpointsButton, true);
        });
        createButtonTrigger(healManaButton, () => {
            BlzFrameSetEnable(healManaButton, false);
            const grp: Group = new Group(GetUnitsSelectedAll(Player(0)));
            grp.for((u: unit) => {
                SetUnitManaPercentBJ(u, 100);
            });

            grp.destroy();
            BlzFrameSetEnable(healManaButton, true);
        });
        createButtonTrigger(resetCooldownButton, () => {
            BlzFrameSetEnable(resetCooldownButton, false);
            const grp: Group = new Group(GetUnitsSelectedAll(Player(0)));
            grp.for((u: unit) => {
                UnitResetCooldown(u);
            });

            grp.destroy();
            BlzFrameSetEnable(resetCooldownButton, true);
        });
        createButtonTrigger(levelUpButton, () => {
            BlzFrameSetEnable(levelUpButton, false);
            const grp: Group = new Group(GetUnitsSelectedAll(Player(0)));
            grp.for((u: unit) => {
                if (IsUnitType(u, UNIT_TYPE_HERO)) {
                    SetHeroLevel(u, GetHeroLevel(u) + 1, true);
                }
            });

            grp.destroy();
            BlzFrameSetEnable(levelUpButton, true);
        });
    }
}
