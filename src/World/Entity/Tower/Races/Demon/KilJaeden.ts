import { Tower } from '../../Specs/Tower';
import { AttackActionTower } from '../../Specs/AttackActionTower';
import { GenericAutoAttackTower } from '../../Specs/GenericAutoAttackTower';

export class KilJaeden extends Tower implements GenericAutoAttackTower {


    public GenericAttack(): void {
        this.CastSpellOnAttackedUnitLocation('rainofchaos');
    }

}
