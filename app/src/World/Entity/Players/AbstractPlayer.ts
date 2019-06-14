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

}
