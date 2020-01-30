import { Buff } from './Specs/Buff';
import { DamageModificationBuff } from './Specs/DamageModificationBuff';
import { WarcraftMaul } from '../../WarcraftMaul';

/**
 * [Unique] The Darkness
 * +25% damage
 */
export class TheDarknessBuff extends Buff implements DamageModificationBuff {
    constructor(game: WarcraftMaul) {
        super('B02O', game); // Buff ID
    }

    public ModifyDamage(): void {
        const target: unit | undefined = this.damageEngineGlobals.udg_DamageEventTarget;
        if (!target) {
            return;
        }
        if (!this.Condition(target)) {
            return;
        }

        this.damageEngineGlobals.udg_DamageEventAmount *= 1.25;
    }
}
