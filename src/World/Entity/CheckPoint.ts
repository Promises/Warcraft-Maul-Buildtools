import { WorldMap } from '../WorldMap';
import { Trigger } from '../../JassOverrides/Trigger';
import { SpawnedCreeps } from './SpawnedCreeps';
import { Creep } from './Creep';

export class CheckPoint {
    private _previous: CheckPoint | undefined;
    private _next: CheckPoint | undefined;
    public rectangle: rect;
    public eventTrig: Trigger;
    public worldMap: WorldMap;


    constructor(rectangle: rect, worldMap: WorldMap) {
        this.rectangle = rectangle;
        this.worldMap = worldMap;
        this.eventTrig = new Trigger();

        this.eventTrig.RegisterEnterRectSimple(rectangle);

        this.eventTrig.AddCondition(() => this.verifyTargetCheckpoint());
        this.eventTrig.AddAction(() => this.CheckPointAction());


    }


    public verifyTargetCheckpoint(): boolean {

        if (!this.isEnteringUnitCreep) {
            return false;
        }
        const spawnedCreeps: SpawnedCreeps | undefined = this.worldMap.spawnedCreeps;
        if (spawnedCreeps !== undefined) {
            const spawnedCreep: Creep | undefined = spawnedCreeps.unitMap.get(GetHandleIdBJ(GetEnteringUnit()));
            if (spawnedCreep !== undefined) {
                if (spawnedCreep.targetCheckpoint) {
                    return spawnedCreep.targetCheckpoint === this;
                }
            }
        }
        return true;
    }

    public CheckPointAction(): void {
        if (!this.next) {
            return;
        }
        const spawnedCreeps: SpawnedCreeps | undefined = this.worldMap.spawnedCreeps;
        if (spawnedCreeps !== undefined) {
            const creep: Creep | undefined = spawnedCreeps.unitMap.get(GetHandleIdBJ(GetEnteringUnit()));
            if (creep !== undefined) {
                creep.targetCheckpoint = this.next;
                creep.OrderMove(GetRectCenterX(this.next.rectangle), GetRectCenterY(this.next.rectangle));
                if (UnitHasBuffBJ(GetEnteringUnit(), FourCC('B028'))) {
                    creep.MorningPerson();
                }

            }
        }
    }


    get previous(): CheckPoint | undefined {
        return this._previous;
    }

    set previous(value: CheckPoint | undefined) {
        this._previous = value;
    }

    get next(): CheckPoint | undefined {
        return this._next;
    }

    set next(value: CheckPoint | undefined) {
        this._next = value;
    }


    public isEnteringUnitCreep(): boolean {
        const ownerID: COLOUR = GetPlayerId(GetOwningPlayer(GetEnteringUnit()));
        switch (ownerID) {
            case COLOUR.NAVY:
            case COLOUR.TURQUOISE:
            case COLOUR.VOILET:
            case COLOUR.WHEAT:
                return true;
            default:
                return false;
        }
    }

}


