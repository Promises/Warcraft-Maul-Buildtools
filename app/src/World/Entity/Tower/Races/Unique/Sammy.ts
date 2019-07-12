import { Tower } from '../../Specs/Tower';
import { AttackActionTower } from '../../Specs/AttackActionTower';
import { Defender } from '../../../Players/Defender';

export class Sammy extends Tower implements AttackActionTower {
    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;


        if (u === this.tower) {
            SetUnitManaBJ(this.tower, (GetUnitStateSwap(UNIT_STATE_MANA, this.tower) + 1.00));
            if (GetUnitStateSwap(UNIT_STATE_MANA, this.tower) >= 1000) {
                this.Sell();
                const tower: unit = ReplaceUnitBJ(
                    this.tower,
                    FourCC('u040'),
                    bj_UNIT_STATE_METHOD_DEFAULTS);


                this.game.worldMap.towerConstruction.SetupTower(tower, this.owner);
            }

        }
    }
}
