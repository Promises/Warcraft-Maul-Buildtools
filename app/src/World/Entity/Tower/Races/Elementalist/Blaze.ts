import { Tower } from '../../Specs/Tower';
import { EndOfRoundTower } from '../../Specs/EndOfRoundTower';

export class Blaze extends Tower implements EndOfRoundTower {


    public EndOfRoundAction(): void {
        this.Upgrade(FourCC('n027'));
    }

}
