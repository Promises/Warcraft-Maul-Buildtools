import { Tower } from '../../Specs/Tower';
import { AttackActionTower } from '../../Specs/AttackActionTower';

export class GoblinMineLayer extends Tower implements AttackActionTower {
    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;

        if (u === this.tower && target) {
            if (!(GetUnitStateSwap(UNIT_STATE_MANA, this.tower) >= 15.00)) {
                return;
            }
            const mine: unit = CreateUnit(
                this.owner.wcPlayer,
                FourCC('h013'),
                GetUnitX(target),
                GetUnitY(target),
                bj_UNIT_FACING);
            UnitApplyTimedLifeBJ(2.00, FourCC('BTLF'), mine);
            SetUnitManaBJ(this.tower, (GetUnitStateSwap(UNIT_STATE_MANA, this.tower) - 15.00));
        }
    }
}
