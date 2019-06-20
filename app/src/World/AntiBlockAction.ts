import { Trigger } from '../JassOverrides/Trigger';
import * as settings from './GlobalSettings';
import { Log } from '../lib/Serilog/Serilog';
import { Attacker } from './Entity/Players/Attacker';
import { WorldMap } from './WorldMap';
import { AntiBlockData } from './AntiBlockData';
import { AntiBlockController } from './AntiBlockController';


export class AntiBlockAction {


    antiBlockMap: Map<number, AntiBlockData>;
    worldMap: WorldMap;
    antiBlockPlayer: Attacker | undefined;
    udg_AntiBlockTable=InitHashtable();

    antiBlockCheckGroup = CreateGroup();
    antiJuggle = false;
    towerCounter = 0;
    touchedLastTower = false;
    playerLimitCircleOne = 0;
    playerLimitCircleTwo = 0;
    playerLimitCircleThree = 0;
    playerLimitCircleFour = 0;
    playerLimitCircleFive = 0;
    playerLimitCircleSix = 0;
    playerLimitCircleSeven = 0;
    playerLimitLeft = 0;
    playerLimitRight = 0;
    playerLimitOne = 0;
    playerLimitTwo = 0;
    playerLimitThree = 0;
    playerLimitFour = 0;
    playerLimitFive = 0;
    playerLimitSix = 0;
    playerLimitCheckpointOne = 0;
    playerLimitCheckpointTwo = 0;
    playerLimitCheckpointThree = 0;
    playerLimitCheckpointFour = 0;
    playerLimitCheckpointFive = 0;
    playerLimitCheckpointSix = 0;
    playerLimitCheckpointSeven = 0;
    playerLimitCheckpointEight = 0;
    antiBlockController: AntiBlockController;


    constructor(worldMap: WorldMap, antiBlockController: AntiBlockController) {
        this.worldMap = worldMap;
        this.antiBlockController = antiBlockController;
        this.antiBlockMap = new Map<number, AntiBlockData>();
        Log.Debug("New AntiBlock!");
    }

    public AntiBlockAction() {
        let consUnit = GetConstructingStructure();

        let player = settings.players.get(GetPlayerId(GetOwningPlayer(consUnit)));
        if (!player) {
            return;
        }


        if (GetUnitAbilityLevelSwapped(FourCC('A0CR'), consUnit) > 0) {
            if (!player.getRectangle().ContainsUnit(consUnit)) {
                TriggerSleepAction(0.01);
                IssueImmediateOrderById(consUnit, settings.UNIT_ORDER_CANCEL_UPGRADE);
            }
        }


        this.antiJuggle = false;
        this.towerCounter = 0;
        this.touchedLastTower = false;
        this.playerLimitCircleOne = 0;
        this.playerLimitCircleTwo = 0;
        this.playerLimitCircleThree = 0;
        this.playerLimitCircleFour = 0;
        this.playerLimitCircleFive = 0;
        this.playerLimitCircleSix = 0;
        this.playerLimitCircleSeven = 0;
        this.playerLimitLeft = 0;
        this.playerLimitRight = 0;
        this.playerLimitOne = 0;
        this.playerLimitTwo = 0;
        this.playerLimitThree = 0;
        this.playerLimitFour = 0;
        this.playerLimitFive = 0;
        this.playerLimitSix = 0;
        this.playerLimitCheckpointOne = 0;
        this.playerLimitCheckpointTwo = 0;
        this.playerLimitCheckpointThree = 0;
        this.playerLimitCheckpointFour = 0;
        this.playerLimitCheckpointFive = 0;
        this.playerLimitCheckpointSix = 0;
        this.playerLimitCheckpointSeven = 0;
        this.playerLimitCheckpointEight = 0;


        for (let p of settings.players.values()) {
            if (p.getRectangle().ContainsUnit(consUnit)) {
                this.antiBlockPlayer = p;
                break;
            }
        }

        this.CheckForCreeps(consUnit, player);
        if (this.antiJuggle) {
            return;
        }

        if (this.CheckCheckpointsConstructing(player)) {
            this.IterateCheckpoints(consUnit);
            if (this.IsBlockingACheckpoint()) {
                this.Blocking(player);
            }
        }

        GroupClear(this.antiBlockCheckGroup);
        GroupAddUnitSimple(consUnit, this.antiBlockCheckGroup);
        // SaveInteger(this.antiBlockTable, GetHandleIdBJ(consUnit))
        // let data = this.GetOrCreateAntiBlockData(GetHandleIdBJ(consUnit));
        // data.num = GetHandleIdBJ(consUnit);
        SaveInteger(this.udg_AntiBlockTable, GetHandleIdBJ(GetConstructingStructure()), 1, GetHandleIdBJ(GetConstructingStructure()))

        while (true) {
            ForGroupBJ(this.antiBlockCheckGroup,
                () => xpcall(() => this.FindNeighbouringTowers(), (err) => Log.Fatal(err)));
            if (this.towerCounter == CountUnitsInGroup(this.antiBlockCheckGroup)) {
                break;
            }
        }
        // this.antiBlockMap = new Map<number, AntiBlockData>();
        FlushParentHashtable(this.udg_AntiBlockTable)
        this.udg_AntiBlockTable=InitHashtable()

        // Is Player blocking?
        ForGroupBJ(this.antiBlockCheckGroup, () => this.IsPlayerBlocking());

        GroupClear(this.antiBlockCheckGroup);

        if (this.IsPlayerBlockingCheck()) {
            Log.Debug('IsPlayerBlockingCheck');
            this.Blocking(player);
            return;
        }
        if (this.CheckForCircle()) {
            Log.Debug('CheckForCircle');

            this.Blocking(player);
            return;
        }


    }

