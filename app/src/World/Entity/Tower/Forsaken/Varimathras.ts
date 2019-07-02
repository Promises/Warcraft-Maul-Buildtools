import { Tower } from '../Specs/Tower';
import { GenericAutoAttackTower } from '../Specs/GenericAutoAttackTower';

export class Varimathras extends Tower implements GenericAutoAttackTower {

    public GenericAttack(): void {
        IssueTargetOrderBJ(GetAttacker(), "doom", GetAttackedUnitBJ());
    }

}
