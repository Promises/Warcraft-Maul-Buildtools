import { Tower } from '../Specs/Tower';
import { AttackActionTower } from '../Specs/AttackActionTower';
import { Log } from '../../../../lib/Serilog/Serilog';

export class CavernTurtle extends Tower implements AttackActionTower {
    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;

        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;

        if (u === this.tower && target) {
            if (!(this.game.gameDamageEngineGlobals.udg_DamageEventAOE === 1)) {
                return;
            }
            if (!(GetUnitStateSwap(UNIT_STATE_MANA, this.tower) >= 100)) {
                return;
            }

            SetUnitManaBJ(this.tower, (GetUnitStateSwap(UNIT_STATE_MANA, this.tower) - 100.00));
            const tempUnit: unit = CreateUnit(this.owner.wcPlayer, FourCC('u008'), GetUnitX(target), GetUnitY(target), bj_UNIT_FACING);
            UnitApplyTimedLifeBJ(3.00, FourCC('BTLF'), tempUnit);
            UnitAddAbilityBJ(FourCC('A0BY'), tempUnit);
            IssueImmediateOrderBJ(tempUnit, 'fanofknives');

        }
    }


}
