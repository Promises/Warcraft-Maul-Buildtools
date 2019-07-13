import { Tower } from '../../Specs/Tower';
import { GenericAutoAttackTower } from '../../Specs/GenericAutoAttackTower';

export class AncientProtector extends Tower implements GenericAutoAttackTower {

    public GenericAttack(): void {
        const u: unit = GetAttacker();
        if (u === this.tower) {
            if (!(GetUnitStateSwap(UNIT_STATE_MANA, this.tower) >= 30)) {
                return;
            }
            if (!(UnitInventoryCount(this.tower) <= 1)) {
                return;
            }
            SetUnitManaPercentBJ(this.tower, 0);
            const roll: number = Util.RandomInt(1, 3);
            switch (roll) {
                case 1:
                    UnitAddItemByIdSwapped(FourCC('I023'), this.tower);
                    break;
                case 2:
                    UnitAddItemByIdSwapped(FourCC('I021'), this.tower);
                    break;
                case 3:
                    UnitAddItemByIdSwapped(FourCC('I022'), this.tower);
                    break;
            }

        }
    }

}
