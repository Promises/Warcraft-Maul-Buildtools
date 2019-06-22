import { Trigger } from '../../../JassOverrides/Trigger';
import { Defender } from '../Players/Defender';
import * as settings from '../../GlobalSettings';
import { Log } from '../../../lib/Serilog/Serilog';
import { NagaSlave } from './NagaSlave';
import { Tower } from './Tower';


export class TowerConstruction {
    towerConstructTrigger: Trigger;
    towerTypes: Map<number, object> = new Map<number, object>();

    constructor() {
        Log.Debug('Starting towercons');
        this.InitTypes();
        this.towerConstructTrigger = new Trigger();
        this.towerConstructTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_CONSTRUCT_FINISH);
        this.towerConstructTrigger.AddAction(() => this.ConstructionFinished());
    }

    private ConstructionFinished(): void {
        const tower: unit = GetTriggerUnit();

        const owner: Defender | undefined = settings.players.get(GetPlayerId(GetOwningPlayer(tower)));
        UnitRemoveAbilityBJ(FourCC('ARal'), tower);

        if (!owner) {
            return;
        }
        let ObjectExtendsTower: Tower;

        const obj: object | undefined = this.towerTypes.get(GetUnitTypeId(tower));
        if (obj) {
            // @ts-ignore
            ObjectExtendsTower = new obj(tower, owner);
        } else {
            ObjectExtendsTower = new Tower(tower, owner);
        }
    }

    private InitTypes(): void {
        this.towerTypes.set(FourCC('h03G'), NagaSlave);
    }
}
