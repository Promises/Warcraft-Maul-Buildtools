import { CreepAbility } from './specs/CreepAbility';
import { AttackActionCreepAbility } from './specs/AttackActionCreepAbility';

export class CrippleAura extends CreepAbility implements AttackActionCreepAbility {
    constructor(abilityUnit: unit) {
        super('A08G', abilityUnit);
    }

    public AttackAction(): void {
        if (!this.game || !this.game.worldMap.gameRoundHandler) {
            return;
        }
        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;
        const source: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;

        if (target && source) {
            if (UnitHasBuffBJ(source, FourCC('B01C'))) {
                return;
            }
            if (!UnitHasBuffBJ(target, FourCC('B01D'))) {
                return;
            }
            if (Util.RandomInt(1, 100) > 10) {
                return;
            }

            const tempUnit: unit = CreateUnit(
                Player(PLAYER_NEUTRAL_PASSIVE),
                FourCC('u008'),
                0.0,
                -5300.0,
                bj_UNIT_FACING);
            UnitAddAbilityBJ(FourCC('A06B'), tempUnit);
            SetUnitAbilityLevel(tempUnit, FourCC('A06B'), this.game.worldMap.gameRoundHandler.currentWave + 1);
            UnitApplyTimedLifeBJ(1.00, FourCC('BTLF'), tempUnit);
            IssueTargetOrderBJ(tempUnit, 'cripple', source);

        }
    }

}