    CheckForCreeps(consUnit: unit, player: Attacker) {
        let loc = GetUnitLoc(consUnit);
        let grp = GetUnitsInRangeOfLocMatching(124, loc, Condition(() => Trigger.EvaluateCondition(() => this.UnitIsAliveCreepFilter())));
        if (this.antiJuggle) {
            this.IsJuggling(consUnit, player);
        }
        ForGroupBJ(grp, () => xpcall(() => this.IssueCreepMovement(), (err) => Log.Fatal(err)));

        DestroyGroup(grp);
        RemoveLocation(loc);
    }

    IsJuggling(consUnit: unit, player: Attacker) {
        player.sendMessage('|CFFFF0303[Anti-Juggle]|r |CFFFFFF01Detected a possible juggling attempt. Your building has been cancelled and you have been refunded the full cost.|r');
        TriggerSleepAction(0.01);
        IssueImmediateOrderById(consUnit, settings.UNIT_ORDER_CANCEL_UPGRADE);
    }

    UnitIsAliveCreepFilter() {

        if (!this.FilteredUnitIsCreep()) {
            return false;
        }

        if (!IsUnitAliveBJ(GetFilterUnit())) {
            return false;
        }

        if (IsUnitType(GetFilterUnit(), UNIT_TYPE_FLYING)) {
            return false;
        }

        this.antiJuggle = true;
        return true;
    }


    FilteredUnitIsCreep() {
        let filterUnit = GetFilterUnit();
        let oP = GetPlayerId(GetOwningPlayer(filterUnit));

        switch (oP) {
            case COLOUR.NAVY:
            case COLOUR.TURQUOISE:
            case COLOUR.VOILET:
            case COLOUR.WHEAT:
                return true;
            default:
                return false;

        }

    }

    IssueCreepMovement() {
        let spawnedCreeps = this.worldMap.spawnedCreeps;
        if (spawnedCreeps) {
            let spawnedCreep = spawnedCreeps.unitMap.get(GetHandleIdBJ(GetEnumUnit()));
            if (spawnedCreep) {
                spawnedCreep.ReapplyMovement();
            }


        }
    }

    IsBlockingACheckpoint() {
        return !!(this.IsBlockingCheckpointOne || this.IsBlockingCheckpointTwo);

    }

    IsBlockingCheckpointOne() {

        if (!(this.playerLimitCheckpointOne > 0)) {
            return false;
        }


        if (!(this.playerLimitCheckpointTwo > 0)) {
            return false;
        }


        if (!(this.playerLimitCheckpointThree > 0)) {
            return false;
        }


        if (!(this.playerLimitCheckpointFour > 0)) {
            return false;
        }


        return true;

    }

