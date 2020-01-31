import { Trigger } from '../../JassOverrides/Trigger';
import { Queue } from './Queue';
import { WarcraftMaul } from '../../World/WarcraftMaul';

export class SafeEventQueue {
    private ticker: Trigger;
    private readonly maxEventsPerTick: number = 2;
    private highPriority: Queue<() => boolean> = new Queue<() => boolean>();
    private medPriority: Queue<() => boolean> = new Queue<() => boolean>();
    private lowPriority: Queue<() => boolean> = new Queue<() => boolean>();
    private currentTask: (() => boolean) | undefined = undefined;
    private game: WarcraftMaul;

    constructor(game: WarcraftMaul) {
        this.ticker = new Trigger();
        this.ticker.registerTimerEventPeriodic(0.1);
        this.ticker.addAction(() => {
            this.HandleTick();
        });
        this.game = game;
    }

    private HandleTick(): void {
        if (this.game.worldMap.gameRoundHandler && !this.game.worldMap.gameRoundHandler.isWaveInProgress) {

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
