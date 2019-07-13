import { Trigger } from '../../JassOverrides/Trigger';
import { TickingTower } from '../Entity/Tower/Specs/TickingTower';

export class TowerTicker {
    private readonly trig: Trigger;
    private tickingTowers: Map<number, TickingTower> = new Map<number, TickingTower>();
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

    public AddTickingTower(id: number, tickingTower: TickingTower): void {
        this.tickingTowers.set(id, tickingTower);
    }
    public RemoveTickingTower(id: number): void {
        this.tickingTowers.delete(id);
    }
}
