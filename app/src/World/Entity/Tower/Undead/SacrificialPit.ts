import { Tower } from '../Tower';
import { AttackActionTower } from '../AttackActionTower';

export class SacrificialPit extends Tower implements AttackActionTower {


    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        const dmgEventAmount: number = this.game.gameDamageEngineGlobals.udg_DamageEventAmount;
        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;
        if (target) {
            if (!UnitHasBuffBJ(target, FourCC('B014'))) {
                return;
            }
            if ((dmgEventAmount < GetUnitStateSwap(UNIT_STATE_LIFE, target))) {
                return;
            }


            const loc: location = GetUnitLoc(target);
            const dummy: unit = CreateUnitAtLoc(this.owner.wcPlayer, FourCC('u008'), loc, bj_UNIT_FACING);
            UnitAddAbilityBJ(FourCC('A08P'), dummy);
            IssuePointOrderLocBJ(dummy, 'rainoffire', loc);
            UnitApplyTimedLifeBJ(3.00, FourCC('BTLF'), dummy);
            RemoveLocation(loc);


        }

    }


}
