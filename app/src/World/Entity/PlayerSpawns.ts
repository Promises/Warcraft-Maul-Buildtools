import { CheckPoint } from './CheckPoint';
import { WorldMap } from '../WorldMap';
import { Trigger } from '../../JassOverrides/Trigger';

export class PlayerSpawns {
    private _spawnOne: CheckPoint | undefined;
    private _spawnTwo: CheckPoint | undefined;

    oneTrig: Trigger | undefined;
    twoTrig: Trigger| undefined;
    isOpen: boolean;
    worldMap: WorldMap;

    constructor (worldMap: WorldMap){
        this.worldMap = worldMap;
        this.isOpen = false;
    }



    get spawnOne(): CheckPoint | undefined {
        return this._spawnOne;
    }

    set spawnOne(value: CheckPoint | undefined) {
        this._spawnOne = value;
        if(this.spawnOne){
            this.oneTrig = new Trigger();
            this.oneTrig.RegisterEnterRectSimple(this.spawnOne.rectangle);
            this.oneTrig.AddCondition(() => this.EnteringUnitIsCreepAndHasNoCheckpoint());
            this.oneTrig.AddAction( () => this.SpawnAction(<CheckPoint>this.spawnOne));
        }

    }

    get spawnTwo(): CheckPoint | undefined {
        return this._spawnTwo;
    }

    set spawnTwo(value: CheckPoint | undefined) {
        this._spawnTwo = value;
        if(this.spawnTwo) {

            this.twoTrig = new Trigger();
            this.twoTrig.RegisterEnterRectSimple(this.spawnTwo.rectangle);
            this.twoTrig.AddCondition(() => this.EnteringUnitIsCreepAndHasNoCheckpoint());
            this.twoTrig.AddAction( () => this.SpawnAction(<CheckPoint>this.spawnTwo));

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
        if(this.spawnOne && !spawn.next){
                spawn = this.spawnOne;
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
