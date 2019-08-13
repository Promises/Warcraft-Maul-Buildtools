import { WarcraftMaul } from './World/WarcraftMaul';
import './lib/translators';
import { Trigger } from './JassOverrides/Trigger';
import { Log, LogLevel } from './lib/Serilog/Serilog';
import { StringSink } from './lib/Serilog/Sinks/StringSink';
import { PatchNatives } from './JassOverrides/NativePatcher';

ceres.addHook('main::after', () => {
    require('app/src/LuaModules/TimerUtils'); // non leaking timers
    // require('app/src/LuaModules/PolledWait'); // proper wait
    require('app/src/LuaModules/FastTriggers'); // 16x faster triggers
    PatchNatives();
    Log.Init([
        new StringSink(LogLevel.Warning, SendMessageUnlogged),
                 // new PreloadSink(LogLevel.Message, `WCMAUL\\${os.time()}.txt`),
    ]);


    function Main(this: void): void {
        const maul: WarcraftMaul = new WarcraftMaul();
        if (maul.debugMode) {
            Log.Information('Initialisation finished');
        }
    }

    xpcall(() => {
        const init: Trigger = new Trigger();
        init.RegisterTimerEvent(0.00, false);
        init.AddAction(() => Main());
    },     (err) => {
        Log.Fatal(err);
    });

});

