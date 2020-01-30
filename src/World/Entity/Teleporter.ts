import { CheckPoint } from './CheckPoint';
import { WorldMap } from '../WorldMap';
import { SpawnedCreeps } from './SpawnedCreeps';
import { Creep } from './Creep';

export class Teleporter extends CheckPoint {
    private readonly facing: number;

    constructor(rectangle: rect, worldMap: WorldMap, facing: number) {
        super(rectangle, worldMap);
        this.facing = facing;
    }

    public CheckPointAction(): void {
        if (!this.next) {
            return;
        }
        const x: number = GetRectCenterX(this.next.rectangle);
        const y: number = GetRectCenterY(this.next.rectangle);
        const spawnedCreeps: SpawnedCreeps | undefined = this.worldMap.spawnedCreeps;
        if (spawnedCreeps !== undefined) {
            const spawnedCreep: Creep | undefined = spawnedCreeps.unitMap.get(GetHandleIdBJ(GetEnteringUnit()));
            if (spawnedCreep !== undefined) {
                spawnedCreep.targetCheckpoint = this.next;
                spawnedCreep.SetPostition(x, y);
                spawnedCreep.SetFacingDirection(this.facing);
                DestroyEffect(AddSpecialEffect('Abilities/Spells/Human/MassTeleport/MassTeleportCaster.mdl', x, y));
                spawnedCreep.OrderMove(GetRectCenterX(this.next.rectangle), GetRectCenterY(this.next.rectangle));
            }
        }
    }
}
