import { WarcraftMaul } from './WarcraftMaul';
import { Ship } from './Entity/Ship';
import { WaveCreep } from './Entity/WaveCreep';
import { Race } from './Game/Races/Race';
import { PlayerSpawns } from './Entity/PlayerSpawns';
import { SpawnedCreeps } from './Entity/SpawnedCreeps';
import { CheckPoint } from './Entity/CheckPoint';
import { Teleporter } from './Entity/Teleporter';
import { RaceVoid } from './Game/Races/RaceVoid';
import { RaceLootBoxer } from './Game/Races/RaceLootBoxer';
import { AntiBlock } from './Antiblock/AntiBlock';
import { Maze } from './Antiblock/Maze';
import * as settings from './GlobalSettings';
import { TowerConstruction } from './Entity/Tower/TowerConstruction';
import { DirectionalArrow } from './Game/DirectionalArrow';

export class WorldMap {
    public game: WarcraftMaul;
    public worldCreatures: Map<String, unit> = new Map<String, unit>();
    public waveCreeps: WaveCreep[] = [];
    public races: Race[] = [];
    private _spawnedCreeps: SpawnedCreeps;
    public ship: Ship | undefined;
    public archimondeDummy!: unit;
    public playerSpawns: PlayerSpawns[] = [];
    public readonly playerMazes: Maze[] = [];
    public disabledRaces: number = 0;
    public towerConstruction: TowerConstruction;
    public antiBlock: AntiBlock;

    constructor(game: WarcraftMaul) {
        this.game = game;
        this.setupWorldCreatures();
        this._spawnedCreeps = new SpawnedCreeps(this);
        this.towerConstruction = new TowerConstruction(game);
        this.antiBlock = new AntiBlock(this);
    }

    private setupWorldCreatures(): void {
        // Ship at the bottom of the world
        this.ship = new Ship(CreateUnit(Player(COLOUR.NAVY), FourCC('n05G'), 63.0, -5343.5, 0.000), this);
        this.createCreepWaves();
        this.createDummyCreeps();
        this.setupRaces();
        this.setupCheckpoint();
        this.setupMazes();
        this.setupArrows();
    }

    private setupArrows(): void {
        const directionalArrows: DirectionalArrow[] = [];
        for (let playerId: number = 0; playerId < 13; playerId++) {
            const firstSpawn: CheckPoint | undefined = this.playerSpawns[playerId].spawnOne;
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

            let modelPath: string = '';
            // if (Player(playerId) === GetLocalPlayer()) {
            // modelPath = 'Doodads\\Cinematic\\DemonFootPrint\\DemonFootPrint0.mdl';
            // modelPath = 'Abilities\\Spells\\Items\\OrbCorruption\\OrbCorruptionMissile.mdl';
            modelPath = 'Abilities\\Spells\\NightElf\\FaerieDragonInvis\\FaerieDragon_Invis.mdl';
            // }
            //
            directionalArrows.push(new DirectionalArrow(modelPath,
                                                        GetRectCenterX(firstCheckpoint.rectangle),
                                                        GetRectCenterY(firstCheckpoint.rectangle),
                                                        GetRectCenterX(secondCheckpoint.rectangle),
                                                        GetRectCenterY(secondCheckpoint.rectangle)));
        }

        // TODO: This needs to be replaced with a timer library!
        const t: timer = CreateTimer();
        TimerStart(t, 10.00, false, () => {
            let directionalArrow: DirectionalArrow | undefined = directionalArrows.pop();
            while (directionalArrow !== undefined) {
                directionalArrow.Destroy();
                directionalArrow = directionalArrows.pop();
            }
        });
    }

