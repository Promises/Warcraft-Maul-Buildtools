import * as settings from '../GlobalSettings';
import { ARMOUR_TYPE_COLOURS, ARMOUR_TYPE_NAMES, CREEP_TYPE_COLOURS } from '../GlobalSettings';
import { WarcraftMaul } from '../WarcraftMaul';
import { WaveCreep } from '../Entity/WaveCreep';
import { Creep } from '../Entity/Creep';
import { Trigger } from '../../JassOverrides/Trigger';
import { PlayerSpawns } from '../Entity/PlayerSpawns';
import { Ship } from '../Entity/Ship';
import { ArchimondeGate } from './ArchimondeGate';
import { ArchimondeTeleport } from './ArchimondeTeleport';
import { EndOfRoundTower } from '../Entity/Tower/Specs/EndOfRoundTower';
import { CreepAbility } from '../Entity/CreepAbilities/specs/CreepAbility';
import { Tower } from '../Entity/Tower/Specs/Tower';

export class GameRound {


    private gameTimeTrigger: Trigger;
    private roundEndTrigger: Trigger;
    private game: WarcraftMaul;
    private shouldStartWaveTimer: boolean = false;
    private _isWaveInProgress: boolean = false;
    private _currentWave: number = 1;
    private roundOverGoldReward: number = settings.GAME_GOLD_REWARD_BASE;
    private _endOfTurnTowerArray: (Tower & EndOfRoundTower)[] = [];
    private waitBetweenWaveTime: number = settings.GAME_TIME_BEFORE_WAVE;
    private archimondeGate: ArchimondeGate;
    private archimondeTeleport: ArchimondeTeleport;

    constructor(game: WarcraftMaul) {
        this.game = game;
        this.archimondeGate = new ArchimondeGate(this.game.worldMap.archimondeDummy);
        this.archimondeTeleport = new ArchimondeTeleport(this.game.worldMap.archimondeDummy);
        this.gameTimeTrigger = new Trigger();
        this.gameTimeTrigger.RegisterTimerEventPeriodic(1.00);
        this.gameTimeTrigger.AddAction(() => this.UpdateGameTime());
        this.roundEndTrigger = new Trigger();

        for (const enemy of this.game.enemies) {
            this.roundEndTrigger.RegisterPlayerStateEvent(enemy.wcPlayer, PLAYER_STATE_RESOURCE_FOOD_USED, EQUAL, 0.00);
        }

        this.roundEndTrigger.AddCondition(() => this.CreepFoodConditions());
        this.roundEndTrigger.AddAction(() => this.RoundEnd());
    }


    public AddEndOfRoundTower(id: number, endOfRoundTower: EndOfRoundTower & Tower): void {
        this._endOfTurnTowerArray.push(endOfRoundTower);
    }

    public RemoveEndOfRoundTower(id: number): void {
        this._endOfTurnTowerArray = this._endOfTurnTowerArray.filter((tower) => {
            return tower.UniqueID !== id;
        });

    }


    get currentWave(): number {
        return this._currentWave;
    }

    set currentWave(value: number) {
        this._currentWave = value;
    }


    get isWaveInProgress(): boolean {
        return this._isWaveInProgress;
    }


    private UpdateGameTime(): void {
        if (this.game.gameEnded) {
            this.game.gameEndTimer -= 1;
            if (this.game.scoreBoard) {
                MultiboardSetItemValueBJ(this.game.scoreBoard.board, 1, 1, 'End Time');
                MultiboardSetItemValueBJ(this.game.scoreBoard.board, 2, 1, this.game.PrettifyGameTime(this.game.gameEndTimer));
            }
            if (this.game.gameEndTimer <= 0) {
                this.game.DefeatAllPlayers();
            }
        } else {
            this.game.gameTime += 1;

            if (this.shouldStartWaveTimer) {
                this.shouldStartWaveTimer = false;
                this.game.waveTimer = this.waitBetweenWaveTime + 1;

                this.UpdateScoreboardForWave();
            }

            if (this._isWaveInProgress) {
                if (this.game.scoreBoard) {
                    MultiboardSetItemValueBJ(this.game.scoreBoard.board, 2, 1, this.game.PrettifyGameTime(this.game.gameTime));
                }
            } else {
                this.game.waveTimer = this.game.waveTimer - 1;
                if (this.game.scoreBoard) {
                    MultiboardSetItemValueBJ(this.game.scoreBoard.board, 2, 1, Util.ColourString('#999999', ToString(this.game.waveTimer)));
                }
            }

            if (this.game.waveTimer === 0 && !this._isWaveInProgress) {
                this._isWaveInProgress = true;
                if (this.game.scoreBoard) {
                    MultiboardSetItemValueBJ(this.game.scoreBoard.board, 1, 1, 'Game Time');
                }
                this.SpawnCreeps();


            }


        }

    }

