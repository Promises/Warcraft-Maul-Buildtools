import { CreepAbility } from './specs/CreepAbility';
import { WarcraftMaul } from '../../WarcraftMaul';
import { AttackActionCreepAbility } from './specs/AttackActionCreepAbility';

export class Evasion extends CreepAbility {
    constructor(game: WarcraftMaul) {
        super('A06A', game);
    }
}
