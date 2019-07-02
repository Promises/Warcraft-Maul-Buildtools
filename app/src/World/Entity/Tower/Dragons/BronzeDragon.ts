import { Tower } from '../Specs/Tower';
import { GenericAutoAttackTower } from '../Specs/GenericAutoAttackTower';

export class BronzeDragon extends Tower implements GenericAutoAttackTower {

    public GenericAttack(): void {
        IssueTargetOrderBJ(GetAttacker(), 'slow', GetAttackedUnitBJ());
    }

}
