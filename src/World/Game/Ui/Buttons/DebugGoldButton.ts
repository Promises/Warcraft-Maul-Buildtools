import { AbstractActionButton } from './AbstractActionButton';
import { WarcraftMaul } from '../../../WarcraftMaul';

export class DebugGoldButton extends AbstractActionButton {
    constructor(game: WarcraftMaul, x: number, y: number, size: number, idx: number = 0) {
        super(game, `goldButton${idx}`, 'UI\\Feedback\\Resources\\ResourceGold.blp', x, y, size);
    }

    public clickAction(): void {
        this.disable();
        SetPlayerState(Player(0), PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_GOLD) + 1000);
        this.enable();
    }

}
