import { Buff } from './Specs/Buff';
import { DamageModificationBuff } from './Specs/DamageModificationBuff';
import { WarcraftMaul } from '../../WarcraftMaul';

/**
 * [Ice Troll] Ice Troll Joker
 * *3 damage
 */
export class IceTrollJoker extends Buff implements DamageModificationBuff {
    constructor(game: WarcraftMaul) {
        super('B02M', game); // Buff ID
    }

    public ModifyDamage(): void {
        const target: unit | undefined = this.damageEngineGlobals.udg_DamageEventTarget;
        if (!target) {
            return;
        }
        if (!this.Condition(target)) {
            return;
        }


        if (!(GetUnitMoveSpeed(target) < GetUnitDefaultMoveSpeed(target))) {
            return;
        }
        this.damageEngineGlobals.udg_DamageEventAmount *= 3.00;
    }
}
