import { Trigger } from '../../../JassOverrides/Trigger';
import { Defender } from '../Players/Defender';
import * as settings from '../../GlobalSettings';
import { Log } from '../../../lib/Serilog/Serilog';
import { NagaSlave } from './WorkersUnion/NagaSlave';
import { Tower } from './Tower';
import { WarcraftMaul } from '../../WarcraftMaul';
import { OrcPeon } from './WorkersUnion/OrcPeon';
import { HumanPeasant } from './WorkersUnion/HumanPeasant';
import { UndeadAcolyte } from './WorkersUnion/UndeadAcolyte';
import { NightElfWisp } from './WorkersUnion/NightElfWisp';
import { SacrificialPit } from './Undead/SacrificialPit';
import { EndOfRoundTower } from './EndOfRoundTower';
import { GenericAutoAttackTower } from './GenericAutoAttackTower';


export class TowerConstruction {
    private towerConstructTrigger: Trigger;
    private towerTypes: Map<number, object> = new Map<number, object>();
    public genericAttacks: Map<number, GenericAutoAttackTower> = new Map<number, GenericAutoAttackTower>();
    private genericAttackTrigger: Trigger;
    private game: WarcraftMaul;

    constructor(game: WarcraftMaul) {
        Log.Debug('Starting towercons');
        this.game = game;
        this.InitTypes();
        this.towerConstructTrigger = new Trigger();
        this.towerConstructTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_CONSTRUCT_FINISH);
        this.towerConstructTrigger.AddAction(() => this.ConstructionFinished());
        this.genericAttackTrigger = new Trigger();
        this.genericAttackTrigger.RegisterPlayerUnitEventSimple(Player(COLOUR.NAVY), EVENT_PLAYER_UNIT_ATTACKED);
        this.genericAttackTrigger.RegisterPlayerUnitEventSimple(Player(COLOUR.TURQUOISE), EVENT_PLAYER_UNIT_ATTACKED);
        this.genericAttackTrigger.RegisterPlayerUnitEventSimple(Player(COLOUR.VOILET), EVENT_PLAYER_UNIT_ATTACKED);
        this.genericAttackTrigger.RegisterPlayerUnitEventSimple(Player(COLOUR.WHEAT), EVENT_PLAYER_UNIT_ATTACKED);
        this.genericAttackTrigger.AddAction(() => this.DoGenericTowerAttacks());
    }

    private ConstructionFinished(): void {
        const tower: unit = GetTriggerUnit();

        const owner: Defender | undefined = settings.players.get(GetPlayerId(GetOwningPlayer(tower)));
        UnitRemoveAbilityBJ(FourCC('ARal'), tower);

        if (!owner) {
            return;
        }
        let ObjectExtendsTower: Tower;

        const obj: object | undefined = this.towerTypes.get(GetUnitTypeId(tower));
        if (obj) {
            // @ts-ignore
            ObjectExtendsTower = new obj(tower, owner, this.game);
        } else {
            ObjectExtendsTower = new Tower(tower, owner, this.game);
        }
        if (ObjectExtendsTower.IsEndOfRoundTower()) {
            this.game.gameRoundHandler.endOfTurnTowers.set(ObjectExtendsTower.handleId, ObjectExtendsTower);
        }
        if (ObjectExtendsTower.IsAttackActionTower()) {
            this.game.gameDamageEngine.AddInitialDamageEventTower(ObjectExtendsTower.handleId, ObjectExtendsTower);
        }
        if (ObjectExtendsTower.IsGenericAutoAttackTower()) {
            this.genericAttacks.set(ObjectExtendsTower.handleId, ObjectExtendsTower);
        }
        if (ObjectExtendsTower.IsAreaEffectTower()) {
            let area: number | undefined;

            for (let i: number = 0; i < settings.PLAYER_AREAS.length; i++) {
                if (settings.PLAYER_AREAS[i].ContainsUnit(tower)) {
                    area = i;
                    break;
                }
            }
            if (area) {
                this.game.worldMap.playerSpawns[area].areaTowers.set(ObjectExtendsTower.handleId, ObjectExtendsTower);
            } else {
                Log.Fatal(`${GetUnitName(tower)} built outside of requires area. Please screenshot and report`);
            }
        }
    }

    private InitTypes(): void {
        this.towerTypes.set(FourCC('h03G'), NagaSlave);
        this.towerTypes.set(FourCC('h03E'), OrcPeon);
        this.towerTypes.set(FourCC('h03F'), HumanPeasant);
        this.towerTypes.set(FourCC('h03I'), UndeadAcolyte);
        this.towerTypes.set(FourCC('h03H'), NightElfWisp);
        this.towerTypes.set(FourCC('h00R'), SacrificialPit);
    }

    private DoGenericTowerAttacks(): void {
        for (const tower of this.genericAttacks.values()) {
            tower.GenericAttack();
        }
    }


}
