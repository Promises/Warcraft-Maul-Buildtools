import { Trigger } from '../JassOverrides/Trigger';

export class HostDetection {
    private HostDetectMap: Map<number, string> = new Map<number, string>();
    private LocalHostFlag: boolean =
        !(this.HostDetectMap.has(0)) && (BlzGetFrameByName('NameMenu', 1)) && (Location(0, 0)) && this.HostDetectMap.get(0) === '1';

    private SyncTrig: Trigger = new Trigger();
    private HostPlayer: player | null = null;

    constructor() {
        for (let i: number = 0; i < bj_MAX_PLAYERS; i++) {
            this.SyncTrig.RegisterPlayerSyncEvent(Player(i), 'hostdetect', false);
        }
        this.SyncTrig.AddAction(() => this.OnHostSync());
        if (this.IsLocalPlayerHost()) {
            BlzSendSyncData('hostdetect', '1');
        }
    }

    private IsLocalPlayerHost(): boolean {
        return this.LocalHostFlag;
    }

    private OnHostSync(): void {
        this.HostPlayer = GetTriggerPlayer();
        DisableTrigger(GetTriggeringTrigger());
    }

    public GetHost(): player {
        return <player>this.HostPlayer;
    }

    public IsHostDetected(): boolean {
        return this.HostPlayer != null;
    }
}
