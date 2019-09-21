/**
 * The Map Meta Data Library (TypeScript)
 * Version: v0.10
 * Last Modified: Sept 19, 2019
 * Author Chain: Strilanc, Promises
 */

export enum MMDGoal {
    None,
    High,
    Low,
}

export enum MMDType {
    String,
    Number,
    Boolean,
}

export enum MMDOperator {
    Add,
    Subtract,
    Set,
}

export enum MMDSuggest {
    None,
    Track,
    Leaderboard,
}

export enum MMDFlag {
    Drawer,
    Loser,
    Winner,
    Leaver,
    Practising,
}

enum Senders {
    None,
    Naive,
    Better,
    Safe,
}

export class Queue<T> {
    private _store: T[] = [];

    public push(val: T): void {
        this._store.push(val);
    }

    public pop(): T | undefined {
        return this._store.shift();
    }

    public size(): number {
        return this._store.length;
    }
}


export class EventQueue {
    private ticker: trigger;
    private readonly maxEventsPerTick: number = 2;
    private highPriority: Queue<() => boolean> = new Queue<() => boolean>();
    private medPriority: Queue<() => boolean> = new Queue<() => boolean>();
    private lowPriority: Queue<() => boolean> = new Queue<() => boolean>();
    private currentTask: (() => boolean) | undefined = undefined;


    constructor() {
        this.ticker = CreateTrigger();
        TriggerRegisterTimerEventPeriodic(this.ticker, 0.10);
        TriggerAddAction(this.ticker, () => {
            this.HandleTick();
        });
    }

    private HandleTick(): void {
        if (this.currentTask) {
            for (let i: number = 0; i < this.maxEventsPerTick; i++) {
                if (this.currentTask) {
                    if (this.currentTask()) {
                        this.currentTask = undefined;
                    }
                } else {
                    this.GetTask();
                }

            }
        } else {
            this.GetTask();
        }

    }

    private GetTask(): void {
        if (this.highPriority.size() > 0) {
            this.currentTask = this.highPriority.pop();
            return;
        }
        if (this.medPriority.size() > 0) {
            this.currentTask = this.medPriority.pop();
            return;
        }
        if (this.lowPriority.size() > 0) {
            this.currentTask = this.lowPriority.pop();
            return;
        }
    }

    public AddHigh(event: () => boolean): void {
        this.highPriority.push(event);
    }

    public AddMed(event: () => boolean): void {
        this.medPriority.push(event);
    }

    public AddLow(event: () => boolean): void {
        this.lowPriority.push(event);
    }
}


class MMDNode {
    private readonly _key: string;
    private readonly _message: string;
    private readonly _timeout: number;
    private readonly _checksum: number;
    private readonly mmd: MMD;

    constructor(key: number, message: string, mmd: MMD) {
        this.mmd = mmd;
        this._message = message;
        this._key = key.toString();
        this._timeout = mmd.GetTime() + 7.0 + GetRandomReal(0, 2 + 0.1 * GetPlayerId(GetTriggerPlayer()));
        this._checksum = mmd.PoorHash(this._message, key);
    }

    get timeout(): number {
        return this._timeout;
    }


    get key(): string {
        return this._key;
    }

    get message(): string {
        return this._message;
    }

    get checksum(): number {
        return this._checksum;
    }

    public send(): boolean {
        StoreInteger(this.mmd.gameCache, this.mmd.M_KEY_VAL + this._key, this._message, this._checksum);
        StoreInteger(this.mmd.gameCache, this.mmd.M_KEY_CHK + this._key, this._key, this._checksum);
        SyncStoredInteger(this.mmd.gameCache, this.mmd.M_KEY_VAL + this._key, this._message);
        SyncStoredInteger(this.mmd.gameCache, this.mmd.M_KEY_CHK + this._key, this._key);
        return true;
    }
}

export class MMD {


    private readonly FILENAME: string = 'MMD.Dat';
    private readonly clock: timer = CreateTimer();
    private readonly CURRENT_VERSION: number = 2;
    private readonly MINIMUM_PARSER_VERSION: number = 2;
    private readonly ESCAPED_CHARS: string = ' \\';
    private readonly SHOW_DEBUG_MESSAGES: boolean = true;
    private readonly queue: MMDNode[] = [];
    private senders: Senders = Senders.Naive;
    public readonly M_KEY_VAL: string = 'val:';
    public readonly M_KEY_CHK: string = 'chk:';
    private readonly eventQueue: EventQueue;

    public initialised: boolean = false;
    private _gameCache: gamecache;
    private messageCount: number = 0;


