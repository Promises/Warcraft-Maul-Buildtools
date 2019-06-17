import { COLOUR_CODES } from '../World/GlobalSettings';
import { Log } from '../lib/Serilog/Serilog';

export class Trigger {
    nativeTrigger: trigger;

    constructor() {
        this.nativeTrigger = CreateTrigger();
    }


    public AddAction(actionFunc: () => void): triggeraction {
        return TriggerAddAction(this.nativeTrigger, () => xpcall(() => actionFunc(), err => this.printError(err)));

    }

    public RegisterTimerEvent(timeout: number, periodic: boolean): event {
        return TriggerRegisterTimerEvent(this.nativeTrigger, timeout, periodic);
    }

    public RegisterTimerEventSingle(timeout: number): event {
        return TriggerRegisterTimerEventSingle(this.nativeTrigger, timeout);
    }

    public RegisterTimerEventPeriodic(timeout: number): event {
        return TriggerRegisterTimerEventPeriodic(this.nativeTrigger, timeout);
    }

    public RegisterPlayerStateEvent(whichPlayer: player, whichState: playerstate, opcode: limitop, limitval: number): event {
        return TriggerRegisterPlayerStateEvent(this.nativeTrigger, whichPlayer, whichState, opcode, limitval);
    }


    public RegisterDialogEventBJ(whichDialog: dialog): event {
        return TriggerRegisterDialogEventBJ(this.nativeTrigger, whichDialog);
    }


    public RegisterEnterRectSimple(r: rect): event {
        return TriggerRegisterEnterRectSimple(this.nativeTrigger, r);
    }

    public AddCondition(func: () => boolean): triggercondition {
        return TriggerAddCondition(this.nativeTrigger, Condition(() => this.EvaluateCondition(func)));
    }

    public RegisterAnyUnitEventBJ(whichEvent: playerunitevent) {
        TriggerRegisterAnyUnitEventBJ(this.nativeTrigger, whichEvent);
    }

    public RegisterPlayerChatEvent(whichPlayer: player, chatMessageToDetect: string, exactMatchOnly: boolean): event {
        return TriggerRegisterPlayerChatEvent(this.nativeTrigger, whichPlayer, chatMessageToDetect, exactMatchOnly);
    }


    private EvaluateCondition(func: () => boolean) {
        let answer = false;

        xpcall(() => {
            answer = func();
        }, err => {
            this.printError(err);
        });

        return answer;
    }


    private printError(err: any) {
        Log.Error(err);
    }
}
