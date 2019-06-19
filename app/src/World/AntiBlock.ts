import { Trigger } from '../JassOverrides/Trigger';
import * as settings from './GlobalSettings';
import { Log } from '../lib/Serilog/Serilog';
import { Attacker } from './Entity/Players/Attacker';
import { WorldMap } from './WorldMap';
import { AntiBlockData } from './AntiBlockData';


export class AntiBlock {

    eventTrigger: Trigger;

    antiBlockMap: Map<number, AntiBlockData>;
    worldMap: WorldMap;
    private testRegions: rect[] = [];
    antiBlockPlayer: Attacker | undefined;

    antiBlockCheckGroup=CreateGroup();
    antiJuggle = false;
    towerCounter = 0;
    touchedLastTower = false;
    playerLimitCircleOne = 0;
    playerLimitCircleTwo = 0;
    playerLimitCircleThree = 0;
    playerLimitCircleFour = 0;
    playerLimitCircleFive = 0;
    playerLimitCircleSix = 0;
    playerLimitCircleSeven = 0;
    playerLimitLeft = 0;
    playerLimitRight = 0;
    playerLimitOne = 0;
    playerLimitTwo = 0;
    playerLimitThree = 0;
    playerLimitFour = 0;
    playerLimitFive = 0;
    playerLimitSix = 0;
    playerLimitCheckpointOne = 0;
    playerLimitCheckpointTwo = 0;
    playerLimitCheckpointThree = 0;
    playerLimitCheckpointFour = 0;
    playerLimitCheckpointFive = 0;
    playerLimitCheckpointSix = 0;
    playerLimitCheckpointSeven = 0;
    playerLimitCheckpointEight = 0;


    
    constructor(worldMap: WorldMap) {
        this.worldMap = worldMap;
        this.SetupRegion();
        this.antiBlockMap = new Map<number, AntiBlockData>();
        this.eventTrigger = new Trigger();
        this.eventTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_CONSTRUCT_START);
        this.eventTrigger.AddAction(() => this.AntiBlockAction());

    }

    //TODO: PLEASE, FOR THE LOVE OF GOD NUKE THIS!
    private SetupRegion() {

        Log.Debug("Starting AntiBlock");
        // TEST
        // RED
        this.testRegions.push(Rect(-4160.0, 5440.0, -1856.0, 5504.0)); // Long top
        this.testRegions.push(Rect(-1856.0, 5024.0, -1792.0, 5440.0)); // Spawn top
        this.testRegions.push(Rect(-4160.0, 3968.0, -1856.0, 4032.0)); // Long bottom
        this.testRegions.push(Rect(-1856.0, 4032.0, -1792.0, 4416.0)); // Spawn bottom
        this.testRegions.push(Rect(-4224.0, 3968.0, -4160.0, 4672.0)); // Left bottom
        this.testRegions.push(Rect(-4224.0, 4768.0, -4160.0, 5440.0)); // Left top

        // Circle 1
        this.testRegions.push(Rect(-3552.0, 4672.0, -2464.0, 4800.0)); // Left
        this.testRegions.push(Rect(-2496.0, 4768.0, -2368.0, 5440.0)); // Up
        this.testRegions.push(Rect(-2400.0, 4672.0, -1856.0, 4800.0)); // Right
        this.testRegions.push(Rect(-2496.0, 4032.0, -2368.0, 4704.0)); // Down

        // Circle 2
        this.testRegions.push(Rect(-3648.0, 4032.0, -3520.0, 4704.0)); // Down
        this.testRegions.push(Rect(-4192.0, 4672.0, -3616.0, 4800.0)); // Left
        this.testRegions.push(Rect(-3648.0, 4768.0, -3520.0, 5440.0)); // Up

        // Checkpoint 1
        this.testRegions.push(Rect(-2496.0, 4736.0, -2432.0, 4800.0)); // UL
        this.testRegions.push(Rect(-2432.0, 4736.0, -2368.0, 4800.0)); // UR
        this.testRegions.push(Rect(-2432.0, 4672.0, -2368.0, 4736.0)); // LR
        this.testRegions.push(Rect(-2496.0, 4672.0, -2432.0, 4736.0)); // LL

        // Checkpoint 2
        this.testRegions.push(Rect(-3648.0, 4736.0, -3584.0, 4800.0)); // UL
        this.testRegions.push(Rect(-3584.0, 4736.0, -3520.0, 4800.0)); // UR
        this.testRegions.push(Rect(-3584.0, 4672.0, -3520.0, 4736.0)); // LR
        this.testRegions.push(Rect(-3648.0, 4672.0, -3584.0, 4736.0)); // LL

        // BLUE
        this.testRegions.push(Rect(-768.0, 2304.0, -704.0, 4672.0)); // Long left
        this.testRegions.push(Rect(-768.0, 4672.0, -320.0, 4736.0)); // Spawn top left
        this.testRegions.push(Rect(704.0, 2304.0, 768.0, 4672.0)); // Long right
        this.testRegions.push(Rect(320.0, 4672.0, 768.0, 4736.0)); // Spawn top right
        this.testRegions.push(Rect(160.0, 2304.0, 704.0, 2368.0)); // Exit right
        this.testRegions.push(Rect(-704.0, 2304.0, -160.0, 2368.0)); // Exit left

        // Circle 1
        this.testRegions.push(Rect(-64.0, 2976.0, 64.0, 4064.0)); // Down
        this.testRegions.push(Rect(-704.0, 4032.0, -32.0, 4160.0)); // Left
        this.testRegions.push(Rect(-64.0, 4128.0, 64.0, 4704.0)); // Up
        this.testRegions.push(Rect(32.0, 4032.0, 704.0, 4160.0)); // Right

        // Circle 2
        this.testRegions.push(Rect(32.0, 2880.0, 704.0, 3008.0)); // Right
        this.testRegions.push(Rect(-64.0, 2336.0, 64.0, 2912.0)); // Down
        this.testRegions.push(Rect(-704.0, 2880.0, -32.0, 3008.0)); // Up

        // Checkpoint 1
        this.testRegions.push(Rect(-64.0, 4096.0, 0.0, 4160.0)); // UL
        this.testRegions.push(Rect(0.0, 4096.0, 64.0, 4160.0)); // UR
        this.testRegions.push(Rect(0.0, 4032.0, 64.0, 4096.0)); // LR
        this.testRegions.push(Rect(-64.0, 4032.0, 0.0, 4096.0)); // LL

        // Checkpoint 2
        this.testRegions.push(Rect(-64.0, 2944.0, 0.0, 3008.0)); // UL
        this.testRegions.push(Rect(0.0, 2944.0, 64.0, 3008.0)); // UR
        this.testRegions.push(Rect(0.0, 2880.0, 64.0, 2944.0)); // LR
        this.testRegions.push(Rect(-64.0, 2880.0, 0.0, 2944.0)); // LL

        // TEAL
        this.testRegions.push(Rect(1856.0, 5440.0, 4160.0, 5504.0)); // Long top
        this.testRegions.push(Rect(4160.0, 4800.0, 4224.0, 5504.0)); // Spawn top
        this.testRegions.push(Rect(1856.0, 3968.0, 4160.0, 4032.0)); // Long bottom
        this.testRegions.push(Rect(4160.0, 3968.0, 4224.0, 4704.0)); // Spawn bottom
        this.testRegions.push(Rect(1792.0, 3968.0, 1856.0, 4384.0)); // Left bottom
        this.testRegions.push(Rect(1792.0, 5056.0, 1856.0, 5504.0)); // Left top

        // Circle 1
        this.testRegions.push(Rect(2464.0, 4672.0, 3552.0, 4800.0)); // Right
        this.testRegions.push(Rect(2368.0, 4032.0, 2496.0, 4704.0)); // Down
        this.testRegions.push(Rect(1824.0, 4672.0, 2400.0, 4800.0)); // Left
        this.testRegions.push(Rect(2368.0, 4768.0, 2496.0, 5440.0)); // Up

        // Circle 2
        this.testRegions.push(Rect(3520.0, 4768.0, 3648.0, 5440.0)); // Up
        this.testRegions.push(Rect(3616.0, 4672.0, 4160.0, 4800.0)); // Right
        this.testRegions.push(Rect(3520.0, 4032.0, 3648.0, 4704.0)); // Down

        // Checkpoint 1
        this.testRegions.push(Rect(2368.0, 4736.0, 2432.0, 4800.0)); // UL
        this.testRegions.push(Rect(2432.0, 4736.0, 2496.0, 4800.0)); // UR
        this.testRegions.push(Rect(2432.0, 4672.0, 2496.0, 4736.0)); // LR
        this.testRegions.push(Rect(2368.0, 4672.0, 2432.0, 4736.0)); // LL

        // Checkpoint 2
        this.testRegions.push(Rect(3520.0, 4736.0, 3584.0, 4800.0)); // UL
        this.testRegions.push(Rect(3584.0, 4736.0, 3648.0, 4800.0)); // UR
        this.testRegions.push(Rect(3584.0, 4672.0, 3648.0, 4736.0)); // LR
        this.testRegions.push(Rect(3520.0, 4672.0, 3584.0, 4736.0)); // LL

        // Purple
        this.testRegions.push(Rect(3584.0, -2304.0, 3648.0, 64.0)); // Long left
        this.testRegions.push(Rect(3585.0, 64.0, 4032.0, 128.0)); // Spawn top left
        this.testRegions.push(Rect(5056.0, -2304.0, 5156.0, 64.0)); // Long right
        this.testRegions.push(Rect(4672.0, 64.0, 5120.0, 128.0)); // Spawn top right
        this.testRegions.push(Rect(4384.0, -2304.0, 5056.0, -2240.0)); // Exit right
        this.testRegions.push(Rect(3648.0, -2304.0, 4320.0, -2240.0)); // Exit left

        // Circle 1
        this.testRegions.push(Rect(4288.0, -1632.0, 4416.0, -544.0)); // Down
        this.testRegions.push(Rect(3648.0, -576.0, 4320.0, -448.0)); // Left
        this.testRegions.push(Rect(4288.0, -480.0, 4416.0, 96.0)); // Up
        this.testRegions.push(Rect(4384.0, -576.0, 5056.0, -448.0)); // Right

        // Circle 2
        this.testRegions.push(Rect(4384.0, -1728.0, 5056.0, -1600.0)); // Right
        this.testRegions.push(Rect(4288.0, -2272.0, 4416.0, -1696.0)); // Down
        this.testRegions.push(Rect(3648.0, -1728.0, 4320.0, -1600.0)); // Up

        // Checkpoint 1
        this.testRegions.push(Rect(4288.0, -512.0, 4352.0, -448.0)); // UL
        this.testRegions.push(Rect(4352.0, -512.0, 4416.0, -448.0)); // UR
        this.testRegions.push(Rect(4352.0, -576.0, 4416.0, -512.0)); // LR
        this.testRegions.push(Rect(4288.0, -576.0, 4352.0, -512.0)); // LL

        // Checkpoint 2
        this.testRegions.push(Rect(4288.0, -1664.0, 4352.0, -1600.0)); // UL
        this.testRegions.push(Rect(4352.0, -1664.0, 4416.0, -1600.0)); // UR
        this.testRegions.push(Rect(4352.0, -1728.0, 4416.0, -1664.0)); // LR
        this.testRegions.push(Rect(4288.0, -1728.0, 4352.0, -1664.0)); // LL

        // Yellow
        this.testRegions.push(Rect(-768.0, -768.0, -704.0, 1600.0)); // Long left
        this.testRegions.push(Rect(-768.0, 1600.0, -320.0, 1664.0)); // Spawn top left
        this.testRegions.push(Rect(704.0, -768.0, 768.0, 1600.0)); // Long right
        this.testRegions.push(Rect(320.0, 1600.0, 768.0, 1664.0)); // Spawn top right
        this.testRegions.push(Rect(32.0, -768.0, 736.0, -704.0)); // Exit right
        this.testRegions.push(Rect(-704.0, -768.0, -32.0, -704.0)); // Exit left

        // Circle 1
        this.testRegions.push(Rect(-64.0, -96.0, 64.0, 992.0)); // Down
        this.testRegions.push(Rect(-704.0, 960.0, -32.0, 1088.0)); // Left
        this.testRegions.push(Rect(-64.0, 1056.0, 64.0, 1632.0)); // Up
        this.testRegions.push(Rect(32.0, 960.0, 704.0, 1088.0)); // Right

        // Circle 2
        this.testRegions.push(Rect(32.0, -192.0, 704.0, -64.0)); // Right
        this.testRegions.push(Rect(-64.0, -736.0, 64.0, -160.0)); // Down
        this.testRegions.push(Rect(-704.0, -192.0, -32.0, -64.0)); // Left

        // Checkpoint 1
        this.testRegions.push(Rect(-64.0, 1024.0, 0.0, 1088.0)); // Upper Left
        this.testRegions.push(Rect(0.0, 1024.0, 64.0, 1088.0)); // Upper Right
        this.testRegions.push(Rect(0.0, 960.0, 64.0, 1024.0)); // Lower Right
        this.testRegions.push(Rect(-64.0, 960.0, 0.0, 1024.0)); // Lower Left

        // Checkpoint 2
        this.testRegions.push(Rect(-64.0, -128.0, 0.0, -64.0)); // Upper Left
        this.testRegions.push(Rect(0.0, -128.0, 64.0, -64.0)); // Upper Right
        this.testRegions.push(Rect(0.0, -192.0, 64.0, -128.0)); // Lower Right
        this.testRegions.push(Rect(-64.0, -192.0, 0.0, -128.0)); // Lower Left

        // Orange
        this.testRegions.push(Rect(-5120.0, -2304.0, -5056.0, 64.0)); // Long left
        this.testRegions.push(Rect(-5120.0, 64.0, -4672.0, 128.0)); // Spawn top left
        this.testRegions.push(Rect(-3648.0, -2304.0, -3584.0, 64.0)); // Long right
        this.testRegions.push(Rect(-4032.0, 64.0, -3584.0, 128.0)); // Spawn top right
        this.testRegions.push(Rect(-4320.0, -2304.0, -3616.0, -2240.0)); // Exit right
        this.testRegions.push(Rect(-5056.0, -2304.0, -4416.0, -2240.0)); // Exit left

        // Circle 1
        this.testRegions.push(Rect(-4416.0, -1632.0, -4288.0, -544.0)); // Down
        this.testRegions.push(Rect(-5056.0, -576.0, -4384.0, -448.0)); // Left
        this.testRegions.push(Rect(-4416.0, -480.0, -4288.0, 96.0)); // Up
        this.testRegions.push(Rect(-4320.0, -576.0, -3648.0, -448.0)); // Right

        // Circle 2
        this.testRegions.push(Rect(-4320.0, -1728.0, -3648.0, -1600.0)); // Right
        this.testRegions.push(Rect(-4416.0, -2272.0, -4288.0, -1696.0)); // Down
        this.testRegions.push(Rect(-5056.0, -1728.0, -4384.0, -1600.0)); // Left

        // Checkpoint 1
        this.testRegions.push(Rect(-4416.0, -512.0, -4352.0, -448.0)); // Upper Left
        this.testRegions.push(Rect(-4352.0, -512.0, -4288.0, -448.0)); // Upper Right
        this.testRegions.push(Rect(-4352.0, -576.0, -4288.0, -512.0)); // Lower Right
        this.testRegions.push(Rect(-4416.0, -576.0, -4352.0, -512.0)); // Lower Left

        // Checkpoint 2
        this.testRegions.push(Rect(-4416.0, -1664.0, -4352.0, -1600.0)); // Upper Left
        this.testRegions.push(Rect(-4352.0, -1664.0, -4288.0, -1600.0)); // Upper Right
        this.testRegions.push(Rect(-4352.0, -1728.0, -4288.0, -1664.0)); // Lower Right
        this.testRegions.push(Rect(-4416.0, -1728.0, -4352.0, -1664.0)); // Lower Left

        // Green
        this.testRegions.push(Rect(-4416.0, -4224.0, -2112.0, -4160.0)); // Long bottom
        this.testRegions.push(Rect(-4480.0, -4224.0, -4416.0, -3808.0)); // Spawn bottom
        this.testRegions.push(Rect(-4416.0, -2752.0, -2048.0, -2688.0)); // Long top
        this.testRegions.push(Rect(-4480.0, -3136.0, -4416.0, -2688.0)); // Spawn top
        this.testRegions.push(Rect(-2112.0, -3424.0, -2048.0, -2752.0)); // Exit top
        this.testRegions.push(Rect(-2112.0, -4224.0, -2048.0, -3488.0)); // Exit bottom

        // Circle 1
        this.testRegions.push(Rect(-3808.0, -3520.0, -2720.0, -3392.0)); // Right
        this.testRegions.push(Rect(-3904.0, -4160.0, -3776.0, -3488.0)); // Down
        this.testRegions.push(Rect(-4416.0, -3520.0, -3872.0, -3392.0)); // Left
        this.testRegions.push(Rect(-3904.0, -3424.0, -3776.0, -2752.0)); // Up

        // Circle 2
        this.testRegions.push(Rect(-2752.0, -3424.0, -2624.0, -2752.0)); // Up
        this.testRegions.push(Rect(-2656.0, -3520.0, -2112.0, -3392.0)); // Right
        this.testRegions.push(Rect(-2752.0, -4160.0, -2624.0, -3488.0)); // Down

        // Checkpoint 1
        this.testRegions.push(Rect(-3904.0, -3456.0, -3840.0, -3392.0)); // Upper Left
        this.testRegions.push(Rect(-3840.0, -3456.0, -3776.0, -3392.0)); // Upper Right
        this.testRegions.push(Rect(-3840.0, -3520.0, -3776.0, -3456.0)); // Lower Right
        this.testRegions.push(Rect(-3904.0, -3520.0, -3840.0, -3456.0)); // Lower Left

        // Checkpoint 2
        this.testRegions.push(Rect(-2752.0, -3456.0, -2688.0, -3392.0)); // Upper Left
        this.testRegions.push(Rect(-2688.0, -3456.0, -2624.0, -3392.0)); // Upper Right
        this.testRegions.push(Rect(-2688.0, -3520.0, -2624.0, -3456.0)); // Lower Right
        this.testRegions.push(Rect(-2752.0, -3520.0, -2688.0, -3456.0)); // Lower Left

        // Pink
        this.testRegions.push(Rect(2112.0, -4224.0, 4416.0, -4160.0)); // Long bottom
        this.testRegions.push(Rect(4416.0, -4224.0, 4480.0, -3776.0)); // Spawn bottom
        this.testRegions.push(Rect(2112.0, -2752.0, 4416.0, -2688.0)); // Long top
        this.testRegions.push(Rect(4416.0, -3168.0, 4480.0, -2688.0)); // Spawn top
        this.testRegions.push(Rect(2048.0, -3424.0, 2112.0, -2688.0)); // Exit top
        this.testRegions.push(Rect(2048.0, -4224.0, 2112.0, -3520.0)); // Exit bottom

        // Circle 1
        this.testRegions.push(Rect(2720.0, -3520.0, 3808.0, -3392.0)); // Left
        this.testRegions.push(Rect(3776.0, -3424.0, 3904.0, -2752.0)); // Up
        this.testRegions.push(Rect(3872.0, -3520.0, 4416.0, -3392.0)); // Right
        this.testRegions.push(Rect(3776.0, -4160.0, 3904.0, -3488.0)); // Down

        // Circle 2
        this.testRegions.push(Rect(2624.0, -4160.0, 2752.0, -3488.0)); // Down
        this.testRegions.push(Rect(2080.0, -3520.0, 2656.0, -3392.0)); // Left
        this.testRegions.push(Rect(2624.0, -3424.0, 2752.0, -2752.0)); // Up

        // Checkpoint 1
        this.testRegions.push(Rect(3776.0, -3456.0, 3840.0, -3392.0)); // Upper Left
        this.testRegions.push(Rect(3840.0, -3456.0, 3904.0, -3392.0)); // Upper Right
        this.testRegions.push(Rect(3840.0, -3520.0, 3904.0, -3456.0)); // Lower Right
        this.testRegions.push(Rect(3776.0, -3520.0, 3840.0, -3456.0)); // Lower Left

        // Checkpoint 2
        this.testRegions.push(Rect(2624.0, -3520.0, 2688.0, -3392.0)); // Upper Left
        this.testRegions.push(Rect(2688.0, -3456.0, 2752.0, -3392.0)); // Upper Right
        this.testRegions.push(Rect(2688.0, -3520.0, 2752.0, -3456.0)); // Lower Right
        this.testRegions.push(Rect(2624.0, -3520.0, 2688.0, -3456.0)); // Lower Left

        // Grey
        this.testRegions.push(Rect(-768.0, -4864.0, -704.0, -2496.0)); // Long left
        this.testRegions.push(Rect(-768.0, -2496.0, -192.0, -2432.0)); // Spawn top left
        this.testRegions.push(Rect(704.0, -4864.0, 768.0, -2496.0)); // Long right
        this.testRegions.push(Rect(192.0, -2496.0, 768.0, -2432.0)); // Spawn top right
        this.testRegions.push(Rect(160.0, -4864.0, 740.0, -4800.0)); // Exit right
        this.testRegions.push(Rect(-704.0, -4864.0, -160.0, -4800.0)); // Exit left

        // Circle 1
        this.testRegions.push(Rect(-64.0, -4192.0, 64.0, -3104.0)); // Down
        this.testRegions.push(Rect(-704.0, -3136.0, -32.0, -3008.0)); // Left
        this.testRegions.push(Rect(-64.0, -3040.0, 64.0, -2464.0)); // Up
        this.testRegions.push(Rect(32.0, -3136.0, 704.0, -3008.0)); // Right

        // Circle 2
        this.testRegions.push(Rect(32.0, -4288.0, 704.0, -4160.0)); // Right
        this.testRegions.push(Rect(-64.0, -4832.0, 64.0, -4256.0)); // Down
        this.testRegions.push(Rect(-704.0, -4288.0, -32.0, -4160.0)); // Left

        // Checkpoint 1
        this.testRegions.push(Rect(-64.0, -3072.0, 0.0, -3008.0)); // Upper Left
        this.testRegions.push(Rect(0.0, -3072.0, 64.0, -3008.0)); // Upper Right
        this.testRegions.push(Rect(0.0, -3136.0, 64.0, -3072.0)); // Lower Right
        this.testRegions.push(Rect(-64.0, -3136.0, 0.0, -3072.0)); // Lower Left

        // Checkpoint 2
        this.testRegions.push(Rect(-64.0, -4224.0, 0.0, -4160.0)); // Upper Left
        this.testRegions.push(Rect(0.0, -4224.0, 64.0, -4160.0)); // Upper Right
        this.testRegions.push(Rect(0.0, -4288.0, 64.0, -4224.0)); // Lower Right
        this.testRegions.push(Rect(-64.0, -4288.0, 0.0, -4224.0)); // Lower Left

        // Lightblue
        this.testRegions.push(Rect(-1472.0, -1920.0, -1408.0, 448.0)); // Long left
        this.testRegions.push(Rect(-1856.0, -1920.0, -1472.0, -1856.0)); // Spawn right
        this.testRegions.push(Rect(-2944.0, -1920.0, -2880.0, 448.0)); // Long left
        this.testRegions.push(Rect(-2880.0, -1920.0, -2496.0, -1856.0)); // Spawn right
        this.testRegions.push(Rect(-2944.0, 448.0, -2240.0, 512.0)); // Exit left
        this.testRegions.push(Rect(-2112.0, 448.0, -1408.0, 512.0)); // Exit right

        // Circle 1
        this.testRegions.push(Rect(-2240.0, -1248.0, -2112.0, -160.0)); // Up
        this.testRegions.push(Rect(-2144.0, -1344.0, -1472.0, -1216.0)); // Right
        this.testRegions.push(Rect(-2240.0, -1888.0, -2112.0, -1312.0)); // Down
        this.testRegions.push(Rect(-2880.0, -1344.0, -2208.0, -1216.0)); // Left

        // Circle 2
        this.testRegions.push(Rect(-2880.0, -192.0, -2208.0, -64.0)); // Left
        this.testRegions.push(Rect(-2240.0, -96.0, -2112.0, 480.0)); // Up
        this.testRegions.push(Rect(-2144.0, -192.0, -1472.0, -64.0)); // Right

        // Checkpoint 1
        this.testRegions.push(Rect(-2240.0, -1280.0, -2176.0, -1344.0)); // Upper Left
        this.testRegions.push(Rect(-2176.0, -1280.0, -2112.0, -1216.0)); // Upper Right
        this.testRegions.push(Rect(-2176.0, -1344.0, -2112.0, -1280.0)); // Lower Right
        this.testRegions.push(Rect(-2240.0, -1344.0, -2176.0, -1280.0)); // Lower Left

        // Checkpoint 2
        this.testRegions.push(Rect(-2240.0, -128.0, -2176.0, -64.0)); // Upper Left
        this.testRegions.push(Rect(-2176.0, -128.0, -2112.0, -64.0)); // Upper Right
        this.testRegions.push(Rect(-2176.0, -192.0, -2112.0, -128.0)); // Lower Right
        this.testRegions.push(Rect(-2240.0, -192.0, -2176.0, -128.0)); // Lower Left

        // Darkgreen
        this.testRegions.push(Rect(2880.0, -1920.0, 2944.0, 448.0)); // Long left
        this.testRegions.push(Rect(2496.0, -1920.0, 2880.0, -1856.0)); // Spawn right
        this.testRegions.push(Rect(1408.0, -1920.0, 1472.0, 448.0)); // Long right
        this.testRegions.push(Rect(1472.0, -1920.0, 1856.0, -1856.0)); // Spawn left
        this.testRegions.push(Rect(1408.0, 448.0, 2112.0, 512.0)); // Exit left
        this.testRegions.push(Rect(2240.0, 448.0, 2944.0, 512.0)); // Exit right

        // Circle 1
        this.testRegions.push(Rect(2112.0, -1248.0, 2240.0, -160.0)); // Up
        this.testRegions.push(Rect(2208.0, -1344.0, 2880.0, -1216.0)); // Right
        this.testRegions.push(Rect(2112.0, -1888.0, 2240.0, -1312.0)); // Down
        this.testRegions.push(Rect(1472.0, -1344.0, 2144.0, -1216.0)); // Left

        // Circle 2
        this.testRegions.push(Rect(1472.0, -192.0, 2144.0, -64.0)); // Left
        this.testRegions.push(Rect(2112.0, -96.0, 2240.0, 480.0)); // Up
        this.testRegions.push(Rect(2208.0, -192.0, 2880.0, -64.0)); // Right

        // Checkpoint 1
        this.testRegions.push(Rect(2112.0, -1280.0, 2176.0, -1344.0)); // Upper Left
        this.testRegions.push(Rect(2176.0, -1280.0, 2240.0, -1216.0)); // Upper Right
        this.testRegions.push(Rect(2176.0, -1344.0, 2240.0, -1280.0)); // Lower Right
        this.testRegions.push(Rect(2112.0, -1344.0, 2176.0, -1280.0)); // Lower Left

        // Checkpoint 2
        this.testRegions.push(Rect(2112.0, -128.0, 2176.0, -64.0)); // Upper Left
        this.testRegions.push(Rect(2176.0, -128.0, 2240.0, -64.0)); // Upper Right
        this.testRegions.push(Rect(2176.0, -192.0, 2240.0, -128.0)); // Lower Right
        this.testRegions.push(Rect(2112.0, -192.0, 2176.0, -128.0)); // Lower Left

        // Brown
        this.testRegions.push(Rect(-5120.0, 768.0, -5056.0, 3136.0)); // Long left
        this.testRegions.push(Rect(-5120.0, 3136.0, -4672.0, 3200.0)); // Spawn top left
        this.testRegions.push(Rect(-3648.0, 768.0, -3584.0, 3136.0)); // Long right
        this.testRegions.push(Rect(-4032.0, 3136.0, -3584.0, 3200.0)); // Spawn top right
        this.testRegions.push(Rect(-4192.0, 768.0, -3612.0, 832.0)); // Exit right
        this.testRegions.push(Rect(-5056.0, 768.0, -4512.0, 832.0)); // Exit left

        // Circle 1
        this.testRegions.push(Rect(-4416.0, 1440.0, -4288.0, 2528.0)); // Down
        this.testRegions.push(Rect(-5056.0, 2496.0, -4384.0, 2624.0)); // Left
        this.testRegions.push(Rect(-4416.0, 2592.0, -4288.0, 3168.0)); // Up
        this.testRegions.push(Rect(-4320.0, 2496.0, -3648.0, 2624.0)); // Right

        // Circle 2
        this.testRegions.push(Rect(-4320.0, 1344.0, -3648.0, 1472.0)); // Right
        this.testRegions.push(Rect(-4416.0, 800.0, -4288.0, 1376.0)); // Down
        this.testRegions.push(Rect(-5056.0, 1344.0, -4384.0, 1472.0)); // Left

        // Checkpoint 1
        this.testRegions.push(Rect(-4416.0, 2560.0, -4352.0, 2624.0)); // Upper Left
        this.testRegions.push(Rect(-4352.0, 2560.0, -4288.0, 2624.0)); // Upper Right
        this.testRegions.push(Rect(-4352.0, 2496.0, -4288.0, 2560.0)); // Lower Right
        this.testRegions.push(Rect(-4416.0, 2496.0, -4352.0, 2560.0)); // Lower Left

        // Checkpoint 2
        this.testRegions.push(Rect(-4416.0, 1408.0, -4352.0, 1472.0)); // Upper Left
        this.testRegions.push(Rect(-4352.0, 1408.0, -4288.0, 1472.0)); // Upper Right
        this.testRegions.push(Rect(-4352.0, 1344.0, -4288.0, 1408.0)); // Lower Right
        this.testRegions.push(Rect(-4416.0, 1344.0, -4352.0, 1408.0)); // Lower Left

        // Maroon
        this.testRegions.push(Rect(3584.0, 768.0, 3648.0, 3200.0)); // Long left
        this.testRegions.push(Rect(3648.0, 3136.0, 4064.0, 3200.0)); // Spawn top left
        this.testRegions.push(Rect(5056.0, 768.0, 5120.0, 3200.0)); // Long right
        this.testRegions.push(Rect(4704.0, 3136.0, 5056.0, 3200.0)); // Spawn top right
        this.testRegions.push(Rect(4640.0, 768.0, 5056.0, 832.0)); // Exit right
        this.testRegions.push(Rect(3648.0, 768.0, 4064.0, 832.0)); // Exit left

        // Circle 1
        this.testRegions.push(Rect(4288.0, 1440.0, 4416.0, 2528.0)); // Down
        this.testRegions.push(Rect(3648.0, 2496.0, 4320.0, 2624.0)); // Left
        this.testRegions.push(Rect(4288.0, 2592.0, 4416.0, 3168.0)); // Up
        this.testRegions.push(Rect(4384.0, 2496.0, 5056.0, 2624.0)); // Right

        // Circle 2
        this.testRegions.push(Rect(4384.0, 1344.0, 5056.0, 1472.0)); // Right
        this.testRegions.push(Rect(4288.0, 800.0, 4416.0, 1376.0)); // Down
        this.testRegions.push(Rect(3648.0, 1344.0, 4320.0, 1472.0)); // Left

        // Checkpoint 1
        this.testRegions.push(Rect(4288.0, 2560.0, 4352.0, 2624.0)); // Upper Left
        this.testRegions.push(Rect(4352.0, 2560.0, 4416.0, 2624.0)); // Upper Right
        this.testRegions.push(Rect(4352.0, 2496.0, 4416.0, 2560.0)); // Lower Right
        this.testRegions.push(Rect(4288.0, 2496.0, 4352.0, 2560.0)); // Lower Left

        // Checkpoint 2
        this.testRegions.push(Rect(4288.0, 1408.0, 4352.0, 1472.0)); // Upper Left
        this.testRegions.push(Rect(4352.0, 1408.0, 4416.0, 1472.0)); // Upper Right
        this.testRegions.push(Rect(4352.0, 1344.0, 4416.0, 1408.0)); // Lower Right
        this.testRegions.push(Rect(4288.0, 1344.0, 4352.0, 1408.0)); // Lower Left
        //TSET


    }

    private AntiBlockAction() {
        let consUnit = GetConstructingStructure();

        let player = settings.players.get(GetPlayerId(GetOwningPlayer(consUnit)));
        if (!player) {
            return;
        }


        if (GetUnitAbilityLevelSwapped(FourCC('A0CR'), consUnit) > 0) {
            if (!player.getRectangle().ContainsUnit(consUnit)) {
                TriggerSleepAction(0.01);
                IssueImmediateOrderById(consUnit, settings.UNIT_ORDER_CANCEL_UPGRADE);
            }
        }


        this.antiJuggle = false;
        this.towerCounter = 0;
        this.touchedLastTower = false;
        this.playerLimitCircleOne = 0;
        this.playerLimitCircleTwo = 0;
        this.playerLimitCircleThree = 0;
        this.playerLimitCircleFour = 0;
        this.playerLimitCircleFive = 0;
        this.playerLimitCircleSix = 0;
        this.playerLimitCircleSeven = 0;
        this.playerLimitLeft = 0;
        this.playerLimitRight = 0;
        this.playerLimitOne = 0;
        this.playerLimitTwo = 0;
        this.playerLimitThree = 0;
        this.playerLimitFour = 0;
        this.playerLimitFive = 0;
        this.playerLimitSix = 0;
        this.playerLimitCheckpointOne = 0;
        this.playerLimitCheckpointTwo = 0;
        this.playerLimitCheckpointThree = 0;
        this.playerLimitCheckpointFour = 0;
        this.playerLimitCheckpointFive = 0;
        this.playerLimitCheckpointSix = 0;
        this.playerLimitCheckpointSeven = 0;
        this.playerLimitCheckpointEight = 0;


        for (let p of settings.players.values()) {
            if (p.getRectangle().ContainsUnit(consUnit)) {
                this.antiBlockPlayer = p;
                break;
            }
        }

        this.CheckForCreeps(consUnit, player);
        if (this.antiJuggle) {
            return;
        }

        if (this.CheckCheckpointsConstructing(player)) {
            this.IterateCheckpoints(consUnit);
            if (this.IsBlockingACheckpoint()) {
                this.Blocking(player);
            }
        }

        GroupClear(this.antiBlockCheckGroup);
        GroupAddUnitSimple(consUnit, this.antiBlockCheckGroup);
        // SaveInteger(this.antiBlockTable, GetHandleIdBJ(consUnit))
        let data = this.GetOrCreateAntiBlockData(GetHandleIdBJ(consUnit));
        data.num = GetHandleIdBJ(consUnit);

        while (true) {
            ForGroupBJ(this.antiBlockCheckGroup,
                () => xpcall(() => this.FindNeighbouringTowers(), (err) => Log.Fatal(err)));
            if (this.towerCounter == CountUnitsInGroup(this.antiBlockCheckGroup)) {
                break;
            }
        }
        this.antiBlockMap = new Map<number, AntiBlockData>();


        // Is Player blocking?
        ForGroupBJ(this.antiBlockCheckGroup, () => this.IsPlayerBlocking());

        GroupClear(this.antiBlockCheckGroup);

        if (this.IsPlayerBlockingCheck()) {
            Log.Debug("IsPlayerBlockingCheck");
            this.Blocking(player);
            return;
        }
        if (this.CheckForCircle()) {
            Log.Debug("CheckForCircle");

            this.Blocking(player);
            return;
        }


    }

    CheckForCreeps(consUnit: unit, player: Attacker) {
        let loc = GetUnitLoc(consUnit);
        let grp = GetUnitsInRangeOfLocMatching(124, loc, Condition(() =>Trigger.EvaluateCondition(() => this.UnitIsAliveCreepFilter())));
        if (this.antiJuggle) {
            this.IsJuggling(consUnit, player);
        }
        ForGroupBJ(grp, () => xpcall(() => this.IssueCreepMovement(), (err) => Log.Fatal(err)));

        DestroyGroup(grp);
        RemoveLocation(loc);
    }

    IsJuggling(consUnit: unit, player: Attacker) {
        player.sendMessage('|CFFFF0303[Anti-Juggle]|r |CFFFFFF01Detected a possible juggling attempt. Your building has been cancelled and you have been refunded the full cost.|r');
        TriggerSleepAction(0.01);
        IssueImmediateOrderById(consUnit, settings.UNIT_ORDER_CANCEL_UPGRADE);
    }

    UnitIsAliveCreepFilter() {

        if (!this.FilteredUnitIsCreep()) {
            return false;
        }

        if (!IsUnitAliveBJ(GetFilterUnit())) {
            return false;
        }

        if (IsUnitType(GetFilterUnit(), UNIT_TYPE_FLYING)) {
            return false;
        }

        this.antiJuggle = true;
        return true;
    }


    FilteredUnitIsCreep() {
        let filterUnit = GetFilterUnit();
        let oP = GetPlayerId(GetOwningPlayer(filterUnit));

        switch (oP) {
            case COLOUR.NAVY:
            case COLOUR.TURQUOISE:
            case COLOUR.VOILET:
            case COLOUR.WHEAT:
                return true;
            default:
                return false;

        }

    }

    IssueCreepMovement() {
        let spawnedCreeps = this.worldMap.spawnedCreeps;
        if (spawnedCreeps) {
            let spawnedCreep = spawnedCreeps.unitMap.get(GetHandleIdBJ(GetEnumUnit()));
            if (spawnedCreep) {
                spawnedCreep.ReapplyMovement();
            }


        }
    }

    IsBlockingACheckpoint() {
        return !!(this.IsBlockingCheckpointOne || this.IsBlockingCheckpointTwo);

    }

    IsBlockingCheckpointOne() {

        if (!(this.playerLimitCheckpointOne > 0)) {
            return false;
        }


        if (!(this.playerLimitCheckpointTwo > 0)) {
            return false;
        }


        if (!(this.playerLimitCheckpointThree > 0)) {
            return false;
        }


        if (!(this.playerLimitCheckpointFour > 0)) {
            return false;
        }


        return true;

    }

    IsBlockingCheckpointTwo() {

        if (!(this.playerLimitCheckpointFive > 0)) {
            return false;
        }


        if (!(this.playerLimitCheckpointSix > 0)) {
            return false;
        }


        if (!(this.playerLimitCheckpointSeven > 0)) {
            return false;
        }


        if (!(this.playerLimitCheckpointEight > 0)) {
            return false;
        }


        return true;
    }


    CheckCheckpointsConstructing(player: Attacker) {
        if (RectContainsUnit(this.testRegions[21 * player.id + 13], GetConstructingStructure())) {
            this.playerLimitCheckpointOne = this.playerLimitCheckpointOne + 1;
            return true;
        }
        if (RectContainsUnit(this.testRegions[21 * player.id + 14], GetConstructingStructure())) {
            this.playerLimitCheckpointTwo = this.playerLimitCheckpointTwo + 1;
            return true;
        }
        if (RectContainsUnit(this.testRegions[21 * player.id + 15], GetConstructingStructure())) {
            this.playerLimitCheckpointThree = this.playerLimitCheckpointThree + 1;
            return true;
        }
        if (RectContainsUnit(this.testRegions[21 * player.id + 16], GetConstructingStructure())) {
            this.playerLimitCheckpointFour = this.playerLimitCheckpointFour + 1;
            return true;
        }
        if (RectContainsUnit(this.testRegions[21 * player.id + 17], GetConstructingStructure())) {
            this.playerLimitCheckpointFive = this.playerLimitCheckpointFive + 1;
            return true;
        }
        if (RectContainsUnit(this.testRegions[21 * player.id + 18], GetConstructingStructure())) {
            this.playerLimitCheckpointSix = this.playerLimitCheckpointSix + 1;
            return true;
        }
        if (RectContainsUnit(this.testRegions[21 * player.id + 19], GetConstructingStructure())) {
            this.playerLimitCheckpointSeven = this.playerLimitCheckpointSeven + 1;
            return true;
        }
        if (RectContainsUnit(this.testRegions[21 * player.id + 20], GetConstructingStructure())) {
            this.playerLimitCheckpointEight = this.playerLimitCheckpointEight + 1;
            return true;
        }

    }

    IterateCheckpoints(consUnit: unit) {
        let loc = GetUnitLoc(consUnit);
        let grp = GetUnitsInRangeOfLocAll(182.00, loc);
        ForGroup(grp, () => xpcall(() => this.CheckCheckpoints(), err => Log.Fatal(err)));
        DestroyGroup(grp);
        RemoveLocation(loc);
    }

    CheckCheckpoints() {

        if (GetUnitTypeId(GetEnumUnit()) == FourCC('h03M')) {
            return;
        }
        if (!IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE)) {
            return;
        }
        if(!this.antiBlockPlayer){
            Log.Fatal("antiBlockPlayer is missing");
            return
        }

        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 13], GetEnumUnit())) {
            this.playerLimitCheckpointOne = this.playerLimitCheckpointOne + 1;
            return true;
        }
        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 14], GetEnumUnit())) {
            this.playerLimitCheckpointTwo = this.playerLimitCheckpointTwo + 1;
            return true;
        }
        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 15], GetEnumUnit())) {
            this.playerLimitCheckpointThree = this.playerLimitCheckpointThree + 1;
            return true;
        }
        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 16], GetEnumUnit())) {
            this.playerLimitCheckpointFour = this.playerLimitCheckpointFour + 1;
            return true;
        }
        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 17], GetEnumUnit())) {
            this.playerLimitCheckpointFive = this.playerLimitCheckpointFive + 1;
            return true;
        }
        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 18], GetEnumUnit())) {
            this.playerLimitCheckpointSix = this.playerLimitCheckpointSix + 1;
            return true;
        }
        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 19], GetEnumUnit())) {
            this.playerLimitCheckpointSeven = this.playerLimitCheckpointSeven + 1;
            return true;
        }
        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 20], GetEnumUnit())) {
            this.playerLimitCheckpointEight = this.playerLimitCheckpointEight + 1;
            return true;
        }
    }

    Blocking(player: Attacker) {
        player.sendMessage('|CFFFF0303[Anti-Block]|r |CFFFFFF01Detected a possible blocking attempt. Your building has been cancelled and you have been refunded the full cost.|r');
        TriggerSleepAction(0.01);
        IssueImmediateOrderById(GetConstructingStructure(), settings.UNIT_ORDER_CANCEL_UPGRADE);
    }

    CheckForCircle() {
        if (!this.touchedLastTower) {
            return false;
        }

        if (this.CheckCircleAroundCheckpointOne()) {
            Log.Debug("CheckCircleAroundCheckpointOne");
            return true;
        }


        if (this.CheckCircleAroundCheckpointTwo()) {
            Log.Debug("CheckCircleAroundCheckpointOne");

            return true;
        }


        if (this.CheckCircleAroundBothCheckpoints()) {
            Log.Debug("CheckCircleAroundCheckpointOne");

            return true;
        }
        return false;
    }

    CheckCircleAroundCheckpointOne() {
        if (!(this.playerLimitCircleOne > 0)) {
            return false;
        }

        if (!(this.playerLimitCircleTwo > 0)) {
            return false;
        }

        if (!(this.playerLimitCircleThree > 0)) {
            return false;
        }

        if (!(this.playerLimitCircleFour > 0)) {
            return false;
        }

        return true;
    }

    CheckCircleAroundCheckpointTwo() {
        if (!(this.playerLimitCircleOne > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleFive > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleSix > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleSeven > 0)) {
            return false;
        }


        return true;
    }

    CheckCircleAroundBothCheckpoints() {
        if (!(this.playerLimitCircleTwo > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleThree > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleFour > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleFive > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleSix > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleSeven > 0)) {
            return false;
        }

        return true;
    }

    IsPlayerBlockingCheck() {
        if (this.CheckCrossSectionOne()) {
            return true;
        }

        if (this.CheckCrossSectionTwo()) {
            return true;
        }

        if (this.CheckCrossSectionThree()) {
            return true;
        }

        if (this.CheckCrossSectionFour()) {
            return true;
        }

        if (this.CheckCrossSectionFive()) {
            return true;
        }

        if (this.CheckCrossSectionSix()) {
            return true;
        }

        if (this.CheckCrossSectionSeven()) {
            return true;
        }

        if (this.CheckCrossSectionEight()) {
            return true;
        }

        if (this.CheckCrossSectionNine()) {
            return true;
        }

        if (this.CheckCrossSectionTen()) {
            return true;
        }

        if (this.CheckCrossSectionEleven()) {
            return true;
        }

        if (this.CheckCrossSectionTwelve()) {
            return true;
        }

        if (this.CheckCrossSectionThirteen()) {
            return true;
        }

        if (this.CheckCrossSectionFourteen()) {
            return true;
        }

        if (this.CheckCrossSectionFifteen()) {
            return true;
        }

        return false;
    }


    CheckCrossSectionFifteen() {
        if (!((this.playerLimitCircleOne + this.playerLimitCircleFive + this.playerLimitCircleSix + this.playerLimitCircleSeven) > 2)) { // INLINED!!
            return false;
        }

        if (!(this.playerLimitFive > 0)) {
            return false;
        }

        if (!(this.playerLimitSix > 0)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionOne() {
        if (!(this.playerLimitOne > 0)) {
            return false;
        }

        if (!(this.playerLimitFive > 0)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionTwo() {
        if (!(this.playerLimitTwo > 0)) {
            return false;
        }

        if (!(this.playerLimitFive > 0)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionThree() {
        if (!(this.playerLimitThree > 0)) {
            return false;
        }

        if (!(this.playerLimitFive > 0)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionFour() {
        if (!(this.playerLimitOne > 0)) {
            return false;
        }

        if (!(this.playerLimitFour > 0)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionFive() {
        if (!(this.playerLimitTwo > 0)) {
            return false;
        }

        if (!(this.playerLimitFour > 0)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionSix() {
        if (!(this.playerLimitThree > 0)) {
            return false;
        }

        if (!(this.playerLimitFour > 0)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionSeven() {
        if (!(this.playerLimitThree > 0)) {
            return false;
        }

        if (!(this.playerLimitSix > 0)) {
            return false;
        }

        if (!(this.playerLimitCircleFive > 0)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionEight() {
        if (!(this.playerLimitOne > 0)) {
            return false;
        }

        if (!(this.playerLimitSix > 0)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionNine() {
        if (!(this.playerLimitFour > 0)) {
            return false;
        }

        if (!(this.playerLimitFive > 0)) {
            return false;
        }
        if (this.CheckCircleLine()) {
            return true;
        }

        return false;
    }

    CheckCrossSectionTen() {
        if (!(this.AreAnyOfTheBordersLargerThanOne())) {
            return false;
        }

        if (!(this.ThreeSidesOfAnyCircle())) {
            return false;
        }

        return true;
    }

    CheckCrossSectionEleven() {
        if (!(this.AllSidesOfBothCirclesAreConnected())) {
            return false;
        }

        if (!(this.playerLimitOne + this.playerLimitTwo + this.playerLimitThree + this.playerLimitFour + this.playerLimitFive + this.playerLimitSix > 1)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionTwelve() {
        if (!(this.playerLimitCircleOne > 0)) {
            return false;
        }

        if (!(this.playerLimitCircleFive > 0)) {
            return false;
        }

        if (!(this.playerLimitOne > 0)) {
            return false;
        }

        if (!(this.playerLimitTwo > 0)) {
            return false;
        }

        return true;
    }


    CheckCrossSectionThirteen() {
        if (!(this.playerLimitTwo > 0)) {
            return false;
        }

        if (!(this.playerLimitSix > 0)) {
            return false;
        }

        return true;
    }

    TwoSidesConnected() {
        return (this.playerLimitOne + this.playerLimitTwo + this.playerLimitThree + this.playerLimitFour + this.playerLimitFive + this.playerLimitSix > 1);
    }

    AllSidesOfBothCirclesAreConnected() {
        if (!(this.playerLimitCircleOne > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleTwo > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleThree > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleFour > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleFive > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleSix > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleSeven > 0)) {
            return false;
        }


        return true;
    }


    ThreeSidesOfAnyCircle() {
        if (((this.playerLimitCircleOne + this.playerLimitCircleTwo + this.playerLimitCircleThree + this.playerLimitCircleFour) > 2)) {  // INLINED!!

            return true;
        }

        if (((this.playerLimitCircleOne + this.playerLimitCircleFive + this.playerLimitCircleSix + this.playerLimitCircleSeven) > 2)) { // INLINED!!

            return true;
        }

        return false;
    }

    CheckCrossSectionFourteen() {
        if (!(this.playerLimitTwo > 0)) {
            return false;
        }

        if (!(this.playerLimitThree > 0)) {
            return false;
        }

        if (this.CheckCircleLine()) {
            return true;
        }

        return false;
    }

    ThreeSidesOfCircleOne() {
        return ((this.playerLimitCircleOne + this.playerLimitCircleTwo + this.playerLimitCircleThree + this.playerLimitCircleFour) > 2);
    }

    ThreeSidesOfCircleTwo() {
        return ((this.playerLimitCircleOne + this.playerLimitCircleFive + this.playerLimitCircleSix + this.playerLimitCircleSeven) > 2);
    }

    CheckCircleLine() {
        if (this.playerLimitCircleOne > 0) {
            return true;
        }

        if (this.playerLimitCircleThree > 0) {
            return true;
        }

        if (this.playerLimitCircleSix > 0) {
            return true;
        }

        return false;
    }

    AreAnyOfTheBordersLargerThanOne() {
        if (this.playerLimitOne > 1) {
            return true;
        }

        if (this.playerLimitTwo > 1) {
            return true;
        }

        if (this.playerLimitThree > 1) {
            return true;
        }

        if (this.playerLimitFour > 1) {
            return true;
        }

        if (this.playerLimitFive > 1) {
            return true;
        }

        if (this.playerLimitSix > 1) {
            return true;
        }

        return false;
    }


    IsPlayerBlocking() {
        if(!this.antiBlockPlayer){
            Log.Fatal("antiBlockPlayer is missing");
            return
        }
        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 5], GetEnumUnit())) {
            Log.Debug('IsPlayerBlocking: 5');
            this.playerLimitOne = this.playerLimitOne + 1;

        }

        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id], GetEnumUnit())) {
            Log.Debug('IsPlayerBlocking: 0');
            this.playerLimitTwo = this.playerLimitTwo + 1;

        }

        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 1], GetEnumUnit())) {
            Log.Debug('IsPlayerBlocking: 1');
            this.playerLimitThree = this.playerLimitThree + 1;

        }

        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 3], GetEnumUnit())) {
            Log.Debug('IsPlayerBlocking: 3');
            this.playerLimitFour = this.playerLimitFour + 1;

        }

        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 2], GetEnumUnit())) {
            Log.Debug('IsPlayerBlocking: 2');
            this.playerLimitFive = this.playerLimitFive + 1;
        }

        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 4], GetEnumUnit())) {
            Log.Debug('IsPlayerBlocking: 4');
            this.playerLimitSix = this.playerLimitSix + 1;

        }

        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 6], GetEnumUnit())) {
            Log.Debug('IsPlayerBlocking: 6');
            this.playerLimitCircleOne = this.playerLimitCircleOne + 1;

        }

        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 7], GetEnumUnit())) {
            Log.Debug('IsPlayerBlocking: 7');
            this.playerLimitCircleTwo = this.playerLimitCircleTwo + 1;

        }

        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 8], GetEnumUnit())) {
            Log.Debug('IsPlayerBlocking: 8');
            this.playerLimitCircleThree = this.playerLimitCircleThree + 1;

        }

        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 9], GetEnumUnit())) {
            Log.Debug('IsPlayerBlocking: 9');
            this.playerLimitCircleFour = this.playerLimitCircleFour + 1;

        }

        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 10], GetEnumUnit())) {
            Log.Debug('IsPlayerBlocking: 10');
            this.playerLimitCircleFive = this.playerLimitCircleFive + 1;

        }

        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 11], GetEnumUnit())) {
            Log.Debug('IsPlayerBlocking: 11');
            this.playerLimitCircleSix = this.playerLimitCircleSix + 1;

        }

        if (RectContainsUnit(this.testRegions[21 * this.antiBlockPlayer.id + 12], GetEnumUnit())) {
            Log.Debug('IsPlayerBlocking: 12');
            this.playerLimitCircleSeven = this.playerLimitCircleSeven + 1;

        }
    }

    FindNeighbouringTowers() {
        let handleid = GetHandleIdBJ(GetEnumUnit());
        let entry = this.antiBlockMap.get(handleid);
        if (entry) {
            if (entry.boolOne) {
                return;
            }
        }

        this.NewNeighbourTower(handleid);
    }

    NewNeighbourTower(handleid: number) {
        let loc = GetUnitLoc(GetEnumUnit());
        let data = this.GetOrCreateAntiBlockData(handleid);

        data.boolOne = true;
        data.locX = GetLocationX(loc);
        data.locY = GetLocationY(loc);
        let grp = GetUnitsInRangeOfLocMatching(182, loc, Condition(() => Trigger.EvaluateCondition(() => this.GetUnitsInRangeFilter())));

        data.grp = grp;

        GroupAddGroup(grp, this.antiBlockCheckGroup);

        this.towerCounter = this.towerCounter + 1;
    }

    GetUnitsInRangeFilter() {
        if (!this.FilteredUnitIsStructure()) {
            return false;
        }

        if (GetFilterUnit() == GetEnumUnit()) {
            return false;
        }


        if ((IsUnitInGroup(GetFilterUnit(), this.antiBlockCheckGroup))) { // INLINED!!
            this.CheckHashtable();
            return false;
        }
        let data = this.GetOrCreateAntiBlockData(GetHandleIdBJ(GetFilterUnit()));
        data.num = GetHandleIdBJ(GetFilterUnit());

        // call BlzSetUnitName(GetFilterUnit(), I2S(GetHandleIdBJ(GetEnumUnit())))
        return true;
    }

    CheckHashtable() {
        let filterid = GetHandleIdBJ(GetFilterUnit());
        let enumid = GetHandleIdBJ(GetEnumUnit());
        let handle = this.GetOrCreateAntiBlockData(GetHandleIdBJ(GetEnumUnit()));
        let handleid = handle.num;
        let filter = this.GetOrCreateAntiBlockData(filterid);
        let handleidFilter = filter.num;;

        if (handleid == handleidFilter) {
            return;
        }


        if (handleid == GetHandleIdBJ(GetFilterUnit())) {
            return;
        }


        if (handleid == filter.num) {
            if (!this.CheckIfTowersTouch(handleidFilter, enumid)) {
                return;
            }
        }


        if (handleidFilter == handle.num) {
            return;
        }

        this.touchedLastTower = true;
    }

    CheckIfTowersTouch(first: number, second: number) {
        let flag = false;
        let dist = SquareRoot(Pow(this.GetOrCreateAntiBlockData(first).locX - this.GetOrCreateAntiBlockData(second).locX, 2.00) + Pow(this.GetOrCreateAntiBlockData(first).locY - this.GetOrCreateAntiBlockData(second).locY, 2.00));

        if (dist > 182.00) {
            flag = true;
        }

        return flag;

    }

    FilteredUnitIsStructure() {
        if (GetUnitTypeId(GetFilterUnit()) == FourCC('h03M')) {
            return false;
        }

        return IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE);
    }

    FilteredUnitIsInGroup() {
        return IsUnitInGroup(GetFilterUnit(), this.antiBlockCheckGroup);
    }

    private GetOrCreateAntiBlockData(handleid: number): AntiBlockData {
        let entry = this.antiBlockMap.get(handleid);
        if(this.antiBlockMap.has(handleid)){
            entry = this.antiBlockMap.get(handleid);
        } else {
            this.antiBlockMap.set(handleid, new AntiBlockData());
            entry = this.antiBlockMap.get(handleid);
        }

        if(!entry){
            Log.Fatal("GetOrCreateAntiBlockData unable to get or create")
        }
        // @ts-ignore
        return entry;
    }

}
