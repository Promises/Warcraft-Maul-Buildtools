import { Trigger } from '../../JassOverrides/Trigger';
import { WarcraftMaul } from '../../World/WarcraftMaul';
import { TimedEvent } from './TimedEvent';

export class TimedEventQueue {
    private ticker: Trigger;
    private tick: number = 0;
    private maxTick: number = 100000;
    private events: Map<string, TimedEvent> = new Map<string, TimedEvent>();
    private game: WarcraftMaul;

    constructor(game: WarcraftMaul) {
        this.ticker = new Trigger();
        this.ticker.RegisterTimerEventPeriodic(0.10);
        this.ticker.AddAction(() => {
            this.tick = (this.tick + 1) % this.maxTick;
            this.HandleTick();
        });
        this.game = game;
    }

    private HandleTick(): void {
        this.events.forEach(((event: TimedEvent, key: string) => {
            if (event.AttemptAction(this.tick, this)) {
                this.events.delete(key);
            }
        }));
    }


    public AddEvent(event: TimedEvent): void {
        this.events.set(Util.RandomHash(10), event);
    }

    public GetGame(): WarcraftMaul {
        return this.game;
    }
}
