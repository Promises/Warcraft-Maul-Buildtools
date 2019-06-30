import { WarcraftMaul } from './World/WarcraftMaul';
import './lib/translators';
import { Trigger } from './JassOverrides/Trigger';
import { Log, LogLevel } from './lib/Serilog/Serilog';
import { StringSink } from './lib/Serilog/Sinks/StringSink';


ceres.addHook('main::after', () => {
    Log.Init([
        new StringSink(LogLevel.Fatal, SendMessage),
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

