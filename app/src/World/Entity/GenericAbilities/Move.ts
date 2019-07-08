import { GenericAbility } from './GenericAbility';
import { WarcraftMaul } from '../../WarcraftMaul';
import { Creep } from '../Creep';


/**
 *  Move (Builders)
 *  Forces target unit to move
 */
export class Move extends GenericAbility implements AbilityOnEffectTargetsUnit {
    constructor(game: WarcraftMaul) {
        super('A0EB', game);
    }

    public TargetOnEffectAction(): void {
        const target: unit = GetSpellTargetUnit();

        const creep: Creep | undefined = this.game.worldMap.spawnedCreeps.unitMap.get(GetHandleIdBJ(target));
        if (creep) {
            creep.ReapplyMovement();
        }

    }


}
