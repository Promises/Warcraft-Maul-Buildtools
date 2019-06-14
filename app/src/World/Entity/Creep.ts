import { CheckPoint } from './CheckPoint';

export class Creep {
    creep: unit;
    targetCheckpoint: CheckPoint | undefined;


    constructor(creep: unit){
        this.creep = creep;



    }


    printId() {
        print(GetUnitName(this.creep));
    }
}
