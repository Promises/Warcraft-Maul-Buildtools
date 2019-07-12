import { Tower } from '../../Specs/Tower';
import { AttackActionTower } from '../../Specs/AttackActionTower';

export class CorruptedTreeofLife extends Tower implements AttackActionTower {
    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;
        if (u === this.tower && target) {
            if (!(GetUnitAbilityLevelSwapped(FourCC('A091'), this.tower) > 0)) {
                return;
            }
            const tempUnit: unit = CreateUnit(this.owner.wcPlayer, FourCC('u008'), GetUnitX(target), GetUnitY(target), bj_UNIT_FACING);
            UnitApplyTimedLifeBJ(1.00, FourCC('BTLF'), tempUnit);
            UnitAddAbilityBJ(FourCC('A090'), tempUnit);
            IssueTargetOrderBJ(tempUnit, 'chainlightning', target);
        }
    }
}
