import { CheckPoint } from './CheckPoint';
import { WorldMap } from '../WorldMap';

export class PlayerSpawns {
    private _spawnOne: CheckPoint | undefined;
    private _spawnTwo: CheckPoint | undefined;

    oneTrig: trigger | undefined;
    twoTrig: trigger| undefined;
    worldMap: WorldMap;

    constructor (worldMap: WorldMap){
        this.worldMap = worldMap;
    }



    get spawnOne(): CheckPoint | undefined {
        return this._spawnOne;
    }

    set spawnOne(value: CheckPoint | undefined) {
        this._spawnOne = value;
        if(this.spawnOne){
            this.oneTrig = CreateTrigger();
            TriggerRegisterEnterRectSimple(this.oneTrig, this.spawnOne.rectangle);
            TriggerAddCondition(this.oneTrig, Condition(() => this.EnteringUnitIsCreepAndHasNoCheckpoint()));
            TriggerAddAction(this.oneTrig, () => this.SpawnAction(<CheckPoint>this.spawnOne));
        }

    }

    get spawnTwo(): CheckPoint | undefined {
        if(this._spawnTwo === undefined){
            return this.spawnOne
        }
        return this._spawnTwo;
    }

    set spawnTwo(value: CheckPoint | undefined) {
        this._spawnTwo = value;
        if(this.spawnTwo) {
            this.twoTrig = CreateTrigger();
            TriggerRegisterEnterRectSimple(this.twoTrig, this.spawnTwo.rectangle);
            TriggerAddCondition(this.twoTrig, Condition(() => this.EnteringUnitIsCreepAndHasNoCheckpoint()));
            TriggerAddAction(this.twoTrig, () => this.SpawnAction(<CheckPoint>this.spawnTwo));
        }
    }





    EnteringUnitIsCreepAndHasNoCheckpoint(): boolean {
        let creep = GetEnteringUnit();
        if (!this.isEnteringUnitCreep()) {
            return false;
        }

        let spawnedCreeps = this.worldMap.spawnedCreeps;
        if (spawnedCreeps) {
            let spawnedCreep = spawnedCreeps.unitMap.get(GetHandleIdBJ(GetEnteringUnit()));
            if (spawnedCreep) {
                if (spawnedCreep.targetCheckpoint) {
                    return false;
                }
            }
        }

        return true;
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
                return false
        }
    }

    private SpawnAction(spawn: CheckPoint) {
        if(spawn == this.spawnTwo){
            if(!this.spawnTwo.next && this.spawnOne){
                spawn = this.spawnOne;
            }
        }
        if(!spawn.next){
            return;
        }
        let spawnedCreeps = this.worldMap.spawnedCreeps;
        if (spawnedCreeps) {
            let spawnedCreep = spawnedCreeps.unitMap.get(GetHandleIdBJ(GetEnteringUnit()));
            if (spawnedCreep) {
                if(spawn.next){
                    spawnedCreep.targetCheckpoint = spawn.next;
                    IssuePointOrder(GetEnteringUnit(), "move", GetRectCenterX(spawn.next.rectangle), GetRectCenterY(spawn.next.rectangle));
                    this.AddCreepAbilities();
                }

            }
        }

    }

    private AddCreepAbilities() {
        //TODO: Implement Creep abilities
    }
}
