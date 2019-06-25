import { Buff } from './Specs/Buff';
import { DamageModificationBuff } from './Specs/DamageModificationBuff';
import { WarcraftMaul } from '../../WarcraftMaul';

/**
 * [Tavern] Earth Pandaren
 * +25% damage
 */
export class DrunkenHaze extends Buff implements DamageModificationBuff {
    constructor(game: WarcraftMaul) {
        super('B018', game); // Buff ID
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
