import { Trigger } from '../JassOverrides/Trigger';
import * as settings from './GlobalSettings';
import { Log } from '../lib/Serilog/Serilog';
import { Attacker } from './Entity/Players/Attacker';
import { WorldMap } from './WorldMap';
import { AntiBlockData } from './AntiBlockData';
import { AntiBlockAction } from './AntiBlockAction';


export class AntiBlockController {

    eventTrigger: Trigger;

    worldMap: WorldMap;
    public testRegions: rect[] = [];


    constructor(worldMap: WorldMap) {
        this.worldMap = worldMap;
        this.SetupRegion();
        this.eventTrigger = new Trigger();
        this.eventTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_CONSTRUCT_START);
        this.eventTrigger.AddAction(() => this.Action());

    }

    //TODO: PLEASE, FOR THE LOVE OF GOD NUKE THIS!
    private SetupRegion() {

        Log.Debug('Starting AntiBlockController');
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

    private Action() {
        let action = new AntiBlockAction(this.worldMap, this);
        action.AntiBlockAction();


    }


}
