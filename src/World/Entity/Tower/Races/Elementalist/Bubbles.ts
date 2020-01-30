import { Tower } from '../../Specs/Tower';
import { EndOfRoundTower } from '../../Specs/EndOfRoundTower';

export class Bubbles extends Tower implements EndOfRoundTower {


    public EndOfRoundAction(): void {
        if (BlzGetUnitBaseDamage(this.tower, 0) <= 4) {
            this.Upgrade(FourCC('n027'));
        } else {
            BlzSetUnitBaseDamage(this.tower, BlzGetUnitBaseDamage(this.tower, 0) - 5, 0);
        }
    }

}
