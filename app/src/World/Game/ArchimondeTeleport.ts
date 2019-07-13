import { Trigger } from '../../JassOverrides/Trigger';

export class ArchimondeTeleport {
    private readonly trig: Trigger;

    constructor(archimonde: unit) {
        this.trig = new Trigger();
        this.trig.RegisterEnterRectSimple(Rect(992.0, -5216.0, 1056.0, -4992.0));
        this.trig.AddCondition(() => GetEnteringUnit() === archimonde);
        this.trig.AddAction(() => RemoveUnit(archimonde));
    }
}
