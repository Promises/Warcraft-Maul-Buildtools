import { Tower } from '../../Specs/Tower';
import { AttackActionTower } from '../../Specs/AttackActionTower';

export class CavernRevenant extends Tower implements AttackActionTower {
    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;

        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;

        if (u === this.tower && target) {
            if (!(this.game.gameDamageEngineGlobals.udg_DamageEventAOE === 1)) {
                return;
            }
            if (!(GetUnitStateSwap(UNIT_STATE_MANA, this.tower) >= 25)) {
                return;
            }

            const tempUnit: unit = CreateUnit(this.owner.wcPlayer, FourCC('n00D'), GetUnitX(target), GetUnitY(target), bj_UNIT_FACING);
            SetUnitManaBJ(this.tower, (GetUnitStateSwap(UNIT_STATE_MANA, this.tower) - 25.00));
            UnitApplyTimedLifeBJ(60.00, FourCC('BTLF'), tempUnit);

        }
    }


}
