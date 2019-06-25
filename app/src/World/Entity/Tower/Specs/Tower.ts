import { Defender } from '../../Players/Defender';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { EndOfRoundTower } from './EndOfRoundTower';
import { AttackActionTower } from './AttackActionTower';
import { GenericAutoAttackTower } from './GenericAutoAttackTower';
import { PassiveCreepDiesInAreaEffectTower } from './PassiveCreepDiesInAreaEffectTower';
import * as settings from '../../../GlobalSettings';
import { Log } from '../../../../lib/Serilog/Serilog';
import { Rectangle } from '../../../../JassOverrides/Rectangle';

export class Tower {
    private _tower: unit;
    private _handleId: number;
    private _owner: Defender;
    private _game: WarcraftMaul;

    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {
        this._game = game;
        this._tower = tower;
        this._handleId = GetHandleIdBJ(tower);
        this._owner = owner;
        owner.AddTower(this);

    }

    public GetName(): string {
        return GetUnitName(this.tower);
    }

    public GetRectangle(): Rectangle {
        const x: number = GetUnitX(this.tower);
        const y: number = GetUnitX(this.tower);
        return new Rectangle([x - 64, y - 64, x + 64, y + 64]);
    }

    public get game(): WarcraftMaul {
        return this._game;
    }

    public get handleId(): number {
        return this._handleId;
    }

    public get owner(): Defender {
        return this._owner;
    }

    public get tower(): unit {
        return this._tower;
    }

    public IsEndOfRoundTower(): this is EndOfRoundTower {
        return 'EndOfRoundAction' in this;
    }

    public IsAttackActionTower(): this is AttackActionTower {
        return 'AttackAction' in this;
    }

    public IsGenericAutoAttackTower(): this is GenericAutoAttackTower {
        return 'GenericAttack' in this;
    }

    public IsAreaEffectTower(): this is PassiveCreepDiesInAreaEffectTower {
        return 'PassiveCreepDiesInAreaEffect' in this;
    }


    public Sell(): void {
        this.owner.towers.delete(this.handleId);
        if (this.IsEndOfRoundTower()) {
            this.game.gameRoundHandler.endOfTurnTowers.delete(this.handleId);
        }
        if (this.IsAttackActionTower()) {
            this.game.gameDamageEngine.initialDamageEventTowers.delete(this.handleId);
        }
        if (this.IsGenericAutoAttackTower()) {
            this.game.worldMap.towerConstruction.genericAttacks.delete(this.handleId);
        }
        if (this.IsAreaEffectTower()) {
            let area: number | undefined;

            for (let i: number = 0; i < settings.PLAYER_AREAS.length; i++) {
                if (settings.PLAYER_AREAS[i].ContainsUnit(this.tower)) {
                    area = i;
                    break;
                }
            }
            if (area) {
                this.game.worldMap.playerSpawns[area].areaTowers.delete(this.handleId);
            } else {
                Log.Fatal(`${GetUnitName(this.tower)} built outside of requires area, unable to remove. Please screenshot and report`);
            }
        }

    }

    public CastSpellOnAttackedUnitLocation(spell: string): void {
        const x: number = GetUnitX(GetAttackedUnitBJ());
        const y: number = GetUnitY(GetAttackedUnitBJ());
        IssuePointOrder(GetAttacker(), spell, x, y);
    }
}
