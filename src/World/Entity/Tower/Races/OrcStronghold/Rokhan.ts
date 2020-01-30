import { Tower } from '../../Specs/Tower';
import { AttackActionTower } from '../../Specs/AttackActionTower';

export class Rokhan extends Tower implements AttackActionTower {
    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;

        if (u === this.tower && target) {

            const tempUnit: unit = CreateUnit(
                this.owner.wcPlayer,
                FourCC('o00H'),
                GetUnitX(target),
                GetUnitY(target),
                bj_UNIT_FACING);
            UnitApplyTimedLifeBJ(5.00, FourCC('BTLF'), tempUnit);
        }
    }
}
