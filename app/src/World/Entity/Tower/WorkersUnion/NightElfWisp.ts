import { Tower } from '../Specs/Tower';
import { Defender } from '../../Players/Defender';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { EndOfRoundTower } from '../Specs/EndOfRoundTower';
import { AttackActionTower } from '../Specs/AttackActionTower';
import { GenericAutoAttackTower } from '../Specs/GenericAutoAttackTower';

export class NightElfWisp extends Tower implements EndOfRoundTower, AttackActionTower, GenericAutoAttackTower {


    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        if (this.game.gameDamageEngineGlobals.udg_DamageEventAOE !== 1) {
            return;
        }
        if (u === this.tower) {
            if (!(GetUnitAbilityLevel(this.tower, FourCC('A09V')) > 0)) {
                return;
            }

            BlzSetUnitBaseDamage(this.tower, BlzGetUnitBaseDamage(this.tower, 0) + 40, 0);

        }

    }

    public GenericAttack(): void {
        IssueImmediateOrderBJ(this.tower, 'stomp');
    }


    public EndOfRoundAction(): void {
        BlzSetUnitBaseDamage(this.tower, 39, 0);
    }

}
