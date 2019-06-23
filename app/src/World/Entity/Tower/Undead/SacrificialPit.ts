import { Tower } from '../Tower';
import { Defender } from '../../Players/Defender';
import { WarcraftMaul } from '../../../WarcraftMaul';

export class SacrificialPit extends Tower {

    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {
        super(tower, owner, game);
        game.gameDamageEngine.AddInitialDamageEvent(() => this.AttackAction(game));

    }

    AttackAction(game: WarcraftMaul): void {
        const u: unit | undefined = game.gameDamageEngineGlobals.udg_DamageEventSource;
        const dmgEventAmount: number = game.gameDamageEngineGlobals.udg_DamageEventAmount;
        const target: unit | undefined = game.gameDamageEngineGlobals.udg_DamageEventTarget;
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
