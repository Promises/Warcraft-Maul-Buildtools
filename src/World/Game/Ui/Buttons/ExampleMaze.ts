import { AbstractActionButton } from './AbstractActionButton';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../../Entity/Players/Defender';
import { AdvancedHoloMaze } from '../../../Holograms/AdvancedHoloMaze';
import { CheckPoint } from '../../../Entity/CheckPoint';

export class ExampleMaze extends AbstractActionButton {
    private static disabledIcon: string = 'uiImport\\CommandButtonsDisabled\\DISBTNMaze.dds';
    private static enabledIcon: string = 'uiImport\\CommandButtons\\BTNMAZE.dds';

    constructor(game: WarcraftMaul, x: number, y: number, size: number, idx: number = 0) {
        super(game, `mazeButton${idx}`, ExampleMaze.disabledIcon, x, y, size);
    }

    public clickAction(): void {
        const player: Defender | undefined = this.game.players.get(GetPlayerId(GetTriggerPlayer()));
        if (!player) {
            return;
        }
        this.disable();

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

}
