import { Tower } from '../../Specs/Tower';
import { GenericAutoAttackTower } from '../../Specs/GenericAutoAttackTower';

export class Prawn extends Tower implements GenericAutoAttackTower {

    public GenericAttack(): void {
        this.CastSpellOnAttackedUnitLocation('carrionswarm');
    }

}
