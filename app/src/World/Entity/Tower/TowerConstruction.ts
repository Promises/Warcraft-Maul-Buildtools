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
import { OgreWarrior } from './Giants/OgreWarrior';
import { GoblinMineLayer } from './Goblin/GoblinMineLayer';
import { GoblinTinkerer } from './Goblin/GoblinTinkerer';
import { GoblinBlademaster } from './Goblin/GoblinBlademaster';
import { VenomTower } from './Human/VenomTower';
import { LootBoxerHandler } from './LootBoxer/LootBoxerHandler';
import { Wyvern } from './Aviaries/Wyvern';
import { AntiJuggleTower } from './AntiJuggle/AntiJuggleTower';
import { DemonicIllidan } from './NightElf/DemonicIllidan';
import { CorruptedIllidan } from './NightElf/CorruptedIllidan';
import { Warden } from './NightElf/Warden';
import { Rokhan } from './OrcStronghold/Rokhan';
import { WarchiefThrall } from './OrcStronghold/WarchiefThrall';
import { Magtheridon } from './Outland/Magtheridon';
import { Prawn } from './Summons/Prawn';
import { Wisp } from './NightElf/Wisp';
import { VoidPriest } from './Void/VoidPriest';
import { KodoBeast } from './ShrineOfBuffs/KodoBeast';
import { Berserker } from './OrcStronghold/Berserker';
import { DemonizedDreadlord } from './Demon/DemonizedDreadlord';
import { VoidFissure } from './Void/VoidFissure';
import { ParasiticBroodmother } from './Arachnid/ParasiticBroodmother';
import { DraeneiSeer } from './Draenei/DraeneiSeer';
import { Akama } from './Draenei/Akama';
import { SalamanderLord } from './Draenei/SalamanderLord';
import { Gyrocopter } from './Aviaries/Gyrocopter';
import { FleshGolem } from './Giants/FleshGolem';
import { Kael } from './HighElven/Kael';
import { LavaSpawn } from './Summons/LavaSpawn';
import { StarChaser } from './Galaxy/StarChaser';
import { CelestialMist } from './Galaxy/CelestialMist';
import { FlyingDwarf } from './Dwaven/FlyingDwarf';
import { SirGalahad } from './Human/SirGalahad';
import { ForestTrollHighPriest } from './ForestTrolls/ForestTrollHighPriest';
import { GoblinSapper } from './Goblin/GoblinSapper';
import { GoblinAlchemist } from './Goblin/GoblinAlchemist';
import { BronzeDragonWhelp } from './Dragons/BronzeDragonWhelp';
import { BronzeDrake } from './Dragons/BronzeDrake';
import { BronzeDragon } from './Dragons/BronzeDragon';
import { GargoyleSpire } from './Forsaken/GargoyleSpire';
import { Varimathras } from './Forsaken/Varimathras';
import { GrowthLvl2 } from './CavernousCreatures/Growth/GrowthLvl2';
import { GrowthLvl3 } from './CavernousCreatures/Growth/GrowthLvl3';
import { AncientMonstrosity } from './Unique/AncientMonstrosity';
import { KillingActionTower } from './Specs/KillingActionTower';
import { Hydralisk } from './Unique/Hydralisk';
import { Marine } from './Unique/Marine';
import { ProudMoore } from './Unique/ProudMoore';
import { Sammy } from './Unique/Sammy';
import { TowerMap } from './Specs/TowerMap';
import { ZerglingHive } from './Unique/ZerglingHive';
import { TheDarkness } from './Unique/TheDarkness';
import { CrackedBarrel } from './Arachnid/CrackedBarrel';
import { VoidWorshipper } from './Void/VoidWorshipper';
import { VoidBeing } from './Void/VoidBeing';
import { VoidCorrupter } from './Void/VoidCorrupter';
import { AncientProtector } from './NightElf/AncientProtector';


export class TowerConstruction {
    get towerTypes(): TowerMap<number, object> {
        return this._towerTypes;
    }

    private towerConstructTrigger: Trigger;
    private towerRemoveUpgradeTrigger: Trigger;
    private _towerTypes: TowerMap<number, object> = new TowerMap<number, object>();
    public genericAttacks: Map<number, GenericAutoAttackTower> = new Map<number, GenericAutoAttackTower>();
    public killingActions: Map<number, KillingActionTower> = new Map<number, KillingActionTower>();
    private genericAttackTrigger: Trigger;
    private killingActionsTrigger: Trigger;
    private game: WarcraftMaul;
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
        Log.Debug('Starting towercons');
        this.game = game;
        this.InitTypes();
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
        if (ObjectExtendsTower.IsEndOfRoundTower()) {
            this.game.gameRoundHandler.endOfTurnTowers.set(ObjectExtendsTower.handleId, ObjectExtendsTower);
        }
        if (ObjectExtendsTower.IsAttackActionTower()) {
            this.game.gameDamageEngine.AddInitialDamageEventTower(ObjectExtendsTower.handleId, ObjectExtendsTower);
        }

