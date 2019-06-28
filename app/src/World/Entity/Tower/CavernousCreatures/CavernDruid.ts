import { Tower } from '../Specs/Tower';
import { Log } from '../../../../lib/Serilog/Serilog';
import { InitialDamageModificationTower } from '../Specs/InitialDamageModificationTower';

export class CavernDruid extends Tower implements InitialDamageModificationTower {
    public InitialDamageModification(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        if (u === this.tower) {

            this.game.gameDamageEngineGlobals.udg_DamageEventAmount += GetUnitStateSwap(UNIT_STATE_MANA, this.tower) * 25.00;

            SetUnitManaBJ(this.tower, 0.00);
        }
    }

}
