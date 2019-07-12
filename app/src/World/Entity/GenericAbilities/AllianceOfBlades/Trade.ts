/**
 *  Trade (Alliance Of Blades)
 *  Exchange 2 items for 1 new
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../Players/Defender';
import { Tower } from '../../Tower/Specs/Tower';
import { AOB_ITEM_LOOT_LEVEL_ONE, AOB_ITEM_LOOT_LEVEL_TWO } from '../../../GlobalSettings';


export class Trade extends GenericAbility implements AbilityOnEffectTargetsUnit {
    constructor(game: WarcraftMaul) {
        super('A016', game);
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
                    const mana: number = GetUnitStateSwap(UNIT_STATE_MANA, tower.tower) + 1;
                    SetUnitManaBJ(tower.tower, mana);
                    RemoveItem(UnitItemInSlotBJ(tower.tower, 1));
                    if (mana > 1) {
                        let random: number = Util.RandomInt(0, AOB_ITEM_LOOT_LEVEL_ONE.length - 1);
                        if (random === indx) {
                            random++;
                        }
                        if (random > AOB_ITEM_LOOT_LEVEL_ONE.length - 1) {
                            random = 0;
                        }
                        const newItem: number = AOB_ITEM_LOOT_LEVEL_ONE[random];
                        UnitAddItemByIdSwapped(newItem, tower.tower);
                        SetUnitManaBJ(tower.tower, 0);
                    }
                }
            }
        }

    }


}
