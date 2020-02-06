import { AbstractActionButton } from './AbstractActionButton';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../../Entity/Players/Defender';
import { AdvancedHoloMaze } from '../../../Holograms/AdvancedHoloMaze';
import { CheckPoint } from '../../../Entity/CheckPoint';
import { AbstractPlayer } from '../../../Entity/Players/AbstractPlayer';
import { Log } from '../../../../lib/Serilog/Serilog';

export class ExampleMaze extends AbstractActionButton {
    private static enabledIcon: string = 'uiImport/CommandButtonsDisabled/DISBTNMAZEAlpha.dds';
    private static disabledIcon: string = 'uiImport/CommandButtons/BTNMAZEAlpha.dds';
    private readonly toolTip: framehandle;
    private currentFade: number = 255;
    private defaultSize: number;
    private currentSize: number;
    private increaseFade: boolean = false;
    private players: Map<number, AbstractPlayer> = new Map<number, AbstractPlayer>();

    constructor(game: WarcraftMaul, x: number, y: number, size: number, idx: number = 0) {
        super(game, `mazeButton${idx}`, ExampleMaze.disabledIcon, x, y, size);
        this.toolTip = BlzCreateFrameByType(
            'TEXT',
            'FaceFrameTooltip',
            this.backdropHandle,
            '',
            0);
        this.defaultSize = size;
        this.currentSize = (size * 2);
        BlzFrameSetTooltip(this.buttonHandle, this.toolTip);

        BlzFrameSetAbsPoint(this.toolTip, FRAMEPOINT_CENTER, x, y + 0.025);
        BlzFrameSetText(this.toolTip, 'Show/Hide Sample Maze');

        for (const player of this.game.players.values()) {
            this.players.set(player.id, player);
        }

        // this.game.eventQueue.AddLow(() => this.fadeInAndOut());

    }

    public clickAction(): void {
        const player: Defender | undefined = this.game.players.get(GetPlayerId(GetTriggerPlayer()));
        if (!player) {
            return;
        }
        this.disable();
        this.players.delete(player.id);
        BlzFrameSetAlpha(this.backdropHandle, 255);
        BlzFrameSetSize(this.backdropHandle, this.defaultSize, this.defaultSize);
        BlzFrameSetSize(this.buttonHandle, this.defaultSize, this.defaultSize);
        const firstSpawn: CheckPoint | undefined = this.game.worldMap.playerSpawns[player.id].spawnOne;
        if (firstSpawn === undefined) {
            this.enable();

            return;
        }

        const firstCheckpoint: CheckPoint | undefined = firstSpawn.next;
        if (firstCheckpoint === undefined) {
            this.enable();

            return;
        }

        const secondCheckpoint: CheckPoint | undefined = firstCheckpoint.next;
        if (secondCheckpoint === undefined) {
            this.enable();

            return;
        }

        if (player.holoMaze === undefined) {
            player.setHoloMaze(
                new AdvancedHoloMaze(
                    'ReplaceableTextures\\Splats\\SuggestedPlacementSplat.blp',
                    GetRectCenterX(firstCheckpoint.rectangle),
                    GetRectCenterY(firstCheckpoint.rectangle),
                    GetRectCenterX(secondCheckpoint.rectangle),
                    GetRectCenterY(secondCheckpoint.rectangle)));
            this.setIcon(true);
        } else {
            player.setHoloMaze(undefined);
            this.setIcon(false);
        }
        this.enable();
    }

    public setIcon(enabled: boolean): void {
        if (enabled) {
            if (GetTriggerPlayer() === GetLocalPlayer()) {
                BlzFrameSetTexture(this.backdropHandle, ExampleMaze.enabledIcon, 0, true);
            }
        } else {
            if (GetTriggerPlayer() === GetLocalPlayer()) {
                BlzFrameSetTexture(this.backdropHandle, ExampleMaze.disabledIcon, 0, true);
            }
        }

    }

    public fadeInAndOut(): boolean {
        if (this.currentFade >= 250 || this.currentFade <= 10) {
            this.increaseFade = !this.increaseFade;
        }
        if (this.players.size === 0) {
            return true;
        }
        if (this.increaseFade) {
            this.currentFade += 10;
            this.currentSize += (this.defaultSize / 25.0);
        } else {
            this.currentFade -= 10;
            this.currentSize = this.defaultSize;

        }
        for (const player of this.players.values()) {
            if (player.wcPlayer === GetLocalPlayer()) {
                BlzFrameSetAlpha(this.backdropHandle, this.currentFade);
                BlzFrameSetSize(this.backdropHandle, this.currentSize, this.currentSize);
                BlzFrameSetSize(this.buttonHandle, this.currentSize, this.currentSize);
            }
        }

        return false;
    }

}
