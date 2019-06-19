import { CheckPoint } from './CheckPoint';
import { Log } from '../../lib/Serilog/Serilog';

export class Creep {
    creep: unit;
    targetCheckpoint: CheckPoint | undefined;


    constructor(creep: unit){
        this.creep = creep;



    }


    ReapplyMovement(){
        if(!this.targetCheckpoint){
            Log.Fatal('Creep is missing pathing data');
            return;
        }
        IssuePointOrder(this.creep, 'move', GetRectCenterX(this.targetCheckpoint.rectangle), GetRectCenterY(this.targetCheckpoint.rectangle));
    }


    printId() {
        Log.Debug(GetUnitName(this.creep));
    }
}
