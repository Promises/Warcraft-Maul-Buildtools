import * as settings from '../GlobalSettings';
import {COLOUR_CODES, enemies} from '../GlobalSettings';
import {WarcraftMaul} from '../WarcraftMaul';
import {MultiBoard} from './MultiBoard';
import {Trigger} from '../../JassOverrides/Trigger';
import {Log} from '../../lib/Serilog/Serilog';

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


    InitializeVotes() {
        DialogSetMessageBJ(this.difficultyDialog, 'Difficulty vote:');
        for (let i = 0; i < settings.DIFFICULTIES.length; i++) {
            this.difficultyButtons.push(
                DialogAddButtonBJ(
                    this.difficultyDialog,
                    `${Util.ColourString(settings.DIFFICULTY_COLOURS[i],
                        `${settings.DIFFICULTIES[i]}% ${settings.DIFFICULTY_STRINGS[i]}`)}`
                )
            );
        }

        for (let player of settings.players.values()) {
            PanCameraToTimedForPlayer(player.wcPlayer, -1900.00, 2100.00, 0.00);
            DialogDisplayBJ(true, this.difficultyDialog, player.wcPlayer);

        }

        // DisableTriggers();
        this.InitializeVoteTimer();


    }

    private InitializeVoteTimer() {
        let t = CreateTimer();
        TimerStart(t, 10.00, false, () => this.VoteTimerExpired());
    }

    private SetDifficulty(diffculty: number) {
        for (let enemy of enemies) {
            enemy.setHandicap(diffculty);
        }
    }

    private VoteTimerExpired() {
        PauseTimer(GetExpiredTimer());
        let votecount = 0;
        Log.Debug(Util.ArraysToString(this.votedDiff));
        for (let player of settings.players.values()) {
            if (!this.votedDiff[player.id]) {
                DialogDisplayBJ(false, this.difficultyDialog, player.wcPlayer);
                print(player.getNameWithColour() + " did not vote, their vote will not be counted");
            } else {
                votecount++;
                this.totalVotedDiff += this.votedDiff[player.id]
            }


        }
        this.game.scoreBoard = new MultiBoard(this.game);


        if (votecount == 0) {
            print("Nobody voted, difficulty will automaticall be set to Normal");
            this.difficulty = settings.DIFFICULTIES[0];

        } else {
            this.difficulty = this.totalVotedDiff / votecount;
        }


        let diffIndex = R2I((this.difficulty - 100.00) / 100.00 + ModuloReal((this.difficulty - 100.00) / 100.00, 1.00));
        this.difficulty = Math.floor(this.difficulty);
        this.SetDifficulty(this.difficulty);
        SetPlayerHandicapBJ(Player(PLAYER_NEUTRAL_PASSIVE), this.difficulty);
        print("Difficulty was set to " + this.difficulty + "% (" +
            Util.ColourString(settings.DIFFICULTY_COLOURS[diffIndex], settings.DIFFICULTY_STRINGS[diffIndex]) + ")");

        for (let player of settings.players.values()) {
            for (let ally of settings.players.values()) {
                SetPlayerAllianceBJ(player.wcPlayer, ALLIANCE_HELP_REQUEST, false, ally.wcPlayer);

            }
        }

        if (this.difficulty >= 400) {
            PlaySoundBJ(settings.Sounds.impossibleDifficultySound);
            print("|cFF565656Everyone voted for Extreme, you will only have |r1|cFF565656 life!|r");
            this.game.gameLives = 1;
            this.game.startLives = 1;
            // MultiboardSetItemValueBJ(udg_Scoreboard, 2, 4, I2S(udg_TotalLives))
            SetWaterBaseColorBJ(100, 20.00, 20.00, 0);
            this.game.worldMap.ReplaceRunedBricksWithLava()
        }

        MultiboardSetItemValueBJ(
            this.game.scoreBoard.board,
            2, 3,
            I2S(R2I(this.difficulty)) + "%" + " (" + Util.ColourString(settings.DIFFICULTY_COLOURS[diffIndex], settings.DIFFICULTY_STRINGS[diffIndex]) + ")"
        );


    }

    private DifficultyVote() {
        for (let i = 0; i < this.difficultyButtons.length; i++) {
            let button = this.difficultyButtons[i];

            if (GetClickedButtonBJ() == button) {
                this.votedDiff[GetPlayerId(GetTriggerPlayer())] = settings.DIFFICULTIES[i];
                print(Util.ColourString(COLOUR_CODES[GetPlayerId(GetTriggerPlayer())],
                    GetPlayerName(GetTriggerPlayer())) + ' voted for: ' +
                    Util.ColourString(settings.DIFFICULTY_COLOURS[i], settings.DIFFICULTY_STRINGS[i]));
            }
        }
        DialogDisplayBJ(false, this.difficultyDialog, GetTriggerPlayer());

    }
}
