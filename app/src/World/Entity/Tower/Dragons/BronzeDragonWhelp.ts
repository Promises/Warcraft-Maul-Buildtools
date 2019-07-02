import { Tower } from '../Specs/Tower';
import { GenericAutoAttackTower } from '../Specs/GenericAutoAttackTower';

export class BronzeDragonWhelp extends Tower implements GenericAutoAttackTower {

    public GenericAttack(): void {
        IssueTargetOrderBJ(GetAttacker(), 'slow', GetAttackedUnitBJ());
    }

}
