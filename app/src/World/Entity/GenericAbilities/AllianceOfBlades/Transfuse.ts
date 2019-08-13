/**
 *  Transfuse (Alliance Of Blades)
 *  consume lvl 2 item
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../Players/Defender';
import { Tower } from '../../Tower/Specs/Tower';
import { AOB_ITEM_LOOT_LEVEL_ONE, AOB_ITEM_LOOT_LEVEL_TWO } from '../../../GlobalSettings';


export class Transfuse extends GenericAbility implements AbilityOnEffectTargetsUnit {
    constructor(game: WarcraftMaul) {
        super('A03A', game);
    }


    public TargetOnEffectAction(): void {
        const u: unit = GetTriggerUnit();
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(u)));
        if (owner) {

            const tower: Tower | undefined = owner.GetTower(GetHandleId(u));
            if (tower) {
                if (GetItemLevel(UnitItemInSlotBJ(tower.tower, 1)) === 2) {
                    RemoveItem(UnitItemInSlotBJ(tower.tower, 1));
                    SetUnitManaBJ(tower.tower, GetUnitStateSwap(UNIT_STATE_MANA, tower.tower) + 1.00);
                }
            }
        }

    }


}
