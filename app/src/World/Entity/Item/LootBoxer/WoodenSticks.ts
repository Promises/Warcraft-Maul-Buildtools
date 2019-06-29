import { WarcraftMaul } from '../../../WarcraftMaul';
import { Item } from '../Specs/Item';

export class WoodenSticks extends Item {
    constructor(game: WarcraftMaul) {
        super('I028', game);
    }

    public ManipulateAction(): void {
        if (this.game.worldMap.towerConstruction.lootBoxerTowers.indexOf(GetUnitTypeId(GetManipulatingUnit())) + 1 < 4) {
            return;
        }
        SetUnitManaBJ(GetManipulatingUnit(), (GetUnitStateSwap(UNIT_STATE_MANA, GetManipulatingUnit()) + 1));

    }
}
