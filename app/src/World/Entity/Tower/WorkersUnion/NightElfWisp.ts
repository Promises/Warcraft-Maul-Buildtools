import { Tower } from '../Tower';
import { Defender } from '../../Players/Defender';
import { WarcraftMaul } from '../../../WarcraftMaul';

export class NightElfWisp extends Tower {

    genericAtk: () => void;

    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {
        super(tower, owner, game);
        game.gameDamageEngine.AddInitialDamageEvent(() => this.AttackAction(game));
        game.gameRoundHandler.endOfTurnTowers.push(this);
        this.genericAtk = () => this.GenericAttack();
        game.worldMap.towerConstruction.genericAttacks.push(this.genericAtk);
    }


    AttackAction(game: WarcraftMaul): void {
        const u: unit | undefined = game.gameDamageEngineGlobals.udg_DamageEventSource;
        if (game.gameDamageEngineGlobals.udg_DamageEventAOE !== 1) {
            return;
        }
        if (u === this.tower) {
            if (!(GetUnitAbilityLevel(this.tower, FourCC('A09V')) > 0)) {
                return;
            }

            BlzSetUnitBaseDamage(this.tower, BlzGetUnitBaseDamage(this.tower, 0) + 40, 0);

        }

    }

    GenericAttack(): void {
        IssueImmediateOrderBJ(this.tower, 'stomp');
    }


    EndOfRoundAction(): void {
        BlzSetUnitBaseDamage(this.tower, 39, 0);
    }

}
