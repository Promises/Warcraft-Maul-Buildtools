import { Tower } from '../../Specs/Tower';
import { EndOfRoundTower } from '../../Specs/EndOfRoundTower';

export class Sapling extends Tower implements EndOfRoundTower {


    public EndOfRoundAction(): void {
        if (GetUnitStateSwap(UNIT_STATE_MANA, this.tower) === 5) {
            this.Upgrade(FourCC('u036'));
        } else {
            SetUnitManaBJ(this.tower, GetUnitStateSwap(UNIT_STATE_MANA, this.tower) + 1.00);
        }
    }

}
