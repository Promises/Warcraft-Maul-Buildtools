import { StackingItem } from '../Specs/StackingItem';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Item } from '../Specs/Item';

export class PlatinumToken extends Item {
    constructor(game: WarcraftMaul) {
        super('I02C', game);
    }

    public ManipulateAction(): void {
        if (this.game.worldMap.towerConstruction.lootBoxerTowers.indexOf(GetUnitTypeId(GetManipulatingUnit())) + 1 < 4) {
            return;
        }
        SetUnitManaBJ(GetManipulatingUnit(), (GetUnitStateSwap(UNIT_STATE_MANA, GetManipulatingUnit()) + 6.00));

    }
}
