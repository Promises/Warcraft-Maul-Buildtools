import { Creep } from './Creep';
import { Trigger } from '../../JassOverrides/Trigger';

export class SpawnedCreeps {

    public unitMap: Map<number, Creep> = new Map<number, Creep>();


    constructor() {
        // let creativeName = CreateUnit(Player(COLOUR.NAVY), FourCC('u000'), -64.00, 4032.00, 240.0);
        // this.unitMap.set(GetHandleIdBJ(creativeName), new Creep(creativeName));

        let triggerTest = new Trigger();
        triggerTest.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SELECTED);
        triggerTest.AddAction(() => this.printUnit());


    }


    printUnit(): void {
        const test = this.unitMap.get(GetHandleIdBJ(GetTriggerUnit()));
        if (test != undefined) {
            test.printId();
        }
    }

    // GetHandleIdBJ
}
