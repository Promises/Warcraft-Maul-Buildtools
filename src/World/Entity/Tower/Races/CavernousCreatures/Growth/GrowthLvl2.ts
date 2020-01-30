import { Defender } from '../../../../Players/Defender';
import { WarcraftMaul } from '../../../../../WarcraftMaul';
import { Tower } from '../../../Specs/Tower';

export class GrowthLvl2 extends Tower {

    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {
        super(tower, owner, game);
        SetUnitAbilityLevelSwapped(FourCC('A0CG'), this.tower, 2);
        SetUnitAbilityLevelSwapped(FourCC('S00A'), this.tower, 2);

    }
}
