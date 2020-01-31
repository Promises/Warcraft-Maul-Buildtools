/**
 * All credits to Runi95 for 99% of the work of these modules
 */

import { AbstractActionButton } from './Buttons/AbstractActionButton';
import { WarcraftMaul } from '../../WarcraftMaul';
import { DebugGoldButton } from './Buttons/DebugGoldButton';
import { ExampleMaze } from './Buttons/ExampleMaze';

export class ActionBar {
    private readonly game: WarcraftMaul;
    private readonly actionBarX: number = 0.222;
    private readonly actionBarY: number = 0.15;
    private readonly actionBarHeight: number = 0.02;
    private readonly actionBarButtonsSpaceBetween: number = 0.025;
    private readonly buttons: AbstractActionButton[] = [];

    constructor(game: WarcraftMaul) {
        this.game = game;
        this.initializeButtons();
    }

    private initializeButtons(): void {
        if (this.game.debugMode) {
            this.buttons.push(new DebugGoldButton(this.game, this.getNextX(), this.getNextY(), this.actionBarHeight, this.buttons.length));
        }
        this.buttons.push(new ExampleMaze(this.game, this.getNextX(), this.getNextY(), this.actionBarHeight, this.buttons.length));

    }

    private getNextX(): number {
        return this.actionBarX + (this.buttons.length % 15 * this.actionBarButtonsSpaceBetween);
    }

    private getNextY(): number {
        return this.actionBarY + (Math.floor(this.buttons.length / 15) * this.actionBarButtonsSpaceBetween);
    }
}
