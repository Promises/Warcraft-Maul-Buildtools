import { CreepAbility } from './specs/CreepAbility';
import { AttackActionCreepAbility } from './specs/AttackActionCreepAbility';

export class VampiricAura extends CreepAbility implements AttackActionCreepAbility {
    constructor(abilityUnit: unit) {
        super('A0B3', abilityUnit);
    }

    public AttackAction(): void {
        if (!this.game  || !this.game.worldMap.gameRoundHandler) {
            return;
        }
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
            SetUnitLifeBJ(target, GetUnitStateSwap(UNIT_STATE_LIFE, target) + 4 * (this.game.worldMap.gameRoundHandler.currentWave + 1));
        }
    }

}
