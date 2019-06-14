import { WarcraftMaul } from './WarcraftMaul';
import { Ship } from './Entity/Ship';
import { Creep } from './Entity/Creep';
import { Race } from './Game/Race';
import { PlayerSpawns } from './Entity/PlayerSpawns';
import { SpawnedCreeps } from './Entity/SpawnedCreeps';
import { CheckPoint } from './Entity/CheckPoint';
import { Teleporter } from './Entity/Teleporter';

export class WorldMap {
    game: WarcraftMaul;
    worldCreatures: Map<String, unit> = new Map<String, unit>();
    creeps: Creep[] = [];
    races: Race[] = [];
    spawnedCreeps: SpawnedCreeps | undefined;

    ship: Ship | undefined;
    archimondeDummy: unit | undefined;


    playerSpawns: PlayerSpawns[] = [];


    constructor(game: WarcraftMaul) {
        this.game = game;
        this.setupWorldCreatures();

    }

    private setupWorldCreatures() {

        // Ship at the bottom of the world
        this.ship = new Ship(CreateUnit(Player(13), FourCC('n05G'), 63.0, -5343.5, 0.000));

        this.createCreepWaves();
        this.createDummyCreeps();
        this.setupRaces();
        this.spawnedCreeps = new SpawnedCreeps();


        this.setupCheckpoint();
        // Set up Teleporters


    }


