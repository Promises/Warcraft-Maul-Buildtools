import { CheckPoint } from './CheckPoint';
import { WorldMap } from '../WorldMap';

export class Teleporter extends CheckPoint {
    facing: number;

    constructor(rectangle: rect, worldMap: WorldMap, facing: number) {
        super(rectangle, worldMap);
        this.facing = facing;
    }

    checkPointAction() {
        if (!this.next) {
            return;
        }
        let x = GetRectCenterX(this.next.rectangle);
        let y = GetRectCenterY(this.next.rectangle);
        let spawnedCreeps = this.worldMap.spawnedCreeps;
        if (spawnedCreeps) {
            let spawnedCreep = spawnedCreeps.unitMap.get(GetHandleIdBJ(GetEnteringUnit()));
            if (spawnedCreep) {
                spawnedCreep.targetCheckpoint = this.next;
                SetUnitPosition(GetEnteringUnit(), x, y);
                SetUnitFacing(GetEnteringUnit(), this.facing);
                DestroyEffect(AddSpecialEffect('Abilities/Spells/Human/MassTeleport/MassTeleportCaster.mdl', x, y));
                IssuePointOrder(GetEnteringUnit(), 'move', GetRectCenterX(this.next.rectangle), GetRectCenterY(this.next.rectangle));


            }
        }
    }
}
