import { Buff } from './Specs/Buff';
import { WarcraftMaul } from '../../WarcraftMaul';
import { AttackActionBuff } from './Specs/AttackActionBuff';
import { Defender } from '../Players/Defender';
import { Tower } from '../Tower/Specs/Tower';

/**
 * [Naxxramas] Citadel of Naxxramas
 * Gain mana on nearby death
 */
export class SoulCollector extends Buff implements AttackActionBuff {
    constructor(game: WarcraftMaul) {
        super('B02Q', game); // Buff ID
    }

    public AttackAction(): void {
        const target: unit | undefined = this.damageEngineGlobals.udg_DamageEventTarget;
        const source: unit | undefined = this.damageEngineGlobals.udg_DamageEventSource;
        if (!target) {
            return;
        }
        if (!this.Condition(target)) {
            return;
        }
        if (this.damageEngineGlobals.udg_DamageEventAmount < GetUnitStateSwap(UNIT_STATE_LIFE, target)) {
            return;
        }
        if (!this.damageEngineGlobals.udg_DamageEventSource) {
            return;
        }
        if (source) {
            const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(source)));
            if (owner && owner.citadelOfNaxxramas) {
                const tower: Tower = owner.citadelOfNaxxramas;

                if (tower.GetTypeID() === FourCC('oC7C')) {
                    SetUnitManaBJ(tower.tower, GetUnitStateSwap(UNIT_STATE_MANA, tower.tower) + 1.00);
                }
                if (GetUnitStateSwap(UNIT_STATE_MANA, tower.tower) % 10 === 0) {
                    SetUnitAbilityLevel(tower.tower, FourCC('A0F6'), GetUnitStateSwap(UNIT_STATE_MANA, tower.tower) / 10);
                }
            }
        }
    }
}