    IsBlockingCheckpointTwo() {

        if (!(this.playerLimitCheckpointFive > 0)) {
            return false;
        }


        if (!(this.playerLimitCheckpointSix > 0)) {
            return false;
        }


        if (!(this.playerLimitCheckpointSeven > 0)) {
            return false;
        }


        if (!(this.playerLimitCheckpointEight > 0)) {
            return false;
        }


        return true;
    }


    CheckCheckpointsConstructing(player: Attacker) {
        if (RectContainsUnit(this.antiBlockController.testRegions[21 * player.id + 13], GetConstructingStructure())) {
            this.playerLimitCheckpointOne = this.playerLimitCheckpointOne + 1;
            return true;
        }
        if (RectContainsUnit(this.antiBlockController.testRegions[21 * player.id + 14], GetConstructingStructure())) {
            this.playerLimitCheckpointTwo = this.playerLimitCheckpointTwo + 1;
            return true;
        }
        if (RectContainsUnit(this.antiBlockController.testRegions[21 * player.id + 15], GetConstructingStructure())) {
            this.playerLimitCheckpointThree = this.playerLimitCheckpointThree + 1;
            return true;
        }
        if (RectContainsUnit(this.antiBlockController.testRegions[21 * player.id + 16], GetConstructingStructure())) {
            this.playerLimitCheckpointFour = this.playerLimitCheckpointFour + 1;
            return true;
        }
        if (RectContainsUnit(this.antiBlockController.testRegions[21 * player.id + 17], GetConstructingStructure())) {
            this.playerLimitCheckpointFive = this.playerLimitCheckpointFive + 1;
            return true;
        }
        if (RectContainsUnit(this.antiBlockController.testRegions[21 * player.id + 18], GetConstructingStructure())) {
            this.playerLimitCheckpointSix = this.playerLimitCheckpointSix + 1;
            return true;
        }
        if (RectContainsUnit(this.antiBlockController.testRegions[21 * player.id + 19], GetConstructingStructure())) {
            this.playerLimitCheckpointSeven = this.playerLimitCheckpointSeven + 1;
            return true;
        }
        if (RectContainsUnit(this.antiBlockController.testRegions[21 * player.id + 20], GetConstructingStructure())) {
            this.playerLimitCheckpointEight = this.playerLimitCheckpointEight + 1;
            return true;
        }

    }

    IterateCheckpoints(consUnit: unit) {
        let loc = GetUnitLoc(consUnit);
        let grp = GetUnitsInRangeOfLocAll(182.00, loc);
        ForGroup(grp, () => xpcall(() => this.CheckCheckpoints(), err => Log.Fatal(err)));
        DestroyGroup(grp);
        RemoveLocation(loc);
    }

