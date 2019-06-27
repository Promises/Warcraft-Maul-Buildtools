import { Creep } from '../../Creep';

export interface PassiveCreepDiesInAreaEffectTower {
    PassiveCreepDiesInAreaEffect(dyingCreep: Creep): void;
}
