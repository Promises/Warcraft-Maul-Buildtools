import { AbstractPlayer } from './AbstractPlayer';
import { ALLOW_PLAYER_TOWER_LOCATIONS, PLAYER_AREAS } from '../../GlobalSettings';
import { Race } from '../../Game/Races/Race';

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
    hybridBuilder: unit| undefined;

    constructor(id: number) {
        super(id);
        this.setUpPlayerVariables();


    }

    setUpPlayerVariables() {

        // Remove fog
        CreateFogModifierRectBJ(true, this.wcPlayer, FOG_OF_WAR_VISIBLE, GetPlayableMapRect());


        // Set Starting gold and lumber
        SetPlayerStateBJ(this.wcPlayer, PLAYER_STATE_RESOURCE_GOLD, this.id == COLOUR.GRAY ? 150 : 100);
        SetPlayerStateBJ(this.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER, 1);

        this.sendMessage(`Hello ${this.getNameWithColour()}, you are playing as ${this.getPlayerColour()}`);

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

    getCenterX(){
        let x1 = this.getArea()[0];
        let x2 = this.getArea()[2];

        return (x1 + x2)/2;
    }

    getCenterY(){
        let y1 = this.getArea()[1];
        let y2 = this.getArea()[3];

        return (y1 + y2)/2;
    }

    getVoidBuilder() {
        return this.voidBuilder;
    }

    getLootBoxer() {
        return this.lootBoxer;
    }


}
