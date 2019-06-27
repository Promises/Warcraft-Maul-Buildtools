import { Trigger } from '../../../JassOverrides/Trigger';
import { Defender } from '../Players/Defender';
import * as settings from '../../GlobalSettings';
import { Log } from '../../../lib/Serilog/Serilog';
import { NagaSlave } from './WorkersUnion/NagaSlave';
import { Tower } from './Specs/Tower';
import { WarcraftMaul } from '../../WarcraftMaul';
import { OrcPeon } from './WorkersUnion/OrcPeon';
import { HumanPeasant } from './WorkersUnion/HumanPeasant';
import { UndeadAcolyte } from './WorkersUnion/UndeadAcolyte';
import { NightElfWisp } from './WorkersUnion/NightElfWisp';
import { SacrificialPit } from './Undead/SacrificialPit';
import { EndOfRoundTower } from './Specs/EndOfRoundTower';
import { GenericAutoAttackTower } from './Specs/GenericAutoAttackTower';
import { EarthPandaren } from './Tavern/EarthPandaren';
import { StormPandaren } from './Tavern/StormPandaren';
import { FirePandaren } from './Tavern/FirePandaren';
import { AcidSpittingSpider } from './Arachnid/AcidSpittingSpider';
import { NerubianBehemoth } from './Arachnid/NerubianBehemoth';
import { CavernDruid } from './CavernousCreatures/CavernDruid';
import { CavernHermit } from './CavernousCreatures/CavernHermit';
import { CavernMushroom } from './CavernousCreatures/CavernMushroom';
import { CavernRevenant } from './CavernousCreatures/CavernRevenant';
import { CavernTurtle } from './CavernousCreatures/CavernTurtle';
import { CorruptedTreeofLife } from './CorruptedNightElves/CorruptedTreeofLife';
import { FelGuard } from './Demon/FelGuard';
import { Mannoroth } from './Demon/Mannoroth';
import { SummoningShrine } from './Demon/SummoningShrine';
import { KilJaeden } from './Demon/KilJaeden';
import { DwarfKing } from './Dwaven/DwarfKing';
import { MoonDancer } from './Galaxy/MoonDancer';


export class TowerConstruction {
    private towerConstructTrigger: Trigger;
    private towerRemoveUpgradeTrigger: Trigger;
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
    }

    private RemoveUpgradingTower(): void {
        const tower: unit = GetTriggerUnit();
        const owner: Defender | undefined = settings.players.get(GetPlayerId(GetOwningPlayer(tower)));
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

        // WorkersUnion
        this.towerTypes.set(FourCC('h03G'), NagaSlave);
        this.towerTypes.set(FourCC('h03E'), OrcPeon);
        this.towerTypes.set(FourCC('h03F'), HumanPeasant);
        this.towerTypes.set(FourCC('h03I'), UndeadAcolyte);
        this.towerTypes.set(FourCC('h03H'), NightElfWisp);

        // Undead
        this.towerTypes.set(FourCC('h00R'), SacrificialPit);

        // Tavern
        this.towerTypes.set(FourCC('h01F'), EarthPandaren);
        this.towerTypes.set(FourCC('h01J'), StormPandaren);
        this.towerTypes.set(FourCC('h01I'), FirePandaren);

        // Arachnid
        this.towerTypes.set(FourCC('o019'), AcidSpittingSpider);
        this.towerTypes.set(FourCC('h00W'), NerubianBehemoth);

        // Cavernous Creatures
        this.towerTypes.set(FourCC('h04Q'), CavernDruid);
        this.towerTypes.set(FourCC('h04M'), CavernHermit);
        this.towerTypes.set(FourCC('h04T'), CavernMushroom);
        this.towerTypes.set(FourCC('h04O'), CavernRevenant);
        this.towerTypes.set(FourCC('h04N'), CavernTurtle);

        // CorruptedNightElves
        this.towerTypes.set(FourCC('n00P'), CorruptedTreeofLife);

        // Demon
        this.towerTypes.set(FourCC('h03W'), FelGuard);
        this.towerTypes.set(FourCC('o00L'), Mannoroth);
        this.towerTypes.set(FourCC('n00U'), SummoningShrine);
        this.towerTypes.set(FourCC('eC93'), KilJaeden);


        // Dwarven
        this.towerTypes.set(FourCC('n05Q'), DwarfKing);

        // Galaxy
        this.towerTypes.set(FourCC('e00K'), MoonDancer);


    }

    private DoGenericTowerAttacks(): void {
        for (const tower of this.genericAttacks.values()) {
            tower.GenericAttack();
        }
    }


}
