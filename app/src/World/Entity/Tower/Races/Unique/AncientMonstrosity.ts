import { Tower } from '../../Specs/Tower';
import { AttackActionTower } from '../../Specs/AttackActionTower';

export class AncientMonstrosity extends Tower implements AttackActionTower {


    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;

        if (Util.RandomInt(1, 2) === 1) {
            return;
        }
        if (u === this.tower && target) {
            const tempUnit: unit = CreateUnit(
                this.owner.wcPlayer,
                FourCC('u008'),
                GetUnitX(this.tower),
                GetUnitY(this.tower),
                bj_UNIT_FACING);
            UnitApplyTimedLifeBJ(2.00, FourCC('BTLF'), tempUnit);
            UnitAddAbilityBJ(FourCC('A0EE'), tempUnit);
            IssueTargetOrderBJ(tempUnit, 'acidbomb', target);

        }

    }


}
