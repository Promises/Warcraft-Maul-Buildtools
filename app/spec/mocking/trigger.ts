/** @noSelfInFile **/
import { Rectangle } from '../../src/JassOverrides/Rectangle';

// tslint:disable-next-line:class-name
interface trigger {
    index: number;
    condition?: () => boolean;
    action?: () => void;
}

let triggerTable: trigger[] = [];

interface PlayerEventLeave {
    player: player;
    trigger: trigger;
    index: number;

}

const TriggerRegisterPlayerEventLeaveTable: PlayerEventLeave[] = [];




_G.CreateTrigger = function (): trigger {
    // @ts-ignore
    const t: trigger = {index: 0};
    triggerTable.push(t);
    t.index = triggerTable.indexOf(t);
    return t;
};
_G.CreateTrigger = function (): trigger {
    // @ts-ignore
    const t: trigger = {index: 0};
    triggerTable.push(t);
    t.index = triggerTable.indexOf(t);
    return t;
};

_G.TriggerRegisterPlayerEventLeave = function (trig: trigger, whichPlayer: player): PlayerEventLeave {
    const t: PlayerEventLeave = {player: whichPlayer, trigger: trig, index: 0};
    TriggerRegisterPlayerEventLeaveTable.push(t);
    t.index = TriggerRegisterPlayerEventLeaveTable.indexOf(t);
    return t;
};




_G.Condition = function (fun: () => boolean): () => boolean {
    return () => fun();
};


_G.TriggerAddCondition = function (whichTrigger: trigger, fun: () => boolean): void {
    whichTrigger.condition = () => fun();
};

_G.TriggerAddAction = function (whichTrigger: trigger, fun: () => void): void {
    whichTrigger.action = () => fun();
};

// TriggerRegisterAnyUnitEventBJ
interface AnyUnitEvent {
    trigger: trigger;
    event: number;
    index: number;

}

const TriggerRegisterAnyUnitEventBJTable: AnyUnitEvent[] = [];

_G.TriggerRegisterAnyUnitEventBJ = function (trig: trigger, whichEvent: number): AnyUnitEvent {
    const t: AnyUnitEvent = {trigger: trig, event: whichEvent, index: 0};
    TriggerRegisterAnyUnitEventBJTable.push(t);
    t.index = TriggerRegisterAnyUnitEventBJTable.indexOf(t);
    return t;
};

// TriggerRegisterEnterRectSimple

interface EnterRectSimpleEvent {
    trigger: trigger;
    rectangle: Rectangle;
    index: number;

}

const TriggerRegisterEnterRectSimpleTable: EnterRectSimpleEvent[] = [];

_G.TriggerRegisterEnterRectSimple = function (trig: trigger, r: Rectangle): EnterRectSimpleEvent {
    const t: EnterRectSimpleEvent = {trigger: trig, rectangle: r, index: 0};
    TriggerRegisterEnterRectSimpleTable.push(t);
    t.index = TriggerRegisterEnterRectSimpleTable.indexOf(t);
    return t;
};


// TriggerRegisterPlayerUnitEventSimple


interface PlayerUnitEventSimple {
    trigger: trigger;
    player: player;
    event: number;
    index: number;

}

const TriggerRegisterPlayerUnitEventSimpleTable: PlayerUnitEventSimple[] = [];

_G.TriggerRegisterPlayerUnitEventSimple = function (trig: trigger, whichPlayer: player, whichEvent: number): PlayerUnitEventSimple {
    const t: PlayerUnitEventSimple = {trigger: trig, player: whichPlayer, event: whichEvent, index: 0};
    TriggerRegisterPlayerUnitEventSimpleTable.push(t);
    t.index = TriggerRegisterPlayerUnitEventSimpleTable.indexOf(t);
    return t;
};

//declare function TriggerRegisterDeathEvent(whichTrigger: trigger, whichWidget: widget): event


interface DeathEvent {
    trigger: trigger;
    player: player;
    event: number;
    index: number;

}

const TriggerRegisterDeathEventTable: DeathEvent[] = [];

_G.TriggerRegisterDeathEvent = function (trig: trigger, whichPlayer: player, whichEvent: number): DeathEvent {
    const t: DeathEvent = {trigger: trig, player: whichPlayer, event: whichEvent, index: 0};
    TriggerRegisterDeathEventTable.push(t);
    t.index = TriggerRegisterDeathEventTable.indexOf(t);
    return t;
};



// TODO: timers...
_G.TriggerRegisterTimerEventPeriodic = function (trig: trigger, timeout: number): void {
    return;
};

_G.TriggerRegisterTimerEventSingle = function (trig: trigger, timeout: number): void {
    return;
};

// TODO: chatevent...

_G.TriggerRegisterPlayerChatEvent = function (whichTrigger: trigger, whichPlayer: player, chatMessageToDetect: string, exactMatchOnly: boolean): void {
    return;
};
_G.TriggerRegisterDialogEventBJ = function (trig: trigger, whichDialog: dialog): void {
    return;
};


_G.TriggerRegisterPlayerStateEvent = function (whichTrigger: trigger, whichPlayer: player, whichState: playerstate, opcode: limitop, limitval: number): void {
    return;
}
