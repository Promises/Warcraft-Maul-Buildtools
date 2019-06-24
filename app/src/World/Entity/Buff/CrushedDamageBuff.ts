import { Buff } from './Specs/Buff';
import { DamageModificationBuff } from './Specs/DamageModificationBuff';
import { WarcraftMaul } from '../../WarcraftMaul';

/**
 * [Arachnid] Nerubian Behemoth
 * +25% damage
 */
export class CrushedDamageBuff extends Buff implements DamageModificationBuff {
    constructor(game: WarcraftMaul) {
        super('B006', game); // Buff ID
    }

    public ModifyDamage(): void {
        const target: unit | undefined = this.damageEngineGlobals.udg_DamageEventTarget;
        if (!target) {
            return;
        }
        if (!this.Condition(target)) {
            return;
        }

        this.damageEngineGlobals.udg_DamageEventAmount *= 100.25;
    }
}
