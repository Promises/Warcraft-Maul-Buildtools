import * as settings from '../GlobalSettings';
import { COLOUR_CODES, enemies } from '../GlobalSettings';
import { WarcraftMaul } from '../WarcraftMaul';
import { MultiBoard } from './MultiBoard';
import { Trigger } from '../../JassOverrides/Trigger';
import { Log } from '../../lib/Serilog/Serilog';

export class DifficultyVote {
    initializeVotesTrigger: Trigger;
    difficultyVoteTrigger: Trigger;
    difficultyDialog: dialog = DialogCreate();
    difficultyButtons: button[] = [];

    game: WarcraftMaul;
    private votedDiff: number[] = [];
    private totalVotedDiff: number = 0;
    difficulty: number = 0;


    constructor(game: WarcraftMaul) {
        this.game = game;
        this.initializeVotesTrigger = new Trigger();
        this.initializeVotesTrigger.RegisterTimerEventSingle(1.00);
        this.initializeVotesTrigger.AddAction(() => this.InitializeVotes());

        this.difficultyVoteTrigger = new Trigger();
        this.difficultyVoteTrigger.RegisterDialogEventBJ(this.difficultyDialog);
        this.difficultyVoteTrigger.AddAction(() => this.DifficultyVote());
    }


    InitializeVotes(): void {
        DialogSetMessageBJ(this.difficultyDialog, 'Difficulty vote:');
        for (let i: number = 0; i < settings.DIFFICULTIES.length; i++) {
            this.difficultyButtons.push(
                DialogAddButtonBJ(
                    this.difficultyDialog,
                    `${Util.ColourString(settings.DIFFICULTY_COLOURS[i],
                                         `${settings.DIFFICULTIES[i]}% ${settings.DIFFICULTY_STRINGS[i]}`)}`,
                ),
            );
        }

        for (const player of settings.players.values()) {
            PanCameraToTimedForPlayer(player.wcPlayer, -1900.00, 2100.00, 0.00);
            DialogDisplayBJ(true, this.difficultyDialog, player.wcPlayer);

        }

        // DisableTriggers();
        this.InitializeVoteTimer();
    }

    private InitializeVoteTimer(): void {
        const t: timer = CreateTimer();
        TimerStart(t, 10.00, false, () => this.VoteTimerExpired());
    }

    private SetDifficulty(diffculty: number): void {
        for (const enemy of enemies) {
            enemy.setHandicap(diffculty);
        }
    }

    private VoteTimerExpired(): void {
        PauseTimer(GetExpiredTimer());
        let voteCount: number = 0;
        Log.Debug(Util.ArraysToString(this.votedDiff));
        for (const player of settings.players.values()) {
            if (!this.votedDiff[player.id]) {
                DialogDisplayBJ(false, this.difficultyDialog, player.wcPlayer);
                SendMessage(`${player.getNameWithColour()} did not vote, their vote will not be counted`);
            } else {
                voteCount++;
                this.totalVotedDiff += this.votedDiff[player.id];
            }


        }
        this.game.scoreBoard = new MultiBoard(this.game);


        if (voteCount === 0) {
            SendMessage('Nobody voted, difficulty will automaticall be set to Normal');
            this.difficulty = settings.DIFFICULTIES[0];

        } else {
            this.difficulty = this.totalVotedDiff / voteCount;
        }


        const diffIndex: number = R2I((this.difficulty - 100.00) / 100.00 + ModuloReal((this.difficulty - 100.00) / 100.00, 1.00));
        this.difficulty = Math.floor(this.difficulty);
        this.SetDifficulty(this.difficulty);
        SetPlayerHandicapBJ(Player(PLAYER_NEUTRAL_PASSIVE), this.difficulty);
        SendMessage(`Difficulty was set to ${this.difficulty}% (${Util.ColourString(settings.DIFFICULTY_COLOURS[diffIndex],
                                                                              settings.DIFFICULTY_STRINGS[diffIndex])})`);

        for (const player of settings.players.values()) {
            for (const ally of settings.players.values()) {
                SetPlayerAllianceBJ(player.wcPlayer, ALLIANCE_HELP_REQUEST, false, ally.wcPlayer);

            }
        }

        if (this.difficulty >= 400) {
            PlaySoundBJ(settings.Sounds.impossibleDifficultySound);
            SendMessage('|cFF565656Everyone voted for Extreme, you will only have |r1|cFF565656 life!|r');
            this.game.gameLives = 1;
            this.game.startLives = 1;
            // MultiboardSetItemValueBJ(udg_Scoreboard, 2, 4, I2S(udg_TotalLives))
            SetWaterBaseColorBJ(100, 20.00, 20.00, 0);
            this.game.worldMap.ReplaceRunedBricksWithLava();
        }

        MultiboardSetItemValueBJ(
            this.game.scoreBoard.board,
            2, 3,
            `${I2S(R2I(this.difficulty))}% (${Util.ColourString(settings.DIFFICULTY_COLOURS[diffIndex],
                                                                settings.DIFFICULTY_STRINGS[diffIndex])})`,
        );


    }

    private DifficultyVote(): void {
        for (let i: number = 0; i < this.difficultyButtons.length; i++) {
            const button: button = this.difficultyButtons[i];

            if (GetClickedButtonBJ() === button) {
                this.votedDiff[GetPlayerId(GetTriggerPlayer())] = settings.DIFFICULTIES[i];
                SendMessage(`${Util.ColourString(COLOUR_CODES[GetPlayerId(GetTriggerPlayer())],
                                           GetPlayerName(GetTriggerPlayer()))} voted for: ${Util.ColourString(settings.DIFFICULTY_COLOURS[i],
                                                                                                              settings.DIFFICULTY_STRINGS[i])}`);
            }
        }
        DialogDisplayBJ(false, this.difficultyDialog, GetTriggerPlayer());

    }
}
