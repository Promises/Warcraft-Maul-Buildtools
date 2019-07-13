import { Tower } from '../../Specs/Tower';
import { WarcraftMaul } from '../../../../WarcraftMaul';
import { EndOfRoundTower } from '../../Specs/EndOfRoundTower';
import { AttackActionTower } from '../../Specs/AttackActionTower';

export class NagaSlave extends Tower implements EndOfRoundTower, AttackActionTower {


    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        if (u === this.tower) {
            if (!(GetUnitAbilityLevel(this.tower, FourCC('A09U')) > 0)) {
                return;
            }

            BlzSetUnitBaseDamage(this.tower, BlzGetUnitBaseDamage(this.tower, 0) + 20, 0);

            this.DoSpell(this.game);
        }

    }

    public DoSpell(game: WarcraftMaul): void {
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

    public EndOfRoundAction(): void {
        BlzSetUnitBaseDamage(this.tower, 19, 0);
    }

}
