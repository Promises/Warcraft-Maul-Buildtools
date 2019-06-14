import {players} from "../../GlobalSettings";
import {AbstractPlayer} from "./AbstractPlayer";

export class Attacker extends AbstractPlayer {

    constructor(id: number) {
        super(id);
        SetPlayerName(this.wcPlayer, "Forces of Darkness");
        SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, true, this.wcPlayer );
        for (let humanPlayer of players) {
            SetPlayerAllianceStateBJ(humanPlayer.wcPlayer, this.wcPlayer, bj_ALLIANCE_UNALLIED);
        }
    }


}