    public createDummyCreeps(): void {
        // set up neutrals
        const dummyCreeps: unit[] = [];

        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('u006'), 1664.0, 3072.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('hC04'), 1792.0, 3072.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('eC05'), 1920.0, 3072.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('hC16'), 2048.0, 3072.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC17'), 2176.0, 3072.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC29'), 1664.0, 2944.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('o01C'), 1792.0, 2944.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC30'), 1920.0, 2944.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('oC31'), 2048.0, 2944.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC33'), 2176.0, 2944.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('n008'), 1664.0, 2816.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('eC38'), 1792.0, 2816.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC39'), 1920.0, 2816.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC40'), 2048.0, 2816.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC41'), 2176.0, 2816.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC42'), 1664.0, 2688.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('uC43'), 1792.0, 2688.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('hC44'), 1920.0, 2688.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('uC45'), 2048.0, 2688.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('n004'), 2176.0, 2688.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('hC48'), 1664.0, 2560.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('oC47'), 1792.0, 2560.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC49'), 1920.0, 2560.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC50'), 2048.0, 2560.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC51'), 2176.0, 2560.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC69'), 1664.0, 2432.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('eC52'), 1792.0, 2432.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('oC70'), 1920.0, 2432.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('hC95'), 2048.0, 2432.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('uC71'), 2176.0, 2432.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('hC76'), 1664.0, 2304.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('h03Y'), 1792.0, 2304.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('h03Z'), 1920.0, 2304.0, 270.0));
        dummyCreeps.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('h040'), 2048.0, 2304.0, 270.0));

        for (const creep of dummyCreeps) {
            SetUnitInvulnerable(creep, true);
            PauseUnit(creep, true);
        }

        this.archimondeDummy = CreateUnit(Player(COLOUR.NAVY), FourCC('u000'), 4868.0, -4964.0, 240.0);
        PauseUnitBJ(true, this.archimondeDummy);

        CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('n017'), 0.00, -970.00, bj_UNIT_FACING);
        CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('n017'), -4400.00, 4737.00, bj_UNIT_FACING);
        CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('n017'), 4400.00, 4737.00, bj_UNIT_FACING);
        CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('n017'), -2176.00, 700.00, bj_UNIT_FACING);
        CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('n017'), 2176.00, 700.00, bj_UNIT_FACING);
        CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('n017'), -4400.00, -2500.00, bj_UNIT_FACING);
        CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('n017'), 4400.00, -2500.00, bj_UNIT_FACING);
        CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('n017'), 1950.00, -3500.00, bj_UNIT_FACING);
        CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('n017'), -1950.00, -3500.00, bj_UNIT_FACING);

    }

    public createCreepWaves(): void {
        this.waveCreeps.push(new WaveCreep(1, 'u006', 'Wisp'));
        this.waveCreeps.push(new WaveCreep(2, 'hC04', 'Clockwerk'));
        this.waveCreeps.push(new WaveCreep(3, 'eC05', 'Acolyte'));
        this.waveCreeps.push(new WaveCreep(4, 'hC16', 'Militia'));
        this.waveCreeps.push(new WaveCreep(5, 'nC17', 'Wind Rider'));
        this.waveCreeps.push(new WaveCreep(6, 'nC29', 'Tauren Mystic'));
        this.waveCreeps.push(new WaveCreep(7, 'o01C', 'Grunt'));
        this.waveCreeps.push(new WaveCreep(8, 'nC30', 'Makrura Snapper'));
        this.waveCreeps.push(new WaveCreep(9, 'oC31', 'Mutant'));
        this.waveCreeps.push(new WaveCreep(10, 'nC33', 'Mini-Tank'));
        this.waveCreeps.push(new WaveCreep(11, 'n008', 'Enraged Yeti'));
        this.waveCreeps.push(new WaveCreep(12, 'eC38', 'Faceless Brute'));
        this.waveCreeps.push(new WaveCreep(13, 'nC39', 'Stampeding Reptile'));
        this.waveCreeps.push(new WaveCreep(14, 'nC40', 'Nymph'));
        this.waveCreeps.push(new WaveCreep(15, 'nC41', 'Matured Dragon'));
        this.waveCreeps.push(new WaveCreep(16, 'nC42', 'Merfolk Champion'));
        this.waveCreeps.push(new WaveCreep(17, 'uC43', 'Eternal Spirit'));
        this.waveCreeps.push(new WaveCreep(18, 'hC44', 'Granite Golem'));
        this.waveCreeps.push(new WaveCreep(19, 'uC45', 'Walking Corpse'));
        this.waveCreeps.push(new WaveCreep(20, 'n004', 'Adult Dragon'));
        this.waveCreeps.push(new WaveCreep(21, 'hC48', 'Bear'));
        this.waveCreeps.push(new WaveCreep(22, 'oC47', 'Heavy Tank'));
        this.waveCreeps.push(new WaveCreep(23, 'nC49', 'Big Game Hunter'));
        this.waveCreeps.push(new WaveCreep(24, 'nC50', 'Water Spirit'));
        this.waveCreeps.push(new WaveCreep(25, 'nC51', 'Ancient Dragon'));
        this.waveCreeps.push(new WaveCreep(26, 'nC69', 'Steel Golem'));
        this.waveCreeps.push(new WaveCreep(27, 'eC52', 'Demonic Minion'));
        this.waveCreeps.push(new WaveCreep(28, 'oC70', 'Fire Spirit'));
        this.waveCreeps.push(new WaveCreep(29, 'hC95', 'Demon Queen'));
        this.waveCreeps.push(new WaveCreep(30, 'uC71', 'Nether Dragon'));
        this.waveCreeps.push(new WaveCreep(31, 'hC76', 'Blood Golem'));
        this.waveCreeps.push(new WaveCreep(32, 'h03Y', 'Big Bad Ogre'));
        this.waveCreeps.push(new WaveCreep(33, 'h03Z', 'Snap Dragon'));
        this.waveCreeps.push(new WaveCreep(34, 'h040', 'Zergling'));
        this.waveCreeps.push(new WaveCreep(35, 'uC72', 'Archimonde'));
        this.waveCreeps.push(new WaveCreep(36, 'hC79', 'CRAB OF DEATH'));
    }

    public setupRaces(): void {
        this.races.push(new Race('h03L', 'Workers Union', 'I01A', this));
        this.races.push(new Race('uC98', 'Demon Portal', 'I001', this));
        this.races.push(new Race('oC22', 'Undead Necropolis', 'I002', this));
        this.races.push(new Race('eC10', 'Aviaries', 'I003', this, false));
        this.races.push(new Race('u002', 'High Elf Barracks', 'I004', this));
        this.races.push(new Race('u001', 'Outland', 'I005', this));
        this.races.push(new Race('hC07', 'Human Town Hall', 'I006', this));
        this.races.push(new Race('nC03', 'Orc Stronghold', 'I007', this));
        this.races.push(new Race('n03W', 'High Elf Farm', 'I025', this));
        this.races.push(new Race('uC13', 'Giants Hall', 'I009', this));
        this.races.push(new Race('e00A', 'The Unique', 'I027', this));
        this.races.push(new Race('e007', 'The Summons', 'I00B', this));
        this.races.push(new Race('n00J', 'Arachnid Hive', 'I00C', this));
        this.races.push(new Race('o017', 'Draenei Haven', 'I00D', this));
        this.races.push(new Race('u00B', 'Dragons', 'I00E', this));
        this.races.push(new Race('e00F', 'Night Elf Ancient', 'I00F', this));
        this.races.push(new Race('e00W', 'Elementalists', 'I024', this));
        this.races.push(new Race('e002', 'Tavern', 'I00H', this));
        this.races.push(new Race('e003', 'Corrupted Night Elves', 'I00I', this));
        this.races.push(new Race('e005', 'Goblins', 'I00J', this));
        this.races.push(new Race('n03M', 'Heros Altar', 'NULL', this, false));
        this.races.push(new Race('e00D', 'Caerbannog', 'I000', this));
        this.races.push(new Race('n01V', 'Critters UNITE', 'I00L', this));
        this.races.push(new Race('n02A', 'Gnoll Republic', 'I00M', this));
        this.races.push(new RaceVoid('h02T', 'Void Cult', 'I019', this));
        this.races.push(new Race('n02S', 'Alliance of Blades', 'I00P', this));
        this.races.push(new Race('n03C', 'Cavernous Creatures', 'I00Q', this));
        this.races.push(new Race('n046', 'Forest Troll Hut', 'I00O', this));
        this.races.push(new Race('n014', 'Ice Troll Hut', 'I00R', this));
        this.races.push(new Race('n03W', 'Dark Troll Hut', 'NULL', this, false));
        this.races.push(new Race('n04I', 'The Forsaken', 'I00T', this));
        this.races.push(new Race('e00H', 'Dwarven Mine', 'I00U', this));
        this.races.push(new Race('e00G', 'Galaxy', 'I00Z', this));
        this.races.push(new RaceLootBoxer('u043', 'Loot Boxer', 'I02D', this));
        this.races.push(new Race('u01B', 'Shrine of Buffs', 'I026', this, false));
    }

    private setupCheckpoint(): void {
        const RedSpawns: PlayerSpawns = new PlayerSpawns(this, COLOUR.RED);
        RedSpawns.spawnOne = new CheckPoint(Rect(-1792.0, 4736.0, -1472.0, 5056.0), this);
        RedSpawns.spawnTwo = new CheckPoint(Rect(-1792.0, 4416.0, -1472.0, 4736.0), this);
        let RedCheckpoint: CheckPoint = RedSpawns.spawnOne;
        RedCheckpoint = RedCheckpoint.next = new CheckPoint(Rect(-2464.00, 4704.00, -2400.00, 4768.00), this);
        RedCheckpoint = RedCheckpoint.next = new CheckPoint(Rect(-3616.00, 4704.00, -3552.00, 4768.00), this);
        RedCheckpoint = RedCheckpoint.next = new Teleporter(Rect(-4384.00, 4704.00, -4320.00, 4768.00), this, 270.00);
        RedCheckpoint = RedCheckpoint.next = new CheckPoint(Rect(-4384.00, 3392.00, -4320.00, 3456.00), this);
        this.playerSpawns[COLOUR.RED] = RedSpawns;


        const BlueSpawns: PlayerSpawns = new PlayerSpawns(this, COLOUR.BLUE);
        BlueSpawns.spawnOne = new CheckPoint(Rect(-320.0, 4768.0, 0.0, 5088.0), this);
        BlueSpawns.spawnTwo = new CheckPoint(Rect(0.0, 4768.0, 320.0, 5088.0), this);

        let BluePrimaryCheckpoint: CheckPoint = BlueSpawns.spawnOne;
        BluePrimaryCheckpoint = BluePrimaryCheckpoint.next = new CheckPoint(Rect(-64.00, 4032.00, 64.00, 4160.00), this);
        BluePrimaryCheckpoint = BluePrimaryCheckpoint.next = new CheckPoint(Rect(-64.00, 2880.00, 64.00, 3008.00), this);
        BluePrimaryCheckpoint = BluePrimaryCheckpoint.next = new CheckPoint(Rect(-64, 1920, 64, 2016), this);

        let BlueSecondaryCheckpoint: CheckPoint = BlueSpawns.spawnTwo;
        BlueSecondaryCheckpoint = BlueSecondaryCheckpoint.next = new CheckPoint(Rect(-64.00, 4032.00, 64.00, 4160.00), this);
        BlueSecondaryCheckpoint = BlueSecondaryCheckpoint.next = new CheckPoint(Rect(-64.00, 2880.00, 64.00, 3008.00), this);
        BlueSecondaryCheckpoint = BlueSecondaryCheckpoint.next = new CheckPoint(Rect(-64, 1920, 64, 2016), this);
        this.playerSpawns[COLOUR.BLUE] = BlueSpawns;


        const TealSpawns: PlayerSpawns = new PlayerSpawns(this, COLOUR.TEAL);
        TealSpawns.spawnOne = new CheckPoint(Rect(1472.0, 4768.0, 1792.0, 5088.0), this);
        TealSpawns.spawnTwo = new CheckPoint(Rect(1472.0, 4448.0, 1792.0, 4768.0), this);
        let TealCheckpoint: CheckPoint = TealSpawns.spawnOne;
        TealCheckpoint = TealCheckpoint.next = new CheckPoint(Rect(2400.00, 4704.00, 2464.00, 4768.00), this);
        TealCheckpoint = TealCheckpoint.next = new CheckPoint(Rect(3552.00, 4704.00, 3616.00, 4768.00), this);
        TealCheckpoint = TealCheckpoint.next = new Teleporter(Rect(4320.00, 4704.00, 4384.00, 4768.00), this, 270.00);
        TealCheckpoint = TealCheckpoint.next = new CheckPoint(Rect(4320.00, 3392.00, 4384.00, 3456.00), this);
        this.playerSpawns[COLOUR.TEAL] = TealSpawns;


        const PurpleSpawns: PlayerSpawns = new PlayerSpawns(this, COLOUR.PURPLE);
        PurpleSpawns.spawnOne = new CheckPoint(Rect(4032.0, 128.0, 4352.0, 448.0), this);
        PurpleSpawns.spawnTwo = new CheckPoint(Rect(4352.0, 128.0, 4672.0, 448.0), this);
        let PurpleCheckpoint: CheckPoint = PurpleSpawns.spawnOne;
        PurpleCheckpoint = PurpleCheckpoint.next = new CheckPoint(Rect(4320.00, -544.00, 4384.00, -480.00), this);
        PurpleCheckpoint = PurpleCheckpoint.next = new CheckPoint(Rect(4320.00, -1696.00, 4384.00, -1632.00), this);
        PurpleCheckpoint = PurpleCheckpoint.next = new Teleporter(Rect(4320.00, -2464.00, 4384.00, -2400.00), this, 180.0);
        PurpleCheckpoint = PurpleCheckpoint.next = new CheckPoint(Rect(4672.00, -3488.00, 4736.00, -3424.00), this);
        this.playerSpawns[COLOUR.PURPLE] = PurpleSpawns;

        const YellowSpawns: PlayerSpawns = new PlayerSpawns(this, COLOUR.YELLOW);
        YellowSpawns.spawnOne = new CheckPoint(Rect(-320.0, 1664.0, 0.0, 1984.0), this);
        YellowSpawns.spawnTwo = new CheckPoint(Rect(0.0, 1664.0, 320.0, 1984.0), this);

        let YellowPrimaryCheckpoint: CheckPoint = YellowSpawns.spawnOne;
        YellowPrimaryCheckpoint = YellowPrimaryCheckpoint.next = new CheckPoint(Rect(-32.00, 992.00, 32.00, 1056.00), this);
        YellowPrimaryCheckpoint = YellowPrimaryCheckpoint.next = new CheckPoint(Rect(-32.00, -160.00, 32.00, -96.00), this);
        YellowPrimaryCheckpoint = YellowPrimaryCheckpoint.next = new Teleporter(Rect(-32.00, -928.00, 32.00, -864.00), this, 180.0);
        YellowPrimaryCheckpoint = YellowPrimaryCheckpoint.next = new CheckPoint(Rect(-2208.00, -2144.00, -2144.00, -2080.00), this);

        let YellowSecondaryCheckpoint: CheckPoint = YellowSpawns.spawnTwo;
        YellowSecondaryCheckpoint = YellowSecondaryCheckpoint.next = new CheckPoint(Rect(-32.00, 992.00, 32.00, 1056.00), this);
        YellowSecondaryCheckpoint = YellowSecondaryCheckpoint.next = new CheckPoint(Rect(-32.00, -160.00, 32.00, -96.00), this);
        YellowSecondaryCheckpoint = YellowSecondaryCheckpoint.next = new Teleporter(Rect(-32.00, -928.00, 32.00, -864.00), this, 180.0);
        YellowSecondaryCheckpoint = YellowSecondaryCheckpoint.next = new CheckPoint(Rect(2144.00, -2144.00, 2208.00, -2080.00), this);

        this.playerSpawns[COLOUR.YELLOW] = YellowSpawns;


        const OrangeSpawns: PlayerSpawns = new PlayerSpawns(this, COLOUR.ORANGE);
        OrangeSpawns.spawnOne = new CheckPoint(Rect(-4672.0, 128.0, -4352.0, 448.0), this);
        OrangeSpawns.spawnTwo = new CheckPoint(Rect(-4352.0, 128.0, -4032.0, 448.0), this);
        let OrangeCheckpoint: CheckPoint = OrangeSpawns.spawnOne;
        OrangeCheckpoint = OrangeCheckpoint.next = new CheckPoint(Rect(-4384.00, -544.00, -4320.00, -480.00), this);
        OrangeCheckpoint = OrangeCheckpoint.next = new CheckPoint(Rect(-4384.00, -1696.00, -4320.00, -1632.00), this);
        OrangeCheckpoint = OrangeCheckpoint.next = new Teleporter(Rect(-4384.00, -2464.00, -4320.00, -2400.00), this, 0.0);
        OrangeCheckpoint = OrangeCheckpoint.next = new CheckPoint(Rect(-4768.00, -3488.00, -4704.00, -3424.00), this);
        this.playerSpawns[COLOUR.ORANGE] = OrangeSpawns;


        const GreenSpawns: PlayerSpawns = new PlayerSpawns(this, COLOUR.GREEN);
        GreenSpawns.spawnOne = new CheckPoint(Rect(-4800.0, -3456.0, -4480.0, -3136.0), this);
        GreenSpawns.spawnTwo = new CheckPoint(Rect(-4800.0, -3776.0, -4480.0, -3456.0), this);
        let GreenCheckpoint: CheckPoint = GreenSpawns.spawnOne;
        GreenCheckpoint = GreenCheckpoint.next = new CheckPoint(Rect(-3872.00, -3488.00, -3808.00, -3424.00), this);
        GreenCheckpoint = GreenCheckpoint.next = new CheckPoint(Rect(-2720.00, -3488.00, -2656.00, -3424.00), this);
        GreenCheckpoint = GreenCheckpoint.next = new Teleporter(Rect(-1952.00, -3488.00, -1888.00, -3424.00), this, 270);
        this.playerSpawns[COLOUR.GREEN] = GreenSpawns;


        const PinkSpawns: PlayerSpawns = new PlayerSpawns(this, COLOUR.PINK);
        PinkSpawns.spawnOne = new CheckPoint(Rect(4480.0, -3456.0, 4800.0, -3136.0), this);
        PinkSpawns.spawnTwo = new CheckPoint(Rect(4480.0, -3776.0, 4800.0, -3456.0), this);
        let PinkCheckpoint: CheckPoint = PinkSpawns.spawnOne;
        PinkCheckpoint = PinkCheckpoint.next = new CheckPoint(Rect(3808.00, -3488.00, 3872.00, -3424.00), this);
        PinkCheckpoint = PinkCheckpoint.next = new CheckPoint(Rect(2656.00, -3488.00, 2720.00, -3424.00), this);
        PinkCheckpoint = PinkCheckpoint.next = new Teleporter(Rect(1888.00, -3488.00, 1952.00, -3424.00), this, 270);
        this.playerSpawns[COLOUR.PINK] = PinkSpawns;


        const GreysSpawns: PlayerSpawns = new PlayerSpawns(this, COLOUR.GRAY);
        GreysSpawns.spawnOne = new CheckPoint(Rect(-160.0, -2464.0, 160.0, -2144.0), this);
        let GreysCheckpoint: CheckPoint = GreysSpawns.spawnOne;
        GreysCheckpoint = GreysCheckpoint.next = new CheckPoint(Rect(-32.00, -3104.00, 32.00, -3040.00), this);
        GreysCheckpoint = GreysCheckpoint.next = new CheckPoint(Rect(-32.00, -4256.00, 32.00, -4192.00), this);
        GreysCheckpoint.next = this.ship !== undefined ? this.ship : undefined;
        this.playerSpawns[COLOUR.GRAY] = GreysSpawns;


        // brown
        const BrownSpawns: PlayerSpawns = new PlayerSpawns(this, COLOUR.BROWN);
        BrownSpawns.spawnOne = new CheckPoint(Rect(-4672.0, 3200.0, -4352.0, 3520.0), this);
        BrownSpawns.spawnTwo = new CheckPoint(Rect(-4352.0, 3200.0, -4032.0, 3520.0), this);

        let BrownCheckpoint: CheckPoint = BrownSpawns.spawnOne;
        BrownCheckpoint = BrownCheckpoint.next = new CheckPoint(Rect(-4384.00, 2528.00, -4320.00, 2592.00), this);
        BrownCheckpoint = BrownCheckpoint.next = new CheckPoint(Rect(-4384.00, 1376.00, -4320.00, 1440.00), this);
        BrownCheckpoint = BrownCheckpoint.next = new CheckPoint(Rect(-4416.00, 384.00, -4288.00, 480.00), this);


        this.playerSpawns[COLOUR.BROWN] = BrownSpawns;


        const MaroonsSpawns: PlayerSpawns = new PlayerSpawns(this, COLOUR.MAROON);
        MaroonsSpawns.spawnOne = new CheckPoint(Rect(4032.0, 3200.0, 4352.0, 3520.0), this);
        MaroonsSpawns.spawnTwo = new CheckPoint(Rect(4352.0, 3200.0, 4672.0, 3520.0), this);
        let MaroonsCheckpoint: CheckPoint = MaroonsSpawns.spawnOne;
        MaroonsCheckpoint = MaroonsCheckpoint.next = new CheckPoint(Rect(4320.00, 2528.00, 4384.00, 2592.00), this);
        MaroonsCheckpoint = MaroonsCheckpoint.next = new CheckPoint(Rect(4320.00, 1376.00, 4384.00, 1440.00), this);
        MaroonsCheckpoint = MaroonsCheckpoint.next = new CheckPoint(Rect(4288.00, 384.00, 4416.00, 480.00), this);
        this.playerSpawns[COLOUR.MAROON] = MaroonsSpawns;


        const LightBlueSpawns: PlayerSpawns = new PlayerSpawns(this, COLOUR.LIGHT_BLUE);
        LightBlueSpawns.spawnOne = new CheckPoint(Rect(-2496.0, -2240.0, -2176.0, -1920.0), this);
        LightBlueSpawns.spawnTwo = new CheckPoint(Rect(-2176.0, -2240.0, -1856.0, -1920.0), this);
        let LightBlueCheckpoint: CheckPoint = LightBlueSpawns.spawnOne;
        LightBlueCheckpoint = LightBlueCheckpoint.next = new CheckPoint(Rect(-2208.00, -1312.00, -2144.00, -1248.00), this);
        LightBlueCheckpoint = LightBlueCheckpoint.next = new CheckPoint(Rect(-2208.00, -160.00, -2144.00, -96.00), this);
        LightBlueCheckpoint = LightBlueCheckpoint.next = new Teleporter(Rect(-2208.00, 608.00, -2144.00, 672.00), this, 270);
        // @ts-ignore
        // LightBlueCheckpoint = LightBlueCheckpoint.next = OrangeSpawns.spawnOne;
        this.playerSpawns[COLOUR.LIGHT_BLUE] = LightBlueSpawns;

        const DarkGreenSpawns: PlayerSpawns = new PlayerSpawns(this, COLOUR.DARK_GREEN);
        DarkGreenSpawns.spawnOne = new CheckPoint(Rect(1856.0, -2240.0, 2176.0, -1920.0), this);
        DarkGreenSpawns.spawnTwo = new CheckPoint(Rect(2176.0, -2240.0, 2496.0, -1920.0), this);
        let DarkGreenCheckpoint: CheckPoint = DarkGreenSpawns.spawnOne;
        DarkGreenCheckpoint = DarkGreenCheckpoint.next = new CheckPoint(Rect(2144.00, -1312.00, 2208.00, -1248.00), this);
        DarkGreenCheckpoint = DarkGreenCheckpoint.next = new CheckPoint(Rect(2144.00, -160.00, 2208.00, -96.00), this);
        DarkGreenCheckpoint = DarkGreenCheckpoint.next = new Teleporter(Rect(2144.00, 608.00, 2208.00, 672.00), this, 270);
        // @ts-ignore
        // DarkGreenCheckpoint = DarkGreenCheckpoint.next = MaroonsCheckpoint;
        this.playerSpawns[COLOUR.DARK_GREEN] = DarkGreenSpawns;


        RedCheckpoint.next = BrownSpawns.spawnOne.next;
        BrownCheckpoint.next = OrangeSpawns.spawnOne.next;
        OrangeCheckpoint.next = GreenSpawns.spawnOne.next;
        GreenCheckpoint.next = GreysSpawns.spawnOne;


        TealCheckpoint.next = MaroonsSpawns.spawnOne.next;
        MaroonsCheckpoint.next = PurpleSpawns.spawnOne.next;
        PurpleCheckpoint.next = PinkSpawns.spawnOne.next;
        PinkCheckpoint.next = GreysSpawns.spawnOne;


        BluePrimaryCheckpoint.next = YellowSpawns.spawnOne.next;
        BlueSecondaryCheckpoint.next = YellowSpawns.spawnTwo.next;

        YellowPrimaryCheckpoint.next = LightBlueSpawns.spawnOne.next;
        YellowSecondaryCheckpoint.next = DarkGreenSpawns.spawnOne.next;
        DarkGreenCheckpoint.next = MaroonsCheckpoint;
        LightBlueCheckpoint.next = BrownCheckpoint;


    }

    public setupMazes(): void {
        for (let i: number = 0; i < settings.PLAYER_AREAS.length; i++) {
            const minX: number = settings.PLAYER_AREAS[i].minX;
            const minY: number = settings.PLAYER_AREAS[i].minY;
            const maxX: number = settings.PLAYER_AREAS[i].maxX;
            const maxY: number = settings.PLAYER_AREAS[i].maxY;
            const width: number = Math.abs((maxX - minX) / 64);
            const height: number = Math.abs((maxY - minY) / 64);
            const g: boolean[] = [];
            for (let j: number = 0; j < width; j++) {
                for (let k: number = 0; k < height; k++) {
                    g[j + k * width] = true;
                }
            }

            this.playerMazes[i] = new Maze(minX, minY, maxX, maxY, width, height, g);
        }
    }


    public HealEverythingOnMap(): void {
        const grp: group = GetUnitsInRectAll(GetPlayableMapRect());
        ForGroupBJ(grp, () => {
            SetUnitLifePercentBJ(GetEnumUnit(), 100);
        });
        DestroyGroup(grp);
    }

    public ReplaceRunedBricksWithLava(): void {
        this.ReplaceTerrainTypeId('Irbk', 'Dlvc', -5888.0, 5888.0, -5888.0, 5888.0);
    }

    private ReplaceTerrainTypeId(OldTerrain: string, NewTerrain: string, MinX: number, MaxX: number, MinY: number, MaxY: number): void {
        for (; MinY < MaxY; MinY++) {
            if (GetTerrainType(MinX, MinY) === FourCC(OldTerrain)) {
                SetTerrainType(MinX, MinY, FourCC(NewTerrain), -1, 1, 1);
                if (GetRandomInt(0, 99) > 89) {
                    AddSpecialEffect('Abilities\\Spells\\Human\\FlameStrike\\FlameStrikeEmbers.mdl', MinX, MinY);
                }
            }
            if (MinX >= MaxX) {
                MinY = MinY + 128.0;
                MinX = -5888.0;
            } else {
                MinX = MinX + 128.0;
            }
        }
    }

    public RemoveEveryUnit(): void {
        const grp: group = GetUnitsInRectAll(GetPlayableMapRect());
        ForGroupBJ(grp, () => this.RemoveUnitIfNotShip());
        DestroyGroup(grp);
    }

    private RemoveUnitIfNotShip(): void {
        if (GetUnitTypeId(GetEnumUnit()) === FourCC('n05G')) {
            KillUnit(GetEnumUnit());
        } else {
            RemoveUnit(GetEnumUnit());
        }
    }

    /**
     * Getters and Setters
     */

    get spawnedCreeps(): SpawnedCreeps {
        return this._spawnedCreeps;
    }

    set spawnedCreeps(value: SpawnedCreeps) {
        this._spawnedCreeps = value;
    }
}
