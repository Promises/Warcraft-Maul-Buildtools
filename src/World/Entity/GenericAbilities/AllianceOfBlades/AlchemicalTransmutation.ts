/**
 *  AlchemicalTransmutation (Alliance Of Blades)
 *  Pay 75g to upgrade lvl 1 to 3
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../Players/Defender';
import { Tower } from '../../Tower/Specs/Tower';
import {  AOB_ITEM_LOOT_LEVEL_ONE, AOB_ITEM_LOOT_LEVEL_THREE } from '../../../GlobalSettings';


export class AlchemicalTransmutation extends GenericAbility implements AbilityOnEffectTargetsUnit {
    constructor(game: WarcraftMaul) {
        super('A0B0', game);
    }


    public TargetOnEffectAction(): void {
        const u: unit = GetTriggerUnit();
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(u)));
        if (owner) {

            const tower: Tower | undefined = owner.GetTower(GetHandleId(u));
            if (tower) {
                if (GetItemLevel(UnitItemInSlotBJ(tower.tower, 1)) === 1) {
                    const i: item = UnitItemInSlotBJ(tower.tower, 1);
                    const indx: number = AOB_ITEM_LOOT_LEVEL_ONE.indexOf(GetItemTypeId(i));
                    RemoveItem(UnitItemInSlotBJ(tower.tower, 1));
                    UnitAddItemByIdSwapped(AOB_ITEM_LOOT_LEVEL_THREE[indx], tower.tower);
                } else {
                    owner.giveGold(75);
                }
            }
        }

    }


}
