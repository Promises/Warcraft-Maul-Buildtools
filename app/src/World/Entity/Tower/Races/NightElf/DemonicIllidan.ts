import { Tower } from '../../Specs/Tower';
import { AttackActionTower } from '../../Specs/AttackActionTower';

export class DemonicIllidan extends Tower implements AttackActionTower {
    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;
        if (!this.game.gameDamageEngineGlobals.udg_IsDamageSpell) {
            return;
        }
        if (u === this.tower && target) {

            const tempUnit: unit = CreateUnit(
                this.owner.wcPlayer,
                FourCC('u008'),
                GetUnitX(target),
                GetUnitY(target),
                bj_UNIT_FACING);
            UnitApplyTimedLifeBJ(4.00, FourCC('BTLF'), tempUnit);
            UnitAddAbilityBJ(FourCC('A0BZ'), tempUnit);
            IssueTargetOrderBJ(tempUnit, 'soulburn', target);
        }
    }
}
