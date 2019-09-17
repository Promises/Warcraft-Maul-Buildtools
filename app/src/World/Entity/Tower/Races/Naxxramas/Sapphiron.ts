import { Tower } from '../../Specs/Tower';
import { AttackActionTower } from '../../Specs/AttackActionTower';
import { EndOfRoundTower } from '../../Specs/EndOfRoundTower';

export class Sapphiron extends Tower implements AttackActionTower, EndOfRoundTower {
    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;

        if (u === this.tower) {
            if (GetUnitStateSwap(UNIT_STATE_MANA, this.tower) >= 100) {
                SetUnitManaBJ(this.tower, GetUnitStateSwap(UNIT_STATE_MANA, this.tower) - 100);
                if (GetUnitAbilityLevelSwapped(FourCC('A0F9'), this.tower) <= 6) {
                    IncUnitAbilityLevelSwapped(FourCC('A0F9'), this.tower);
                }
            }
            SetUnitManaBJ(this.tower, GetUnitStateSwap(UNIT_STATE_MANA, u) + 1.00);
        }
    }

    public EndOfRoundAction(): void {
        SetUnitAbilityLevelSwapped(FourCC('A0F9'), this.tower, 1);
    }
}
