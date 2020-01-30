import { CreepAbility } from './specs/CreepAbility';
import { AttackActionCreepAbility } from './specs/AttackActionCreepAbility';

export class WalkItOff extends CreepAbility implements AttackActionCreepAbility {
    constructor(abilityUnit: unit) {
        super('A01T', abilityUnit);
    }

    public AttackAction(): void {
        if (!this.game || !this.game.worldMap.gameRoundHandler) {
            return;
        }
        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;

        if (target) {
            if (!UnitHasBuffBJ(target, FourCC('B01H'))) {
                return;
            }
            if (!(GetUnitMoveSpeed(target) < GetUnitDefaultMoveSpeed(target))) {
                return;
            }
            this.game.gameDamageEngineGlobals.udg_DamageEventAmount *= (1.00 - 0.50 * (this.game.worldMap.gameRoundHandler.currentWave + 1) * 0.01);
        }
    }

}
