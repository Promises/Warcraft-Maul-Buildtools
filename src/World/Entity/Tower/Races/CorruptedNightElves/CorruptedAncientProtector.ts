import { Tower } from '../../Specs/Tower';
import { TickingTower } from '../../Specs/TickingTower';

export class CorruptedAncientProtector extends Tower implements TickingTower {
    public Action(): void {
        if (this.game.worldMap.gameRoundHandler && this.game.worldMap.gameRoundHandler.isWaveInProgress) {
            const y: number = GetUnitY(this.tower);
            const x: number = GetUnitX(this.tower);
            const dummy: unit = CreateUnit(this.owner.wcPlayer, FourCC('u008'), x, y, 0);
            UnitApplyTimedLifeBJ(11.00, FourCC('BTLF'), dummy);
            UnitAddAbilityBJ(FourCC('A010'), dummy);
            IssueImmediateOrderBJ(dummy, 'starfall');
        }
    }

    public GetTickModulo(): number {
        return 300;
    }

}