        if (ObjectExtendsTower.IsInitialDamageModificationTower()) {
            this.game.gameDamageEngine.AddInitialDamageModificationEventTower(ObjectExtendsTower.handleId, ObjectExtendsTower);
        }

        if (ObjectExtendsTower.IsGenericAutoAttackTower()) {
            this.genericAttacks.set(ObjectExtendsTower.handleId, ObjectExtendsTower);
        }
        if (ObjectExtendsTower.IsKillingActionTower()) {
            this.killingActions.set(ObjectExtendsTower.handleId, ObjectExtendsTower);
        }
        if (ObjectExtendsTower.IsLimitedTower()) {
            SetPlayerTechMaxAllowedSwap(GetUnitTypeId(ObjectExtendsTower.tower), ObjectExtendsTower.MaxCount(), owner.wcPlayer);
        }
        if (ObjectExtendsTower.IsConstructActionTower()) {
            ObjectExtendsTower.ConstructionFinished();
        }
        if (ObjectExtendsTower.IsTowerForceTower()) {
            if (owner.towerForces.has(ObjectExtendsTower.GetID())) {
                owner.towerForces.set(ObjectExtendsTower.GetID(), <number>owner.towerForces.get(ObjectExtendsTower.GetID()) + 1);
                for (const towerx of owner.towers.values()) {
                    if (towerx.IsTowerForceTower() && towerx.GetID === ObjectExtendsTower.GetID) {
                        towerx.UpdateSize();
                    }
                }
            } else {
                owner.towerForces.set(ObjectExtendsTower.GetID(), 1);
            }
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
        return ObjectExtendsTower;
    }

