import { Tower } from '../../Specs/Tower';
import { Defender } from '../../../Players/Defender';
import { WarcraftMaul } from '../../../../WarcraftMaul';
import { ELEMENTALIST_ABILITIES } from '../../../../GlobalSettings';
import { Log } from '../../../../../lib/Serilog/Serilog';

export class UnchargedRune extends Tower {
    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {
        super(tower, owner, game);
        this.AddAbilities();
    }

    private AddAbilities(): void {
        const nums: number[] = [];
        for (let i: number = 0; i < ELEMENTALIST_ABILITIES.length - 1; i++) {
            nums.push(i);
            UnitRemoveAbilityBJ(ELEMENTALIST_ABILITIES[nums[i]], this.tower);
        }


        Util.ShuffleArray(nums);
        UnitAddAbilityBJ(ELEMENTALIST_ABILITIES[nums[0]], this.tower);
        UnitAddAbilityBJ(ELEMENTALIST_ABILITIES[nums[1]], this.tower);
    }

}
