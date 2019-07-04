import { Tower } from '../Specs/Tower';
import { GenericAutoAttackTower } from '../Specs/GenericAutoAttackTower';

export class ZerglingHive extends Tower implements GenericAutoAttackTower {
    public GenericAttack(): void {
        if (Util.RandomInt(1, 10) === 1) {
            const tempUnit: unit = CreateUnit(
                this.owner.wcPlayer,
                FourCC('u042'),
                GetUnitX(this.tower),
                GetUnitY(this.tower),
                bj_UNIT_FACING);
            UnitApplyTimedLifeBJ(10.00, FourCC('BTLF'), tempUnit);
        }
    }

}
