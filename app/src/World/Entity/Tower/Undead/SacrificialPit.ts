import { Tower } from '../Tower';
import { AttackActionTower } from '../AttackActionTower';
import { PassiveCreepDiesInAreaEffectTower } from '../PassiveCreepDiesInAreaEffectTower';
import { Creep } from '../../Creep';

export class SacrificialPit extends Tower implements PassiveCreepDiesInAreaEffectTower {


    public PassiveCreepDiesInAreaEffect(dieingCreep: Creep): void {

        const loc: location = dieingCreep.getLocation();
        const dummy: unit = CreateUnitAtLoc(this.owner.wcPlayer, FourCC('u008'), loc, bj_UNIT_FACING);
        UnitAddAbilityBJ(FourCC('A08P'), dummy);
        IssuePointOrderLocBJ(dummy, 'rainoffire', loc);
        UnitApplyTimedLifeBJ(3.00, FourCC('BTLF'), dummy);
        RemoveLocation(loc);


    }


}
