import { Point } from './GlobalSettings';
import { Rectangle } from '../JassOverrides/Rectangle';
import { IMapSettings } from './IMapSettings';
import { PlayerSpawns } from './Entity/PlayerSpawns';
import { CheckPoint } from './Entity/CheckPoint';
import { Teleporter } from './Entity/Teleporter';
import { WorldMap } from './WorldMap';

export class WarcraftMaulSettings implements IMapSettings {
    public ALLOW_PLAYER_TOWER_LOCATIONS: Point[] = [
        { x: -1536.0, y: 5376.0 }, // Red
        { x: 640.0, y: 4992.0 }, // Blue
        { x: 1536.0, y: 5376.0 }, // Teal
        { x: 5120.0, y: 448.0 }, // Purple
        { x: 768.0, y: 1984.0 }, // Yellow
        { x: -3616.0, y: 448.0 }, // Orange
        { x: -4736.0, y: -2816.0 }, // Green
        { x: 4736.0, y: -2816.0 }, // Pink
        { x: 512.0, y: -2176.0 }, // Grey
        { x: -1536.0, y: -2176.0 }, // Lightblue
        { x: 2816.0, y: -2176.0 }, // Darkgreen
        { x: -3712.0, y: 3456.0 }, // Brown
        { x: 4992.0, y: 3456.0 }, // Maroon
    ];
    public INITIAL_LIVES: number = 100;
    public GAME_END_TIME: number = 600;
    public GAME_TIME_BEFORE_START: number = 90;
    public GAME_TIME_BEFORE_WAVE: number = 20;
    public GAME_GOLD_REWARD_BASE: number = 10;
    public GAME_NAME: string = 'Warcraft Maul Reimagined';
    public PLAYER_AREAS: Rectangle[] = [
        new Rectangle([-4224.0, 3968.0, -1792.0, 5504.0]), // Red area
        new Rectangle([-768.0, 2304.0, 768.0, 4736.0]), // Blue area
        new Rectangle([1792.0, 3968.0, 4224.0, 5504.0]), // Teal area
        new Rectangle([3584.0, -2304.0, 5120.0, 128.0]), // Purple area
        new Rectangle([-768.0, -768.0, 768.0, 1664.0]), // Yellow area
        new Rectangle([-5120.0, -2304.0, -3584.0, 128.0]), // Orange area
        new Rectangle([-4480.0, -4224.0, -2048.0, -2688.0]), // Green area
        new Rectangle([2048.0, -4224.0, 4480.0, -2688.0]), // Pink area
        new Rectangle([-768.0, -4864.0, 768.0, -2432.0]), // Grey area
        new Rectangle([-2944.0, -1920.0, -1408.0, 512.0]), // Lightblue area
        new Rectangle([1408.0, -1920.0, 2944.0, 512.0]), // Darkgreen area
        new Rectangle([-5120.0, 768.0, -3584.0, 3200.0]), // Brown area
        new Rectangle([3584.0, 768.0, 5120.0, 3200.0]), // Maroon area
    ];