    constructor() {
        const t: trigger = CreateTrigger();
        TriggerRegisterTimerEvent(t, 0, false);
        TriggerAddAction(t, () => this.init());
        this.eventQueue = new EventQueue();

        FlushGameCache(InitGameCache(this.FILENAME));
        this._gameCache = InitGameCache(this.FILENAME);
        TimerStart(this.clock, 999999999, false, null);
    }

    private init(): void {
        this.initialised = true;
        this.emit(`init version ${this.MINIMUM_PARSER_VERSION} ${this.CURRENT_VERSION}`);
        // Set up all players
        for (let i: number = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            if (GetPlayerSlotState(Player(i)) === PLAYER_SLOT_STATE_PLAYING) {
                if (GetPlayerController(Player(i)) === MAP_CONTROL_USER) {
                    this.emit(`init pid ${i} ${this.pack(GetPlayerName(Player(i)))}`);
                }
            }
        }

        const t: trigger = CreateTrigger();
        TriggerAddAction(t, () => this.tick());
        TriggerRegisterTimerEvent(t, 0.37, true);
    }

    private tick(): void {

        for (const node of this.queue) {
            if (node.timeout >= this.GetTime()) {
                break;
            }
            if (!HaveStoredInteger(this.gameCache, this.M_KEY_VAL + node.key, node.message)) {
                this.RaiseGuard('message skipping');
                node.send();
            } else if (!HaveStoredInteger(this.gameCache, this.M_KEY_CHK + node.key, node.key)) {
                this.RaiseGuard('checksum skipping');
                node.send();
            } else if (GetStoredInteger(this.gameCache, this.M_KEY_VAL + node.key, node.message) !== node.checksum) {
                this.RaiseGuard('message tampering');
                node.send();
            } else if (GetStoredInteger(this.gameCache, this.M_KEY_CHK + node.key, node.key) !== node.checksum) {
                this.RaiseGuard('checksum tampering');
                node.send();
            }
        }

        for (let i: number = 0; i < 10; i++) {
            if (!HaveStoredInteger(this.gameCache, this.M_KEY_CHK + this.messageCount, this.messageCount.toString())) {
                break;
            }
            this.RaiseGuard('message insertion');
            this.emit('Blank');
        }

    }

    private pack(value: string): string {
        let result: string = '';
        for (let i: number = 0; i < value.length; i++) {
            let currentLetter: string = value.charAt(i);
            for (let j: number = 0; j < this.ESCAPED_CHARS.length; j++) {
                if (currentLetter === this.ESCAPED_CHARS.charAt(j)) {
                    currentLetter = `\\${currentLetter}`;
                    break;
                }
            }
            result += currentLetter;

        }
        return result;
    }

    private emit(message: string): void {
        if (!this.initialised) {
            if (this.SHOW_DEBUG_MESSAGES) {
                print('MMD Emit Error: Library not initialized yet.');
            }
            return;
        }

        const queueItem: MMDNode = new MMDNode(this.messageCount, message, this);
        this.queue.push(queueItem);
        this.messageCount++;
        if (this.isEmitter()) {
            this.eventQueue.AddMed(() => queueItem.send());
        }
    }

    private isEmitter(): boolean {
        const picks: number[] = [];
        const pickFlags: boolean[] = [];
        let n: number = 0;

        for (let i: number = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            if (GetPlayerSlotState(Player(i)) === PLAYER_SLOT_STATE_PLAYING) {
                if (GetPlayerController(Player(i)) === MAP_CONTROL_USER) {
                    if (n < this.senders) {
                        picks[n] = i;
                        pickFlags[i] = true;
                    } else {
                        const r: number = GetRandomInt(0, n);
                        if (r < this.senders) {
                            pickFlags[picks[r]] = false;
                            picks[r] = i;
                            pickFlags[i] = true;
                        }
                    }
                    n++;
                }
            }
        }
        return pickFlags[GetPlayerId(GetTriggerPlayer())];
    }

    public GetTime(): number {
        return TimerGetElapsed(this.clock);
    }

    public PoorHash(str: string, seed: number): number {
        const n: number = str.length;
        let m: number = n + seed;
        for (let i: number = 0; i < n; i++) {
            m = m * 41 + str.charCodeAt(i);
        }
        return m;
    }

    get gameCache(): gamecache {
        return this._gameCache;
    }

    private RaiseGuard(reason: string): void {
        if (this.SHOW_DEBUG_MESSAGES) {
            print(`MMD: Guard Raised! (${reason})`);
        }
        this.senders = Senders.Safe;

    }

