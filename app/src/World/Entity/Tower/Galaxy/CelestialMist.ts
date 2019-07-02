import { Tower } from '../Specs/Tower';
import { GenericAutoAttackTower } from '../Specs/GenericAutoAttackTower';

export class CelestialMist extends Tower implements GenericAutoAttackTower {

    public GenericAttack(): void {
        IssueImmediateOrderBJ(GetAttacker(), 'starfall');
    }

}
