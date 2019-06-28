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
        tower = ReplaceUnitBJ(
            GetConstructedStructure(),
            newId,
            bj_UNIT_STATE_METHOD_DEFAULTS);


        return tower;
    }
}
