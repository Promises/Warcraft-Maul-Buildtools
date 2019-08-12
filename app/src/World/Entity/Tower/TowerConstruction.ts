import { Trigger } from '../../../JassOverrides/Trigger';
import { Defender } from '../Players/Defender';
import * as settings from '../../GlobalSettings';
import { Log } from '../../../lib/Serilog/Serilog';
import { Tower } from './Specs/Tower';
import { WarcraftMaul } from '../../WarcraftMaul';
import { GenericAutoAttackTower } from './Specs/GenericAutoAttackTower';
import { LootBoxerHandler } from './Races/LootBoxer/LootBoxerHandler';
import { KillingActionTower } from './Specs/KillingActionTower';
import { TowerMap } from './Specs/TowerMap';
import { RaceTowers } from './Races/RaceTowers';
import { InitialiseAllRaceTowers } from './Races/RaceInitialiser';


export class TowerConstruction {
    private races: RaceTowers[] = [];

    get towerTypes(): TowerMap<number, object> {
        return this._towerTypes;
    }

    private towerConstructTrigger: Trigger;
    private towerRemoveUpgradeTrigger: Trigger;
    private readonly _towerTypes: TowerMap<number, object>;
    public genericAttacks: Map<number, GenericAutoAttackTower> = new Map<number, GenericAutoAttackTower>();
    public killingActions: Map<number, KillingActionTower> = new Map<number, KillingActionTower>();
    private genericAttackTrigger: Trigger;
    private killingActionsTrigger: Trigger;
    private readonly game: WarcraftMaul;
    private lootBoxerHander: LootBoxerHandler;
    public lootBoxerTowers: number[] = [
        FourCC('u044'), // Tier 1
        FourCC('u045'), // Tier 2
        FourCC('u047'), // Tier 3
        FourCC('u046'), // Tier 4
        FourCC('u048'), // Tier 5
        FourCC('u049'), // Tier 6
        FourCC('u04A'), // Tier 7
        FourCC('u04B'), // Tier 8
        FourCC('u04C'), // Tier 9
    ];

