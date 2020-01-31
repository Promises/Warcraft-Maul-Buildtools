import * as settings from '../GlobalSettings';
import { WarcraftMaul } from '../WarcraftMaul';
import { MultiBoard } from './MultiBoard';
import { Trigger } from '../../JassOverrides/Trigger';
import { Log } from '../../lib/Serilog/Serilog';
import { ClassicGameRound } from './ClassicMaul/ClassicGameRound';
import { BlitzGameRound } from './BlitzMaul/BlitzGameRound';
import { AbstractPlayer } from '../Entity/Players/AbstractPlayer';

export class Vote {
    public initializeVotesTrigger: Trigger;
    public difficultyVoteTrigger: Trigger;


    public difficultyDialog: dialog = DialogCreate();
    public difficultyButtons: button[] = [];


    public modeDialog: dialog = DialogCreate();
    public modeButtons: button[] = [];
    public modeVoteTrigger: Trigger;
    private votedMode: number[] = [];


    public game: WarcraftMaul;
    private votedDiff: number[] = [];
    private totalVotedDiff: number = 0;
    public difficulty: number = 0;


    constructor(game: WarcraftMaul) {
        this.game = game;
        this.initializeVotesTrigger = new Trigger();
        this.initializeVotesTrigger.registerTimerEventSingle(1.00);
        this.initializeVotesTrigger.addAction(() => this.InitializeVotes());

        this.difficultyVoteTrigger = new Trigger();
        this.difficultyVoteTrigger.registerDialogEventBJ(this.difficultyDialog);
        this.difficultyVoteTrigger.addAction(() => this.DifficultyVote());

        this.modeVoteTrigger = new Trigger();
        this.modeVoteTrigger.registerDialogEventBJ(this.modeDialog);
        this.modeVoteTrigger.addAction(() => this.ModeVote());
    }


    public InitializeVotes(): void {
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
        DialogSetMessageBJ(this.modeDialog, 'Game mode vote:');
        for (let i: number = 0; i < settings.GAME_MODE_STRINGS.length; i++) {
            this.votedMode[i] = 0;
            this.modeButtons.push(
                DialogAddButtonBJ(
                    this.modeDialog,
                    `${Util.ColourString(settings.GAME_MODE_COLOURS[i],
                        `${settings.GAME_MODE_STRINGS[i]}`)}`,
                ),
            );
        }

        for (const player of this.game.players.values()) {
            PanCameraToTimedForPlayer(player.wcPlayer, -1900.00, 2100.00, 0.00);
            DialogDisplayBJ(true, this.modeDialog, player.wcPlayer);

        }

        // DisableTriggers();
        this.InitializeModeVoteTimer();
    }

    private InitializeModeVoteTimer(): void {
        const t: timer = CreateTimer();
        TimerStart(t, 10.00, false, () => this.ModeVoteTimeExpired());
    }

    private InitializeDiffVoteTimer(): void {
        const t: timer = CreateTimer();
        TimerStart(t, 10.00, false, () => this.VoteDiffTimerExpired());
    }

    private SetDifficulty(diffculty: number): void {
        for (const enemy of this.game.enemies) {
            enemy.setHandicap(diffculty);
        }
    }

    private ModeVoteTimeExpired(): void {
        PauseTimer(GetExpiredTimer());
        let winningMode: number | undefined;
        for (let i: number = 0; i < this.votedMode.length; i++) {
            if (!winningMode) {
                winningMode = i;
            } else {
                if (this.votedMode[i] > this.votedMode[winningMode]) {
                    winningMode = i;
                }
            }
        }
        if (!winningMode) {
            Log.Fatal('Could not parse game mode');
            return;
        }

        const colouredMode: string = Util.ColourString(settings.GAME_MODE_COLOURS[winningMode], settings.GAME_MODE_STRINGS[winningMode]);

        SendMessage(`${colouredMode} won with ${this.votedMode[winningMode]} votes.`);
        switch (winningMode) {
            case settings.GAME_MODES.CLASSIC:
                this.game.worldMap.gameRoundHandler = new ClassicGameRound(this.game);
                break;
            case settings.GAME_MODES.BLITZ:
                this.game.worldMap.gameRoundHandler = new BlitzGameRound(this.game);
                break;
            default:
                Log.Fatal('Invalid game mode, defaulting to classic.');
                this.game.worldMap.gameRoundHandler = new ClassicGameRound(this.game);
                break;
        }

        for (const player of this.game.players.values()) {
            DialogDisplayBJ(true, this.difficultyDialog, player.wcPlayer);

        }


        this.InitializeDiffVoteTimer();

    }

    private VoteDiffTimerExpired(): void {
        PauseTimer(GetExpiredTimer());
        let voteCount: number = 0;
        for (const player of this.game.players.values()) {
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
            SendMessage('Nobody voted, difficulty will automatically be set to Normal');
            this.difficulty = settings.DIFFICULTIES[0];

        } else {
            this.difficulty = this.totalVotedDiff / voteCount;
        }


        const diffIndex: number = R2I((this.difficulty - 100.00) / 100.00 + ModuloReal((this.difficulty - 100.00) / 100.00, 1.00));
        this.difficulty = Math.floor(this.difficulty);
        // this.SetDifficulty(this.difficulty);
        SetPlayerHandicapBJ(Player(PLAYER_NEUTRAL_PASSIVE), this.difficulty);
        // this.game.mmd.DefineSettingNumber('difficulty', this.difficulty);
        SendMessage(`Difficulty was set to ${this.difficulty}% (${Util.ColourString(settings.DIFFICULTY_COLOURS[diffIndex],
            settings.DIFFICULTY_STRINGS[diffIndex])})`);

        for (const player of this.game.players.values()) {
            for (const ally of this.game.players.values()) {
                SetPlayerAllianceBJ(player.wcPlayer, ALLIANCE_HELP_REQUEST, false, ally.wcPlayer);

            }
        }

        if (this.difficulty >= 400) {
            PlaySoundBJ(settings.Sounds.impossibleDifficultySound);
            SendMessage('|cFF565656Everyone voted for Extreme, you will only have |r1|cFF565656 life!|r');
            this.game.gameLives = 1;
            this.game.startLives = 1;
            MultiboardSetItemValueBJ(this.game.scoreBoard.board, 2, 4, `${this.game.gameLives}%`);
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
                const player: AbstractPlayer | undefined = this.game.players.get(GetPlayerId(GetTriggerPlayer()));
                if (!player) {
                    return;
                }
                this.votedDiff[player.id] = settings.DIFFICULTIES[i];
                SendMessage(`${player.getNameWithColour()} voted for: ${Util.ColourString(settings.DIFFICULTY_COLOURS[i], settings.DIFFICULTY_STRINGS[i])}`);
            }
        }
        DialogDisplayBJ(false, this.difficultyDialog, GetTriggerPlayer());

    }

    private ModeVote(): void {
        for (let i: number = 0; i < this.modeButtons.length; i++) {
            const button: button = this.modeButtons[i];

            if (GetClickedButtonBJ() === button) {
                const player: AbstractPlayer | undefined = this.game.players.get(GetPlayerId(GetTriggerPlayer()));
                if (!player) {
                    return;
                }
                this.votedMode[i]++;
                SendMessage(`${player.getNameWithColour()} voted for: ${Util.ColourString(settings.GAME_MODE_COLOURS[i], settings.GAME_MODE_STRINGS[i])}`);
            }
        }
        DialogDisplayBJ(false, this.modeDialog, GetTriggerPlayer());
    }


}
