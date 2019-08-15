import { Tower } from '../../Specs/Tower';
import { AOB_ITEM_LOOT_LEVEL_ONE } from '../../../../GlobalSettings';
import { TickingTower } from '../../Specs/TickingTower';

export class Scavenger extends Tower implements TickingTower {

    public Scavenge(): void {

        if (UnitItemInSlot(this.tower, 0) === null) {
            const lootindx: number = Util.RandomInt(0, AOB_ITEM_LOOT_LEVEL_ONE.length - 1);
            const i: item = CreateItem(AOB_ITEM_LOOT_LEVEL_ONE[lootindx], GetUnitX(this.tower), GetUnitY(this.tower));
            UnitAddItem(this.tower, i);
        }


    }

    public Action(): void {
        this.Scavenge();
    }

    public GetTickModulo(): number {
        return 300;
    }


}
