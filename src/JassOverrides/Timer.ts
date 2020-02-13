import { Log } from '../lib/Serilog/Serilog';

export class Timer {
    private readonly t: timer;

    constructor(t: timer) {
        this.t = t;
    }

    public start(timeout: number, periodic: boolean, handlerFunc: () => void): void {
        TimerStart(this.t, timeout, periodic, () => xpcall(() => handlerFunc(), err => Log.Fatal(err)));
    }

    public pause(): void {
        PauseTimer(this.t);
    }

    public destroy(): void {
        DestroyTimer(this.t);
    }
}
