import { StackingItem } from '../Specs/StackingItem';
import { WarcraftMaul } from '../../../WarcraftMaul';

export class Rocks extends StackingItem {
    constructor(game: WarcraftMaul) {
        super('I02F', game);
    }

    public ManipulateAction(): void {
        const currentCharges: number = GetItemCharges(GetManipulatedItem());
        if (currentCharges <= 8) {
            SetItemCharges(GetManipulatedItem(), (GetItemCharges(GetManipulatedItem()) + 1));
        } else {
            SetItemCharges(GetManipulatedItem(), (GetItemCharges(GetManipulatedItem()) - 9));
            UnitAddItemByIdSwapped(FourCC('I02B'), GetManipulatingUnit());
        }
    }
}