    public setupCheckpoint(worldMap: WorldMap): void {
        const RedSpawns: PlayerSpawns = new PlayerSpawns(worldMap, COLOUR.RED);
        RedSpawns.spawnOne = new CheckPoint(Rect(-1792.0, 4736.0, -1472.0, 5056.0), worldMap);
        RedSpawns.spawnTwo = new CheckPoint(Rect(-1792.0, 4416.0, -1472.0, 4736.0), worldMap);
        let RedCheckpoint: CheckPoint = RedSpawns.spawnOne;
        RedCheckpoint = RedCheckpoint.next = new CheckPoint(Rect(-2464.00, 4704.00, -2400.00, 4768.00), worldMap);
        RedCheckpoint = RedCheckpoint.next = new CheckPoint(Rect(-3616.00, 4704.00, -3552.00, 4768.00), worldMap);
        RedCheckpoint = RedCheckpoint.next = new Teleporter(Rect(-4384.00, 4704.00, -4320.00, 4768.00), worldMap, 270.00);
        RedCheckpoint = RedCheckpoint.next = new CheckPoint(Rect(-4384.00, 3392.00, -4320.00, 3456.00), worldMap);
        worldMap.playerSpawns[COLOUR.RED] = RedSpawns;


        const BlueSpawns: PlayerSpawns = new PlayerSpawns(worldMap, COLOUR.BLUE);
        BlueSpawns.spawnOne = new CheckPoint(Rect(-320.0, 4768.0, 0.0, 5088.0), worldMap);
        BlueSpawns.spawnTwo = new CheckPoint(Rect(0.0, 4768.0, 320.0, 5088.0), worldMap);

        let BluePrimaryCheckpoint: CheckPoint = BlueSpawns.spawnOne;
        BluePrimaryCheckpoint = BluePrimaryCheckpoint.next = new CheckPoint(Rect(-64.00, 4032.00, 64.00, 4160.00), worldMap);
        BluePrimaryCheckpoint = BluePrimaryCheckpoint.next = new CheckPoint(Rect(-64.00, 2880.00, 64.00, 3008.00), worldMap);
        BluePrimaryCheckpoint = BluePrimaryCheckpoint.next = new CheckPoint(Rect(-64, 1920, 64, 2016), worldMap);

        let BlueSecondaryCheckpoint: CheckPoint = BlueSpawns.spawnTwo;
        BlueSecondaryCheckpoint = BlueSecondaryCheckpoint.next = new CheckPoint(Rect(-64.00, 4032.00, 64.00, 4160.00), worldMap);
        BlueSecondaryCheckpoint = BlueSecondaryCheckpoint.next = new CheckPoint(Rect(-64.00, 2880.00, 64.00, 3008.00), worldMap);
        BlueSecondaryCheckpoint = BlueSecondaryCheckpoint.next = new CheckPoint(Rect(-64, 1920, 64, 2016), worldMap);
        worldMap.playerSpawns[COLOUR.BLUE] = BlueSpawns;


        const TealSpawns: PlayerSpawns = new PlayerSpawns(worldMap, COLOUR.TEAL);
        TealSpawns.spawnOne = new CheckPoint(Rect(1472.0, 4768.0, 1792.0, 5088.0), worldMap);
        TealSpawns.spawnTwo = new CheckPoint(Rect(1472.0, 4448.0, 1792.0, 4768.0), worldMap);
        let TealCheckpoint: CheckPoint = TealSpawns.spawnOne;
        TealCheckpoint = TealCheckpoint.next = new CheckPoint(Rect(2400.00, 4704.00, 2464.00, 4768.00), worldMap);
        TealCheckpoint = TealCheckpoint.next = new CheckPoint(Rect(3552.00, 4704.00, 3616.00, 4768.00), worldMap);
        TealCheckpoint = TealCheckpoint.next = new Teleporter(Rect(4320.00, 4704.00, 4384.00, 4768.00), worldMap, 270.00);
        TealCheckpoint = TealCheckpoint.next = new CheckPoint(Rect(4320.00, 3392.00, 4384.00, 3456.00), worldMap);
        worldMap.playerSpawns[COLOUR.TEAL] = TealSpawns;


        const PurpleSpawns: PlayerSpawns = new PlayerSpawns(worldMap, COLOUR.PURPLE);
        PurpleSpawns.spawnOne = new CheckPoint(Rect(4032.0, 128.0, 4352.0, 448.0), worldMap);
        PurpleSpawns.spawnTwo = new CheckPoint(Rect(4352.0, 128.0, 4672.0, 448.0), worldMap);
        let PurpleCheckpoint: CheckPoint = PurpleSpawns.spawnOne;
        PurpleCheckpoint = PurpleCheckpoint.next = new CheckPoint(Rect(4320.00, -544.00, 4384.00, -480.00), worldMap);
        PurpleCheckpoint = PurpleCheckpoint.next = new CheckPoint(Rect(4320.00, -1696.00, 4384.00, -1632.00), worldMap);
        PurpleCheckpoint = PurpleCheckpoint.next = new Teleporter(Rect(4320.00, -2464.00, 4384.00, -2400.00), worldMap, 180.0);
        PurpleCheckpoint = PurpleCheckpoint.next = new CheckPoint(Rect(4672.00, -3488.00, 4736.00, -3424.00), worldMap);
        worldMap.playerSpawns[COLOUR.PURPLE] = PurpleSpawns;

        const YellowSpawns: PlayerSpawns = new PlayerSpawns(worldMap, COLOUR.YELLOW);
        YellowSpawns.spawnOne = new CheckPoint(Rect(-320.0, 1664.0, 0.0, 1984.0), worldMap);
        YellowSpawns.spawnTwo = new CheckPoint(Rect(0.0, 1664.0, 320.0, 1984.0), worldMap);

        let YellowPrimaryCheckpoint: CheckPoint = YellowSpawns.spawnOne;
        YellowPrimaryCheckpoint = YellowPrimaryCheckpoint.next = new CheckPoint(Rect(-32.00, 992.00, 32.00, 1056.00), worldMap);
        YellowPrimaryCheckpoint = YellowPrimaryCheckpoint.next = new CheckPoint(Rect(-32.00, -160.00, 32.00, -96.00), worldMap);
        YellowPrimaryCheckpoint = YellowPrimaryCheckpoint.next = new Teleporter(Rect(-32.00, -928.00, 32.00, -864.00), worldMap, 180.0);
        YellowPrimaryCheckpoint = YellowPrimaryCheckpoint.next = new CheckPoint(Rect(-2208.00, -2144.00, -2144.00, -2080.00), worldMap);

        let YellowSecondaryCheckpoint: CheckPoint = YellowSpawns.spawnTwo;
        YellowSecondaryCheckpoint = YellowSecondaryCheckpoint.next = new CheckPoint(Rect(-32.00, 992.00, 32.00, 1056.00), worldMap);
        YellowSecondaryCheckpoint = YellowSecondaryCheckpoint.next = new CheckPoint(Rect(-32.00, -160.00, 32.00, -96.00), worldMap);
        YellowSecondaryCheckpoint = YellowSecondaryCheckpoint.next = new Teleporter(Rect(-32.00, -928.00, 32.00, -864.00), worldMap, 180.0);
        YellowSecondaryCheckpoint = YellowSecondaryCheckpoint.next = new CheckPoint(Rect(2144.00, -2144.00, 2208.00, -2080.00), worldMap);

        worldMap.playerSpawns[COLOUR.YELLOW] = YellowSpawns;


        const OrangeSpawns: PlayerSpawns = new PlayerSpawns(worldMap, COLOUR.ORANGE);
        OrangeSpawns.spawnOne = new CheckPoint(Rect(-4672.0, 128.0, -4352.0, 448.0), worldMap);
        OrangeSpawns.spawnTwo = new CheckPoint(Rect(-4352.0, 128.0, -4032.0, 448.0), worldMap);
        let OrangeCheckpoint: CheckPoint = OrangeSpawns.spawnOne;
        OrangeCheckpoint = OrangeCheckpoint.next = new CheckPoint(Rect(-4384.00, -544.00, -4320.00, -480.00), worldMap);
        OrangeCheckpoint = OrangeCheckpoint.next = new CheckPoint(Rect(-4384.00, -1696.00, -4320.00, -1632.00), worldMap);
        OrangeCheckpoint = OrangeCheckpoint.next = new Teleporter(Rect(-4384.00, -2464.00, -4320.00, -2400.00), worldMap, 0.0);
        OrangeCheckpoint = OrangeCheckpoint.next = new CheckPoint(Rect(-4768.00, -3488.00, -4704.00, -3424.00), worldMap);
        worldMap.playerSpawns[COLOUR.ORANGE] = OrangeSpawns;


        const GreenSpawns: PlayerSpawns = new PlayerSpawns(worldMap, COLOUR.GREEN);
        GreenSpawns.spawnOne = new CheckPoint(Rect(-4800.0, -3456.0, -4480.0, -3136.0), worldMap);
        GreenSpawns.spawnTwo = new CheckPoint(Rect(-4800.0, -3776.0, -4480.0, -3456.0), worldMap);
        let GreenCheckpoint: CheckPoint = GreenSpawns.spawnOne;
        GreenCheckpoint = GreenCheckpoint.next = new CheckPoint(Rect(-3872.00, -3488.00, -3808.00, -3424.00), worldMap);
        GreenCheckpoint = GreenCheckpoint.next = new CheckPoint(Rect(-2720.00, -3488.00, -2656.00, -3424.00), worldMap);
        GreenCheckpoint = GreenCheckpoint.next = new Teleporter(Rect(-1952.00, -3488.00, -1888.00, -3424.00), worldMap, 270);
        worldMap.playerSpawns[COLOUR.GREEN] = GreenSpawns;


        const PinkSpawns: PlayerSpawns = new PlayerSpawns(worldMap, COLOUR.PINK);
        PinkSpawns.spawnOne = new CheckPoint(Rect(4480.0, -3456.0, 4800.0, -3136.0), worldMap);
        PinkSpawns.spawnTwo = new CheckPoint(Rect(4480.0, -3776.0, 4800.0, -3456.0), worldMap);
        let PinkCheckpoint: CheckPoint = PinkSpawns.spawnOne;
        PinkCheckpoint = PinkCheckpoint.next = new CheckPoint(Rect(3808.00, -3488.00, 3872.00, -3424.00), worldMap);
        PinkCheckpoint = PinkCheckpoint.next = new CheckPoint(Rect(2656.00, -3488.00, 2720.00, -3424.00), worldMap);
        PinkCheckpoint = PinkCheckpoint.next = new Teleporter(Rect(1888.00, -3488.00, 1952.00, -3424.00), worldMap, 270);
        worldMap.playerSpawns[COLOUR.PINK] = PinkSpawns;


        const GreysSpawns: PlayerSpawns = new PlayerSpawns(worldMap, COLOUR.GRAY);
        GreysSpawns.spawnOne = new CheckPoint(Rect(-160.0, -2464.0, 160.0, -2144.0), worldMap);
        let GreysCheckpoint: CheckPoint = GreysSpawns.spawnOne;
        GreysCheckpoint = GreysCheckpoint.next = new CheckPoint(Rect(-32.00, -3104.00, 32.00, -3040.00), worldMap);
        GreysCheckpoint = GreysCheckpoint.next = new CheckPoint(Rect(-32.00, -4256.00, 32.00, -4192.00), worldMap);
        GreysCheckpoint.next = worldMap.ship !== undefined ? worldMap.ship : undefined;
        worldMap.playerSpawns[COLOUR.GRAY] = GreysSpawns;


        // brown
        const BrownSpawns: PlayerSpawns = new PlayerSpawns(worldMap, COLOUR.BROWN);
        BrownSpawns.spawnOne = new CheckPoint(Rect(-4672.0, 3200.0, -4352.0, 3520.0), worldMap);
        BrownSpawns.spawnTwo = new CheckPoint(Rect(-4352.0, 3200.0, -4032.0, 3520.0), worldMap);

        let BrownCheckpoint: CheckPoint = BrownSpawns.spawnOne;
        BrownCheckpoint = BrownCheckpoint.next = new CheckPoint(Rect(-4384.00, 2528.00, -4320.00, 2592.00), worldMap);
        BrownCheckpoint = BrownCheckpoint.next = new CheckPoint(Rect(-4384.00, 1376.00, -4320.00, 1440.00), worldMap);
        BrownCheckpoint = BrownCheckpoint.next = new CheckPoint(Rect(-4416.00, 384.00, -4288.00, 480.00), worldMap);


        worldMap.playerSpawns[COLOUR.BROWN] = BrownSpawns;


        const MaroonsSpawns: PlayerSpawns = new PlayerSpawns(worldMap, COLOUR.MAROON);
        MaroonsSpawns.spawnOne = new CheckPoint(Rect(4032.0, 3200.0, 4352.0, 3520.0), worldMap);
        MaroonsSpawns.spawnTwo = new CheckPoint(Rect(4352.0, 3200.0, 4672.0, 3520.0), worldMap);
        let MaroonsCheckpoint: CheckPoint = MaroonsSpawns.spawnOne;
        MaroonsCheckpoint = MaroonsCheckpoint.next = new CheckPoint(Rect(4320.00, 2528.00, 4384.00, 2592.00), worldMap);
        MaroonsCheckpoint = MaroonsCheckpoint.next = new CheckPoint(Rect(4320.00, 1376.00, 4384.00, 1440.00), worldMap);
        MaroonsCheckpoint = MaroonsCheckpoint.next = new CheckPoint(Rect(4288.00, 384.00, 4416.00, 480.00), worldMap);
        worldMap.playerSpawns[COLOUR.MAROON] = MaroonsSpawns;


        const LightBlueSpawns: PlayerSpawns = new PlayerSpawns(worldMap, COLOUR.LIGHT_BLUE);
        LightBlueSpawns.spawnOne = new CheckPoint(Rect(-2496.0, -2240.0, -2176.0, -1920.0), worldMap);
        LightBlueSpawns.spawnTwo = new CheckPoint(Rect(-2176.0, -2240.0, -1856.0, -1920.0), worldMap);
        let LightBlueCheckpoint: CheckPoint = LightBlueSpawns.spawnOne;
        LightBlueCheckpoint = LightBlueCheckpoint.next = new CheckPoint(Rect(-2208.00, -1312.00, -2144.00, -1248.00), worldMap);
        LightBlueCheckpoint = LightBlueCheckpoint.next = new CheckPoint(Rect(-2208.00, -160.00, -2144.00, -96.00), worldMap);
        LightBlueCheckpoint = LightBlueCheckpoint.next = new Teleporter(Rect(-2208.00, 608.00, -2144.00, 672.00), worldMap, 270);
        // @ts-ignore
        // LightBlueCheckpoint = LightBlueCheckpoint.next = OrangeSpawns.spawnOne;
        worldMap.playerSpawns[COLOUR.LIGHT_BLUE] = LightBlueSpawns;

        const DarkGreenSpawns: PlayerSpawns = new PlayerSpawns(worldMap, COLOUR.DARK_GREEN);
        DarkGreenSpawns.spawnOne = new CheckPoint(Rect(1856.0, -2240.0, 2176.0, -1920.0), worldMap);
        DarkGreenSpawns.spawnTwo = new CheckPoint(Rect(2176.0, -2240.0, 2496.0, -1920.0), worldMap);
        let DarkGreenCheckpoint: CheckPoint = DarkGreenSpawns.spawnOne;
        DarkGreenCheckpoint = DarkGreenCheckpoint.next = new CheckPoint(Rect(2144.00, -1312.00, 2208.00, -1248.00), worldMap);
        DarkGreenCheckpoint = DarkGreenCheckpoint.next = new CheckPoint(Rect(2144.00, -160.00, 2208.00, -96.00), worldMap);
        DarkGreenCheckpoint = DarkGreenCheckpoint.next = new Teleporter(Rect(2144.00, 608.00, 2208.00, 672.00), worldMap, 270);
        // @ts-ignore
        // DarkGreenCheckpoint = DarkGreenCheckpoint.next = MaroonsCheckpoint;
        worldMap.playerSpawns[COLOUR.DARK_GREEN] = DarkGreenSpawns;


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
}
