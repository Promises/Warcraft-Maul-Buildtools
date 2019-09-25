import { AbstractGameRound } from '../BaseMaul/AbstractGameRound';
import * as settings from '../../GlobalSettings';
import { WarcraftMaul } from '../../WarcraftMaul';
import { Trigger } from '../../../JassOverrides/Trigger';
import { Ship } from '../../Entity/Ship';
import { TimedEvent } from '../../../lib/WCEventQueue/TimedEvent';

export class BlitzGameRound extends AbstractGameRound {
    private shouldStartWaveTimer: boolean = false;
    private waitBetweenWaveTime: number = settings.GAME_TIME_BEFORE_WAVE;
    private roundEndTrigger: Trigger;
    private roundOverGoldReward: number = settings.GAME_GOLD_REWARD_BASE;
    private shouldStartSpawning: boolean = false;

    constructor(game: WarcraftMaul) {
        super(game);
        this.roundEndTrigger = new Trigger();

        for (const enemy of this.game.enemies) {
            this.roundEndTrigger.RegisterPlayerStateEvent(enemy.wcPlayer, PLAYER_STATE_RESOURCE_FOOD_USED, EQUAL, 0.00);
        }

        this.roundEndTrigger.AddCondition(() => this.CreepFoodConditions());
        this.roundEndTrigger.AddAction(() => this.AllIsDead());
        this.roundEndTrigger.Disable();
        this.roundOverGoldReward += 5;

    }


    private SpawnNextWave(): boolean {
        this.shouldStartSpawning = true;
        this.currentWave++;
        this.roundOverGoldReward += 5;
        return true;
    }

    public GameTimeUpdateEvent(): void {
        if (this.shouldStartWaveTimer) {
            this.shouldStartWaveTimer = false;
            this.game.waveTimer = this.waitBetweenWaveTime + 1;

            this.UpdateScoreboardForWave();
        }

        if (this.isWaveInProgress) {
            if (this.game.scoreBoard) {
                MultiboardSetItemValueBJ(this.game.scoreBoard.board, 2, 1, this.game.PrettifyGameTime(this.game.gameTime));
            }
        } else {
            this.game.waveTimer = this.game.waveTimer - 1;
            if (this.game.scoreBoard) {
                MultiboardSetItemValueBJ(this.game.scoreBoard.board, 2, 1, Util.ColourString('#999999', ToString(this.game.waveTimer)));
            }
        }

        if (this.game.waveTimer === 0 && !this.isWaveInProgress || this.shouldStartSpawning) {
            this.shouldStartSpawning = false;

            this.isWaveInProgress = true;
            if (this.game.scoreBoard) {
                MultiboardSetItemValueBJ(this.game.scoreBoard.board, 1, 1, 'Game Time');
            }
            this.SpawnCreeps();


        }

    }

    private AllIsDead(): void {

        if (this.currentWave === this.game.worldMap.waveCreeps.length) {
            this.BonusRoundsOver();
        } else {
            this.currentWave++;
            this.roundOverGoldReward += 2;


            // Update scoreboard
            if (this.game.scoreBoard) {
                MultiboardSetItemValueBJ(this.game.scoreBoard.board, 2, 2, `${this.currentWave}`);
            }

            // Display lives lost
            this.DisplayLivesLost();


            this.GiveWaveGoldReward();

            // Start new timers
            this.isWaveInProgress = false;
            this.shouldStartWaveTimer = true;

            this.game.worldMap.HealEverythingOnMap();

            if (this.currentWave === 35 && this.game.worldMap.archimondeDummy) {
                PauseUnitBJ(false, this.game.worldMap.archimondeDummy);
                IssueTargetDestructableOrder(this.game.worldMap.archimondeDummy, 'attack', this.game.worldMap.archimondeGate.gate);
            }
            if (this.currentWave === 36) { // as 35 is the last normal wave :P
                this.game.GameWin();
            }
        }

        for (const tower of this.game.worldMap.gameTurn.EndOfRoundTowers()) {
            tower.EndOfRoundAction();
        }

        for (const maze of this.game.worldMap.playerMazes) {
            maze.CleanAll();
        }

    }

