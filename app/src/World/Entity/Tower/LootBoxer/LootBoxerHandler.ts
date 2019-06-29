import {
    HybridTierEight,
    HybridTierFive,
    HybridTierFour, HybridTierNine,
    HybridTierOne, HybridTierSeven,
    HybridTierSix,
    HybridTierThree,
    HybridTierTwo,
} from '../../../../Generated/hybridRandomGEN';
import { Log } from '../../../../lib/Serilog/Serilog';
import { Defender } from '../../Players/Defender';
import { TowerConstruction } from '../TowerConstruction';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Trigger } from '../../../../JassOverrides/Trigger';
import * as settings from '../../../GlobalSettings';
import { Tower } from '../Specs/Tower';

export class LootBoxerHandler {
    private abilityUpgradeTrigger: Trigger;
    constuction: TowerConstruction;
    game: WarcraftMaul;


    constructor(constuction: TowerConstruction, game: WarcraftMaul) {
        this.constuction = constuction;
        this.game = game;
        this.abilityUpgradeTrigger = new Trigger();
        this.abilityUpgradeTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_CAST);
        this.abilityUpgradeTrigger.AddCondition(() => this.IsUpgradeAbility());
        this.abilityUpgradeTrigger.AddAction(() => this.UpgradeToTower());


    }

    private GetId(tier: number): number {
        let newId: number;
        switch (tier + 1) {
            case 1:
                newId = FourCC(HybridTierOne[Util.RandomInt(0, HybridTierOne.length - 1)]);
                break;
            case 2:
                newId = FourCC(HybridTierTwo[Util.RandomInt(0, HybridTierTwo.length - 1)]);
                break;
            case 3:
                newId = FourCC(HybridTierThree[Util.RandomInt(0, HybridTierThree.length - 1)]);
                break;
            case 4:
                newId = FourCC(HybridTierFour[Util.RandomInt(0, HybridTierFour.length - 1)]);
                break;
            case 5:
                newId = FourCC(HybridTierFive[Util.RandomInt(0, HybridTierFive.length - 1)]);
                break;
            case 6:
                newId = FourCC(HybridTierSix[Util.RandomInt(0, HybridTierSix.length - 1)]);
                break;
            case 7:
                newId = FourCC(HybridTierSeven[Util.RandomInt(0, HybridTierSeven.length - 1)]);
                break;
            case 8:
                newId = FourCC(HybridTierEight[Util.RandomInt(0, HybridTierEight.length - 1)]);
                break;
            case 9:
                newId = FourCC(HybridTierNine[Util.RandomInt(0, HybridTierNine.length - 1)]);
                break;
            default:
                Log.Fatal('failed to get loot boxer tier');
                newId = FourCC(HybridTierOne[Util.RandomInt(0, HybridTierOne.length - 1)]);
                break;
        }
        return newId;
    }

    public handleLootBoxTower(tower: unit, owner: Defender, tier: number): unit {
        let newId: number;
        const lootBoxer: unit | undefined = owner.getLootBoxer();
        if (!lootBoxer) {
            return tower;
        }
        if (tier >= 3) {
            SetUnitAbilityLevelSwapped(FourCC('A0EX'), tower, tier + 1);
            return tower;
        }

        newId = this.GetId(tier);

        this.AddItemToLootBoxer(tier, lootBoxer);


        tower = ReplaceUnitBJ(
            GetConstructedStructure(),
            newId,
            bj_UNIT_STATE_METHOD_DEFAULTS);


        return tower;
    }


    private AddItemToLootBoxer(tier: number, lootBoxer: unit): void {
        const randomInt: number = Util.RandomInt(1, 100);

        if (tier < 3) {
            if (randomInt <= 100 - (5 * (tier + 1))) {
                UnitAddItemByIdSwapped(FourCC('I02F'), lootBoxer);
            } else if (randomInt <= 100 - 2 * (tier + 1)) {
                UnitAddItemByIdSwapped(FourCC('I029'), lootBoxer);
            } else {
                UnitAddItemByIdSwapped(FourCC('I02B'), lootBoxer);
            }
        } else {
            switch (tier + 1) {
                case 4:
                case 5:
                    if (randomInt <= 100 - 20 + 10 * (tier - 4 + 1)) {
                        UnitAddItemByIdSwapped(FourCC('I02F'), lootBoxer);
                        SetItemCharges(GetLastCreatedItem(), GetRandomInt(1, tier));
                    } else if (randomInt <= 100 - 10 + 5 * (tier - 4 + 1)) {
                        UnitAddItemByIdSwapped(FourCC('I029'), lootBoxer);
                    } else if (randomInt <= 100 - 2 * (tier - 3 + 1)) {
                        UnitAddItemByIdSwapped(FourCC('I02B'), lootBoxer);
                    } else {
                        UnitAddItemByIdSwapped(FourCC('I028'), lootBoxer);
                    }
                    break;
                case 6:
                    if (randomInt <= 100 - 20 + 10 * (tier - 4 + 1)) {
                        UnitAddItemByIdSwapped(FourCC('I02F'), lootBoxer);
                        SetItemCharges(GetLastCreatedItem(), GetRandomInt(1, tier));
                    } else if (randomInt <= 100 - 10 + 5 * (tier - 4 + 1)) {
                        UnitAddItemByIdSwapped(FourCC('I02B'), lootBoxer);
                    } else if (randomInt <= 100 - 2 * (tier - 3 + 1)) {
                        UnitAddItemByIdSwapped(FourCC('I028'), lootBoxer);
                    } else {
                        UnitAddItemByIdSwapped(FourCC('I02A'), lootBoxer);
                    }
                    break;
                case 7:
                    this.GetRandomItem(tier, randomInt, lootBoxer, 'I028', 70, 'I02B', 85, 'I02A', 95, 'I02C');
                    break;
                case 8:
                    this.GetRandomItem(tier, randomInt, lootBoxer, 'I028', 65, 'I02A', 80, 'I02B', 92, 'I02C');
                    break;
                case 9:
                    this.GetRandomItem(tier, randomInt, lootBoxer, 'I028', 60, 'I02A', 80, 'I02B', 90, 'I02C');
                    break;

                default:
                    Log.Fatal('failed to get loot boxer item tier');
                    this.AddItemToLootBoxer(1, lootBoxer);
                    break;
            }
        }
    }

    private GetRandomItem(tier: number,
                          randomInt: number,
                          lootBoxer: unit,
                          itemOne: string,
                          chanceOne: number,
                          itemTwo: string,
                          chanceTwo: number,
                          itemThree: string,
                          chanceThree: number,
                          defaultItem: string): void {
        if (randomInt <= 100 - 20 + 10 * (tier - 4 + 1)) {
            UnitAddItemByIdSwapped(FourCC('I02F'), lootBoxer);
            SetItemCharges(GetLastCreatedItem(), GetRandomInt(1 + (tier - 5), tier));
        } else if (randomInt <= chanceOne) {
            UnitAddItemByIdSwapped(FourCC(itemOne), lootBoxer);
        } else if (randomInt <= chanceTwo) {
            UnitAddItemByIdSwapped(FourCC(itemTwo), lootBoxer);
        } else if (randomInt <= chanceThree) {
            UnitAddItemByIdSwapped(FourCC(itemThree), lootBoxer);
        } else {
            UnitAddItemByIdSwapped(FourCC(defaultItem), lootBoxer);
        }

    }

    private IsUpgradeAbility(): boolean {
        return GetSpellAbilityId() === FourCC('A0EX');
    }

    private UpgradeToTower(): void {
        let tower: unit = GetSpellAbilityUnit();

        const owner: Defender | undefined = settings.players.get(GetPlayerId(GetOwningPlayer(tower)));
        if (!owner) {
            return;
        }

        const instance: Tower | undefined = owner.towers.get(GetHandleIdBJ(tower));
        if (instance) {
            instance.Sell();
        }

        tower = ReplaceUnitBJ(
            tower,
            this.GetId(this.constuction.lootBoxerTowers.indexOf(GetUnitTypeId(tower))),
            bj_UNIT_STATE_METHOD_DEFAULTS);

        const lootBoxer: unit | undefined = owner.getLootBoxer();

        if (lootBoxer) {
            this.AddItemToLootBoxer(this.constuction.lootBoxerTowers.indexOf(GetUnitTypeId(tower)), lootBoxer);

        }

        this.constuction.SetupTower(tower, owner);
    }
}
