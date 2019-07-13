import { Tower } from '../../Specs/Tower';
import { TickingTower } from '../../Specs/TickingTower';

export class ChimaeraRoost extends Tower implements TickingTower {
    public Action(): void {

        if (this.owner.chimeraCount <= 3) {
            this.owner.chimeraCount++;
            const tempUnit: unit = CreateUnit(
                this.owner.wcPlayer,
                FourCC('e004'),
                GetUnitX(this.tower),
                GetUnitY(this.tower),
                bj_UNIT_FACING);
        }
    }

    public GetTickModulo(): number {
        return 150;
    }


}
