import { StackingItem } from '../Specs/StackingItem';
import { WarcraftMaul } from '../../../WarcraftMaul';

export class PremiumLootTower extends StackingItem {
    constructor(game: WarcraftMaul) {
        super('I029', game);
    }

    public ManipulateAction(): void {
        return;
    }
}