    private UpdateScoreboardForWave(): void {
        if (this.game.scoreBoard) {
            MultiboardSetItemValueBJ(this.game.scoreBoard.board, 1, 1, 'Starting in');
            let armourType: string = ARMOUR_TYPE_NAMES[this.game.worldMap.waveCreeps[this._currentWave - 1].getArmourType()].toLowerCase();
            armourType = armourType.charAt(0).toUpperCase() + armourType.slice(1);
            MultiboardSetItemValueBJ(
                this.game.scoreBoard.board,
                2, 5,
                Util.ColourString(ARMOUR_TYPE_COLOURS[this.game.worldMap.waveCreeps[this._currentWave - 1].getArmourType()], armourType));
            const creepType: CREEP_TYPE = this.game.worldMap.waveCreeps[this._currentWave - 1].getCreepType();
            if (creepType !== CREEP_TYPE.NORMAL) {
                let creepTypeName: string = settings.CREEP_TYPE_NAMES[this.game.worldMap.waveCreeps[this._currentWave - 1].getCreepType()];
                creepTypeName = creepTypeName.charAt(0).toUpperCase() + creepTypeName.toLowerCase().slice(1);
                MultiboardSetItemValueBJ(
                    this.game.scoreBoard.board,
                    2, 6,
                    Util.ColourString(
                        CREEP_TYPE_COLOURS[this.game.worldMap.waveCreeps[this._currentWave - 1].getCreepType()],
                        `(${creepTypeName})`));
            } else {
                MultiboardSetItemValueBJ(
                    this.game.scoreBoard.board,
                    2, 6,
                    '');
            }
        }
    }


    private RoundEnd(): void {

        if (this._currentWave === this.game.worldMap.waveCreeps.length) {
            this.BonusRoundsOver();
        } else {
            this._currentWave++;
            this.roundOverGoldReward += 2;


            // Update scoreboard
            if (this.game.scoreBoard) {
                MultiboardSetItemValueBJ(this.game.scoreBoard.board, 2, 2, `${this._currentWave}`);
            }

            // Display lives lost
            this.DisplayLivesLost();


            this.GiveWaveGoldReward();

            // Start new timers
            this._isWaveInProgress = false;
            this.shouldStartWaveTimer = true;

            this.game.worldMap.HealEverythingOnMap();

            if (this._currentWave === 35 && this.game.worldMap.archimondeDummy) {
                PauseUnitBJ(false, this.game.worldMap.archimondeDummy);
                IssueTargetDestructableOrder(this.game.worldMap.archimondeDummy, 'attack', this.archimondeGate.gate);
            }
            if (this._currentWave === 36) { // as 35 is the last normal wave :P
                this.game.GameWin();
            }
        }

        for (const tower of this._endOfTurnTowerArray) {
            tower.EndOfRoundAction();
        }

        for (const maze of this.game.worldMap.playerMazes) {
            maze.CleanAll();
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

    private SpawnCreeps(): void {
        const wave: WaveCreep = this.game.worldMap.waveCreeps[this._currentWave - 1];
        SendMessage(`Level ${this._currentWave} - ${wave.name}`);

        let spawnAmount: number = 10;
        switch (wave.getCreepType()) {
            case CREEP_TYPE.CHAMPION:
                spawnAmount = 4;
                break;
            case CREEP_TYPE.BOSS:
                spawnAmount = 1;
                break;

        }
        if (wave.wave > 35) {
            spawnAmount = 1;
        }
        if (this._currentWave === 35) {
            SetTimeOfDay(0.00);
            SetWaterBaseColorBJ(100, 33.00, 33.00, 0);
        }
        this.startSpawning(spawnAmount, wave);
    }

    private startSpawning(amount: number, wave: WaveCreep): void {
        let creepOwner: number = 0;
        if (!this.game.worldMap.spawnedCreeps) {
            return;
        }

        const spawned: Map<number, Creep> = this.game.worldMap.spawnedCreeps.unitMap;
        const abilities: CreepAbility[] = this.game.creepAbilityHandler.GetAbilitiesForWave(wave);
        for (let y: number = 0; y < amount; y += 1) {
            for (let i: number = 0; i < this.game.worldMap.playerSpawns.length; i += 1) {
                const spawn: PlayerSpawns = this.game.worldMap.playerSpawns[i];
                spawn.SpawnCreep(this, spawned, abilities, wave, creepOwner);
            }
            creepOwner += 1;
            TriggerSleepAction(0.50);
        }
    }


    private GiveWaveGoldReward(): void {
        for (const player of this.game.players.values()) {
            if (this._currentWave === 15) {
                player.giveLumber(1);
            }
            if (player.id === COLOUR.GRAY) {
                player.giveGold(2 * this.roundOverGoldReward);
                player.sendMessage(
                    `|c0000cdf9You recieved|r ${2 * this.roundOverGoldReward} |c0000cdf9` +
                    `extra gold for completing level as the last defender|r ${(this._currentWave - 1)}`);
            } else {
                player.giveGold(this.roundOverGoldReward);
                player.sendMessage(
                    `|c0000cdf9You recieved|r ${this.roundOverGoldReward} |c0000cdf9` +
                    `extra gold for completing level|r ${(this._currentWave - 1)}`);

            }
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


    private BonusRoundsOver(): void {
        SendMessage('|cFFF48C42That\'s all the bonus levels, see you next time!|r');
        this._isWaveInProgress = false;
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
            SendMessage(NO_LIVES_LOST);
        } else {
            const livesRemaining: number = this.game.startLives - this.game.gameLives;
            SendMessage(
                `${livesRemaining}${Util.ColourString(settings.COLOUR_CODES[COLOUR.RED], '% of your lives have been lost')}`,
            );
        }
    }

    // FOR TESTING ONLY
    set isWaveInProgress(value: boolean) {
        this._isWaveInProgress = value;
    }


}
