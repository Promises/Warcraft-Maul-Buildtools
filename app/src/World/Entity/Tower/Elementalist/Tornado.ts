import { Tower } from '../Specs/Tower';
import { EndOfRoundTower } from '../Specs/EndOfRoundTower';

export class Tornado extends Tower implements EndOfRoundTower {


    public EndOfRoundAction(): void {
        if (GetUnitAbilityLevel(this.tower, FourCC('A0E0')) > 0) {
            UnitRemoveAbility(this.tower,  FourCC('A0E0'));
            UnitAddAbility(this.tower,  FourCC('A0E1'));
            UnitAddAbility(this.tower,  FourCC('A0E2'));
        } else {
            UnitRemoveAbility(this.tower,  FourCC('A0E1'));
            UnitRemoveAbility(this.tower,  FourCC('A0E2'));
            UnitAddAbility(this.tower,  FourCC('A0E0'));
        }
    }

}
