import { StackingItem } from '../Specs/StackingItem';
import { WarcraftMaul } from '../../../WarcraftMaul';

export class Rocks extends StackingItem {
    constructor(game: WarcraftMaul) {
        super('I029', game);
    }

    public ManipulateAction(): void {
        return;
    }
}
