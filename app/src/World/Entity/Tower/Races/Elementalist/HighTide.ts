import { Tower } from '../../Specs/Tower';
import { EndOfRoundTower } from '../../Specs/EndOfRoundTower';

export class HighTide extends Tower implements EndOfRoundTower {


    public EndOfRoundAction(): void {
        this.Upgrade(FourCC('u01F'));
    }

}
