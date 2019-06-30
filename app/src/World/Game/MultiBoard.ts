import { WarcraftMaul } from '../WarcraftMaul';
import * as settings from '../GlobalSettings';
import { ARMOUR_TYPE_COLOURS, ARMOUR_TYPE_NAMES, players } from '../GlobalSettings';

export class MultiBoard {
    board: multiboard;
    game: WarcraftMaul;
    scoreboardColumnWidth: number[] = [];

    constructor(game: WarcraftMaul) {
        this.game = game;

        this.scoreboardColumnWidth[1] = 10.00;
        this.scoreboardColumnWidth[2] = 8.00;
        this.board = CreateMultiboardBJ(2, settings.players.size + 7, settings.GAME_NAME);
        MultiboardSetItemValueBJ(this.board, 1, 1, 'Starting in');
        MultiboardSetItemValueBJ(this.board, 2, 1, this.game.waveTimer + '');
        MultiboardSetItemValueBJ(this.board, 1, 2, 'Level');
        MultiboardSetItemValueBJ(this.board, 2, 2, this.game.gameRoundHandler.currentWave + '');
        MultiboardSetItemValueBJ(this.board, 1, 3, 'Difficulty');
        MultiboardSetItemValueBJ(this.board, 1, 4, 'Lives');
        MultiboardSetItemValueBJ(this.board, 2, 4, this.game.gameLives + '');
        MultiboardSetItemValueBJ(this.board, 1, 5, 'Armour Type');
        let armourType: string = ARMOUR_TYPE_NAMES[this.game.worldMap.waveCreeps[0].getArmourType()].toLowerCase();
        armourType = armourType.charAt(0).toUpperCase() + armourType.slice(1);
        MultiboardSetItemValueBJ(
            this.board, 2, 5,
            Util.ColourString(ARMOUR_TYPE_COLOURS[this.game.worldMap.waveCreeps[0].getArmourType()], armourType));
        MultiboardSetItemValueBJ(this.board, 1, 7, 'Player');
        MultiboardSetItemValueBJ(this.board, 2, 7, 'Kills');

        MultiboardSetItemWidthBJ(this.board, 1, 1, this.scoreboardColumnWidth[1]); // Game time
        MultiboardSetItemWidthBJ(this.board, 2, 1, this.scoreboardColumnWidth[2]);
        MultiboardSetItemWidthBJ(this.board, 1, 2, this.scoreboardColumnWidth[1]); // Level
        MultiboardSetItemWidthBJ(this.board, 2, 2, this.scoreboardColumnWidth[2]);
        MultiboardSetItemWidthBJ(this.board, 1, 3, this.scoreboardColumnWidth[1]); // Difficulty
        MultiboardSetItemWidthBJ(this.board, 2, 3, this.scoreboardColumnWidth[2]);
        MultiboardSetItemWidthBJ(this.board, 1, 4, this.scoreboardColumnWidth[1]); // Lives
        MultiboardSetItemWidthBJ(this.board, 2, 4, this.scoreboardColumnWidth[2]);
        MultiboardSetItemWidthBJ(this.board, 1, 5, this.scoreboardColumnWidth[1]); // Level Type
        MultiboardSetItemWidthBJ(this.board, 2, 5, this.scoreboardColumnWidth[2]);
        MultiboardSetItemWidthBJ(this.board, 1, 6, this.scoreboardColumnWidth[1]); // Level Type 2
        MultiboardSetItemWidthBJ(this.board, 2, 6, this.scoreboardColumnWidth[2]);
        MultiboardSetItemWidthBJ(this.board, 1, 7, this.scoreboardColumnWidth[1]); // Kills
        MultiboardSetItemWidthBJ(this.board, 2, 7, this.scoreboardColumnWidth[2]);

        MultiboardSetItemStyleBJ(this.board, 1, 1, true, false);
        MultiboardSetItemStyleBJ(this.board, 2, 1, true, false);
        MultiboardSetItemStyleBJ(this.board, 1, 2, true, false);
        MultiboardSetItemStyleBJ(this.board, 2, 2, true, false);
        MultiboardSetItemStyleBJ(this.board, 1, 3, true, false);
        MultiboardSetItemStyleBJ(this.board, 2, 3, true, false);
        MultiboardSetItemStyleBJ(this.board, 1, 4, true, false);
        MultiboardSetItemStyleBJ(this.board, 2, 4, true, false);
        MultiboardSetItemStyleBJ(this.board, 1, 5, true, false);
        MultiboardSetItemStyleBJ(this.board, 2, 5, true, false);
        MultiboardSetItemStyleBJ(this.board, 1, 6, true, false);
        MultiboardSetItemStyleBJ(this.board, 2, 6, true, false);
        MultiboardSetItemStyleBJ(this.board, 1, 7, true, false);
        MultiboardSetItemStyleBJ(this.board, 2, 7, true, false);

        this.InitializePlayerScores();

        MultiboardDisplayBJ(true, this.board);
    }

    private InitializePlayerScores(): void {
        let count = 0;
        for (const player of settings.players.values()) {
            player.scoreSlot = count;
            MultiboardSetItemValueBJ(this.board, 1, 7 + count, player.getNameWithColour());
            MultiboardSetItemValueBJ(this.board, 2, 7 + count, '' + player.kills);
            MultiboardSetItemStyleBJ(this.board, 1, 7 + count, true, false);
            MultiboardSetItemStyleBJ(this.board, 2, 7 + count, true, false);
            MultiboardSetItemWidthBJ(this.board, 1, 7 + count, this.scoreboardColumnWidth[1]); // Kills
            MultiboardSetItemWidthBJ(this.board, 2, 7 + count, this.scoreboardColumnWidth[2]);
            count++;
        }
        MultiboardSetItemStyleBJ(this.board, 1, 7 + count, true, false);
        MultiboardSetItemStyleBJ(this.board, 2, 7 + count, true, false);


    }
}
