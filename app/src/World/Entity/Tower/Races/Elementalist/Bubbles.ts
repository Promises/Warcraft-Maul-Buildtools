import { Tower } from '../../Specs/Tower';
import { EndOfRoundTower } from '../../Specs/EndOfRoundTower';

export class Bubbles extends Tower implements EndOfRoundTower {


    public EndOfRoundAction(): void {
        if (BlzGetUnitBaseDamage(this.tower, 0) <= 4) {
            this.Sell();
            const u: unit = ReplaceUnitBJ(this.tower, FourCC('n027'), bj_UNIT_STATE_METHOD_DEFAULTS);
            this.game.worldMap.towerConstruction.SetupTower(u, this.owner);
        } else {
            BlzSetUnitBaseDamage(this.tower, BlzGetUnitBaseDamage(this.tower, 0) - 5, 0);
        }
    }

}
