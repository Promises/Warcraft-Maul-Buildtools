import { Tower } from '../Specs/Tower';
import { AttackActionTower } from '../Specs/AttackActionTower';

export class NerubianBehemoth extends Tower implements AttackActionTower {
    public AttackAction(): void {
        if (Util.RandomInt(1, 4) !== 1) {
            return;
        }

        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;
        if (u === this.tower && target) {
            const tempUnit: unit = CreateUnit(this.owner.wcPlayer, FourCC('u008'), GetUnitX(u), GetUnitY(u), bj_UNIT_FACING);
            UnitApplyTimedLifeBJ(1.00, FourCC('BTLF'), tempUnit);
            UnitAddAbilityBJ(FourCC('A0AH'), tempUnit);
            IssueTargetOrderBJ(tempUnit, 'cripple', target);
        }
    }
}
