import { SpawnedCreeps } from './SpawnedCreeps';
import { WorldMap } from '../WorldMap';
import { Creep } from './Creep';
import get = Reflect.get;
import { Trigger } from '../../JassOverrides/Trigger';

export class CheckPoint {
    private _previous: CheckPoint | undefined;
    private _next: CheckPoint | undefined;
    rectangle: rect;
    eventTrig: Trigger;
    worldMap: WorldMap;


    constructor(rectangle: rect, worldMap: WorldMap) {
        this.rectangle = rectangle;
        this.worldMap = worldMap;
        this.eventTrig = new Trigger();

        this.eventTrig.RegisterEnterRectSimple(rectangle);

        this.eventTrig.AddCondition(() => this.verifyTargetCheckpoint());
        this.eventTrig.AddAction(() => this.checkPointAction());


    }


    verifyTargetCheckpoint(): boolean {

        if (!this.isEnteringUnitCreep) {
            return false;
        }
        let spawnedCreeps = this.worldMap.spawnedCreeps;
        if (spawnedCreeps) {
            let spawnedCreep = spawnedCreeps.unitMap.get(GetHandleIdBJ(GetEnteringUnit()));
            if (spawnedCreep) {
                if (spawnedCreep.targetCheckpoint) {
                    return spawnedCreep.targetCheckpoint === this;
                }
            }
        }
        return true;
    }

    checkPointAction() {
        if (!this.next) {
            return;
        }
        let spawnedCreeps = this.worldMap.spawnedCreeps;
        if (spawnedCreeps) {
            let creep = spawnedCreeps.unitMap.get(GetHandleIdBJ(GetEnteringUnit()));
            if (creep) {
                creep.targetCheckpoint = this.next;
                IssuePointOrder(GetEnteringUnit(), 'move', GetRectCenterX(this.next.rectangle), GetRectCenterY(this.next.rectangle));
                if (UnitHasBuffBJ(GetEnteringUnit(), FourCC('B028'))) {
                    // TODO: creep.morningPerson();
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


    isEnteringUnitCreep() {
        let ownerID: COLOUR = GetPlayerId(GetOwningPlayer(GetEnteringUnit()));
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


