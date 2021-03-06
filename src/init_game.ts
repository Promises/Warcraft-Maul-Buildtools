import { PatchNatives } from './JassOverrides/NativePatcher';
import { Log, LogLevel } from './lib/Serilog/Serilog';
import { StringSink } from './lib/Serilog/Sinks/StringSink';
import { WarcraftMaul } from './World/WarcraftMaul';
import { Trigger } from './JassOverrides/Trigger';
import './lib/translators';
import * as settings from './World/GlobalSettings';
import { CreepAbilityHandler } from './World/Entity/CreepAbilities/CreepAbilityHandler';
import { MMD } from './lib/MMD';
import { WarcraftMaulSettings } from './World/WarcraftMaulSettings';

export class InitGame {


    private static Main(this: void, creepAbilityHandler: CreepAbilityHandler/*, mmd: MMD*/): void {
        const maul: WarcraftMaul = new WarcraftMaul(creepAbilityHandler/*, mmd*/);
        if (maul.debugMode) {
            Log.Information('Initialisation finished');
        }
    }

    public static run(): void {
        require('LuaModules.TimerUtils'); // non leaking timers
        // require('app/src/LuaModules/PolledWait'); // proper wait
        require('LuaModules.FastTriggers'); // 16x faster triggers
        PatchNatives();
        BlzLoadTOCFile('uiImport\\Templates.toc');


        Log.Init([
            new StringSink(LogLevel.Warning, SendMessageUnlogged),
            // new PreloadSink(LogLevel.Message, `WCMAUL\\${os.time()}.txt`),
        ]);
        const creepAbilityHandler: CreepAbilityHandler = this.SetupAbilities();
        // const mmd: MMD = new MMD();

        xpcall(() => {
            const init: Trigger = new Trigger();
            init.registerTimerEvent(0.00, false);
            init.addAction(() => InitGame.Main(creepAbilityHandler/*, mmd*/));
        }, (err) => {
            Log.Fatal(err);
        });
    }


    private static SetupAbilities(): CreepAbilityHandler {
        // Setup Sacrifical lamb
        const abilityUnit: unit = CreateUnit(Player(bj_PLAYER_NEUTRAL_EXTRA), FourCC('h00L'), 0, 0, 0);


        const creepAbilityHandler: CreepAbilityHandler = new CreepAbilityHandler(abilityUnit);
        RemoveUnit(abilityUnit);
        return creepAbilityHandler;
    }
}

InitGame.run();
