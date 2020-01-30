import { Trigger } from '../../JassOverrides/Trigger';

export class ArchimondeGate {
    public readonly gate: destructable;
    private trig: Trigger;

    constructor(archimonde: unit) {
        this.gate = CreateDestructable(FourCC('B000'), 3520.0, -5312.0, 0.000, 0.900, 0);
        this.trig = new Trigger();
        this.trig.RegisterDeathEvent(this.gate);
        this.trig.AddAction(() => IssuePointOrder(archimonde, 'move', 1000.00, -5050.00));
    }
}
