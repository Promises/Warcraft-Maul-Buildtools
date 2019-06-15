import {COLOUR_CODES} from "../../GlobalSettings";

export abstract class AbstractPlayer {
    wcPlayer: player;
    id: number;

    constructor(id: number) {
        this.id = id;
        this.wcPlayer = Player(id);
    }


    makeAlliance(otherPlayer: AbstractPlayer){
        SetPlayerAllianceStateBJ(this.wcPlayer, otherPlayer.wcPlayer, bj_ALLIANCE_ALLIED_VISION);
    }

    getPlayerColour(): string {
        return COLOUR[this.id].toLowerCase();
    }

    getColourCode(): string {
        return COLOUR_CODES[this.id];
    }

    getNameWithColour(): string {
        return Util.ColourString(this.getColourCode(), this.getPlayerName());
    }

    getPlayerName(): string {
        return GetPlayerName(this.wcPlayer);
    }

    sendMessage(message:string){
        DisplayTimedTextToPlayer(this.wcPlayer, 0, 0, 5, message)

    }

    setGold(amount: number) {
        SetPlayerStateBJ(this.wcPlayer, PLAYER_STATE_RESOURCE_GOLD, amount);
    }

    setLumber(amount: number) {
        SetPlayerStateBJ(this.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER, amount);
    }

    setHandicap(percentage: number) {
        SetPlayerHandicapBJ(this.wcPlayer,percentage)
    }

    giveLumber(amount: number) {
        AdjustPlayerStateBJ(amount, this.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER);
    }

    giveGold(amount: number) {
        AdjustPlayerStateBJ(amount, this.wcPlayer, PLAYER_STATE_RESOURCE_GOLD);
    }

    defeatPlayer(){
        CustomDefeatBJ(this.wcPlayer, "Defeat!")
    }

}
