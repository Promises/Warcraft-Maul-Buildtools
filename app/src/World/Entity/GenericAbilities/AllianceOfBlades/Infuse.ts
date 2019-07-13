/**
 *  Infuse (Alliance Of Blades)
 *  gamble upgrade lvl 2 to 3
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../Players/Defender';
import { Tower } from '../../Tower/Specs/Tower';
import { AOB_ITEM_LOOT_LEVEL_THREE, AOB_ITEM_LOOT_LEVEL_TWO } from '../../../GlobalSettings';


export class Infuse extends GenericAbility implements AbilityOnEffectTargetsUnit {
    constructor(game: WarcraftMaul) {
        super('A0A7', game);
    }


    public TargetOnEffectAction(): void {
        const u: unit = GetTriggerUnit();
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(u)));
        if (owner) {

            const tower: Tower | undefined = owner.towers.get(GetHandleId(u));
            if (tower) {
                if (GetItemLevel(UnitItemInSlotBJ(tower.tower, 1)) === 2) {
                    const i: item = UnitItemInSlotBJ(tower.tower, 1);
                    const indx: number = AOB_ITEM_LOOT_LEVEL_TWO.indexOf(GetItemTypeId(i));

                    RemoveItem(UnitItemInSlotBJ(tower.tower, 1));
                    const mana: number = GetUnitStateSwap(UNIT_STATE_MANA, tower.tower);
                    SetUnitManaBJ(tower.tower, 0);
                    if (10 * mana > Util.RandomInt(0, 99)) {
                        UnitAddItemByIdSwapped(AOB_ITEM_LOOT_LEVEL_THREE[indx], tower.tower);
                    }
                }
            }
        }

    }


}
