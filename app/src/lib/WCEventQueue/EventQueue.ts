import { Trigger } from '../../JassOverrides/Trigger';
import { Queue } from './Queue';

export class EventQueue {
    private ticker: Trigger;
    private readonly maxEventsPerTick: number = 20;
    private highPriority: Queue<() => boolean> = new Queue<() => boolean>();
    private medPriority: Queue<() => boolean> = new Queue<() => boolean>();
    private lowPriority: Queue<() => boolean> = new Queue<() => boolean>();
    private currentTask: () => boolean


    constructor() {
        this.ticker = new Trigger();
        this.ticker.RegisterTimerEventPeriodic(0.10);
        this.ticker.AddAction(() => {
            this.HandleTick();
        });
    }

    private HandleTick(): void {
        let j = 0;
        for (let i: number = 0; i < this.maxEventsPerTick; i++) {
            if (this.highPriority.size() > 0) {

            }
            if (this.medPriority.size() > 0) {

            }
            if (this.lowPriority.size() > 0) {

            }
        }
    }
}
