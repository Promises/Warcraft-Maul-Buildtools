import { Tower } from '../../Specs/Tower';
import { AOB_ITEM_LOOT_LEVEL_ONE } from '../../../../GlobalSettings';
import { TickingTower } from '../../Specs/TickingTower';

export class Scavenger extends Tower implements TickingTower {


    public Scavenge(): void {

        if (UnitItemInSlotBJ(this.tower, 1) === null) {
            const lootindx: number = Util.RandomInt(0, AOB_ITEM_LOOT_LEVEL_ONE.length - 1);
            UnitAddItemById(this.tower, AOB_ITEM_LOOT_LEVEL_ONE[lootindx]);
        }


    }

    public Action(): void {
        this.Scavenge();
    }

    public GetTickModulo(): number {
        return 300;
    }


}
