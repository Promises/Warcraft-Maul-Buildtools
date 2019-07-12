import { Tower } from '../Specs/Tower';
import { TickingTower } from '../Specs/TickingTower';
import { Log } from '../../../../lib/Serilog/Serilog';

export class IceTrollEmperor extends Tower implements TickingTower {
    public Action(): void {
        if (this.game.gameRoundHandler.isWaveInProgress) {

            this.CastBlizzard();
        }
    }

    public GetTickModulo(): number {
        return 10;
    }


    private CastBlizzard(): void {
        const unitX: number = GetUnitX(this.tower);
        const unitY: number = GetUnitY(this.tower);
        const x: number = unitX + GetRandomReal(0.00, 500.00) - 250.00;
        const y: number = unitY + GetRandomReal(0.00, 500.00) - 250.00;
        const dummy: unit = CreateUnit(this.owner.wcPlayer, FourCC('u008'), x, y, 0);
        UnitApplyTimedLifeBJ(2.00, FourCC('BTLF'), dummy);
        UnitAddAbilityBJ(FourCC('A0CO'), dummy);
        IssuePointOrder(dummy, 'blizzard', x, y);
    }
}
