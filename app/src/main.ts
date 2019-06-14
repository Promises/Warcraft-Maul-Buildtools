import './lib/translators'
import './World/GlobalSettings'
import {WarcraftMaul} from "./World/WarcraftMaul";
import { COLOUR_CODES } from './World/GlobalSettings';

function printError(err: any) {
    print(`${Util.ColourString(COLOUR_CODES[COLOUR.RED],"ERROR: ")}${err}`);
}


function Main(this:void) {
    let maul = new WarcraftMaul();

    print("Initialisation finished");




}


let init = CreateTrigger();
TriggerRegisterTimerEvent(init, 0.00, false);
TriggerAddAction(init, () => {
    xpcall(() => Main(), err => printError(err));

});





// let t = CreateTrigger()
// TriggerRegisterTimerEvent(t, 0.00, false)
// TriggerAddAction(t, () => {
//     xpcall(() => { 
//         BJDebugMsg("Hello, world arrow!")
//     }, (err) => {
//         BJDebugMsg("Err: " + err)
//     });
// });



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
