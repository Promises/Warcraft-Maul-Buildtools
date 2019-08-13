/**
 *  Sacrifice (Alliance Of Blades)
 *  Consume 2 lvl 3 items, upgrade 2nd
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../Players/Defender';
import { Tower } from '../../Tower/Specs/Tower';
import { AOB_ITEM_LOOT_LEVEL_FOUR, AOB_ITEM_LOOT_LEVEL_ONE, AOB_ITEM_LOOT_LEVEL_THREE } from '../../../GlobalSettings';


export class Sacrifice extends GenericAbility implements AbilityOnEffectTargetsUnit {
    constructor(game: WarcraftMaul) {
        super('A0AJ', game);
    }


    public TargetOnEffectAction(): void {
        const u: unit = GetTriggerUnit();
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(u)));
        if (owner) {

            const tower: Tower | undefined = owner.GetTower(GetHandleId(u));
            if (tower) {
                if (GetItemLevel(UnitItemInSlotBJ(tower.tower, 1)) === 3) {
                    const i: item = UnitItemInSlotBJ(tower.tower, 1);
                    const indx: number = AOB_ITEM_LOOT_LEVEL_THREE.indexOf(GetItemTypeId(i));
                    const mana: number = GetUnitStateSwap(UNIT_STATE_MANA, tower.tower) + 1;
                    SetUnitManaBJ(tower.tower, mana);
                    RemoveItem(UnitItemInSlotBJ(tower.tower, 1));

                    if (mana > 1) {
                        SetUnitManaBJ(tower.tower, 0);

                        UnitAddItemByIdSwapped(AOB_ITEM_LOOT_LEVEL_FOUR[indx], tower.tower);
                    }
                }
            }
        }

    }


}
