import { Tower } from '../Specs/Tower';
import { GenericAutoAttackTower } from '../Specs/GenericAutoAttackTower';

export class Gyrocopter extends Tower implements GenericAutoAttackTower {

    public GenericAttack(): void {
        IssueTargetOrderBJ(GetAttacker(), 'chainlightning', GetAttackedUnitBJ());
    }

}