    CheckCheckpoints() {

        if (GetUnitTypeId(GetEnumUnit()) == FourCC('h03M')) {
            return;
        }
        if (!IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE)) {
            return;
        }
        if (!this.antiBlockPlayer) {
            Log.Fatal('antiBlockPlayer is missing');
            return;
        }

        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 13], GetEnumUnit())) {
            this.playerLimitCheckpointOne = this.playerLimitCheckpointOne + 1;
            return true;
        }
        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 14], GetEnumUnit())) {
            this.playerLimitCheckpointTwo = this.playerLimitCheckpointTwo + 1;
            return true;
        }
        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 15], GetEnumUnit())) {
            this.playerLimitCheckpointThree = this.playerLimitCheckpointThree + 1;
            return true;
        }
        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 16], GetEnumUnit())) {
            this.playerLimitCheckpointFour = this.playerLimitCheckpointFour + 1;
            return true;
        }
        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 17], GetEnumUnit())) {
            this.playerLimitCheckpointFive = this.playerLimitCheckpointFive + 1;
            return true;
        }
        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 18], GetEnumUnit())) {
            this.playerLimitCheckpointSix = this.playerLimitCheckpointSix + 1;
            return true;
        }
        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 19], GetEnumUnit())) {
            this.playerLimitCheckpointSeven = this.playerLimitCheckpointSeven + 1;
            return true;
        }
        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 20], GetEnumUnit())) {
            this.playerLimitCheckpointEight = this.playerLimitCheckpointEight + 1;
            return true;
        }
    }

    Blocking(player: Attacker) {
        player.sendMessage('|CFFFF0303[Anti-Block]|r |CFFFFFF01Detected a possible blocking attempt. Your building has been cancelled and you have been refunded the full cost.|r');
        TriggerSleepAction(0.01);
        IssueImmediateOrderById(GetConstructingStructure(), settings.UNIT_ORDER_CANCEL_UPGRADE);
    }

    CheckForCircle() {
        if (!this.touchedLastTower) {
            Log.Debug('!touchedLastTower');

            return false;
        }

        if (this.CheckCircleAroundCheckpointOne()) {
            Log.Debug('CheckCircleAroundCheckpointOne');
            return true;
        }


        if (this.CheckCircleAroundCheckpointTwo()) {
            Log.Debug('CheckCircleAroundCheckpointTwo');

            return true;
        }


        if (this.CheckCircleAroundBothCheckpoints()) {
            Log.Debug('CheckCircleAroundBothCheckpoints');

            return true;
        }
        Log.Debug('all g');
        return false;
    }

    CheckCircleAroundCheckpointOne() {
        if (!(this.playerLimitCircleOne > 0)) {
            return false;
        }

        if (!(this.playerLimitCircleTwo > 0)) {
            return false;
        }

        if (!(this.playerLimitCircleThree > 0)) {
            return false;
        }

        if (!(this.playerLimitCircleFour > 0)) {
            return false;
        }

        Log.Debug(`${this.playerLimitCircleOne} ${this.playerLimitCircleTwo} ${this.playerLimitCircleThree} ${this.playerLimitCircleFour}`);
        Log.Debug('reached end');
        return true;
    }

    CheckCircleAroundCheckpointTwo() {
        if (!(this.playerLimitCircleOne > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleFive > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleSix > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleSeven > 0)) {
            return false;
        }


        return true;
    }

    CheckCircleAroundBothCheckpoints() {
        if (!(this.playerLimitCircleTwo > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleThree > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleFour > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleFive > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleSix > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleSeven > 0)) {
            return false;
        }

        return true;
    }

    IsPlayerBlockingCheck() {
        if (this.CheckCrossSectionOne()) {
            return true;
        }

        if (this.CheckCrossSectionTwo()) {
            return true;
        }

        if (this.CheckCrossSectionThree()) {
            return true;
        }

        if (this.CheckCrossSectionFour()) {
            return true;
        }

        if (this.CheckCrossSectionFive()) {
            return true;
        }

        if (this.CheckCrossSectionSix()) {
            return true;
        }

        if (this.CheckCrossSectionSeven()) {
            return true;
        }

        if (this.CheckCrossSectionEight()) {
            return true;
        }

        if (this.CheckCrossSectionNine()) {
            return true;
        }

        if (this.CheckCrossSectionTen()) {
            return true;
        }

        if (this.CheckCrossSectionEleven()) {
            return true;
        }

        if (this.CheckCrossSectionTwelve()) {
            return true;
        }

        if (this.CheckCrossSectionThirteen()) {
            return true;
        }

        if (this.CheckCrossSectionFourteen()) {
            return true;
        }

        if (this.CheckCrossSectionFifteen()) {
            return true;
        }

        return false;
    }


    CheckCrossSectionFifteen() {
        if (!((this.playerLimitCircleOne + this.playerLimitCircleFive + this.playerLimitCircleSix + this.playerLimitCircleSeven) > 2)) { // INLINED!!
            return false;
        }

        if (!(this.playerLimitFive > 0)) {
            return false;
        }

        if (!(this.playerLimitSix > 0)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionOne() {
        if (!(this.playerLimitOne > 0)) {
            return false;
        }

        if (!(this.playerLimitFive > 0)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionTwo() {
        if (!(this.playerLimitTwo > 0)) {
            return false;
        }

        if (!(this.playerLimitFive > 0)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionThree() {
        if (!(this.playerLimitThree > 0)) {
            return false;
        }

        if (!(this.playerLimitFive > 0)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionFour() {
        if (!(this.playerLimitOne > 0)) {
            return false;
        }

        if (!(this.playerLimitFour > 0)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionFive() {
        if (!(this.playerLimitTwo > 0)) {
            return false;
        }

        if (!(this.playerLimitFour > 0)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionSix() {
        if (!(this.playerLimitThree > 0)) {
            return false;
        }

        if (!(this.playerLimitFour > 0)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionSeven() {
        if (!(this.playerLimitThree > 0)) {
            return false;
        }

        if (!(this.playerLimitSix > 0)) {
            return false;
        }

        if (!(this.playerLimitCircleFive > 0)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionEight() {
        if (!(this.playerLimitOne > 0)) {
            return false;
        }

        if (!(this.playerLimitSix > 0)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionNine() {
        if (!(this.playerLimitFour > 0)) {
            return false;
        }

        if (!(this.playerLimitFive > 0)) {
            return false;
        }
        if (this.CheckCircleLine()) {
            return true;
        }

        return false;
    }

    CheckCrossSectionTen() {
        if (!(this.AreAnyOfTheBordersLargerThanOne())) {
            return false;
        }

        if (!(this.ThreeSidesOfAnyCircle())) {
            return false;
        }

        return true;
    }

    CheckCrossSectionEleven() {
        if (!(this.AllSidesOfBothCirclesAreConnected())) {
            return false;
        }

        if (!(this.playerLimitOne + this.playerLimitTwo + this.playerLimitThree + this.playerLimitFour + this.playerLimitFive + this.playerLimitSix > 1)) {
            return false;
        }

        return true;
    }

    CheckCrossSectionTwelve() {
        if (!(this.playerLimitCircleOne > 0)) {
            return false;
        }

        if (!(this.playerLimitCircleFive > 0)) {
            return false;
        }

        if (!(this.playerLimitOne > 0)) {
            return false;
        }

        if (!(this.playerLimitTwo > 0)) {
            return false;
        }

        return true;
    }


    CheckCrossSectionThirteen() {
        if (!(this.playerLimitTwo > 0)) {
            return false;
        }

        if (!(this.playerLimitSix > 0)) {
            return false;
        }

        return true;
    }

    TwoSidesConnected() {
        return (this.playerLimitOne + this.playerLimitTwo + this.playerLimitThree + this.playerLimitFour + this.playerLimitFive + this.playerLimitSix > 1);
    }

    AllSidesOfBothCirclesAreConnected() {
        if (!(this.playerLimitCircleOne > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleTwo > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleThree > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleFour > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleFive > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleSix > 0)) {
            return false;
        }


        if (!(this.playerLimitCircleSeven > 0)) {
            return false;
        }


        return true;
    }


    ThreeSidesOfAnyCircle() {
        if (((this.playerLimitCircleOne + this.playerLimitCircleTwo + this.playerLimitCircleThree + this.playerLimitCircleFour) > 2)) {  // INLINED!!

            return true;
        }

        if (((this.playerLimitCircleOne + this.playerLimitCircleFive + this.playerLimitCircleSix + this.playerLimitCircleSeven) > 2)) { // INLINED!!

            return true;
        }

        return false;
    }

    CheckCrossSectionFourteen() {
        if (!(this.playerLimitTwo > 0)) {
            return false;
        }

        if (!(this.playerLimitThree > 0)) {
            return false;
        }

        if (this.CheckCircleLine()) {
            return true;
        }

        return false;
    }

    ThreeSidesOfCircleOne() {
        return ((this.playerLimitCircleOne + this.playerLimitCircleTwo + this.playerLimitCircleThree + this.playerLimitCircleFour) > 2);
    }

    ThreeSidesOfCircleTwo() {
        return ((this.playerLimitCircleOne + this.playerLimitCircleFive + this.playerLimitCircleSix + this.playerLimitCircleSeven) > 2);
    }

    CheckCircleLine() {
        if (this.playerLimitCircleOne > 0) {
            return true;
        }

        if (this.playerLimitCircleThree > 0) {
            return true;
        }

        if (this.playerLimitCircleSix > 0) {
            return true;
        }

        return false;
    }

    AreAnyOfTheBordersLargerThanOne() {
        if (this.playerLimitOne > 1) {
            return true;
        }

        if (this.playerLimitTwo > 1) {
            return true;
        }

        if (this.playerLimitThree > 1) {
            return true;
        }

        if (this.playerLimitFour > 1) {
            return true;
        }

        if (this.playerLimitFive > 1) {
            return true;
        }

        if (this.playerLimitSix > 1) {
            return true;
        }

        return false;
    }


    IsPlayerBlocking() {
        if (!this.antiBlockPlayer) {
            Log.Fatal('antiBlockPlayer is missing');
            return;
        }
        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 5], GetEnumUnit())) {
            Log.Debug(`IsPlayerBlocking: 5 [${21 * this.antiBlockPlayer.id + 5}]`);
            this.playerLimitOne = this.playerLimitOne + 1;

        }

        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id], GetEnumUnit())) {
            Log.Debug(`IsPlayerBlocking: 0 [${21 * this.antiBlockPlayer.id + 0}]`);
            this.playerLimitTwo = this.playerLimitTwo + 1;

        }

        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 1], GetEnumUnit())) {
            Log.Debug(`IsPlayerBlocking: 1 [${21 * this.antiBlockPlayer.id + 16}]`);
            this.playerLimitThree = this.playerLimitThree + 1;

        }

        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 3], GetEnumUnit())) {
            Log.Debug(`IsPlayerBlocking: 3 [${21 * this.antiBlockPlayer.id + 3}]`);
            this.playerLimitFour = this.playerLimitFour + 1;

        }

        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 2], GetEnumUnit())) {
            Log.Debug(`IsPlayerBlocking: 2 [${21 * this.antiBlockPlayer.id + 2}]`);
            this.playerLimitFive = this.playerLimitFive + 1;
        }

        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 4], GetEnumUnit())) {
            Log.Debug(`IsPlayerBlocking: 4 [${21 * this.antiBlockPlayer.id + 4}]`);
            this.playerLimitSix = this.playerLimitSix + 1;

        }

        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 6], GetEnumUnit())) {
            Log.Debug(`IsPlayerBlocking: 6 [${21 * this.antiBlockPlayer.id + 6}]`);
            this.playerLimitCircleOne = this.playerLimitCircleOne + 1;

        }

        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 7], GetEnumUnit())) {
            Log.Debug(`IsPlayerBlocking: 7 [${21 * this.antiBlockPlayer.id + 7}]`);
            this.playerLimitCircleTwo = this.playerLimitCircleTwo + 1;

        }

        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 8], GetEnumUnit())) {
            Log.Debug(`IsPlayerBlocking: 8 [${21 * this.antiBlockPlayer.id + 8}]`);
            this.playerLimitCircleThree = this.playerLimitCircleThree + 1;

        }

        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 9], GetEnumUnit())) {
            Log.Debug(`IsPlayerBlocking: 9 [${21 * this.antiBlockPlayer.id + 9}]`);
            this.playerLimitCircleFour = this.playerLimitCircleFour + 1;

        }

        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 10], GetEnumUnit())) {
            Log.Debug(`IsPlayerBlocking: 10 [${21 * this.antiBlockPlayer.id + 10}]`);
            this.playerLimitCircleFive = this.playerLimitCircleFive + 1;

        }

        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 11], GetEnumUnit())) {
            Log.Debug(`IsPlayerBlocking: 11 [${21 * this.antiBlockPlayer.id + 11}]`);
            this.playerLimitCircleSix = this.playerLimitCircleSix + 1;

        }

        if (RectContainsUnit(this.antiBlockController.testRegions[21 * this.antiBlockPlayer.id + 12], GetEnumUnit())) {
            Log.Debug(`IsPlayerBlocking: 12 [${21 * this.antiBlockPlayer.id + 12}]`);
            this.playerLimitCircleSeven = this.playerLimitCircleSeven + 1;

        }
    }

    FindNeighbouringTowers() {
        let handleid = GetHandleIdBJ(GetEnumUnit());
        // let entry = this.antiBlockMap.get(handleid);
        // if (entry) {
        //     if (entry.boolOne) {
        //         return;
        //     }
        // }
        if ( LoadBoolean(this.udg_AntiBlockTable, handleid, 0) ) {
            return;
        }


        this.NewNeighbourTower(handleid);
    }

    NewNeighbourTower(handleid: number) {
        let loc = GetUnitLoc(GetEnumUnit());
        // let data = this.GetOrCreateAntiBlockData(handleid);
        SaveBoolean(this.udg_AntiBlockTable, handleid, 0, true)
        SaveReal(this.udg_AntiBlockTable, handleid, 2, GetLocationX(loc))
        SaveReal(this.udg_AntiBlockTable, handleid, 3, GetLocationY(loc))
        // data.boolOne = true;
        // data.locX = GetLocationX(loc);
        // data.locY = GetLocationY(loc);
        let grp = GetUnitsInRangeOfLocMatching(182, loc, Condition(() => Trigger.EvaluateCondition(() => this.GetUnitsInRangeFilter())));
        SaveGroupHandle(this.udg_AntiBlockTable, handleid, 1, grp)
        // data.grp = grp;

        GroupAddGroup(grp, this.antiBlockCheckGroup);

        this.towerCounter = this.towerCounter + 1;
    }

    GetUnitsInRangeFilter() {
        if (!this.FilteredUnitIsStructure()) {
            return false;
        }

        if (GetFilterUnit() == GetEnumUnit()) {
            return false;
        }


        if ((IsUnitInGroup(GetFilterUnit(), this.antiBlockCheckGroup))) { // INLINED!!
            this.CheckHashtable();
            return false;
        }
        // let data = this.GetOrCreateAntiBlockData(GetHandleIdBJ(GetFilterUnit()));
        // data.num = GetHandleIdBJ(GetFilterUnit());
        SaveInteger(this.udg_AntiBlockTable, GetHandleIdBJ(GetFilterUnit()), 1, GetHandleIdBJ(GetEnumUnit()))

        // call BlzSetUnitName(GetFilterUnit(), I2S(GetHandleIdBJ(GetEnumUnit())))
        return true;
    }

    CheckHashtable() {
        let filterid = GetHandleIdBJ(GetFilterUnit());
        let enumid = GetHandleIdBJ(GetEnumUnit());
        // let handleid = this.GetOrCreateAntiBlockData(GetHandleIdBJ(GetEnumUnit())).num;
        // let handleidFilter = this.GetOrCreateAntiBlockData(filterid).num;
        let handleid= LoadInteger(this.udg_AntiBlockTable, GetHandleIdBJ(GetEnumUnit()), 1)
        let handleidFilter= LoadInteger(this.udg_AntiBlockTable, filterid, 1)
        if (handleid == handleidFilter) {
            Log.Debug(`1`);
            return;
        }

        if (handleid == GetHandleIdBJ(GetFilterUnit())) {
            Log.Debug(`2`);
            return;
        }


        if (handleid == LoadInteger(this.udg_AntiBlockTable, handleidFilter, 1) ) {
            if (!this.CheckIfTowersTouch(handleidFilter, enumid)) {
                Log.Debug(`3`);
                return;
            }
        }


        if (handleidFilter == LoadInteger(this.udg_AntiBlockTable, handleid, 1) ) {
            Log.Debug(`4`);
            return;
        }

        this.touchedLastTower = true;
    }

    CheckIfTowersTouch(first: number, second: number) {
        let flag = false;
        let dist = SquareRoot(Pow(LoadReal(this.udg_AntiBlockTable, first, 2) - LoadReal(this.udg_AntiBlockTable, second, 2), 2.00) + Pow(LoadReal(this.udg_AntiBlockTable, first, 3) - LoadReal(this.udg_AntiBlockTable, second, 3), 2.00));

        if (dist > 182.00) {
            flag = true;
        }

        return flag;

    }

    FilteredUnitIsStructure() {
        if (GetUnitTypeId(GetFilterUnit()) == FourCC('h03M')) {
            return false;
        }

        return IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE);
    }

    FilteredUnitIsInGroup() {
        return IsUnitInGroup(GetFilterUnit(), this.antiBlockCheckGroup);
    }

    private GetOrCreateAntiBlockData(handleid: number): AntiBlockData {
        let entry = this.antiBlockMap.get(handleid);
        if (this.antiBlockMap.has(handleid)) {
            entry = this.antiBlockMap.get(handleid);
        } else {
            Log.Debug("Created!")
            this.antiBlockMap.set(handleid, new AntiBlockData());
            entry = this.antiBlockMap.get(handleid);
        }

        if (!entry) {
            Log.Fatal('GetOrCreateAntiBlockData unable to get or create');
        }
        // @ts-ignore
        return entry;
    }

}
