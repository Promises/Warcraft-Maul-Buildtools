import { Tower } from '../Tower';
import { Defender } from '../../Players/Defender';
import { WarcraftMaul } from '../../../WarcraftMaul';

export class UndeadAcolyte extends Tower {

    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {
        super(tower, owner, game);
        game.gameDamageEngine.AddInitialDamageEvent(() => this.AttackAction(game));
        game.gameRoundHandler.endOfTurnTowers.push(this);

    }


    AttackAction(game: WarcraftMaul): void {
        const u: unit | undefined = game.gameDamageEngineGlobals.udg_DamageEventSource;
        if (game.gameDamageEngineGlobals.udg_DamageEventAOE !== 1) {
            return;
        }
        if (u === this.tower) {
            if (!(GetUnitAbilityLevel(this.tower, FourCC('A09S')) > 0)) {
                return;
            }

            BlzSetUnitBaseDamage(this.tower, BlzGetUnitBaseDamage(this.tower, 0) + 5, 0);

        }

    }


    EndOfRoundAction(): void {
        BlzSetUnitBaseDamage(this.tower, 4, 0);
    }

}
