import { Tower } from '../../Specs/Tower';
import { TickingTower } from '../../Specs/TickingTower';

export class OgreMagi extends Tower implements TickingTower {
    public Action(): void {
        const y: number = GetUnitY(this.tower);
        const x: number = GetUnitX(this.tower);
        const dummy: unit = CreateUnit(this.owner.wcPlayer, FourCC('u008'), x, y, 0);
        UnitApplyTimedLifeBJ(1.00, FourCC('BTLF'), dummy);
        UnitAddAbilityBJ(FourCC('A036'), dummy);
        IssueImmediateOrderBJ(dummy, 'battleroar');
    }

    public GetTickModulo(): number {
        return 99;
    }

}
