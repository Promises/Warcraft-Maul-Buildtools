import { Tower } from '../Tower';
import { DamageModificationTower } from '../DamageModificationTower';
import { GenericAutoAttackTower } from '../GenericAutoAttackTower';

export class EarthPandaren extends Tower implements DamageModificationTower, GenericAutoAttackTower {
    public DamageModificationEvent(): void {
        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;
        if (!target) {
            return;
        }
        if (!UnitHasBuffBJ(target, FourCC('B018'))) {
            return;
        }

        this.game.gameDamageEngineGlobals.udg_DamageEventAmount *=  1.25;
    }



    public GenericAttack(): void {
        IssueTargetOrderBJ(GetAttacker(), 'drunkenhaze', GetAttackedUnitBJ());
    }

}
