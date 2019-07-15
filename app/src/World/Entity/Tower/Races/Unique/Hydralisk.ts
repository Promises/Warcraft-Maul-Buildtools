import { Tower } from '../../Specs/Tower';
import { KillingActionTower } from '../../Specs/KillingActionTower';

export class Hydralisk extends Tower implements KillingActionTower {


    public KillingAction(): void {
        const u: unit | undefined = GetKillingUnitBJ();
        const target: unit | undefined = GetDyingUnit();

        if (Util.RandomInt(1, 2) === 1) {
            return;
        }
        if (u === this.tower && target) {
            if (GetUnitAbilityLevelSwapped(FourCC('A0EH'), this.tower) <= 50) {
                IncUnitAbilityLevelSwapped(FourCC('A0EH'), this.tower);
            }

            if (GetUnitAbilityLevelSwapped(FourCC('A0EI'), this.tower) <= 50) {
                IncUnitAbilityLevelSwapped(FourCC('A0EI'), this.tower);
            }

        }

    }


}
