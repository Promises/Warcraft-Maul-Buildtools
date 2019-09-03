import { CheckPoint } from './CheckPoint';
import { WorldMap } from '../WorldMap';
import { Trigger } from '../../JassOverrides/Trigger';
import { SpawnedCreeps } from './SpawnedCreeps';
import { Creep } from './Creep';
import { PassiveCreepDiesInAreaEffectTower } from './Tower/Specs/PassiveCreepDiesInAreaEffectTower';
import { PLAYER_AREAS } from '../GlobalSettings';
import { Rectangle } from '../../JassOverrides/Rectangle';
import { Defender } from './Players/Defender';
import { CreepAbility } from './CreepAbilities/specs/CreepAbility';
import { Log } from '../../lib/Serilog/Serilog';
import { WaveCreep } from './WaveCreep';
import { GameRound } from '../Game/GameRound';

export class PlayerSpawns {
    private _spawnOne: CheckPoint | undefined;
    private _spawnTwo: CheckPoint | undefined;
    public areaTowers: Map<number, PassiveCreepDiesInAreaEffectTower> = new Map<number, PassiveCreepDiesInAreaEffectTower>();


    public oneTrig: Trigger | undefined;
    public twoTrig: Trigger | undefined;
    public isOpen: boolean;
    public worldMap: WorldMap;
    public colourId: number;
    private readonly area: Rectangle;
    private enterTrig: Trigger;

    constructor(worldMap: WorldMap, colourId: number) {
        this.worldMap = worldMap;
        this.isOpen = false;
        this.colourId = colourId;
        this.area = PLAYER_AREAS[this.colourId];
        this.enterTrig = new Trigger();
        this.enterTrig.RegisterEnterRectangle(this.area);
        this.enterTrig.AddAction(() => this.EnterRegions());
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

    public SpawnCreep(gameRound: GameRound,
                      spawned: Map<number, Creep>,
                      abilities: CreepAbility[],
                      wave: WaveCreep,
                      creepOwner: number): void {
        if (!this.isOpen) {
            return;
        }
        if (this.spawnOne) {

            let creep: unit = CreateUnit(
                Player(COLOUR.NAVY + creepOwner % 4),
                FourCC(wave.id),
                GetRectCenterX(this.spawnOne.rectangle),
                GetRectCenterY(this.spawnOne.rectangle),
                this.getSpawnFace(this.colourId));
            spawned.set(GetHandleId(creep), new Creep(creep, gameRound, abilities, this.worldMap.game));

            if (wave.wave !== 37) {
                if (this.spawnTwo) {

                    creep = CreateUnit(
                        Player(COLOUR.NAVY + creepOwner % 4),
                        FourCC(wave.id),
                        GetRectCenterX(this.spawnTwo.rectangle),
                        GetRectCenterY(this.spawnTwo.rectangle),
                        this.getSpawnFace(this.colourId));
                    spawned.set(GetHandleId(creep), new Creep(creep, gameRound, abilities, this.worldMap.game));
                }
            }
        }
    }

    private getSpawnFace(id: COLOUR): number {
        switch (id) {
            case COLOUR.RED:
            case COLOUR.PINK:
                return 180;
            case COLOUR.BLUE:
            case COLOUR.PURPLE:
            case COLOUR.YELLOW:
            case COLOUR.ORANGE:
            case COLOUR.GRAY:
            case COLOUR.BROWN:
            case COLOUR.MAROON:
                return 270;
            case COLOUR.TEAL:
            case COLOUR.GREEN:
                return 0;
            case COLOUR.LIGHT_BLUE:
            case COLOUR.DARK_GREEN:
                return 90;
            default:
                Log.Error(`getSpawnFace, could not find player: ${id}`);
                return 0;

        }
    }

    public EnteringUnitIsCreepAndHasNoCheckpoint(): boolean {
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
                    spawnedCreep.AddCreepAbilities();
                }

            }
        }

    }


    public AreaTowerActions(dyingCreep: Creep): void {
        for (const tower of this.areaTowers.values()) {
            tower.PassiveCreepDiesInAreaEffect(dyingCreep);
        }
    }

    private EnterRegions(): void {
        if (this.isEnteringUnitCreep()) {
            if (!this.isOpen) {
                if (!(UnitHasBuffBJ(GetEnteringUnit(), FourCC('Bblo')))) {
                    const dummy: unit = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('u008'), 0.0, -5300.0, bj_UNIT_FACING);
                    UnitAddAbilityBJ(FourCC('A068'), dummy);
                    IssueTargetOrderBJ(dummy, 'bloodlust', GetEnteringUnit());
                    UnitApplyTimedLifeBJ(1.00, FourCC('BTLF'), dummy);

                }
            } else {
                UnitRemoveBuffBJ(FourCC('Bblo'), GetEnteringUnit());
            }
        } else if (IsUnitType(GetEnteringUnit(), UNIT_TYPE_SUMMONED)) {
            if (GetUnitTypeId(GetTriggerUnit()) !== FourCC('u008')) {
                if (GetOwningPlayer(GetEnteringUnit()) !== Player(this.colourId)) {
                    SetUnitPosition(GetEnteringUnit(), this.area.GetCenterX(), this.area.GetCenterY());
                }
            }

        } else if (this.worldMap.game.players.get(this.colourId) && !IsUnitType(GetEnteringUnit(), UNIT_TYPE_STRUCTURE)) {
            const areaPlayer: Defender = <Defender>this.worldMap.game.players.get(this.colourId);
            if (areaPlayer.HasDenied(GetPlayerId(GetOwningPlayer(GetEnteringUnit())))) {
                SetUnitPosition(GetEnteringUnit(), PLAYER_AREAS[GetPlayerId(GetOwningPlayer(GetEnteringUnit()))].GetCenterX(), PLAYER_AREAS[GetPlayerId(GetOwningPlayer(GetEnteringUnit()))].GetCenterY());
            }
        }


    }
}
