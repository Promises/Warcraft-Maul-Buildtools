import { Tower } from '../../Specs/Tower';
import { TickingTower } from '../../Specs/TickingTower';

export class AncientGolem extends Tower implements TickingTower {

    public Action(): void {
        const mana: number = GetUnitStateSwap(UNIT_STATE_MANA, this.tower) + 1;
        SetUnitManaBJ(this.tower, mana);
        BlzSetUnitBaseDamage(this.tower, BlzGetUnitBaseDamage(this.tower, 0) + 75, 0);

        SetUnitScalePercent(this.tower, 30.0 + (mana * 10), 30.0 + (mana * 10), 30.0 + (mana * 10));

        if (mana > 6) {
            this.game.towerTicker.RemoveTickingTower(this.UniqueID);
        }

    }

    public GetTickModulo(): number {
        return 599;
    }

}
