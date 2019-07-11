/**
 *  Enchanment (Alliance Of Blades)
 *  Upgrade an item to lvl two
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../Players/Defender';
import { Tower } from '../../Tower/Specs/Tower';
import { AOB_ITEM_LOOT_LEVEL_ONE, AOB_ITEM_LOOT_LEVEL_TWO } from '../../../GlobalSettings';


export class Enchantment extends GenericAbility implements AbilityOnEffectTargetsUnit {
    constructor(game: WarcraftMaul) {
        super('A03F', game);
    }


    public TargetOnEffectAction(): void {
        const u: unit = GetTriggerUnit();
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(u)));
        if (owner) {

            const tower: Tower | undefined = owner.towers.get(GetHandleId(u));
            if (tower) {
                if (GetItemLevel(UnitItemInSlotBJ(tower.tower, 1)) === 1) {
                    const i: item = UnitItemInSlotBJ(tower.tower, 1);
                    const indx: number = AOB_ITEM_LOOT_LEVEL_ONE.indexOf(GetItemTypeId(i));
                    const lvlTwoItem: number = AOB_ITEM_LOOT_LEVEL_TWO[indx];
                    RemoveItem(UnitItemInSlotBJ(GetTriggerUnit(), 1));
                    UnitAddItemByIdSwapped(lvlTwoItem, tower.tower);
                }
            }
        }

    }


}
