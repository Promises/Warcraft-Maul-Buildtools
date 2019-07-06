import { CheckPoint } from './CheckPoint';
import { Log } from '../../lib/Serilog/Serilog';
import { GameRound } from '../Game/GameRound';
import { CreepAbility } from './CreepAbilities/specs/CreepAbility';

export class Creep {
    creep: unit;
    targetCheckpoint: CheckPoint | undefined;
    gameRound: GameRound;

    constructor(creep: unit, gameRound: GameRound, abilities: CreepAbility[]) {
        this.creep = creep;
        this.gameRound = gameRound;

        for (const ability of abilities) {
            ability.AddAbilityToCreep(this);
        }

    }

    ReapplyMovement(): void {
        if (!this.targetCheckpoint) {
            Log.Fatal('Creep is missing pathing data');
            return;
        }
        IssuePointOrder(this.creep, 'move',
                        GetRectCenterX(this.targetCheckpoint.rectangle),
                        GetRectCenterY(this.targetCheckpoint.rectangle));
    }

    printId(): void {
        Log.Debug(this.getName());
    }

    getName(): string {
        return GetUnitName(this.creep);
    }

    getId(): number {
        return GetUnitTypeId(this.creep);
    }

    getHandleId(): number {
        return GetHandleIdBJ(this.creep);
    }


    public getLocation(): location {
        return GetUnitLoc(this.creep);
    }

    public morningPerson(): void {
        const mdlFile: string = 'Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl';
        DestroyEffect(AddSpecialEffect(mdlFile, GetUnitX(this.creep), GetUnitY(this.creep)));
        SetUnitLifePercentBJ(GetEnteringUnit(), GetUnitLifePercent(this.creep) + 0.50 * this.gameRound.currentWave);
    }
}
