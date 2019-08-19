import { CreepAbility } from './specs/CreepAbility';

export class TornadoAura extends CreepAbility {
    constructor(abilityUnit: unit) {
        super('A01S', abilityUnit);
    }
}
