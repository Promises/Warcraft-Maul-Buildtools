import { Buff } from './Specs/Buff';
import { DamageModificationBuff } from './Specs/DamageModificationBuff';
import { WarcraftMaul } from '../../WarcraftMaul';
import { AttackActionBuff } from './Specs/AttackActionBuff';

/**
 * [Galaxy] Moonstorm
 * 10% chance of dealing 800 extra damage
 */
export class Moonstorm extends Buff implements DamageModificationBuff {
    constructor(game: WarcraftMaul) {
        super('B01E', game); // Buff ID
    }

    public ModifyDamage(): void {
        const target: unit | undefined = this.damageEngineGlobals.udg_DamageEventTarget;
        if (!target) {
            return;
        }
        if (!this.Condition(target)) {
            return;
        }
        if (Util.RandomInt(1, 100) > 10) {
            return;
        }

        DestroyEffect(AddSpecialEffect('Abilities\\Spells\\Other\\Monsoon\\MonsoonBoltTarget.mdl', GetUnitX(target), GetUnitY(target)));
        this.damageEngineGlobals.udg_DamageEventAmount += 800;
    }
}
