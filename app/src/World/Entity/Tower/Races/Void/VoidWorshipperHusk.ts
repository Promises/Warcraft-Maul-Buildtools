import { Tower } from '../../Specs/Tower';
import { Defender } from '../../../Players/Defender';
import { WarcraftMaul } from '../../../../WarcraftMaul';
import { SellActionTower } from '../../Specs/SellActionTower';

export class VoidWorshipperHusk extends Tower implements SellActionTower {
    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {
        super(tower, owner, game);
        this.owner.SetVoidFragmentTick(this.owner.GetVoidFragmentTick() + 1);
    }

    public SellAction(): void {
        this.owner.SetVoidFragmentTick(this.owner.GetVoidFragmentTick() - 1);

    }


}
