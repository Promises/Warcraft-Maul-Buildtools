import { Tower } from '../../Specs/Tower';
import { GenericAutoAttackTower } from '../../Specs/GenericAutoAttackTower';
import { EndOfRoundTower } from '../../Specs/EndOfRoundTower';

export class ZerglingHive extends Tower implements GenericAutoAttackTower, EndOfRoundTower {
    private chance: number = 55;
    private currentHit: number = 55;


    public GenericAttack(): void {
        if (this.currentHit >= this.chance) {
            this.currentHit = 0;
            const tempUnit: unit = CreateUnit(
                this.owner.wcPlayer,
                FourCC('u042'),
                GetUnitX(this.tower),
                GetUnitY(this.tower),
                bj_UNIT_FACING);
            UnitApplyTimedLifeBJ(10.00, FourCC('BTLF'), tempUnit);
        }
        this.currentHit++;

    }

    public EndOfRoundAction(): void {
        this.currentHit = 55;
    }

}
