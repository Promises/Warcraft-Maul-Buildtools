import { Tower } from '../../Specs/Tower';
import { GenericAutoAttackTower } from '../../Specs/GenericAutoAttackTower';
import { LimitedTower } from '../../Specs/LimitedTower';
import { TickingTower } from '../../Specs/TickingTower';

export class VoidWorshipper extends Tower implements LimitedTower, TickingTower {
    public MaxCount(): number {
        return 30;
    }
    public Action(): void {
        BlzSetUnitBaseDamage(GetEnumUnit(), 14 + IMinBJ(30, R2I(0.10 * this.owner.GetVoidFragments())), 0);
    }

    public GetTickModulo(): number {
        return 9;
    }

}
