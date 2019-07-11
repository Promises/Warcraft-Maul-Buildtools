import { Tower } from '../Specs/Tower';
import { KillingActionTower } from '../Specs/KillingActionTower';
import { AOB_ITEM_LOOT_LEVEL_ONE } from '../../../GlobalSettings';

export class Adventurer extends Tower implements KillingActionTower { //n02T


    public KillingAction(): void {
        const u: unit | undefined = GetKillingUnitBJ();
        const target: unit | undefined = GetDyingUnit();


        if (u === this.tower && target) {
            if (UnitItemInSlotBJ(u, 1) === null) {
                const lootindx: number = Util.RandomInt(0, AOB_ITEM_LOOT_LEVEL_ONE.length - 1);
                UnitAddItemById(u, AOB_ITEM_LOOT_LEVEL_ONE[lootindx]);
            }
        }

    }


}
