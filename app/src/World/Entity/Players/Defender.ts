import { AbstractPlayer } from './AbstractPlayer';
import { ALLOW_PLAYER_TOWER_LOCATIONS, PLAYER_AREAS, players, Point } from '../../GlobalSettings';
import { Race } from '../../Game/Races/Race';
import { Rectangle } from '../../../JassOverrides/Rectangle';
import { Trigger } from '../../../JassOverrides/Trigger';
import { WarcraftMaul } from '../../WarcraftMaul';
import { AbstractHologramMaze } from '../../Holograms/AbstractHologramMaze';
import { Tower } from '../Tower/Specs/Tower';

export class Defender extends AbstractPlayer {
    private _scoreSlot: number = 0;
    private _kills: number = 0;
    private allowPlayerTower: unit | undefined;
    private _hasHybridRandomed: boolean = false;
    private _hasHardcoreRandomed: boolean = false;
    private _hasNormalPicked: boolean = false;
    private _races: Race[] = [];
    private _totalMazeLength: number = 0;

    private _repickCounter: number = 0;
    private _voidBuilder: unit | undefined;
    private _lootBoxer: unit | undefined;
    private _hybridBuilder: unit | undefined;
    private _hybridTowers: any[] = [];
    private leaveTrigger: Trigger;
    private deniedPlayers: AbstractPlayer[] = [];
    private _towers: Map<number, Tower> = new Map<number, Tower>();
    private holoMaze: AbstractHologramMaze | undefined = undefined;
    private game: WarcraftMaul;

    constructor(id: number, game: WarcraftMaul) {
        super(id);
        this.game = game;
        this.setUpPlayerVariables();
        this.leaveTrigger = new Trigger();
        this.leaveTrigger.AddCondition(() => this.PlayerLeftTheGameConditions(game));
        this.leaveTrigger.AddAction(() => this.PlayerLeftTheGame(game));
    }

    public setHoloMaze(holoMaze: AbstractHologramMaze | undefined): void {
        if (this.holoMaze !== undefined) {
            this.holoMaze.Destroy();
        }

        this.holoMaze = holoMaze;
    }

    private setUpPlayerVariables(): void {
        // Remove fog
        CreateFogModifierRectBJ(true, this.wcPlayer, FOG_OF_WAR_VISIBLE, GetPlayableMapRect());


        // Set Starting gold and lumber
        SetPlayerStateBJ(this.wcPlayer, PLAYER_STATE_RESOURCE_GOLD, this.id === COLOUR.GRAY ? 150 : 100);
        SetPlayerStateBJ(this.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER, 1);


        // Creat the allow player indicator tower
        const allowTowerLoc: Point = ALLOW_PLAYER_TOWER_LOCATIONS[this.id];
        //
        this.allowPlayerTower = CreateUnit(this.wcPlayer, FourCC('h03S'), allowTowerLoc.x, allowTowerLoc.y, 0.000);
    }

    public hasRace(race: Race): boolean {
        return this._races.indexOf(race) !== -1;
    }


    public getArea(): Rectangle {
        return PLAYER_AREAS[this.id];
    }

    public getCenterX(): number {
        const x1: number = this.getArea().minX;
        const x2: number = this.getArea().maxX;

        return (x1 + x2) / 2;
    }

    public getCenterY(): number {
        const y1: number = this.getArea().minY;
        const y2: number = this.getArea().maxY;

        return (y1 + y2) / 2;
    }

    public getVoidBuilder(): unit | undefined {
        return this._voidBuilder;
    }

    public getLootBoxer(): unit | undefined {
        return this._lootBoxer;
    }


    public getRectangle(): Rectangle {
        return this.getArea();
    }

    private PlayerLeftTheGameConditions(game: WarcraftMaul): boolean {
        return game.gameLives > 0;
    }

    private PlayerLeftTheGame(game: WarcraftMaul): void {
        SendMessage(`${this.getNameWithColour()} has left the game!`);

        this.ResetSpawnRestrictions();
        TriggerSleepAction(2.00);
        game.worldMap.playerSpawns[this.id].isOpen = false;
        if (game.scoreBoard) {
            MultiboardSetItemValueBJ(game.scoreBoard.board, 1, 7 + this._scoreSlot,
                                     Util.ColourString(this.getColourCode(), '<Quit>'));
        }

        players.delete(this.id);

        // this.DistributePlayerGold();
        // this.DistributePlayerTowers();
    }

    private ResetSpawnRestrictions(): void {
        // TODO: Implement this function
    }

    public AddTower(tower: Tower): void {
        this._towers.set(tower.handleId, tower);
    }

    public GiveKillCount(): void {
        this._kills++;
        if (this.game.scoreBoard) {
            MultiboardSetItemValueBJ(this.game.scoreBoard.board, 2, 7 + this._scoreSlot, `${this._kills}`);
        }
    }

    /**
     * Getters and Setters
     */
    get totalMazeLength(): number {
        return this._totalMazeLength;
    }

    set totalMazeLength(value: number) {
        this._totalMazeLength = value;
    }

    get towers(): Map<number, Tower> {
        return this._towers;
    }

    set towers(value: Map<number, Tower>) {
        this._towers = value;
    }

    get hybridTowers(): any[] {
        return this._hybridTowers;
    }

    set hybridTowers(value: any[]) {
        this._hybridTowers = value;
    }

    get hasHardcoreRandomed(): boolean {
        return this._hasHardcoreRandomed;
    }

    set hasHardcoreRandomed(value: boolean) {
        this._hasHardcoreRandomed = value;
    }

    get hasNormalPicked(): boolean {
        return this._hasNormalPicked;
    }

    set hasNormalPicked(value: boolean) {
        this._hasNormalPicked = value;
    }

    get races(): Race[] {
        return this._races;
    }

    set races(value: Race[]) {
        this._races = value;
    }

    get hybridBuilder(): unit | undefined {
        return this._hybridBuilder;
    }

    set hybridBuilder(value: unit | undefined) {
        this._hybridBuilder = value;
    }

    get hasHybridRandomed(): boolean {
        return this._hasHybridRandomed;
    }

    set hasHybridRandomed(value: boolean) {
        this._hasHybridRandomed = value;
    }

    get lootBoxer(): unit | undefined {
        return this._lootBoxer;
    }

    set lootBoxer(value: unit | undefined) {
        this._lootBoxer = value;
    }

    get voidBuilder(): unit | undefined {
        return this._voidBuilder;
    }

    set voidBuilder(value: unit | undefined) {
        this._voidBuilder = value;
    }

    get repickCounter(): number {
        return this._repickCounter;
    }

    set repickCounter(value: number) {
        this._repickCounter = value;
    }

    get kills(): number {
        return this._kills;
    }

    set kills(value: number) {
        this._kills = value;
    }

    get scoreSlot(): number {
        return this._scoreSlot;
    }

    set scoreSlot(value: number) {
        this._scoreSlot = value;
    }
}
