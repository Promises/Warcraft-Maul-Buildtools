import { Creep } from '../../Creep';

export interface PassiveCreepDiesInAreaEffectTower {
    PassiveCreepDiesInAreaEffect(dieingCreep: Creep): void;
}
