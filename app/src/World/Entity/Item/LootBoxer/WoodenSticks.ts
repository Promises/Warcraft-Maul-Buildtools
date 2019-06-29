import { StackingItem } from '../Specs/StackingItem';
import { WarcraftMaul } from '../../../WarcraftMaul';

export class WoodenSticks extends StackingItem {
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
