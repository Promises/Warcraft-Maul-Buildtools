import { Creep } from './Creep';
import { Trigger } from '../../JassOverrides/Trigger';
import { Log } from '../../lib/Serilog/Serilog';
import * as settings from '../GlobalSettings';

export class SpawnedCreeps {
    public unitMap: Map<number, Creep> = new Map<number, Creep>();
    private unitDiesTrigger: Trigger;

    constructor() {
        // let creativeName = CreateUnit(Player(COLOUR.NAVY), FourCC('u000'), -64.00, 4032.00, 240.0);
        // this.unitMap.set(GetHandleIdBJ(creativeName), new Creep(creativeName));
        const triggerTest: Trigger = new Trigger();
        triggerTest.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SELECTED);
        triggerTest.AddAction(() => this.printUnit());


        this.unitDiesTrigger = new Trigger();
        this.unitDiesTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_DEATH);
        this.unitDiesTrigger.AddAction(() => this.RemoveDeadCreeps());
    }

    private printUnit(): void {
        const test: Creep | undefined = this.unitMap.get(GetHandleIdBJ(GetTriggerUnit()));
        if (test !== undefined) {
            test.printId();
        }
    }

    private RemoveDeadCreeps(): void {
        const creep: Creep | undefined = this.unitMap.get(GetHandleIdBJ(GetDyingUnit()));
        if (!creep) {
            // Handle spawns? spiders and alike?
            return;
        }

        const killingPlayerID: number = GetPlayerId(GetOwningPlayer(GetKillingUnitBJ()));




    }
}
