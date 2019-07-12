import { Tower } from '../../Specs/Tower';
import { AttackActionTower } from '../../Specs/AttackActionTower';
import { GenericAutoAttackTower } from '../../Specs/GenericAutoAttackTower';

export class CavernHermit extends Tower implements AttackActionTower, GenericAutoAttackTower {
    public AttackAction(): void {
        if (!this.game.gameDamageEngineGlobals.udg_IsDamageSpell) {
            return;
        }
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;

        if (u === this.tower && target) {
            if (Util.RandomInt(1, 3) !== 1) {
                return;
            }
            const tempUnit: unit = CreateUnit(this.owner.wcPlayer, FourCC('u008'), GetUnitX(u), GetUnitY(u), bj_UNIT_FACING);
            UnitApplyTimedLifeBJ(3.00, FourCC('BTLF'), tempUnit);
            UnitAddAbilityBJ(FourCC('A0CC'), tempUnit);
            IssueTargetOrderBJ(tempUnit, 'lightningshield', target);
        }
    }

    public GenericAttack(): void {
        this.CastSpellOnAttackedUnitLocation('carrionswarm');
    }

}
