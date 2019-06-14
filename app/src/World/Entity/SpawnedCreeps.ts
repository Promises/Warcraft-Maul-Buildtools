import {Creep} from "./Creep";

export class SpawnedCreeps {

    public unitMap: Map<number, Creep> = new Map<number, Creep>();


    constructor(){
        // let creativeName = CreateUnit(Player(COLOUR.NAVY), FourCC('u000'), -64.00, 4032.00, 240.0);
        // this.unitMap.set(GetHandleIdBJ(creativeName), new Creep(creativeName));

        let triggerTest = CreateTrigger();
        TriggerRegisterAnyUnitEventBJ (triggerTest, EVENT_PLAYER_UNIT_SELECTED);
        TriggerAddAction(triggerTest, () => this.printUnit());




    }


    printUnit(): void {
        const test = this.unitMap.get(GetHandleIdBJ(GetTriggerUnit()));
        if(test != undefined){
            test.printId();
        }
    }

    // GetHandleIdBJ
}
