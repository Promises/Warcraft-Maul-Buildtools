import { Creep } from './Creep';
import { Trigger } from '../../JassOverrides/Trigger';
import * as settings from '../GlobalSettings';
import { WorldMap } from '../WorldMap';
import { Defender } from './Players/Defender';

export class SpawnedCreeps {
    public unitMap: Map<number, Creep> = new Map<number, Creep>();
    private unitDiesTrigger: Trigger;
    private worldMap: WorldMap;

    private chimearaIds: number[] = [
        FourCC('e004'),
        FourCC('e009'),
        FourCC('e00U'),
        FourCC('e00V'),
        FourCC('e000'),
    ];

    constructor(worldMap: WorldMap) {
        this.worldMap = worldMap;
        // let creativeName = CreateUnit(Player(COLOUR.NAVY), FourCC('u000'), -64.00, 4032.00, 240.0);
        // this.unitMap.set(GetHandleIdBJ(creativeName), new Creep(creativeName));
        // const triggerTest: Trigger = new Trigger();
        // triggerTest.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SELECTED);
        // triggerTest.AddAction(() => this.printUnit());


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
            if (this.chimearaIds.indexOf(GetUnitTypeId(GetDyingUnit())) >= 0) {
                const owningplayer: Defender | undefined = this.worldMap.game.players.get(GetPlayerId(GetOwningPlayer(GetDyingUnit())));
                if (owningplayer) {
                    owningplayer.chimeraCount--;

                }
            }
            RemoveUnit(GetDyingUnit());
            return;
        }

        let area: number | undefined;

        for (let i: number = 0; i < settings.PLAYER_AREAS.length; i++) {
            if (settings.PLAYER_AREAS[i].ContainsCreep(creep)) {
                area = i;
                break;
            }
        }
        if (area) {
            this.worldMap.playerSpawns[area].AreaTowerActions(creep);
        }

        const player: Defender | undefined = this.worldMap.game.players.get(GetPlayerId(GetOwningPlayer(GetKillingUnitBJ())));
        if (player) {
            player.GiveKillCount();
        }


        this.unitMap.delete(creep.getId());
        RemoveUnit(creep.creep);


    }
}
