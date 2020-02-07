import { CheckPoint } from './CheckPoint';
import { Log } from '../../lib/Serilog/Serilog';
import { AbstractGameRound } from '../Game/BaseMaul/AbstractGameRound';
import { CreepAbility } from './CreepAbilities/specs/CreepAbility';
import { WarcraftMaul } from '../WarcraftMaul';

export class Creep {
    public creep: unit;
    public targetCheckpoint: CheckPoint | undefined;
    public gameRound: AbstractGameRound;
    public abilities: CreepAbility[];
    private readonly game: WarcraftMaul;

    constructor(creep: unit, gameRound: AbstractGameRound, abilities: CreepAbility[], game: WarcraftMaul) {
        this.creep = creep;
        this.gameRound = gameRound;
        this.game = game;
        this.AddArmorBonusByDifficulty();
        this.AddHPBonusByDifficulty();
        this.abilities = abilities;

    }

    public ReapplyMovement(): void {
        if (!this.targetCheckpoint) {
            Log.Fatal('Creep is missing pathing data');
            return;
        }
        IssuePointOrder(this.creep, 'move',
            GetRectCenterX(this.targetCheckpoint.rectangle),
            GetRectCenterY(this.targetCheckpoint.rectangle));
    }

    public printId(): void {
        // Log.Debug(this.getName());
    }

    public getName(): string {
        return GetUnitName(this.creep);
    }

    public getTypeId(): number {
        return GetUnitTypeId(this.creep);
    }

    public getHandleId(): number {
        return GetHandleIdBJ(this.creep);
    }


    public getLocation(): location {
        return GetUnitLoc(this.creep);
    }

    public MorningPerson(): void {
        const mdlFile: string = 'Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl';
        DestroyEffect(AddSpecialEffect(mdlFile, GetUnitX(this.creep), GetUnitY(this.creep)));
        SetUnitLifePercentBJ(GetEnteringUnit(), GetUnitLifePercent(this.creep) + 0.50 * this.gameRound.currentWave);
    }

    public AddCreepAbilities(): void {
        for (const ability of this.abilities) {
            ability.AddAbilityToCreep(this);
        }
    }

    public AddArmorBonusByDifficulty(): void {
        const unitArmorScaling: number = Math.round(BlzGetUnitArmor(this.creep) * (this.game.diffVote.difficulty / 100));
        BlzSetUnitArmor(this.creep, unitArmorScaling);
    }

    public AddHPBonusByDifficulty(): void {
        const unitHPScaling: number = Math.round(BlzGetUnitMaxHP(this.creep) * (this.game.diffVote.difficulty / 100));
        BlzSetUnitMaxHP(this.creep, unitHPScaling);
        SetUnitLifeBJ(this.creep, unitHPScaling);
    }

    public SetPostition(x: number, y: number): void {
        SetUnitPosition(this.creep, x, y);
    }

    public SetFacingDirection(facing: number): void {
        SetUnitFacing(this.creep, facing);
    }

    public OrderMove(x: number, y: number): void {
        IssuePointOrder(this.creep, 'move', x, y);
    }

    public GetCurrentOrder(): number {
        return GetUnitCurrentOrder(this.creep);
    }
}
