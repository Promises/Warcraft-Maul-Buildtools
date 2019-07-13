import { Trigger } from '../../JassOverrides/Trigger';
import { WarcraftMaul } from '../WarcraftMaul';

export class VoidTicker {
    private readonly trig: Trigger;
    private game: WarcraftMaul;

    constructor(game: WarcraftMaul) {
        this.game = game;
        this.trig = new Trigger();
        this.trig.RegisterTimerEventPeriodic(30);
        this.trig.AddAction(() => this.TickVoid());
    }

    private TickVoid(): void {
        this.game.players.forEach((player) => {
            player.SetVoidFragments(player.GetVoidFragments() + player.GetVoidFragmentTick());
            if (player.getVoidBuilder()) {
                SetUnitManaBJ(<unit>player.getVoidBuilder(), player.GetVoidFragments());

            }
            if (player.GetVoidFragments() > 2000) {
                player.SetVoidFragments(2000);
            }
        });

    }
}
