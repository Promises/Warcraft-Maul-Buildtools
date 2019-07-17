import { Trigger } from '../../JassOverrides/Trigger';
import { Queue } from './Queue';
import { Log } from '../Serilog/Serilog';

export class EventQueue {
    private ticker: Trigger;
    private readonly maxEventsPerTick: number = 20;
    private highPriority: Queue<() => boolean> = new Queue<() => boolean>();
    private medPriority: Queue<() => boolean> = new Queue<() => boolean>();
    private lowPriority: Queue<() => boolean> = new Queue<() => boolean>();
    private currentTask: (() => boolean) | undefined = undefined;


    constructor() {
        this.ticker = new Trigger();
        this.ticker.RegisterTimerEventPeriodic(0.10);
        this.ticker.AddAction(() => {
            this.HandleTick();
        });
    }

    private HandleTick(): void {
        let j = 0;
        if (this.currentTask) {
            Log.Debug('There is a task');
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
            Log.Debug('found high');

            this.currentTask = this.highPriority.pop();
            return;
        }
        if (this.medPriority.size() > 0) {
            Log.Debug('found med');
            this.currentTask = this.medPriority.pop();
            return;
        }
        if (this.lowPriority.size() > 0) {
            Log.Debug('found low');
            this.currentTask = this.lowPriority.pop();
            return;
        }
    }

    public AddHigh(event: () => boolean): void {
        this.highPriority.push(event);
    }

    public AddMed(event: () => boolean): void {
        Log.Debug('Added to queue');

        this.medPriority.push(event);
    }

    public AddLow(event: () => boolean): void {
        this.lowPriority.push(event);
    }
}
