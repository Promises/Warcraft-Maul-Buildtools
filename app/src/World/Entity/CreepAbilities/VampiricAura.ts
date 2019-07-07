import { CreepAbility } from './specs/CreepAbility';
import { WarcraftMaul } from '../../WarcraftMaul';
import { AttackActionCreepAbility } from './specs/AttackActionCreepAbility';

export class VampiricAura extends CreepAbility implements AttackActionCreepAbility {
    constructor(game: WarcraftMaul) {
        super('A0B3', game);
    }

    public AttackAction(): void {
        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;

        if (target) {
            if (!(GetUnitAbilityLevel(target, this.GetID()) > 0)) {
                return;
            }
            if (Util.RandomInt(1, 100) > 10) {
                return;
            }
            const effectModel: string = 'Abilities\\Spells\\Undead\\VampiricAura\\VampiricAuraTarget.mdl';
            DestroyEffectBJ(AddSpecialEffect(effectModel, GetUnitX(target), GetUnitY(target)));
            SetUnitLifeBJ(target, GetUnitStateSwap(UNIT_STATE_LIFE, target) + 4 * (this.game.gameRoundHandler.currentWave + 1));
        }
    }

}
