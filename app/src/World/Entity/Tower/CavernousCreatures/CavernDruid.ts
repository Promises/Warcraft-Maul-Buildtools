import { Tower } from '../Specs/Tower';
import { AttackActionTower } from '../Specs/AttackActionTower';

export class CavernDruid extends Tower implements AttackActionTower {
    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        if (u === this.tower) {

            this.game.gameDamageEngineGlobals.udg_DamageEventAmount += GetUnitStateSwap(UNIT_STATE_MANA, this.tower) * 25.00;
            SetUnitManaBJ(this.tower, 0.00);
        }
    }

}
