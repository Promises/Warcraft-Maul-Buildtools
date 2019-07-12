import { Tower } from '../Specs/Tower';
import { Defender } from '../../Players/Defender';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { TickingTower } from '../Specs/TickingTower';

export class IceTrollKing extends Tower implements TickingTower {
    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {
        super(tower, owner, game);
        this.AddCriticalStrike();
    }

    private AddCriticalStrike(): void {
        const loc: location = GetUnitLoc(this.tower);
        const grp: group = GetUnitsInRangeOfLocMatching(182.00, loc, Condition(() => this.InitializeCriticalStrikeGroupConditions()));
        RemoveLocation(loc);
        DestroyGroup(grp);
    }

    public Action(): void {

        this.AddCriticalStrike();
    }

    public GetTickModulo(): number {
        return 599;
    }


    private InitializeCriticalStrikeGroupConditions(): boolean {
        if (!IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE)) {
            return false;
        }


        if (GetFilterUnit() === this.tower) {
            return false;
        }


        if (GetUnitAbilityLevel(GetFilterUnit(), FourCC('A0CN')) > 0) {
            return false;
        }


        UnitAddAbilityBJ(FourCC('A0CN'), GetFilterUnit());
        return true;
    }
}
