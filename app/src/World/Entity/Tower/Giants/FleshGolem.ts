import { Tower } from '../Specs/Tower';
import { GenericAutoAttackTower } from '../Specs/GenericAutoAttackTower';

export class FleshGolem extends Tower implements GenericAutoAttackTower {

    public GenericAttack(): void {
        IssueImmediateOrderBJ(GetAttacker(), 'berserk');
    }

}