    constructor(game: WarcraftMaul) {
        this.game = game;
        this._towerTypes = InitialiseAllRaceTowers();
        this.lootBoxerHander = new LootBoxerHandler(this, game);
        this.towerConstructTrigger = new Trigger();
        this.towerConstructTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_CONSTRUCT_FINISH);
        this.towerConstructTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_UPGRADE_FINISH);
        this.towerConstructTrigger.AddAction(() => this.ConstructionFinished());

        this.towerRemoveUpgradeTrigger = new Trigger();
        this.towerRemoveUpgradeTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_UPGRADE_START);
        this.towerRemoveUpgradeTrigger.AddAction(() => this.RemoveUpgradingTower());


        this.genericAttackTrigger = new Trigger();
        this.genericAttackTrigger.RegisterPlayerUnitEventSimple(Player(COLOUR.NAVY), EVENT_PLAYER_UNIT_ATTACKED);
        this.genericAttackTrigger.RegisterPlayerUnitEventSimple(Player(COLOUR.TURQUOISE), EVENT_PLAYER_UNIT_ATTACKED);
        this.genericAttackTrigger.RegisterPlayerUnitEventSimple(Player(COLOUR.VOILET), EVENT_PLAYER_UNIT_ATTACKED);
        this.genericAttackTrigger.RegisterPlayerUnitEventSimple(Player(COLOUR.WHEAT), EVENT_PLAYER_UNIT_ATTACKED);
        this.genericAttackTrigger.AddAction(() => this.DoGenericTowerAttacks());

        this.killingActionsTrigger = new Trigger();
        this.killingActionsTrigger.RegisterPlayerUnitEventSimple(Player(COLOUR.NAVY), EVENT_PLAYER_UNIT_DEATH);
        this.killingActionsTrigger.RegisterPlayerUnitEventSimple(Player(COLOUR.TURQUOISE), EVENT_PLAYER_UNIT_DEATH);
        this.killingActionsTrigger.RegisterPlayerUnitEventSimple(Player(COLOUR.VOILET), EVENT_PLAYER_UNIT_DEATH);
        this.killingActionsTrigger.RegisterPlayerUnitEventSimple(Player(COLOUR.WHEAT), EVENT_PLAYER_UNIT_DEATH);
        this.killingActionsTrigger.AddAction(() => this.DoKillingTowerActions());
    }

    private RemoveUpgradingTower(): void {
        const tower: unit = GetTriggerUnit();
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(tower)));
        if (!owner) {
            return;
        }
        const instance: Tower | undefined = owner.towers.get(GetHandleIdBJ(tower));
        if (instance) {
            instance.Sell();
        }
    }

    private ConstructionFinished(): void {
        const tower: unit = GetTriggerUnit();

        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(tower)));
        UnitRemoveAbilityBJ(FourCC('ARal'), tower);

        if (!owner) {
            return;
        }

        this.SetupTower(tower, owner);
    }

    public SetupTower(tower: unit, owner: Defender): Tower {
        let ObjectExtendsTower: Tower;
        if (this.isLootBoxer(tower)) {
            tower = this.lootBoxerHander.handleLootBoxTower(tower, owner, this.lootBoxerTowers.indexOf(GetUnitTypeId(tower)));
            UnitRemoveAbilityBJ(FourCC('ARal'), tower);
        }

        const obj: object | undefined = this._towerTypes.get(GetUnitTypeId(tower));
        if (obj) {
            // @ts-ignore
            ObjectExtendsTower = new obj(tower, owner, this.game);
        } else {
            ObjectExtendsTower = new Tower(tower, owner, this.game);
        }
        if (false) { //disables code
            //
            // if (ObjectExtendsTower.IsEndOfRoundTower()) {
            //     this.game.gameRoundHandler.endOfTurnTowers.set(ObjectExtendsTower.handleId, ObjectExtendsTower);
            // }
            // if (ObjectExtendsTower.IsAttackActionTower()) {
            //     this.game.gameDamageEngine.AddInitialDamageEventTower(ObjectExtendsTower.handleId, ObjectExtendsTower);
            // }
            //
            // if (ObjectExtendsTower.IsInitialDamageModificationTower()) {
            //     this.game.gameDamageEngine.AddInitialDamageModificationEventTower(ObjectExtendsTower.handleId, ObjectExtendsTower);
            // }
            //
            // if (ObjectExtendsTower.IsGenericAutoAttackTower()) {
            //     this.genericAttacks.set(ObjectExtendsTower.handleId, ObjectExtendsTower);
            // }
            // if (ObjectExtendsTower.IsKillingActionTower()) {
            //     this.killingActions.set(ObjectExtendsTower.handleId, ObjectExtendsTower);
            // }
            // if (ObjectExtendsTower.IsLimitedTower()) {
            //     SetPlayerTechMaxAllowedSwap(GetUnitTypeId(ObjectExtendsTower.tower), ObjectExtendsTower.MaxCount(), owner.wcPlayer);
            // }
            // if (ObjectExtendsTower.IsConstructActionTower()) {
            //     ObjectExtendsTower.ConstructionFinished();
            // }
            // if (ObjectExtendsTower.IsTickingTower()) {
            //     this.game.towerTicker.AddTickingTower(ObjectExtendsTower.handleId, ObjectExtendsTower);
            // }
            // if (ObjectExtendsTower.IsTowerForceTower()) {
            //     if (owner.towerForces.has(ObjectExtendsTower.GetID())) {
            //         owner.towerForces.set(ObjectExtendsTower.GetID(), <number>owner.towerForces.get(ObjectExtendsTower.GetID()) + 1);
            //         for (const towerx of owner.towers.values()) {
            //             if (towerx.IsTowerForceTower() && towerx.GetID === ObjectExtendsTower.GetID) {
            //                 towerx.UpdateSize();
            //             }
            //         }
            //     } else {
            //         owner.towerForces.set(ObjectExtendsTower.GetID(), 1);
            //     }
            // }
            //
            //
            // if (ObjectExtendsTower.IsAreaEffectTower()) {
            //     let area: number | undefined;
            //
            //     for (let i: number = 0; i < settings.PLAYER_AREAS.length; i++) {
            //         if (settings.PLAYER_AREAS[i].ContainsUnit(tower)) {
            //             area = i;
            //             break;
            //         }
            //     }
            //     if (area) {
            //         this.game.worldMap.playerSpawns[area].areaTowers.set(ObjectExtendsTower.handleId, ObjectExtendsTower);
            //     } else {
            //         Log.Fatal(`${GetUnitName(tower)} built outside of requires area. Please screenshot and report`);
            //     }
            // }
        }
        // Log.Event(1, `{"tower":"${DecodeFourCC(ObjectExtendsTower.GetID())}", "owner": "${ObjectExtendsTower.owner.GetLogStr()}"}`);
        return ObjectExtendsTower;
    }


    private DoGenericTowerAttacks(): void {
        const generic: GenericAutoAttackTower | undefined = this.genericAttacks.get(GetHandleId(GetAttacker()));
        if (generic) {
            generic.GenericAttack();
        }
    }

    private DoKillingTowerActions(): void {
        const killing: KillingActionTower | undefined = this.killingActions.get(GetHandleId(GetKillingUnit()));
        if (killing) {
            killing.KillingAction();
        }
    }

    private isLootBoxer(tower: unit): boolean {
        return this.lootBoxerTowers.indexOf(GetUnitTypeId(tower)) > -1;
    }
}
