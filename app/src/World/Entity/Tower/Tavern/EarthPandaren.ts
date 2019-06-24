import { Tower } from '../Specs/Tower';
import { DamageModificationTower } from '../Specs/DamageModificationTower';
import { GenericAutoAttackTower } from '../Specs/GenericAutoAttackTower';

export class EarthPandaren extends Tower implements GenericAutoAttackTower {
    public GenericAttack(): void {
        IssueTargetOrderBJ(GetAttacker(), 'drunkenhaze', GetAttackedUnitBJ());
    }

}
