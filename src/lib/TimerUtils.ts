import { Timer } from '../JassOverrides/Timer';
import { Node } from './Node';
import { LinkedList } from './LinkedList';

export class TimerUtils {

    // Settings
    private QUANTITY: number = 256;
    private MAX_SIZE: number = 8190;

    // Globals
    private timerQueue: LinkedList<Timer> = new LinkedList<Timer>();

    constructor() {
        for (let i: number = 0; i < this.QUANTITY; i++) {
            this.timerQueue.add(new Timer(CreateTimer()));
        }
    }

    public newTimer(): Timer {
        const t: Node<Timer> | undefined = this.timerQueue.pop();
        if (t === undefined) {
            BJDebugMsg('Warning: Exceeded timer QUANTITY, make sure all timers are getting recycled correctly!');
            return new Timer(CreateTimer());
        }

        return t.value;
    }

    public releaseTimer(t: Timer): void {
        if (t === undefined) {
            return BJDebugMsg('Warning: attempt to release an undefined timer');
        }

        if (this.timerQueue.getSize() === this.MAX_SIZE) {
            BJDebugMsg('Warning: Timer stack is full, destroying timer!!');
            return t.destroy();
        }

        t.pause();
        this.timerQueue.add(t);
    }
}
