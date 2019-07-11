import { Tower } from '../Specs/Tower';
import { Defender } from '../../Players/Defender';
import { WarcraftMaul } from '../../../WarcraftMaul';

export class IceTrollKing extends Tower {
    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {
        super(tower, owner, game);
        this.AddCriticalStrike();
    }

    private AddCriticalStrike(): void {
        const loc: location = GetUnitLoc(GetTriggerUnit());
        const grp: group = GetUnitsInRangeOfLocMatching(182.00, loc, Condition(() => this.InitializeCriticalStrikeGroupConditions()));
        RemoveLocation(loc);
        DestroyGroup(grp);
    }

    private InitializeCriticalStrikeGroupConditions(): boolean {
        if (!IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE)) {
            return false;
        }


        if (GetFilterUnit() === GetTriggerUnit()) {
            return false;
        }


        if (GetUnitAbilityLevel(GetFilterUnit(), FourCC('A0CN')) > 0) {
            return false;
        }


        UnitAddAbilityBJ(FourCC('A0CN'), GetFilterUnit());
        return true;
    }
}
