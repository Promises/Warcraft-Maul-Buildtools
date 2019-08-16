import { Tower } from '../../Specs/Tower';
import { EndOfRoundTower } from '../../Specs/EndOfRoundTower';

export class LowTide extends Tower implements EndOfRoundTower {


    public EndOfRoundAction(): void {
        if (GetUnitStateSwap(UNIT_STATE_MANA, this.tower) === 2) {
            this.Upgrade(FourCC('u029'));
        } else {
            SetUnitManaBJ(this.tower, GetUnitStateSwap(UNIT_STATE_MANA, this.tower) + 1.00);
        }
    }

}
