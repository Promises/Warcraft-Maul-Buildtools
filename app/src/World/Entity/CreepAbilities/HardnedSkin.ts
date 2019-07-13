import { CreepAbility } from './specs/CreepAbility';
import { WarcraftMaul } from '../../WarcraftMaul';
import { AttackActionCreepAbility } from './specs/AttackActionCreepAbility';

export class HardnedSkin extends CreepAbility {
    constructor(game: WarcraftMaul) {
        super('A069', game);
    }
}
