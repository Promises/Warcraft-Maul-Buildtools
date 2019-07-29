import { TimedEventQueue } from './TimedEventQueue';

export class TimedEvent {
    private time: number;
    private func: () => boolean;
    private safe: boolean;
    private initialTime: number | undefined;

    constructor(func: () => boolean, time: number, safe: boolean = true) {
        this.safe = safe;
        this.time = time;
        this.func = func;
    }

    public AttemptAction(currentTick: number, teq: TimedEventQueue): boolean {
        if (!this.initialTime) {
            this.initialTime = currentTick;
        }
        if (this.time <= currentTick - this.initialTime) {
            if (this.safe) {
                teq.GetGame().safeEventQueue.AddMed(this.func);
            } else {
                teq.GetGame().eventQueue.AddMed(this.func);
            }
            return true;
        }
        return false;
    }
}
