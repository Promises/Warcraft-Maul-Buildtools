import { Trigger } from '../../JassOverrides/Trigger';
import { WarcraftMaul } from '../WarcraftMaul';
import { Log } from '../../lib/Serilog/Serilog';

export class VoidTicker {
    private readonly trig: Trigger;
    private game: WarcraftMaul;

    constructor(game: WarcraftMaul) {
        this.game = game;
        this.trig = new Trigger();
        this.trig.registerTimerEventPeriodic(30);
        this.trig.addAction(() => this.TickVoid());
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
