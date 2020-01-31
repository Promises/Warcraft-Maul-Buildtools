import { Log } from '../lib/Serilog/Serilog';
import { AbstractPlayer } from '../World/Entity/Players/AbstractPlayer';
import { Rectangle } from './Rectangle';

export class Trigger {

    constructor() {
        this.nativeTrigger = CreateTrigger();
    }

    private nativeTrigger: trigger;


    public static EvaluateCondition(func: () => boolean): boolean {
        let answer: boolean = false;

        xpcall(() => {
            answer = func();
        }, (err: any) => {
            this.printError(err);
        });

        return answer;
    }


    public static printError(err: any): void {
        Log.Fatal(err);
    }


    public addAction(actionFunc: () => void): triggeraction {
        return TriggerAddAction(this.nativeTrigger, () => xpcall(() => actionFunc(), err => Trigger.printError(err)));

    }

    public registerTimerEvent(timeout: number, periodic: boolean): event {
        return TriggerRegisterTimerEvent(this.nativeTrigger, timeout, periodic);
    }

    public registerTimerEventSingle(timeout: number): event {
        return TriggerRegisterTimerEventSingle(this.nativeTrigger, timeout);
    }

    public registerTimerEventPeriodic(timeout: number): event {
        return TriggerRegisterTimerEventPeriodic(this.nativeTrigger, timeout);
    }

    public registerPlayerStateEvent(whichPlayer: player, whichState: playerstate, opcode: limitop, limitval: number): event {
        return TriggerRegisterPlayerStateEvent(this.nativeTrigger, whichPlayer, whichState, opcode, limitval);
    }

    public registerDeathEvent(whichWidget: widget): event {
        return TriggerRegisterDeathEvent(this.nativeTrigger, whichWidget);
    }

    public registerDialogEventBJ(whichDialog: dialog): event {
        return TriggerRegisterDialogEventBJ(this.nativeTrigger, whichDialog);
    }


    public registerEnterRectSimple(r: rect): event {
        return TriggerRegisterEnterRectSimple(this.nativeTrigger, r);
    }

    public registerEnterRectangle(area: Rectangle): event {
        const rectangle: rect = Rect(area.minX, area.minY, area.maxX, area.maxY);
        const trigEvent: event = this.registerEnterRectSimple(rectangle);
        RemoveRect(rectangle);
        return trigEvent;

    }

    public addCondition(func: () => boolean): triggercondition {
        return TriggerAddCondition(this.nativeTrigger, Condition(() => Trigger.EvaluateCondition(func)));
    }

    public addFilterFuncCondition(filter: filterfunc): triggercondition {
        return TriggerAddCondition(this.nativeTrigger, filter);
    }

    public registerAnyUnitEventBJ(whichEvent: playerunitevent): void {
        TriggerRegisterAnyUnitEventBJ(this.nativeTrigger, whichEvent);
    }

    public registerPlayerChatEvent(whichPlayer: player, chatMessageToDetect: string, exactMatchOnly: boolean): event {
        return TriggerRegisterPlayerChatEvent(this.nativeTrigger, whichPlayer, chatMessageToDetect, exactMatchOnly);
    }

    public registerPlayerUnitEventSimple(whichPlayer: player, whichEvent: playerunitevent): event {
        return TriggerRegisterPlayerUnitEventSimple(this.nativeTrigger, whichPlayer, whichEvent);
    }

    public registerPlayerEventLeave(whichPlayer: AbstractPlayer): event {
        return TriggerRegisterPlayerEventLeave(this.nativeTrigger, whichPlayer.wcPlayer);

    }

    public registerPlayerUnitEvent(whichPlayer: player, whichPlayerUnitEvent: playerunitevent, filter?: boolexpr): event {
        return TriggerRegisterPlayerUnitEvent(this.nativeTrigger, whichPlayer, whichPlayerUnitEvent, filter === undefined ? null : filter);

    }

    public registerPlayerSyncEvent(whichPlayer: player, prefix: string, fromServer: boolean): event {
        return BlzTriggerRegisterPlayerSyncEvent(this.nativeTrigger, whichPlayer, prefix, fromServer);
    }

    public registerDialogButtonEvent(whichButton: button): event {
        return TriggerRegisterDialogButtonEvent(this.nativeTrigger, whichButton);
    }

    public registerFrameEvent(whichFrameHandle: framehandle, whichEvent: frameeventtype): event {
        return BlzTriggerRegisterFrameEvent(this.nativeTrigger, whichFrameHandle, whichEvent);
    }

    public registerLeaveRectSimple(r: rect): event {
        return TriggerRegisterLeaveRectSimple(this.nativeTrigger, r);
    }

    public execute(): void {
        TriggerExecute(this.nativeTrigger);
    }

    public disable(): void {
        DisableTrigger(this.nativeTrigger);
    }

    public enable(): void {
        EnableTrigger(this.nativeTrigger);
    }

}
