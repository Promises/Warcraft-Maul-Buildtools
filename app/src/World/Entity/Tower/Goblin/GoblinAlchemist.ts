import { Tower } from '../Specs/Tower';
import { GenericAutoAttackTower } from '../Specs/GenericAutoAttackTower';

export class GoblinAlchemist extends Tower implements GenericAutoAttackTower {

    public GenericAttack(): void {
        IssueTargetOrderBJ(GetAttacker(), 'acidbomb', GetAttackedUnitBJ());
    }

}
