import { AbstractPlayer } from './AbstractPlayer';
import { WarcraftMaul } from '../../WarcraftMaul';

export class Attacker extends AbstractPlayer {

    constructor(id: number, game: WarcraftMaul) {
        super(id);
        SetPlayerName(this.wcPlayer, 'Forces of Darkness');
        SetPlayerFlagBJ(PLAYER_STATE_GIVES_BOUNTY, true, this.wcPlayer);
        for (const humanPlayer of game.players.values()) {
            SetPlayerAllianceStateBJ(humanPlayer.wcPlayer, this.wcPlayer, bj_ALLIANCE_UNALLIED);
        }
    }


}
