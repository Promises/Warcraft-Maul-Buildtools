import { Defender } from '../../Players/Defender';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { EndOfRoundTower } from './EndOfRoundTower';
import { AttackActionTower } from './AttackActionTower';
import { GenericAutoAttackTower } from './GenericAutoAttackTower';
import { PassiveCreepDiesInAreaEffectTower } from './PassiveCreepDiesInAreaEffectTower';
import * as settings from '../../../GlobalSettings';
import { Log } from '../../../../lib/Serilog/Serilog';
import { Rectangle } from '../../../../JassOverrides/Rectangle';
import { InitialDamageModificationTower } from './InitialDamageModificationTower';
import { KillingActionTower } from './KillingActionTower';
import { TowerForce } from './TowerForce';
import { LimitedTower } from './LimitedTower';
import { ConstructActionTower } from './ConstructActionTower';
import { SellActionTower } from './SellActionTower';
import { TickingTower } from './TickingTower';

export class Tower {

    private readonly _tower: unit;
    private readonly _handleId: number;
    private readonly _owner: Defender;
    private readonly _game: WarcraftMaul;
    private sellValue: number;
    private _leaverOwned: boolean = false;
    private targetTick: number | undefined;

    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {
        this._game = game;
        this._tower = tower;
        this._handleId = GetHandleIdBJ(tower);
        this._owner = owner;
        this.sellValue = GetUnitPointValue(tower);
        owner.AddTower(this);
    }

    public GetName(): string {
        return GetUnitName(this.tower);
    }

    public GetID(): number {
        return GetUnitTypeId(this.tower);
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

    public get leaverOwned(): boolean {
        return this._leaverOwned;
    }

    public set leaverOwned(value: boolean) {
        this._leaverOwned = value;
    }

    public IsEndOfRoundTower(): this is EndOfRoundTower {
        return 'EndOfRoundAction' in this;
    }

    public IsAttackActionTower(): this is AttackActionTower {
        return 'AttackAction' in this;
    }


    public IsInitialDamageModificationTower(): this is InitialDamageModificationTower {
        return 'InitialDamageModification' in this;
    }

    public IsGenericAutoAttackTower(): this is GenericAutoAttackTower {
        return 'GenericAttack' in this;
    }

    public IsKillingActionTower(): this is KillingActionTower {
        return 'KillingAction' in this;
    }


    public IsAreaEffectTower(): this is PassiveCreepDiesInAreaEffectTower {
        return 'PassiveCreepDiesInAreaEffect' in this;
    }

    public IsTowerForceTower(): this is TowerForce {
        return 'UpdateSize' in this;
    }

    public IsConstructActionTower(): this is ConstructActionTower {
        return 'ConstructionFinished' in this;
    }

    public IsSellActionTower(): this is SellActionTower {
        return 'SellAction' in this;
    }

    public IsLimitedTower(): this is LimitedTower {
        return 'MaxCount' in this;
    }

    public IsTickingTower(): this is TickingTower {
        return 'GetTickModulo' in this;
    }

    public Sell(): void {

        Log.Debug(`Selling for: ${Util.Round(0.75 * GetUnitGoldCost(this.GetID()))}`);
        if (this.IsEndOfRoundTower()) {
            this.game.gameRoundHandler.endOfTurnTowers.delete(this.handleId);
        }
        if (this.IsAttackActionTower()) {
            this.game.gameDamageEngine.initialDamageEventTowers.delete(this.handleId);
        }
        if (this.IsTickingTower()) {
            this.game.towerTicker.RemoveTickingTower(this.handleId);
        }
        if (this.IsInitialDamageModificationTower()) {
            this.game.gameDamageEngine.initialDamageModificationEventTowers.delete(this.handleId);
        }
        if (this.IsGenericAutoAttackTower()) {
            this.game.worldMap.towerConstruction.genericAttacks.delete(this.handleId);
        }
        if (this.IsKillingActionTower()) {
            this.game.worldMap.towerConstruction.killingActions.delete(this.handleId);
        }
        if (this.IsSellActionTower()) {
            this.SellAction();
        }
        if (this.IsTowerForceTower()) {
            if (this.owner.towerForces.has(this.GetID())) {
                this.owner.towerForces.set(this.GetID(), <number>this.owner.towerForces.get(this.GetID()) - 1);
                for (const towerx of this.owner.towersArray) {
                    if (towerx.IsTowerForceTower() && towerx.GetID === this.GetID) {
                        towerx.UpdateSize();
                    }
                }
            }
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
        this.owner.RemoveTower(this.handleId);

    }

    public CastSpellOnAttackedUnitLocation(spell: string): void {
        const x: number = GetUnitX(GetAttackedUnitBJ());
        const y: number = GetUnitY(GetAttackedUnitBJ());
        IssuePointOrder(GetAttacker(), spell, x, y);
    }

    public SetOwnership(newOwner: Defender): Tower {
        SetUnitOwner(this.tower, newOwner.wcPlayer, true);
        return this.game.worldMap.towerConstruction.SetupTower(this.tower, newOwner);
    }

    public SetLeaverSellValue(): void {
        this.sellValue *= 0.3;
        this._leaverOwned = true;
    }

    public GetSellValue(): number {
        return this.sellValue;
    }


    /**
     * Helper Functions for TickingTower
     */
    public IsTargetTick(currentTick: number, modulo: number): boolean {
        if (!this.IsTickingTower()) {
            Log.Debug(`${this.GetName()} is not a ticking tower`);
            return false;
        }
        if (this.targetTick === undefined) {
            this.SetTargetTick(currentTick, modulo);
            return false;
        }
        if (currentTick >= this.targetTick) {
            this.SetTargetTick(currentTick, modulo);
            return true;
        }
        return false;
    }

    private SetTargetTick(currentTick: number, modulo: number): void {
        if (!this.IsTickingTower()) {
            Log.Debug(`${this.GetName()} is not a ticking tower`);
            return;
        }
        this.targetTick = (currentTick + this.GetTickModulo()) % modulo;
    }
    /**
     * End Helper Functions for TickingTower
     */

}
