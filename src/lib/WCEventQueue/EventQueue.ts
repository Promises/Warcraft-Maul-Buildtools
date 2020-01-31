import { Trigger } from '../../JassOverrides/Trigger';
import { Queue } from './Queue';
import { Log } from '../Serilog/Serilog';

export class EventQueue {
    private ticker: Trigger;
    private readonly maxEventsPerTick: number = 2;
    private highPriority: Queue<() => boolean> = new Queue<() => boolean>();
    private medPriority: Queue<() => boolean> = new Queue<() => boolean>();
    private lowPriority: Queue<() => boolean> = new Queue<() => boolean>();
    private currentTask: (() => boolean) | undefined = undefined;


    constructor() {
        this.ticker = new Trigger();
        this.ticker.registerTimerEventPeriodic(0.10);
        this.ticker.addAction(() => {
            this.HandleTick();
        });
    }

    private HandleTick(): void {
        if (this.currentTask) {
            for (let i: number = 0; i < this.maxEventsPerTick; i++) {
                if (this.currentTask) {
                    if (this.currentTask()) {
                        this.currentTask = undefined;
                    }
                } else {
                    this.GetTask();
                }

            }
        } else {
            this.GetTask();
        }

    }

    private GetTask(): void {
        if (this.highPriority.size() > 0) {
            this.currentTask = this.highPriority.pop();
            return;
        }
        if (this.medPriority.size() > 0) {
            this.currentTask = this.medPriority.pop();
            return;
        }
        if (this.lowPriority.size() > 0) {
            this.currentTask = this.lowPriority.pop();
            return;
        }
    }

    public AddHigh(event: () => boolean): void {
        this.highPriority.push(event);
    }

    public AddMed(event: () => boolean): void {
        this.medPriority.push(event);
    }

    public AddLow(event: () => boolean): void {
        this.lowPriority.push(event);
    }
}
