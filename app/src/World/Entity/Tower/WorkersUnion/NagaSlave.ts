import { Tower } from '../Tower';
import { Defender } from '../../Players/Defender';
import { WarcraftMaul } from '../../../WarcraftMaul';

export class NagaSlave extends Tower {

    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {
        super(tower, owner, game);
        game.gameDamageEngine.AddInitialDamageEvent(() => this.AttackAction(game));
        game.gameRoundHandler.endOfTurnTowers.push(this);

    }

    AttackAction(game: WarcraftMaul): void {
        const u: unit | undefined = game.gameDamageEngineGlobals.udg_DamageEventSource;
        if (u === this.tower) {
            if (!(GetUnitAbilityLevel(this.tower, FourCC('A09U')) > 0)) {
                return;
            }

            BlzSetUnitBaseDamage(this.tower, BlzGetUnitBaseDamage(this.tower, 0) + 20, 0);

            this.DoSpell(game);
        }

    }

    DoSpell(game: WarcraftMaul): void {
        const randomInt: number = Util.RandomInt(1, 4);
        const target: unit | undefined = game.gameDamageEngineGlobals.udg_DamageEventTarget;
        if (!target) {
            return;
        }
        if (randomInt === 1 || randomInt === 2) {
            const spellPoint: location = GetUnitLoc(this.tower);
            const tempUnit: unit = CreateUnitAtLocSaveLast(this.owner.wcPlayer, FourCC('u008'), spellPoint, bj_UNIT_FACING);
            UnitApplyTimedLifeBJ(3.00, FourCC('BTLF'), tempUnit);
            if (randomInt === 1) {
                UnitAddAbilityBJ(FourCC('A09W'), tempUnit);
                IssueTargetOrderBJ(tempUnit, 'thunderbolt', target);
            } else {
                UnitAddAbilityBJ(FourCC('A09X'), tempUnit);
                IssueTargetOrderBJ(tempUnit, 'forkedlightning', target);
            }

            RemoveLocation(spellPoint);
        }

    }

    EndOfRoundAction(): void {
        BlzSetUnitBaseDamage(this.tower, 19, 0);
    }

}
