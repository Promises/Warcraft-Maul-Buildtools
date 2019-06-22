import {AbstractPlayer} from './AbstractPlayer';
import {ALLOW_PLAYER_TOWER_LOCATIONS, PLAYER_AREAS, players} from '../../GlobalSettings';
import {Race} from '../../Game/Races/Race';
import {Rectangle} from '../../../JassOverrides/Rectangle';
import {Trigger} from '../../../JassOverrides/Trigger';
import {WarcraftMaul} from '../../WarcraftMaul';
import { Tower } from '../Tower/Tower';

export class Defender extends AbstractPlayer {
    scoreSlot = 0;
    kills = 0;
    allowPlayerTower: unit | undefined;
    hasHybridRandomed: boolean = false;
    hasHardcoreRandomed: boolean = false;
    hasNormalPicked: boolean = false;
    races: Race[] = [];

    repickCounter: number = 0;
    voidBuilder: unit | undefined;
    lootBoxer: unit | undefined;
    hybridBuilder: unit | undefined;
    hybridTowers: any[] = [];
    leaveTrigger: Trigger;
    deniedPlayers: AbstractPlayer[] = [];
    towers: Map<number, Tower> = new Map<number, Tower>();

    constructor(id: number, game: WarcraftMaul) {
        super(id);
        this.setUpPlayerVariables();
        this.leaveTrigger = new Trigger();
        this.leaveTrigger.AddCondition(() => this.PlayerLeftTheGameConditions(game));
        this.leaveTrigger.AddAction(() => this.PlayerLeftTheGame(game));

    }


    setUpPlayerVariables() {

        // Remove fog
        CreateFogModifierRectBJ(true, this.wcPlayer, FOG_OF_WAR_VISIBLE, GetPlayableMapRect());


        // Set Starting gold and lumber
        SetPlayerStateBJ(this.wcPlayer, PLAYER_STATE_RESOURCE_GOLD, this.id == COLOUR.GRAY ? 150 : 100);
        SetPlayerStateBJ(this.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER, 1);


        // Creat the allow player indicator tower
        const allowTowerLoc = ALLOW_PLAYER_TOWER_LOCATIONS[this.id];
        //
        this.allowPlayerTower = CreateUnit(this.wcPlayer, FourCC('h03S'), allowTowerLoc.x, allowTowerLoc.y, 0.000);


    }

    hasRace(randomedRace: Race) {
        return this.races.indexOf(randomedRace) != -1;
    }


    getArea() {
        return PLAYER_AREAS[this.id];
    }

    getCenterX() {
        let x1 = this.getArea()[0];
        let x2 = this.getArea()[2];

        return (x1 + x2) / 2;
    }

    getCenterY() {
        let y1 = this.getArea()[1];
        let y2 = this.getArea()[3];

        return (y1 + y2) / 2;
    }

    getVoidBuilder() {
        return this.voidBuilder;
    }

    getLootBoxer() {
        return this.lootBoxer;
    }


    getRectangle() {
        return new Rectangle(this.getArea());
    }

    private PlayerLeftTheGameConditions(game: WarcraftMaul) {
        return game.gameLives > 0;
    }

    private PlayerLeftTheGame(game: WarcraftMaul) {
        print(`${this.getNameWithColour()} has left the game!`);

        this.ResetSpawnRestrictions();
        TriggerSleepAction(2.00);
        game.worldMap.playerSpawns[this.id].isOpen = false;
        if (game.scoreBoard) {
            MultiboardSetItemValueBJ(game.scoreBoard.board, 1, 7 + this.scoreSlot,
                Util.ColourString(this.getColourCode(), '<Quit>'));
        }

        players.delete(this.id);

        // this.DistributePlayerGold();
        // this.DistributePlayerTowers();
    }

    private ResetSpawnRestrictions() {


    }

    AddTower(tower: Tower): void {
        this.towers.set(tower.handleId, tower);
    }
}
