import { CreepAbility } from './specs/CreepAbility';
import { WarcraftMaul } from '../../WarcraftMaul';
import { AttackActionCreepAbility } from './specs/AttackActionCreepAbility';

export class WalkItOff extends CreepAbility implements AttackActionCreepAbility {
    constructor(game: WarcraftMaul) {
        super('A01T', game);
    }

    public AttackAction(): void {
        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;

        if (target) {
            if (!UnitHasBuffBJ(target, FourCC('B01H'))) {
                return;
            }
            if (!(GetUnitMoveSpeed(target) < GetUnitDefaultMoveSpeed(target))) {
                return;
            }
            this.game.gameDamageEngineGlobals.udg_DamageEventAmount *= (1.00 - 0.50 * (this.game.gameRoundHandler.currentWave + 1) * 0.01);
        }
    }

}
