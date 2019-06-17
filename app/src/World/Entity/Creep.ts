import { CheckPoint } from './CheckPoint';
import { Log } from '../../lib/Serilog/Serilog';

export class Creep {
    creep: unit;
    targetCheckpoint: CheckPoint | undefined;


    constructor(creep: unit){
        this.creep = creep;



    }


    printId() {
        Log.Debug(GetUnitName(this.creep));
    }
}
