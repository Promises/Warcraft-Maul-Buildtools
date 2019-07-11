import { Tower } from '../Specs/Tower';
import { EndOfRoundTower } from '../Specs/EndOfRoundTower';

export class Sapling extends Tower implements EndOfRoundTower {


    public EndOfRoundAction(): void {
        if (GetUnitStateSwap(UNIT_STATE_MANA, this.tower) === 5) {
            this.Sell();
            const u: unit = ReplaceUnitBJ(this.tower, FourCC('u036'), bj_UNIT_STATE_METHOD_DEFAULTS);
            this.game.worldMap.towerConstruction.SetupTower(u, this.owner);
        } else {
            SetUnitManaBJ(this.tower, GetUnitStateSwap(UNIT_STATE_MANA, this.tower) + 1.00);
        }
    }

}
