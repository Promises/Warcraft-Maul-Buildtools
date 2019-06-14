import { CheckPoint } from './CheckPoint';

export class SpawnedCreep {
    creep: unit;
    targetCheckpoint: CheckPoint | undefined;


    constructor(creep: unit){
        this.creep = creep;



    }


    printId() {
        print(GetUnitName(this.creep));
    }
}
