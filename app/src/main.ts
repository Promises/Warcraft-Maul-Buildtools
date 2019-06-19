import { WarcraftMaul } from './World/WarcraftMaul';
import './lib/translators';
import { Trigger } from './JassOverrides/Trigger';
import { Log, LogLevel } from './lib/Serilog/Serilog';
import { StringSink } from './lib/Serilog/Sinks/StringSink';

Log.Init([
    new StringSink(LogLevel.Fatal, BJDebugMsg),
]);
function Main(this: void) {
    let maul = new WarcraftMaul();
    if(maul.debugMode)
    {
        Log.Information('Initialisation finished');
    }


}

xpcall(() => {
    let init = new Trigger();
    init.RegisterTimerEvent(0.00, false);
    init.AddAction(() => Main());
}, (err) => {
    Log.Fatal(err);
});




// let t = new Trigger()
// TriggerRegisterTimerEvent(t.nativeTrigger, 0.00, false);
// t.RegisterTimerEvent(0.00, false)
// t.AddAction(
//     () => BJDebugMsg("Hello, world arrow!")
// );


// function printHello(this: void) {
//     BJDebugMsg("Hello, world function!");
// }


//
//
//
// class HelloWorld{
//
//     constructor(){
//
//         let t = CreateTrigger()
//         TriggerRegisterTimerEvent(t, 0.00, false)
//         TriggerAddAction(t, () => this.printHello());
//     }
//     printHello() {
//         BJDebugMsg(`Hello, world class! ${this.constructor.name}`);
//     }
// }
//
// let ttt = new HelloWorld();
