import { CreepAbility } from './specs/CreepAbility';
import { WarcraftMaul } from '../../WarcraftMaul';
import { AttackActionCreepAbility } from './specs/AttackActionCreepAbility';

export class TornadoAura extends CreepAbility {
    constructor(game: WarcraftMaul) {
        super('A01S', game);
    }
}
