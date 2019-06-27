import { Buff } from './Specs/Buff';
import { DamageModificationBuff } from './Specs/DamageModificationBuff';
import { WarcraftMaul } from '../../WarcraftMaul';
import { AttackActionBuff } from './Specs/AttackActionBuff';

/**
 * [NEAncients] Corrupted Ancient of War
 * Has a 75% chance of spawning an ent
 */
export class ForceOfNature extends Buff implements AttackActionBuff {
    constructor(game: WarcraftMaul) {
        super('B005', game); // Buff ID
    }

    public AttackAction(): void {
        const target: unit | undefined = this.damageEngineGlobals.udg_DamageEventTarget;
        if (!target) {
            return;
        }
        if (!this.Condition(target)) {
            return;
        }
        if (this.damageEngineGlobals.udg_DamageEventAmount < GetUnitStateSwap(UNIT_STATE_LIFE, target)) {
            return;
        }
        if (Util.RandomInt(1, 100) > 75) {
            return;
        }
        if (!this.damageEngineGlobals.udg_DamageEventSource) {
            return;
        }

        const dummy: unit = CreateUnit(
            GetOwningPlayer(this.damageEngineGlobals.udg_DamageEventSource),
            FourCC('u005'),
            GetUnitX(target),
            GetUnitY(target),
            bj_UNIT_FACING);
        UnitApplyTimedLifeBJ(10.00, FourCC('BTLF'), dummy);
    }
}
