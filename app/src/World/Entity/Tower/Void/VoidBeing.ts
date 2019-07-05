import { Tower } from '../Specs/Tower';
import { AttackActionTower } from '../Specs/AttackActionTower';

export class VoidBeing extends Tower implements AttackActionTower {
    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;

        if (u === this.tower) {

            SetUnitLifeBJ(this.tower, GetUnitStateSwap(UNIT_STATE_LIFE, this.tower) + 2.00);


        }
    }
}
