import { Tower } from '../Tower';
import { EndOfRoundTower } from '../EndOfRoundTower';
import { AttackActionTower } from '../AttackActionTower';

export class UndeadAcolyte extends Tower implements EndOfRoundTower, AttackActionTower {

    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        if (this.game.gameDamageEngineGlobals.udg_DamageEventAOE !== 1) {
            return;
        }
        if (u === this.tower) {
            if (!(GetUnitAbilityLevel(this.tower, FourCC('A09S')) > 0)) {
                return;
            }

            BlzSetUnitBaseDamage(this.tower, BlzGetUnitBaseDamage(this.tower, 0) + 5, 0);

        }

    }


    public EndOfRoundAction(): void {
        BlzSetUnitBaseDamage(this.tower, 4, 0);
    }

}
