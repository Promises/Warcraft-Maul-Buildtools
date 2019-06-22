import { Trigger } from '../../../JassOverrides/Trigger';
import { Defender } from '../Players/Defender';
import * as settings from '../../GlobalSettings';
import { Log } from '../../../lib/Serilog/Serilog';
import { NagaSlave } from './WorkersUnion/NagaSlave';
import { Tower } from './Tower';
import { WarcraftMaul } from '../../WarcraftMaul';
import { OrcPeon } from './WorkersUnion/OrcPeon';
import { HumanPeasant } from './WorkersUnion/HumanPeasant';


export class TowerConstruction {
    towerConstructTrigger: Trigger;
    towerTypes: Map<number, object> = new Map<number, object>();
    game: WarcraftMaul;

    constructor(game: WarcraftMaul) {
        Log.Debug('Starting towercons');
        this.game = game;
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
            ObjectExtendsTower = new obj(tower, owner, this.game);
        } else {
            ObjectExtendsTower = new Tower(tower, owner, this.game);
        }
    }

    private InitTypes(): void {
        this.towerTypes.set(FourCC('h03G'), NagaSlave);
        this.towerTypes.set(FourCC('h03E'), OrcPeon);
        this.towerTypes.set(FourCC('h03F'), HumanPeasant);
    }
}
