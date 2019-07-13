import { Tower } from '../../Specs/Tower';
import { EndOfRoundTower } from '../../Specs/EndOfRoundTower';

export class HighTide extends Tower implements EndOfRoundTower {


    public EndOfRoundAction(): void {
        this.Sell();
        const u: unit = ReplaceUnitBJ(this.tower, FourCC('u01F'), bj_UNIT_STATE_METHOD_DEFAULTS);
        this.game.worldMap.towerConstruction.SetupTower(u, this.owner);
    }

}
