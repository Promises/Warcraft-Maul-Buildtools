import { CheckPoint } from './CheckPoint';
import { WorldMap } from '../WorldMap';
import { Trigger } from '../../JassOverrides/Trigger';
import { SpawnedCreeps } from './SpawnedCreeps';
import { Creep } from './Creep';
import { PassiveCreepDiesInAreaEffectTower } from './Tower/PassiveCreepDiesInAreaEffectTower';

export class PlayerSpawns {
    private _spawnOne: CheckPoint | undefined;
    private _spawnTwo: CheckPoint | undefined;
    public areaTowers: Map<number, PassiveCreepDiesInAreaEffectTower> = new Map<number, PassiveCreepDiesInAreaEffectTower>();


    oneTrig: Trigger | undefined;
    twoTrig: Trigger | undefined;
    isOpen: boolean;
    worldMap: WorldMap;

    constructor(worldMap: WorldMap) {
        this.worldMap = worldMap;
        this.isOpen = false;
    }


    get spawnOne(): CheckPoint | undefined {
        return this._spawnOne;
    }

    set spawnOne(value: CheckPoint | undefined) {
        this._spawnOne = value;
        if (this.spawnOne) {
            this.oneTrig = new Trigger();
            this.oneTrig.RegisterEnterRectSimple(this.spawnOne.rectangle);
            this.oneTrig.AddCondition(() => this.EnteringUnitIsCreepAndHasNoCheckpoint());
            this.oneTrig.AddAction(() => this.SpawnAction(<CheckPoint>this.spawnOne));
        }

    }

    get spawnTwo(): CheckPoint | undefined {
        return this._spawnTwo;
    }

    set spawnTwo(value: CheckPoint | undefined) {
        this._spawnTwo = value;
        if (this.spawnTwo) {

            this.twoTrig = new Trigger();
            this.twoTrig.RegisterEnterRectSimple(this.spawnTwo.rectangle);
            this.twoTrig.AddCondition(() => this.EnteringUnitIsCreepAndHasNoCheckpoint());
            this.twoTrig.AddAction(() => this.SpawnAction(<CheckPoint>this.spawnTwo));

        }
    }


    EnteringUnitIsCreepAndHasNoCheckpoint(): boolean {
        if (!this.isEnteringUnitCreep()) {
            return false;
        }

        const spawnedCreeps: SpawnedCreeps | undefined = this.worldMap.spawnedCreeps;
        if (spawnedCreeps !== undefined) {
            const spawnedCreep: Creep | undefined = spawnedCreeps.unitMap.get(GetHandleIdBJ(GetEnteringUnit()));
            if (spawnedCreep !== undefined) {
                if (spawnedCreep.targetCheckpoint) {
                    return false;
                }
            }
        }

        return true;
    }

    isEnteringUnitCreep(): boolean {
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

    private SpawnAction(spawn: CheckPoint): void {
        if (this.spawnOne && !spawn.next) {
            spawn = this.spawnOne;
        }
        if (!spawn.next) {
            return;
        }
        const spawnedCreeps: SpawnedCreeps | undefined = this.worldMap.spawnedCreeps;
        if (spawnedCreeps !== undefined) {
            const spawnedCreep: Creep | undefined = spawnedCreeps.unitMap.get(GetHandleIdBJ(GetEnteringUnit()));
            if (spawnedCreep) {
                if (spawn.next) {
                    spawnedCreep.targetCheckpoint = spawn.next;
                    IssuePointOrder(GetEnteringUnit(), 'move', GetRectCenterX(spawn.next.rectangle), GetRectCenterY(spawn.next.rectangle));
                    this.AddCreepAbilities();
                }

            }
        }

    }

    private AddCreepAbilities(): void {
        // TODO: Implement Creep abilities
    }

    public AreaTowerActions(dieingCreep: Creep): void {
        for (const tower of this.areaTowers.values()) {
            tower.PassiveCreepDiesInAreaEffect(dieingCreep);
        }
    }
}
