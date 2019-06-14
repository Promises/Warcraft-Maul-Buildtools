import {AbstractPlayer} from "./AbstractPlayer";
import {ALLOW_PLAYER_TOWER_LOCATIONS} from "../../GlobalSettings";

export class Defender extends AbstractPlayer{

    allowPlayerTower: unit | undefined;
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
        this.allowPlayerTower = CreateUnit(this.wcPlayer,FourCC('h03S'), allowTowerLoc.x, allowTowerLoc.y, 0.000);



    }

}
