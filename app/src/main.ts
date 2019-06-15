import { WarcraftMaul } from './World/WarcraftMaul';
import './lib/translators';
import { Trigger } from './JassOverrides/Trigger';

BJDebugMsg('initialising');

function Main(this: void) {
    let maul = new WarcraftMaul();
    if(maul.debugMode){
        print('Initialisation finished');
    }


}
// BJDebugMsg('prexp call');

xpcall(() => {
    // print('initialising');
    let init = new Trigger();
    init.RegisterTimerEvent(0.00, false);
    init.AddAction(() => Main());
}, (err) => {
    BJDebugMsg('Err: ' + err);
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
