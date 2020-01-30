import { WCItem } from './WCItem';

export class StackingItem extends WCItem {

    public StackingCondition(): boolean {
        if (this.itemID !== GetItemTypeId(GetManipulatedItem())) {
            return false;
        }
        if (!(UnitHasItemOfTypeBJ(GetManipulatingUnit(), GetItemTypeId(GetManipulatedItem())))) {
            return false;
        }

        if (!(GetManipulatedItem() !== GetItemOfTypeFromUnitBJ(GetManipulatingUnit(), GetItemTypeId(GetManipulatedItem())))) {
            return false;
        }

        return true;
    }

    public MakeStack(): void {
        SetItemCharges(GetItemOfTypeFromUnitBJ(GetManipulatingUnit(), GetItemTypeId(GetManipulatedItem())),
            (GetItemCharges(GetItemOfTypeFromUnitBJ(GetManipulatingUnit(), GetItemTypeId(GetManipulatedItem()))) + GetItemCharges(GetManipulatedItem())));
        UnitRemoveItemSwapped(GetManipulatedItem(), GetManipulatingUnit());
        RemoveItem(GetManipulatedItem());
    }
}
