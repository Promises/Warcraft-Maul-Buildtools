import { CheckPoint } from './CheckPoint';
import { Log } from '../../lib/Serilog/Serilog';

export class Creep {
    creep: unit;
    targetCheckpoint: CheckPoint | undefined;

    constructor(creep: unit) {
        this.creep = creep;
    }

    ReapplyMovement(): void {
        if (!this.targetCheckpoint) {
            Log.Fatal('Creep is missing pathing data');
            return;
        }
        IssuePointOrder(this.creep, 'move',
                        GetRectCenterX(this.targetCheckpoint.rectangle),
                        GetRectCenterY(this.targetCheckpoint.rectangle));
    }

    printId(): void {
        Log.Debug(this.getName());
    }

    getName(): string {
        return GetUnitName(this.creep);
    }

    getId(): number {
        return GetUnitTypeId(this.creep);
    }

    getHandleId(): number {
        return GetHandleIdBJ(this.creep);
    }


    public getLocation(): location {
        return GetUnitLoc(this.creep);
    }
}