    private InitTypes(): void {

        // const oldset: (key: number, value: object) => Map<number, object> = this._towerTypes.set;


        // WorkersUnion
        this._towerTypes.add(FourCC('h03G'), NagaSlave);
        this._towerTypes.add(FourCC('h03E'), OrcPeon);
        this._towerTypes.add(FourCC('h03F'), HumanPeasant);
        this._towerTypes.add(FourCC('h03I'), UndeadAcolyte);
        this._towerTypes.add(FourCC('h03H'), NightElfWisp);

        // Undead
        this._towerTypes.add(FourCC('h00R'), SacrificialPit);

        // Tavern
        this._towerTypes.add(FourCC('h01F'), EarthPandaren);
        this._towerTypes.add(FourCC('h01J'), StormPandaren);
        this._towerTypes.add(FourCC('h01I'), FirePandaren);

        // Arachnid
        this._towerTypes.add(FourCC('o019'), AcidSpittingSpider);
        this._towerTypes.add(FourCC('h00W'), NerubianBehemoth);
        this._towerTypes.add(FourCC('o01A'), ParasiticBroodmother);
        this._towerTypes.add(FourCC('h03T'), CrackedBarrel);

        // Aviaries
        this._towerTypes.add(FourCC('oC60'), Wyvern);
        this._towerTypes.add(FourCC('hC36'), Gyrocopter);


        // Cavernous Creaaddes
        this._towerTypes.add(FourCC('h04Q'), CavernDruid);
        this._towerTypes.add(FourCC('h04M'), CavernHermit);
        this._towerTypes.add(FourCC('h04T'), CavernMushroom);
        this._towerTypes.add(FourCC('h04O'), CavernRevenant);
        this._towerTypes.add(FourCC('h04N'), CavernTurtle);
        this._towerTypes.add(FourCC('h04S'), GrowthLvl2);
        this._towerTypes.add(FourCC('h04L'), GrowthLvl3);

        // CorruptedNightaddes
        this._towerTypes.add(FourCC('n00P'), CorruptedTreeofLife);

        // Demon
        this._towerTypes.add(FourCC('h03W'), FelGuard);
        this._towerTypes.add(FourCC('o00L'), Mannoroth);
        this._towerTypes.add(FourCC('n00U'), SummoningShrine);
        this._towerTypes.add(FourCC('eC93'), KilJaeden);
        this._towerTypes.add(FourCC('h00F'), DemonizedDreadlord);

        // Draenei
        this._towerTypes.add(FourCC('h04F'), DraeneiSeer);
        this._towerTypes.add(FourCC('h00I'), Akama);
        this._towerTypes.add(FourCC('h04I'), SalamanderLord);

        // Dragons
        this._towerTypes.add(FourCC('o00M'), BronzeDragonWhelp);
        this._towerTypes.add(FourCC('o01F'), BronzeDrake);
        this._towerTypes.add(FourCC('o01K'), BronzeDragon);


        // Dwarven
        this._towerTypes.add(FourCC('n05Q'), DwarfKing);
        this._towerTypes.add(FourCC('n05N'), FlyingDwarf);

        // Forest Trolls
        this._towerTypes.add(FourCC('n03I'), ForestTrollHighPriest);

        // Forsaken
        this._towerTypes.add(FourCC('u00F'), GargoyleSpire);
        this._towerTypes.add(FourCC('u012'), Varimathras);

        // Galaxy
        this._towerTypes.add(FourCC('e00K'), MoonDancer);
        this._towerTypes.add(FourCC('e00P'), StarChaser);
        this._towerTypes.add(FourCC('e00R'), CelestialMist);

        // Giants
        this._towerTypes.add(FourCC('oC35'), OgreWarrior);
        this._towerTypes.add(FourCC('o00G'), FleshGolem);

        // Goblin
        this._towerTypes.add(FourCC('o01R'), GoblinMineLayer);
        this._towerTypes.add(FourCC('o01S'), GoblinTinkerer);
        this._towerTypes.add(FourCC('o01P'), GoblinBlademaster);
        this._towerTypes.add(FourCC('o01M'), GoblinSapper);
        this._towerTypes.add(FourCC('o01O'), GoblinAlchemist);

        // High Elven
        this._towerTypes.add(FourCC('o00N'), Kael);

        // Human
        this._towerTypes.add(FourCC('h045'), VenomTower);
        this._towerTypes.add(FourCC('n05C'), SirGalahad);

        // Night Elf
        this._towerTypes.add(FourCC('h00S'), DemonicIllidan);
        this._towerTypes.add(FourCC('eC83'), CorruptedIllidan);
        this._towerTypes.add(FourCC('h00G'), Warden);
        this._towerTypes.add(FourCC('e00E'), Wisp);
        this._towerTypes.add(FourCC('hC82'), AncientProtector);


        // Orc Stronghold
        this._towerTypes.add(FourCC('h002'), Rokhan);
        this._towerTypes.add(FourCC('oC65'), WarchiefThrall);
        this._towerTypes.add(FourCC('o00E'), Berserker);

        // Outland
        this._towerTypes.add(FourCC('u01C'), Magtheridon);


        // Summons
        this._towerTypes.add(FourCC('h027'), Prawn);
        this._towerTypes.add(FourCC('h026'), LavaSpawn);

        // Shrine of buffadd
        this._towerTypes.add(FourCC('oC58'), KodoBeast);

        // Void
        this._towerTypes.add(FourCC('h02F'), VoidPriest);
        this._towerTypes.add(FourCC('h01M'), VoidFissure);
        this._towerTypes.add(FourCC('h02G'), VoidWorshipper);
        this._towerTypes.add(FourCC('h00T'), VoidBeing);
        this._towerTypes.add(FourCC('h01A'), VoidCorrupter);

        // Unique
        this._towerTypes.add(FourCC('h02K'), AncientMonstrosity);
        this._towerTypes.add(FourCC('h02L'), Hydralisk);
        this._towerTypes.add(FourCC('h02H'), Marine);
        this._towerTypes.add(FourCC('h02J'), ProudMoore);
        this._towerTypes.add(FourCC('u03F'), Sammy);
        this._towerTypes.add(FourCC('u03E'), ZerglingHive);
        this._towerTypes.add(FourCC('u040'), TheDarkness);

        // AntiJuggle
        this._towerTypes.add(FourCC('uC14'), AntiJuggleTower);


    }

    private DoGenericTowerAttacks(): void {
        for (const tower of this.genericAttacks.values()) {
            tower.GenericAttack();
        }
    }

    private DoKillingTowerActions(): void {
        for (const tower of this.killingActions.values()) {
            tower.KillingAction();
        }
    }

    private isLootBoxer(tower: unit): boolean {
        return this.lootBoxerTowers.indexOf(GetUnitTypeId(tower)) > -1;
    }
}
