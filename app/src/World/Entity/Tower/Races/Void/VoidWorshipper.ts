import { Tower } from '../../Specs/Tower';
import { LimitedTower } from '../../Specs/LimitedTower';
import { TickingTower } from '../../Specs/TickingTower';
import { Defender } from '../../../Players/Defender';
import { WarcraftMaul } from '../../../../WarcraftMaul';
import { SellActionTower } from '../../Specs/SellActionTower';

export class VoidWorshipper extends Tower implements LimitedTower, TickingTower, SellActionTower {
    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {
        super(tower, owner, game);
        this.owner.SetVoidFragmentTick(this.owner.GetVoidFragmentTick() + 1);
    }

    public MaxCount(): number {
        return 30;
    }

    public Action(): void {
        BlzSetUnitBaseDamage(GetEnumUnit(), 14 + IMinBJ(30, R2I(0.10 * this.owner.GetVoidFragments())), 0);
    }

    public GetTickModulo(): number {
        return 9;
    }

    public SellAction(): void {
        this.owner.SetVoidFragmentTick(this.owner.GetVoidFragmentTick() - 1);

    }

}
