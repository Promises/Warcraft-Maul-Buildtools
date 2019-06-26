import { Tower } from '../Specs/Tower';
import { AttackActionTower } from '../Specs/AttackActionTower';
import { Log } from '../../../../lib/Serilog/Serilog';

export class CavernRevenant extends Tower implements AttackActionTower {
    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;

        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;

        if (u === this.tower && target) {
            if (!(this.game.gameDamageEngineGlobals.udg_DamageEventAOE === 0)) {
                Log.Debug('Failed AOE')

                return;
            }
            if (!(GetUnitStateSwap(UNIT_STATE_MANA, this.tower) >= 25)) {
                Log.Debug('Mana failed')

                return;
            }

            Log.Debug('Making revenant tentacle')
            const tempUnit: unit = CreateUnit(this.owner.wcPlayer, FourCC('n00D'), GetUnitX(target), GetUnitY(target), bj_UNIT_FACING);
            SetUnitManaBJ(this.tower, (GetUnitStateSwap(UNIT_STATE_MANA, this.tower) - 25.00));
            UnitApplyTimedLifeBJ(60.00, FourCC('BTLF'), tempUnit);

        }
    }


}
