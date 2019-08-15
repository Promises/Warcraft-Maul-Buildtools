import { Trigger } from '../../JassOverrides/Trigger';
import { TickingTower } from '../Entity/Tower/Specs/TickingTower';
import { Tower } from '../Entity/Tower/Specs/Tower';
import { Log } from '../../lib/Serilog/Serilog';

export class TowerTicker {
    private readonly trig: Trigger;
    // private tickingTowers: Map<number, TickingTower & Tower> = new Map<number, TickingTower & Tower>(); // FUCKING DESYNCS
    private tickingTowers: (Tower & TickingTower)[] = [];
    private tick: number = 0;
    private readonly maxTick: number = 100000;

    constructor() {
        this.trig = new Trigger();
        this.trig.RegisterTimerEventPeriodic(0.10);
        this.trig.AddAction(() => {
            this.tick = (this.tick + 1) % this.maxTick;
            this.tickingTowers.forEach((tickingTower) => {

                if (this.tick % tickingTower.GetTickModulo() === 0) {
                    tickingTower.Action();
                }
            });
        });
    }

    public AddTickingTower(id: number, tickingTower: TickingTower & Tower): void {
        this.tickingTowers.push(tickingTower);
    }

    public RemoveTickingTower(id: number): void {
        // tslint:disable-next-line:ter-arrow-parens
        this.tickingTowers = this.tickingTowers.filter((tower) => tower.handleId !== id);
    }
}
