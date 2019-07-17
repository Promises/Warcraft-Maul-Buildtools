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
        return 40;
    }

    public Action(): void {
        const fragments: number = this.owner.GetVoidFragments();

        const newDmg: number = Math.floor(14 + IMinBJ(35, 0.10 * fragments));

        BlzSetUnitBaseDamage(this.tower, newDmg, 0);
    }

    public GetTickModulo(): number {
        return 9;
    }

    public SellAction(): void {
        this.owner.SetVoidFragmentTick(this.owner.GetVoidFragmentTick() - 1);

    }

}
