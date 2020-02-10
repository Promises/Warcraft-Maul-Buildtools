import { Tower } from '../../Specs/Tower';
import { LimitedTower } from '../../Specs/LimitedTower';
import { Defender } from '../../../Players/Defender';
import { WarcraftMaul } from '../../../../WarcraftMaul';
import { SellActionTower } from '../../Specs/SellActionTower';

export class CitadelOfNaxxramas extends Tower implements LimitedTower, SellActionTower {

    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {
        super(tower, owner, game);
        this.owner.citadelOfNaxxramas = this;
    }
    public MaxCount(): number {
        return 1;
    }

    public SellAction(): void {
        this.owner.citadelOfNaxxramas = undefined;
    }
}
