import { Tower } from '../../Specs/Tower';
import { AttackActionTower } from '../../Specs/AttackActionTower';

export class KelThuzad extends Tower implements AttackActionTower {
    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;

        if (u === this.tower && target) {
            BlzSetUnitArmor(target, BlzGetUnitArmor(target) - 0.1 * (1 - (GetUnitMoveSpeed(target) / GetUnitDefaultMoveSpeed(target))));
        }
    }
}