    createDummyCreeps() {

        // set up neutrals
        const dummyWaves: unit[] = [];

        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('u006'), 1664.0, 3072.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('hC04'), 1792.0, 3072.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('eC05'), 1920.0, 3072.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('hC16'), 2048.0, 3072.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC17'), 2176.0, 3072.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC29'), 1664.0, 2944.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('o01C'), 1792.0, 2944.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC30'), 1920.0, 2944.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('oC31'), 2048.0, 2944.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC33'), 2176.0, 2944.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('n008'), 1664.0, 2816.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('eC38'), 1792.0, 2816.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC39'), 1920.0, 2816.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC40'), 2048.0, 2816.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC41'), 2176.0, 2816.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC42'), 1664.0, 2688.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('uC43'), 1792.0, 2688.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('hC44'), 1920.0, 2688.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('uC45'), 2048.0, 2688.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('n004'), 2176.0, 2688.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('hC48'), 1664.0, 2560.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('oC47'), 1792.0, 2560.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC49'), 1920.0, 2560.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC50'), 2048.0, 2560.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC51'), 2176.0, 2560.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('nC69'), 1664.0, 2432.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('eC52'), 1792.0, 2432.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('oC70'), 1920.0, 2432.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('hC95'), 2048.0, 2432.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('uC71'), 2176.0, 2432.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('hC76'), 1664.0, 2304.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('h03Y'), 1792.0, 2304.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('h03Z'), 1920.0, 2304.0, 270.0));
        dummyWaves.push(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('h040'), 2048.0, 2304.0, 270.0));

        for (let wave of dummyWaves) {
            SetUnitInvulnerable(wave, true);
            PauseUnit(wave, true);
        }

        this.archimondeDummy = CreateUnit(Player(COLOUR.NAVY), FourCC('u000'), 4868.0, -4964.0, 240.0);
        PauseUnitBJ(true, this.archimondeDummy);

    }

    createCreepWaves() {
        this.creeps.push(new Creep(1, 'u006', 'Wisp'));
        this.creeps.push(new Creep(2, 'hC04', 'Clockwerk'));
        this.creeps.push(new Creep(3, 'eC05', 'Acolyte'));
        this.creeps.push(new Creep(4, 'hC16', 'Militia'));
        this.creeps.push(new Creep(5, 'nC17', 'Wind Rider'));
        this.creeps.push(new Creep(6, 'nC29', 'Tauren Mystic'));
        this.creeps.push(new Creep(7, 'o01C', 'Grunt'));
        this.creeps.push(new Creep(8, 'nC30', 'Makrura Snapper'));
        this.creeps.push(new Creep(9, 'oC31', 'Mutant'));
        this.creeps.push(new Creep(10, 'nC33', 'Mini-Tank'));
        this.creeps.push(new Creep(11, 'n008', 'Enraged Yeti'));
        this.creeps.push(new Creep(12, 'eC38', 'Faceless Brute'));
        this.creeps.push(new Creep(13, 'nC39', 'Stampeding Reptile'));
        this.creeps.push(new Creep(14, 'nC40', 'Nymph'));
        this.creeps.push(new Creep(15, 'nC41', 'Matured Dragon'));
        this.creeps.push(new Creep(16, 'nC42', 'Merfolk Champion'));
        this.creeps.push(new Creep(17, 'uC43', 'Eternal Spirit'));
        this.creeps.push(new Creep(18, 'hC44', 'Granite Golem'));
        this.creeps.push(new Creep(19, 'uC45', 'Walking Corpse'));
        this.creeps.push(new Creep(20, 'n004', 'Adult Dragon'));
        this.creeps.push(new Creep(21, 'hC48', 'Bear'));
        this.creeps.push(new Creep(22, 'oC47', 'Heavy Tank'));
        this.creeps.push(new Creep(23, 'nC49', 'Big Game Hunter'));
        this.creeps.push(new Creep(24, 'nC50', 'Water Spirit'));
        this.creeps.push(new Creep(25, 'nC51', 'Ancient Dragon'));
        this.creeps.push(new Creep(26, 'nC69', 'Steel Golem'));
        this.creeps.push(new Creep(27, 'eC52', 'Demonic Minion'));
        this.creeps.push(new Creep(28, 'oC70', 'Fire Spirit'));
        this.creeps.push(new Creep(29, 'hC95', 'Demon Queen'));
        this.creeps.push(new Creep(30, 'uC71', 'Nether Dragon'));
        this.creeps.push(new Creep(31, 'hC76', 'Blood Golem'));
        this.creeps.push(new Creep(32, 'h03Y', 'Big Bad Ogre'));
        this.creeps.push(new Creep(33, 'h03Z', 'Snap Dragon'));
        this.creeps.push(new Creep(34, 'h040', 'Zergling'));
        this.creeps.push(new Creep(35, 'uC72', 'Archimonde'));
        this.creeps.push(new Creep(36, 'hC79', 'CRAB OF DEATH'));
    }

    setupRaces() {
        this.races.push(new Race('h03L', 'Workers Union'));
        this.races.push(new Race('uC98', 'Demon Portal'));
        this.races.push(new Race('oC22', 'Undead Necropolis'));
        this.races.push(new Race('eC10', 'Aviaries'));
        this.races.push(new Race('u002', 'High Elf Barracks'));
        this.races.push(new Race('u001', 'Outland'));
        this.races.push(new Race('hC07', 'Human Town Hall'));
        this.races.push(new Race('nC03', 'Orc Stronghold'));
        this.races.push(new Race('n03W', 'High Elf Farm'));
        this.races.push(new Race('uC13', 'Giants Hall'));
        this.races.push(new Race('e00A', 'The Unique'));
        this.races.push(new Race('e007', 'The Summons'));
        this.races.push(new Race('n00J', 'Arachnid Hive'));
        this.races.push(new Race('o017', 'Draenei Haven'));
        this.races.push(new Race('u00B', 'Dragons'));
        this.races.push(new Race('e00F', 'Night Elf Ancient'));
        this.races.push(new Race('e00W', 'Elementalists'));
        this.races.push(new Race('e002', 'Tavern'));
        this.races.push(new Race('e003', 'Corrupted Night Elves'));
        this.races.push(new Race('e005', 'Goblins'));
        this.races.push(new Race('n03M', 'Heros Altar'));
        this.races.push(new Race('e00D', 'Caerbannog'));
        this.races.push(new Race('n01V', 'Critters UNITE'));
        this.races.push(new Race('n02A', 'Gnoll Republic'));
        this.races.push(new Race('h02T', 'Void Cult'));
        this.races.push(new Race('n02S', 'Alliance of Blades'));
        this.races.push(new Race('n03C', 'Cavernous Creatures'));
        this.races.push(new Race('n046', 'Forest Troll Hut'));
        this.races.push(new Race('n014', 'Ice Troll Hut'));
        this.races.push(new Race('n03W', 'Dark Troll Hut'));
        this.races.push(new Race('n04I', 'The Forsaken'));
        this.races.push(new Race('e00H', 'Dwarven Mine'));
        this.races.push(new Race('e00G', 'Galaxy'));
        this.races.push(new Race('u01B', 'Shrine of Buffs'));
    }

    private setupCheckpoint() {

        let RedSpawns = new PlayerSpawns(this);
        RedSpawns.spawnOne = new CheckPoint(Rect(-1792.0, 4736.0, -1472.0, 5056.0), this);
        RedSpawns.spawnTwo = new CheckPoint(Rect(-1792.0, 4416.0, -1472.0, 4736.0), this);
        this.playerSpawns.push(RedSpawns);


        let RedCheckpoint = RedSpawns.spawnOne;
        RedCheckpoint = RedCheckpoint.next = new CheckPoint(Rect(-2464.00, 4704.00, -2400.00, 4768.00), this);
        RedCheckpoint = RedCheckpoint.next = new CheckPoint(Rect(-3616.00, 4704.00, -3552.00, 4768.00), this);
        RedCheckpoint = RedCheckpoint.next = new Teleporter(Rect(-4384.00, 4704.00, -4320.00, 4768.00), this, 270.00);
        RedCheckpoint = RedCheckpoint.next = new CheckPoint(Rect(-4384.00, 3392.00, -4320.00, 3456.00), this);


        let BlueSpawns = new PlayerSpawns(this);
        BlueSpawns.spawnOne = new CheckPoint(Rect(-320.0, 4768.0, 0.0, 5088.0), this);
        BlueSpawns.spawnTwo = new CheckPoint(Rect(0.0, 4768.0, 320.0, 5088.0), this);
        this.playerSpawns.push(BlueSpawns);


        let TealSpawns = new PlayerSpawns(this);
        TealSpawns.spawnOne = new CheckPoint(Rect(1472.0, 4768.0, 1792.0, 5088.0), this);
        TealSpawns.spawnTwo = new CheckPoint(Rect(1472.0, 4448.0, 1792.0, 4768.0), this);
        this.playerSpawns.push(TealSpawns);


        let PurpleSpawns = new PlayerSpawns(this);
        PurpleSpawns.spawnOne = new CheckPoint(Rect(4032.0, 128.0, 4352.0, 448.0), this);
        PurpleSpawns.spawnTwo = new CheckPoint(Rect(4352.0, 128.0, 4672.0, 448.0), this);
        this.playerSpawns.push(PurpleSpawns);


        let YellowSpawns = new PlayerSpawns(this);
        YellowSpawns.spawnOne = new CheckPoint(Rect(-320.0, 1664.0, 0.0, 1984.0), this);
        YellowSpawns.spawnTwo = new CheckPoint(Rect(0.0, 1664.0, 320.0, 1984.0), this);
        this.playerSpawns.push(YellowSpawns);


        let OrangeSpawns = new PlayerSpawns(this);
        OrangeSpawns.spawnOne = new CheckPoint(Rect(-4672.0, 128.0, -4352.0, 448.0), this);
        OrangeSpawns.spawnTwo = new CheckPoint(Rect(-4352.0, 128.0, -4032.0, 448.0), this);
        this.playerSpawns.push(OrangeSpawns);
        let OrangeCheckpoint = OrangeSpawns.spawnOne;
        OrangeCheckpoint = OrangeCheckpoint.next = new CheckPoint(Rect(-4384.00, -544.00, -4320.00, -480.00), this);
        OrangeCheckpoint = OrangeCheckpoint.next = new CheckPoint(Rect(-4384.00, -1696.00, -4320.00, -1632.00), this);
        OrangeCheckpoint = OrangeCheckpoint.next = new Teleporter(Rect(-4384.00, -2464.00, -4320.00, -2400.00), this, 0.0);
        OrangeCheckpoint = OrangeCheckpoint.next = new CheckPoint(Rect(-4768.00, -3488.00, -4704.00, -3424.00), this);


        let GreenSpawns = new PlayerSpawns(this);
        GreenSpawns.spawnOne = new CheckPoint(Rect(-4800.0, -3456.0, -4480.0, -3136.0), this);
        GreenSpawns.spawnTwo = new CheckPoint(Rect(-4800.0, -3776.0, -4480.0, -3456.0), this);
        this.playerSpawns.push(GreenSpawns);
        let GreenCheckpoint = GreenSpawns.spawnOne;
        GreenCheckpoint = GreenCheckpoint.next = new CheckPoint(Rect(-3872.00, -3488.00, -3808.00, -3424.00), this);
        GreenCheckpoint = GreenCheckpoint.next = new CheckPoint(Rect(-2720.00, -3488.00, -2656.00, -3424.00), this);
        GreenCheckpoint = GreenCheckpoint.next = new Teleporter(Rect(-1952.00, -3488.00, -1888.00, -3424.00), this, 270);


        let PinkSpawns = new PlayerSpawns(this);
        PinkSpawns.spawnOne = new CheckPoint(Rect(4480.0, -3456.0, 4800.0, -3136.0), this);
        PinkSpawns.spawnTwo = new CheckPoint(Rect(4480.0, -3776.0, 4800.0, -3456.0), this);
        this.playerSpawns.push(PinkSpawns);


        let GreysSpawns = new PlayerSpawns(this);
        GreysSpawns.spawnOne = new CheckPoint(Rect(-160.0, -2464.0, 160.0, -2144.0), this);
        this.playerSpawns.push(GreysSpawns);
        let GreysCheckpoint = GreysSpawns.spawnOne;
        GreysCheckpoint = GreysCheckpoint.next = new CheckPoint(Rect(-32.00, -3104.00, 32.00, -3040.00), this);
        GreysCheckpoint = GreysCheckpoint.next = new CheckPoint(Rect(-32.00, -4256.00, 32.00, -4192.00), this);
        GreysCheckpoint = GreysCheckpoint.next = new CheckPoint(Rect(-768.00, -4992.00, 768.00, -4800.00), this);



        let LightBlueSpawns = new PlayerSpawns(this);
        LightBlueSpawns.spawnOne = new CheckPoint(Rect(-2496.0, -2240.0, -2176.0, -1920.0), this);
        LightBlueSpawns.spawnTwo = new CheckPoint(Rect(-2176.0, -2240.0, -1856.0, -1920.0), this);
        this.playerSpawns.push(LightBlueSpawns);


        let DarkGreenSpawns = new PlayerSpawns(this);
        DarkGreenSpawns.spawnOne = new CheckPoint(Rect(1856.0, -2240.0, 2176.0, -1920.0), this);
        DarkGreenSpawns.spawnTwo = new CheckPoint(Rect(2176.0, -2240.0, 2496.0, -1920.0), this);
        this.playerSpawns.push(DarkGreenSpawns);


        // brown
        let BrownSpawns = new PlayerSpawns(this);
        BrownSpawns.spawnOne = new CheckPoint(Rect(-4672.0, 3200.0, -4352.0, 3520.0), this);
        BrownSpawns.spawnTwo = new CheckPoint(Rect(-4352.0, 3200.0, -4032.0, 3520.0), this);
        this.playerSpawns.push(BrownSpawns);

        let BrownCheckpoint = BrownSpawns.spawnOne;
        BrownCheckpoint = BrownCheckpoint.next = new CheckPoint(Rect(-4384.00, 2528.00, -4320.00, 2592.00), this);
        BrownCheckpoint = BrownCheckpoint.next = new CheckPoint(Rect(-4384.00, 1376.00, -4320.00, 1440.00), this);


        let MaroonsSpawns = new PlayerSpawns(this);
        MaroonsSpawns.spawnOne = new CheckPoint(Rect(4032.0, 3200.0, 4352.0, 3520.0), this);
        MaroonsSpawns.spawnTwo = new CheckPoint(Rect(4352.0, 3200.0, 4672.0, 3520.0), this);
        this.playerSpawns.push(MaroonsSpawns);


        // red
        RedCheckpoint.next = BrownSpawns.spawnOne.next;
        BrownCheckpoint.next = OrangeSpawns.spawnOne.next;
        OrangeCheckpoint.next = GreenSpawns.spawnOne.next;
        GreenCheckpoint.next = GreysSpawns.spawnOne;
    }
}
