import { GenericAbility } from './GenericAbility';
import { WarcraftMaul } from '../../WarcraftMaul';


/**
 *  Frost Attack (A08X)
 *  Slows enemies with splash
 */
export class FrostAttack extends GenericAbility implements AttackActionAbility {
    constructor(game: WarcraftMaul) {
        super('A08X', game);
    }

    public AttackAction(): void {
        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;
        const source: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        if (target && source) {
            if (!(GetUnitAbilityLevelSwapped(FourCC('A08X'), source) > 0)) {
                return;
            }
            if (UnitHasBuffBJ(target, FourCC('B017'))) {
                return;
            }
            const dummy: unit = CreateUnit(GetOwningPlayer(source), FourCC('u008'), GetUnitX(target), GetUnitY(target), bj_UNIT_FACING);
            UnitAddAbilityBJ(FourCC('A02U'), dummy); // Slow
            IssueTargetOrderBJ(dummy, 'slow', target);
            UnitApplyTimedLifeBJ(1.00, FourCC('BTLF'), dummy);
        }

    }


}
