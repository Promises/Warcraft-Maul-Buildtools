import { CreepAbility } from './specs/CreepAbility';
import { FinalDamageModificationCreepAbility } from './specs/FinalDamageModificationCreepAbility';
import { WarcraftMaul } from '../../WarcraftMaul';

export class DivineShield extends CreepAbility implements FinalDamageModificationCreepAbility {
    constructor(game: WarcraftMaul) {
        super('A01E', game);
    }

    public ModifyFinalDamage(): void {
        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;
        if (target) {
            if (GetUnitAbilityLevel(target, this.GetID()) > 0) {
                const lvl: number = GetUnitAbilityLevel(target, this.GetID());
                this.game.gameDamageEngineGlobals.udg_DamageEventAmount = 0;
                if (lvl <= 1) {
                    UnitRemoveAbility(target, this.GetID());
                } else {
                    SetUnitAbilityLevel(target, this.GetID(), lvl - 1);
                }

            }
        }


    }

}
