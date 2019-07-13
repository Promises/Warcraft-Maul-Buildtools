import { Tower } from '../../Specs/Tower';
import { GenericAutoAttackTower } from '../../Specs/GenericAutoAttackTower';

export class FlyingDwarf extends Tower implements GenericAutoAttackTower {

    public GenericAttack(): void {
        this.CastSpellOnAttackedUnitLocation('clusterrockets');
    }

}
