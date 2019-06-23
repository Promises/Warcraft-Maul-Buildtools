import { Tower } from '../Tower';
import { EndOfRoundTower } from '../EndOfRoundTower';
import { AttackActionTower } from '../AttackActionTower';

export class OrcPeon extends Tower implements EndOfRoundTower, AttackActionTower {


    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        if (u === this.tower) {
            if (!(GetUnitAbilityLevel(this.tower, FourCC('A09Q')) > 0)) {
                return;
            }

            BlzSetUnitBaseDamage(this.tower, BlzGetUnitBaseDamage(this.tower, 0) + 1, 0);

        }

    }


    public EndOfRoundAction(): void {
        BlzSetUnitBaseDamage(this.tower, 0, 0);
    }

}
