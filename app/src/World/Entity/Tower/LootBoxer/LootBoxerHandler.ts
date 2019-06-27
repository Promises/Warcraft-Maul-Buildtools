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

export class LootBoxerHandler {
    public handleLootBoxTower(tower: unit, tier: number): unit {
        let newId: number;
        switch (tier + 1) {
            case 1:
                newId = FourCC(HybridTierOne[GetRandomInt(0, HybridTierOne.length)]);
                break;
            case 2:
                newId = FourCC(HybridTierTwo[GetRandomInt(0, HybridTierTwo.length)]);
                break;
            case 3:
                newId = FourCC(HybridTierThree[GetRandomInt(0, HybridTierThree.length)]);
                break;
            case 4:
                newId = FourCC(HybridTierFour[GetRandomInt(0, HybridTierFour.length)]);
                break;
            case 5:
                newId = FourCC(HybridTierFive[GetRandomInt(0, HybridTierFive.length)]);
                break;
            case 6:
                newId = FourCC(HybridTierSix[GetRandomInt(0, HybridTierSix.length)]);
                break;
            case 7:
                newId = FourCC(HybridTierSeven[GetRandomInt(0, HybridTierSeven.length)]);
                break;
            case 8:
                newId = FourCC(HybridTierEight[GetRandomInt(0, HybridTierEight.length)]);
                break;
            case 9:
                newId = FourCC(HybridTierNine[GetRandomInt(0, HybridTierNine.length)]);
                break;
            default:
                Log.Fatal('failed to get loot boxer tier');
                newId = FourCC(HybridTierOne[GetRandomInt(0, HybridTierOne.length)]);
                break;
        }
        tower = ReplaceUnitBJ(
            GetConstructedStructure(),
            newId,
            bj_UNIT_STATE_METHOD_DEFAULTS);


        return tower;
    }
}
