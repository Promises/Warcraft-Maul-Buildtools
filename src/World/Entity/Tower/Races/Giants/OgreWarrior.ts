import { Tower } from '../../Specs/Tower';
import { AttackActionTower } from '../../Specs/AttackActionTower';

export class OgreWarrior extends Tower implements AttackActionTower {
    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;


        if (u === this.tower && target) {
            if (UnitHasBuffBJ(target, FourCC('B01J'))) {
                return;
            }

            const tempUnit: unit = CreateUnit(
                this.owner.wcPlayer,
                FourCC('u008'),
                GetUnitX(target),
                GetUnitY(target),
                bj_UNIT_FACING);
            UnitApplyTimedLifeBJ(1.00, FourCC('BTLF'), tempUnit);
            UnitAddAbilityBJ(FourCC('A029'), tempUnit);
            IssueTargetOrderBJ(tempUnit, 'slow', target);
        }
    }
}
