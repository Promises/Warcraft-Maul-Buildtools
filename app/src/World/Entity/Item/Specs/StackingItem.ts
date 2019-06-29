import { Item } from './Item';

export class StackingItem extends Item {

    public StackingCondition(): boolean {
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