    private UpdateScoreboardForWave(): void {
        if (this.game.scoreBoard) {
            MultiboardSetItemValueBJ(this.game.scoreBoard.board, 1, 1, 'Starting in');
            let armourType: string = settings.ARMOUR_TYPE_NAMES[this.game.worldMap.waveCreeps[this.currentWave - 1].getArmourType()];
            armourType = armourType.charAt(0).toUpperCase() + armourType.toLowerCase().slice(1);
            MultiboardSetItemValueBJ(
                this.game.scoreBoard.board,
                2, 5,
                Util.ColourString(
                    settings.ARMOUR_TYPE_COLOURS[this.game.worldMap.waveCreeps[this.currentWave - 1].getArmourType()], armourType,
                ),
            );
            const creepType: CREEP_TYPE = this.game.worldMap.waveCreeps[this.currentWave - 1].getCreepType();
            if (creepType !== CREEP_TYPE.NORMAL) {
                let creepTypeName: string = settings.CREEP_TYPE_NAMES[this.game.worldMap.waveCreeps[this.currentWave - 1].getCreepType()];
                creepTypeName = creepTypeName.charAt(0).toUpperCase() + creepTypeName.toLowerCase().slice(1);
                MultiboardSetItemValueBJ(
                    this.game.scoreBoard.board,
                    2, 6,
                    Util.ColourString(
                        settings.CREEP_TYPE_COLOURS[this.game.worldMap.waveCreeps[this.currentWave - 1].getCreepType()],
                        `(${creepTypeName})`));
            } else {
                MultiboardSetItemValueBJ(
                    this.game.scoreBoard.board,
                    2, 6,
                    '');
            }
        }
    }

    private CreepFoodConditions(): boolean {
        for (const enemy of this.game.enemies) {
            if (!(GetPlayerState(enemy.wcPlayer, PLAYER_STATE_RESOURCE_FOOD_USED) === 0)) {
                return false;
            }
        }
        return true;
    }


    private BonusRoundsOver(): void {
        SendMessage('|cFFF48C42That\'s all the bonus levels, see you next time!|r');
        this.isWaveInProgress = false;
        this.game.gameEndTimer = settings.GAME_END_TIME;
        this.game.gameEnded = true;
        const ship: Ship | undefined = this.game.worldMap.ship;
        if (ship) {
            ship.MoveShip();
        }
        this.BonusRoundEffects();

    }

    private DisplayLivesLost(): void {
        if (this.game.gameLives === this.game.startLives) {
            SendMessage(settings.NO_LIVES_LOST);
        } else {
            const livesRemaining: number = this.game.startLives - this.game.gameLives;
            SendMessage(
                `${livesRemaining}${Util.ColourString(settings.COLOUR_CODES[COLOUR.RED], '% of your lives have been lost')}`,
            );
        }
    }


    private BonusRoundEffects(): void {
        const t: timer = CreateTimer();
        TimerStart(t, 0.03, true, () => this.SpamBonusEffects());
    }


    private SpamBonusEffects(): void {
        const x: number = GetRandomInt(0, 10000) - 5000;
        const y: number = GetRandomInt(0, 10000) - 5000;
        const loc: location = Location(x, y);
        DestroyEffect(AddSpecialEffectLocBJ(loc, 'Abilities\\Spells\\Human\\Flare\\FlareCaster.mdl'));
        RemoveLocation(loc);
    }


    private GiveWaveGoldReward(): void {
        for (const player of this.game.players.values()) {
            if (this.currentWave === 15) {
                player.giveLumber(1);
            }
            if (player.id === COLOUR.GRAY) {
                player.giveGold(2 * this.roundOverGoldReward);
                player.sendMessage(
                    `|c0000cdf9You recieved|r ${2 * this.roundOverGoldReward} |c0000cdf9` +
                    `extra gold for completing level as the last defender|r ${(this.currentWave - 1)}`);
            } else {
                player.giveGold(this.roundOverGoldReward);
                player.sendMessage(
                    `|c0000cdf9You recieved|r ${this.roundOverGoldReward} |c0000cdf9` +
                    `extra gold for completing level|r ${(this.currentWave - 1)}`);

            }
        }
    }

    public FinishedSpawning(): void {
        this.game.timedEventQueue.AddEvent(new TimedEvent(() => this.SpawnNextWave(), 50, false));
    }

}
