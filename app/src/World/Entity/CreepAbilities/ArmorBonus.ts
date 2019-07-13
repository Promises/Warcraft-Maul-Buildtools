import { CreepAbility } from './specs/CreepAbility';
import { WarcraftMaul } from '../../WarcraftMaul';
import { AttackActionCreepAbility } from './specs/AttackActionCreepAbility';

export class ArmorBonus extends CreepAbility {
    constructor(game: WarcraftMaul) {
        super('A06C', game);
    }
}