    public DefineValue(name: string, type: MMDType, goal: MMDGoal, suggestion: MMDSuggest): void {
        if (name.length > 32) {
            if (this.SHOW_DEBUG_MESSAGES) {
                print('MMD Def Error: Variable name is too long.');
            }
        } else if (name.length === 0) {
            if (this.SHOW_DEBUG_MESSAGES) {
                print('MMD Def Error: Variable name is empty.');
            }
        } else if (type === MMDType.String && goal !== MMDGoal.None) {
            if (this.SHOW_DEBUG_MESSAGES) {
                print('MMD Def Error: Strings must have goal type of none.');
            }
        } else if (GetStoredInteger(this.gameCache, 'types', name) !== 0) {
            if (this.SHOW_DEBUG_MESSAGES) {
                print('MMD Def Error: Variable name is empty.');
            }
        } else {
            StoreInteger(this.gameCache, 'types', name, type);
            this.emit(`DefVarP ${this.pack(name)} ${type} ${goal} ${suggestion}`);
        }
    }

    private update_value(name: string, p: player, op: MMDOperator, value: string, type: MMDType): void {
        const id: number = GetPlayerId(p);
        if (!p || id < 0 || id >= bj_MAX_PLAYER_SLOTS) {
            if (this.SHOW_DEBUG_MESSAGES) {
                print('MMD Set Error: Invalid player. Must be P1 to P24.');
            }
        } else if (type !== GetStoredInteger(this.gameCache, 'types', name)) {
            if (this.SHOW_DEBUG_MESSAGES) {
                print('MMD Set Error: Updated value of undefined variable or used value of incorrect type.');
            }
        } else if (name.length > 50) {
            if (this.SHOW_DEBUG_MESSAGES) {
                print('MMD Set Error: Variable name is too long.');
            }
        } else if (name.length === 0) {
            if (this.SHOW_DEBUG_MESSAGES) {
                print('MMD Set Error: Variable name is empty.');
            }
        } else {
            this.emit(`VarP ${id} ${this.pack(name)} ${op} ${value}`);
        }
    }

    public UpdateValueNumber(name: string, p: player, op: MMDOperator, value: number): void {
        this.update_value(name, p, op, value.toString(), MMDType.Number);
    }

    public FlagPlayer(p: player, flag: MMDFlag): void {
        const id: number = GetPlayerId(p);
        if (!p) {
            if (this.SHOW_DEBUG_MESSAGES) {
                print('MMD Flag Error: Invalid player. Must be P1 to P24.');
            }

        } else if (GetPlayerController(p) === MAP_CONTROL_USER) {
            this.emit(`FlagP ${id} ${flag}`);
        }
    }

    public UpdateValueString(name: string, p: player, value: string): void {
        this.update_value(name, p, MMDOperator.Set, `"${value}"`, MMDType.String);
    }

    public DefineEvent(name: string, ...args: string[]): void {
        if (GetStoredInteger(this.gameCache, 'events', name) !== 0) {
            if (this.SHOW_DEBUG_MESSAGES) {
                print('MMD DefEvent Error: Event redefined.');
            }
        } else {
            StoreInteger(this.gameCache, 'events', name, args.length);
            this.emit(`DefEvent ${this.pack(name)} ${args.length - 1} ${this.JoinListOfStrings(args)}`);

        }
    }

    private DefineSetting(name: string, type: MMDType, value: string): void {
        if (GetStoredInteger(this.gameCache, 'setting', name) !== 0) {
            if (this.SHOW_DEBUG_MESSAGES) {
                print('MMD DefEvent Error: Setting redefined.');
            }
        } else {
            StoreInteger(this.gameCache, 'setting', name, 1);
            this.emit(`setting ${this.pack(name)} ${type} ${value}`);
        }
    }
    public DefineSettingString(name: string, value: string): void {
        this.DefineSetting(name, MMDType.String, value);
    }

    public DefineSettingNumber(name: string, value: number): void {
        this.DefineSetting(name, MMDType.Number, value.toString());
    }

    public DefineSettingBoolean(name: string, value: boolean): void {
        this.DefineSetting(name, MMDType.Boolean, value ? '1' : '0');
    }

    public LogEvent(name: string, ...args: string[]): void {
        const storedValue: number = GetStoredInteger(this.gameCache, 'events', name);

        if (storedValue !== args.length) {
            if (this.SHOW_DEBUG_MESSAGES) {
                if (storedValue !== 0) {
                    print(`MMD LogEvent Error: Event defined with different # of args. [${storedValue}]`);
                } else {
                    print('MMD LogEvent Error: Event not defined.');
                }
            }

        } else {
            this.emit(`Event ${this.pack(name)} ${this.JoinListOfStrings(args)}`);
        }
    }

    public LogCustom(uniqueID: string, data: string): void {
        this.emit(`custom ${this.pack(uniqueID)} ${this.pack(data)}`);
    }

    private JoinListOfStrings(listOfStrings: string[]): string {
        let result: string = '';
        let first: boolean = true;
        for (const str of listOfStrings) {
            if (!first) {
                result += ' ';
            }

            result += this.pack(str);
            first = false;
        }
        return result;
    }

}
