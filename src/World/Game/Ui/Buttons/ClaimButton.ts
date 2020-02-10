import { AbstractActionButton } from './AbstractActionButton';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../../Entity/Players/Defender';
import { AbstractPlayer } from '../../../Entity/Players/AbstractPlayer';

export class ClaimButton extends AbstractActionButton {
    private static Icon: string = 'uiImport/CommandButtons/BTNClaim.dds';
    private readonly toolTip: framehandle;
    private players: Map<number, AbstractPlayer> = new Map<number, AbstractPlayer>();

    constructor(game: WarcraftMaul, x: number, y: number, size: number, idx: number = 0) {
        super(game, `claimButton${idx}`, ClaimButton.Icon, x, y, size);
        this.toolTip = BlzCreateFrameByType(
            'TEXT',
            'FaceFrameTooltip',
            this.backdropHandle,
            '',
            0);
        BlzFrameSetTooltip(this.buttonHandle, this.toolTip);

        BlzFrameSetAbsPoint(this.toolTip, FRAMEPOINT_CENTER, x, y + 0.025);
        BlzFrameSetText(this.toolTip, 'Claim all towers in your region');

        for (const player of this.game.players.values()) {
            this.players.set(player.id, player);
        }

    }

    public clickAction(): void {
        const player: Defender | undefined = this.game.players.get(GetPlayerId(GetTriggerPlayer()));
        if (!player) {
            return;
        }
        this.disable();
        player.ClaimTowers();
        this.enable();
    }


}
