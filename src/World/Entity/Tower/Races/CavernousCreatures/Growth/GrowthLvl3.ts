import { Defender } from '../../../../Players/Defender';
import { WarcraftMaul } from '../../../../../WarcraftMaul';
import { Tower } from '../../../Specs/Tower';

export class GrowthLvl3 extends Tower {

    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {
        super(tower, owner, game);
        SetUnitAbilityLevelSwapped(FourCC('A0CG'), this.tower, 3);
        SetUnitAbilityLevelSwapped(FourCC('S00A'), this.tower, 3);

    }
}
