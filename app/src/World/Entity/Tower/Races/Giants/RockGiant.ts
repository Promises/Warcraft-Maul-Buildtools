import { Tower } from '../../Specs/Tower';
import { KillingActionTower } from '../../Specs/KillingActionTower';

export class RockGiant extends Tower implements KillingActionTower {


    public KillingAction(): void {
        const u: unit | undefined = GetKillingUnitBJ();
        const target: unit | undefined = GetDyingUnit();


        if (u === this.tower && target) {
            const mana: number = GetUnitStateSwap(UNIT_STATE_MANA, this.tower) + 1.00;
            SetUnitManaBJ(this.tower, mana);
            if (mana > 39) {
                SetUnitManaBJ(this.tower, 0.00);
                this.Sell();
                const nu: unit = ReplaceUnitBJ(this.tower, FourCC('h00A'), 0);
                this.game.worldMap.towerConstruction.SetupTower(nu, this.owner);
            }
        }

    }


}
