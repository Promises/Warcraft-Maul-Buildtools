import { Buff } from './Specs/Buff';
import { DamageModificationBuff } from './Specs/DamageModificationBuff';
import { WarcraftMaul } from '../../WarcraftMaul';

/**
 * [Forest Troll] Forest troll joker
 * +50% damage
 */
export class BattleRoar extends Buff implements DamageModificationBuff {
    constructor(game: WarcraftMaul) {
        super('B015', game); // Buff ID
    }

    public ModifyDamage(): void {
        const target: unit | undefined = this.damageEngineGlobals.udg_DamageEventTarget;
        if (!target) {
            return;
        }
        if (!this.Condition(target)) {
            return;
        }

        this.damageEngineGlobals.udg_DamageEventAmount *= 1.5;
    }
}
