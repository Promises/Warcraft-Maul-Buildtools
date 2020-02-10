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
import { AntiJuggleTower } from '../../AntiJuggle/AntiJuggleTower';

export class Tower {


    private readonly _tower: unit;
    private readonly _UniqueID: number;
    private readonly _owner: Defender;
    private readonly _game: WarcraftMaul;
    private _towerValue: number;
    private _leaverOwned: boolean = false;
    private targetTick: number | undefined;

    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {
        this._game = game;
        this._tower = tower;
        this._UniqueID = GetHandleIdBJ(tower);
        this._owner = owner;
        this._towerValue = GetUnitGoldCost(this.GetTypeID());
        owner.AddTower(this);
    }

    public GetName(): string {
        return GetUnitName(this.tower);
    }

    public GetTypeID(): number {
        return GetUnitTypeId(this.tower);
    }

    public GetRectangle(): Rectangle {
        const x: number = GetUnitX(this.tower);
        const y: number = GetUnitX(this.tower);
        return new Rectangle([x - 64, y - 64, x + 64, y + 64]);
    }

    public get towerValue(): number {
        return this._towerValue;
    }

    public set towerValue(value: number) {
        this._towerValue = value;
    }

    public get game(): WarcraftMaul {
        return this._game;
    }

    public get UniqueID(): number {
        return this._UniqueID;
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

    public Upgrade(newTypeId: number): Tower {
        this.Sell();
        const u: unit = ReplaceUnitBJ(this.tower, newTypeId, bj_UNIT_STATE_METHOD_DEFAULTS);
        const newTower: Tower = this.game.worldMap.towerConstruction.SetupTower(u, this.owner);
        newTower._towerValue += this._towerValue;
        return newTower;
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

        if (this.IsEndOfRoundTower() && this.game.worldMap.gameRoundHandler) {
            this.game.worldMap.gameTurn.RemoveEndOfRoundTower(this.UniqueID);
        }
        if (this.IsAttackActionTower()) {
            this.game.gameDamageEngine.initialDamageEventTowers.delete(this.UniqueID);
        }
        if (this.IsTickingTower()) {
            this.game.towerTicker.RemoveTickingTower(this.UniqueID);
        }
        if (this.IsInitialDamageModificationTower()) {
            this.game.gameDamageEngine.initialDamageModificationEventTowers.delete(this.UniqueID);
        }
        if (this.IsGenericAutoAttackTower()) {
            this.game.worldMap.towerConstruction.genericAttacks.delete(this.UniqueID);
        }
        if (this.IsKillingActionTower()) {
            this.game.worldMap.towerConstruction.killingActions.delete(this.UniqueID);
        }
        if (this.IsSellActionTower()) {
            this.SellAction();
        }
        if (this.IsTowerForceTower()) {
            if (this.owner.towerForces.has(this.GetTypeID())) {
                this.owner.towerForces.set(this.GetTypeID(), <number>this.owner.towerForces.get(this.GetTypeID()) - 1);
                for (const towerx of this.owner.towersArray) {
                    if (towerx.IsTowerForceTower() && towerx.GetTypeID === this.GetTypeID) {
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
                this.game.worldMap.playerSpawns[area].areaTowers.delete(this.UniqueID);
            } else {
                Log.Fatal(`${GetUnitName(this.tower)} built outside of requires area, unable to remove. Please screenshot and report`);
            }
        }
        this.owner.RemoveTower(this.UniqueID);

    }

    public CastSpellOnAttackedUnitLocation(spell: string): void {
        const x: number = GetUnitX(GetAttackedUnitBJ());
        const y: number = GetUnitY(GetAttackedUnitBJ());
        IssuePointOrder(GetAttacker(), spell, x, y);
    }

    public SetOwnership(newOwner: Defender): Tower {
        SetUnitOwner(this.tower, newOwner.wcPlayer, true);
        this.Sell();
        const newTower: Tower = this.game.worldMap.towerConstruction.SetupTower(this.tower, newOwner);
        newTower._towerValue = this._towerValue;
        return newTower;
    }

    public GetSellValue(): number {
        return this.towerValue;
    }

    public Remove(): void {
        this.Sell();
        if (this.game.worldMap.gameRoundHandler && this.game.worldMap.gameRoundHandler.isWaveInProgress) {

            const antijuggle: AntiJuggleTower = new AntiJuggleTower(this._game, this);
        }
        RemoveUnit(this.tower);

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


    public isPaused(): boolean {
        return IsUnitPausedBJ(this.tower);
    }
}
