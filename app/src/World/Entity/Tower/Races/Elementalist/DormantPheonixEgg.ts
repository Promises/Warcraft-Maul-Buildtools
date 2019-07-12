import { Tower } from '../../Specs/Tower';
import { EndOfRoundTower } from '../../Specs/EndOfRoundTower';
import { AttackActionTower } from '../../Specs/AttackActionTower';

export class DormantPheonixEgg extends Tower implements EndOfRoundTower {


    public EndOfRoundAction(): void {
        SetUnitManaBJ(this.tower, GetUnitStateSwap(UNIT_STATE_MANA, this.tower) + 1.00);
    }

}
