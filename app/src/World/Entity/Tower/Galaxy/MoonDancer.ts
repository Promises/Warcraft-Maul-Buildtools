import { Tower } from '../Specs/Tower';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { EndOfRoundTower } from '../Specs/EndOfRoundTower';
import { AttackActionTower } from '../Specs/AttackActionTower';

export class MoonDancer extends Tower implements AttackActionTower {


    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        if (u === this.tower) {
            if (!(GetUnitAbilityLevel(this.tower, FourCC('A09U')) > 0)) {
                return;
            }
            const mana: number = GetUnitStateSwap(UNIT_STATE_MANA, this.tower) + 1.00;
            SetUnitManaBJ(this.tower, mana);
            if (mana > 4) {
                SetUnitManaBJ(this.tower, 0.00);
                this.DoSpell(this.game);
            }
            this.DoSpell(this.game);
        }

    }

    public DoSpell(game: WarcraftMaul): void {
        const target: unit | undefined = game.gameDamageEngineGlobals.udg_DamageEventTarget;
        if (!target) {
            return;
        }
        const spellPoint: location = GetUnitLoc(target);
        const tempUnit: unit = CreateUnitAtLoc(this.owner.wcPlayer, FourCC('u008'), spellPoint, bj_UNIT_FACING);
        UnitApplyTimedLifeBJ(1.00, FourCC('BTLF'), tempUnit);
        UnitAddAbilityBJ(FourCC('A022'), tempUnit);
        IssueTargetOrderBJ(tempUnit, 'blizzard', target);
        RemoveLocation(spellPoint);
    }


}
