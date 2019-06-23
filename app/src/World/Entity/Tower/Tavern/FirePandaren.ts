import { Tower } from '../Tower';
import { GenericAutoAttackTower } from '../GenericAutoAttackTower';

export class FirePandaren extends Tower implements GenericAutoAttackTower {
    public GenericAttack(): void {
        const x: number = GetUnitX(GetAttackedUnitBJ());
        const y: number = GetUnitY(GetAttackedUnitBJ());
        IssuePointOrder(GetAttacker(), 'breathoffire', x, y);
    }

}
