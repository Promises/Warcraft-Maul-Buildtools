import { CreepAbility } from './specs/CreepAbility';
import { WarcraftMaul } from '../../WarcraftMaul';
import { AttackActionCreepAbility } from './specs/AttackActionCreepAbility';

export class SpellShield extends CreepAbility {
    constructor(abilityUnit: unit) {
        super('A00D', abilityUnit);
    }
}
