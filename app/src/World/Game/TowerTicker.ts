import { Trigger } from '../../JassOverrides/Trigger';
import { TickingTower } from './TickingTower';

export class TowerTicker {
    private readonly trig: Trigger;
    private tickingTowers: TickingTower[] = [];
    private tick: number = 0;
    private readonly maxTick: number = 100000;

    constructor() {
        this.trig = new Trigger();
        this.trig.RegisterTimerEventPeriodic(0.10);
        this.trig.AddAction(() => {
            this.tick = (this.tick + 1) % this.maxTick;
            this.tickingTowers.filter(tickingTower => this.tick % tickingTower.GetTickModulo() === 0)
                .forEach(tickingTower => tickingTower.Action());
        });
    }

    public AddTickingTower(tickingTower: TickingTower): void {
        this.tickingTowers.push(tickingTower);
    }
}
