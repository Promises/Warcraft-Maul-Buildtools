import { Tower } from '../Specs/Tower';
import { PassiveCreepDiesInAreaEffectTower } from '../Specs/PassiveCreepDiesInAreaEffectTower';
import { Creep } from '../../Creep';

export class Plague extends Tower implements PassiveCreepDiesInAreaEffectTower {


    public PassiveCreepDiesInAreaEffect(dyingCreep: Creep): void {

        const loc: location = dyingCreep.getLocation();
        const dummy: unit = CreateUnitAtLoc(this.owner.wcPlayer, FourCC('u008'), loc, bj_UNIT_FACING);
        UnitAddAbilityBJ(FourCC('A0DZ'), dummy);
        UnitApplyTimedLifeBJ(5.00, FourCC('BTLF'), dummy);
        RemoveLocation(loc);


    }


}
