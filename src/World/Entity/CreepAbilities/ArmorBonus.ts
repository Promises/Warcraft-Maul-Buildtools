import { CreepAbility } from './specs/CreepAbility';

export class ArmorBonus extends CreepAbility {
    constructor(abilityUnit: unit) {
        super('A06C', abilityUnit);
    }
}
