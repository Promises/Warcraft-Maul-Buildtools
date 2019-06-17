import * as settings from '../GlobalSettings';
import { WarcraftMaul } from '../WarcraftMaul';
import { WaveCreep } from '../Entity/WaveCreep';
import { Creep } from '../Entity/Creep';
import { CheckPoint } from '../Entity/CheckPoint';
import { COLOUR_CODES, enemies } from '../GlobalSettings';
import { Trigger } from '../../JassOverrides/Trigger';
import { Log } from '../../lib/Serilog/Serilog';

export class GameRound {
    gameTimeTrigger: Trigger;
    roundEndTrigger: Trigger;
    game: WarcraftMaul;
    shouldStartWaveTimer: boolean = false;
    isWaveInProgress: boolean = false;


    currentWave: number = 1;
    roundOverGoldReward: number = 20;

    testStucture: destructable;

    waitBetweenWaveTime: number = 20;

    constructor(game: WarcraftMaul) {
        this.game = game;
        this.gameTimeTrigger = new Trigger();
        this.gameTimeTrigger.RegisterTimerEventPeriodic(1.00);
        this.gameTimeTrigger.AddAction(() => this.UpdateGameTime());

        this.testStucture = this.FindThingForBossToDestroy() ||
            CreateDestructable(FourCC('B000'), 3520.0, -5312.0, 0.000, 0.900, 0);


        this.roundEndTrigger = new Trigger();

        for (let enemy of enemies) {
            this.roundEndTrigger.RegisterPlayerStateEvent(enemy.wcPlayer, PLAYER_STATE_RESOURCE_FOOD_USED, EQUAL, 0.00);
        }

        this.roundEndTrigger.AddCondition(() => this.CreepFoodConditions());
        this.roundEndTrigger.AddAction(() => this.RoundEnd());
    }

    UpdateGameTime() {
        if (this.game.gameEnded) {
            this.game.gameEndTimer--;
            if (this.game.scoreBoard) {
                MultiboardSetItemValueBJ(this.game.scoreBoard.board, 1, 1, 'End Time');
                MultiboardSetItemValueBJ(this.game.scoreBoard.board, 2, 1, this.game.PrettifyGameTime(this.game.gameEndTimer));
            }
            if (this.game.gameEndTimer <= 0) {
                this.game.DefeatAllPlayers();
            }
        } else {
            this.game.gameTime++;

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
                    MultiboardSetItemValueBJ(this.game.scoreBoard.board, 2, 1, '|cFF999999' + this.game.waveTimer + '|r');
                }
            }

            if (this.game.waveTimer == 0 && !this.isWaveInProgress) {
                this.isWaveInProgress = true;
                if (this.game.scoreBoard) {
                    MultiboardSetItemValueBJ(this.game.scoreBoard.board, 1, 1, 'Game Time');
                }
                this.SpawnCreeps();


            }


        }

    }

    UpdateScoreboardForWave() {
        if (this.game.scoreBoard) {
            MultiboardSetItemValueBJ(this.game.scoreBoard.board, 1, 1, 'Starting in');
            MultiboardSetItemValueBJ(this.game.scoreBoard.board, 2, 5, settings.ARMOUR_TYPE_NAMES[this.game.worldMap.waveCreeps[this.currentWave].getArmourType()]);
            MultiboardSetItemValueBJ(this.game.scoreBoard.board, 2, 5, settings.CREEP_TYPE_NAMES[this.game.worldMap.waveCreeps[this.currentWave].getCreepType()]);
        }
    }


    RoundEnd() {


        // Disable buffs
        // call DisableTrigger(gg_trg_WalkItOff)
        // call DisableTrigger(gg_trg_DivineShield)
        // call DisableTrigger(gg_trg_CrippleAura)
        // call DisableTrigger(gg_trg_VampiricAura)

        if (this.currentWave == this.game.worldMap.waveCreeps.length - 1) {
            this.BonusRoundsOver();
        } else {
            // call SetCreepAbilities()
            this.currentWave++;
            this.roundOverGoldReward += 2;


            // Update scoreboard
            if (this.game.scoreBoard) {
                MultiboardSetItemValueBJ(this.game.scoreBoard.board, 2, 2, this.currentWave + '');
            }

            // Display lives lost

            if (this.game.gameLives == this.game.startLives) {
                print(
                    '|cFFF44242Co|r|cFFF47442ng|r|cFFF4A742ra|r|cFFEBF442tu|r|cFFC5F442la|r|cFF8FF442ti|r|cFF62F442on|r|cFF42F477s n|r|cFF42F4E5o l|r|cFF42A7F4iv|r|cFF425FF4es|r|cFF7A42F4 lo|r|cFFC542F4st!|r'
                );
            } else {
                print(
                    `${this.game.gameLives} ${Util.ColourString(COLOUR_CODES[COLOUR.RED], 'Chances have been lost')}`
                );
            }
            this.GiveWaveGoldReward();

            // Start new timers
            this.isWaveInProgress = false;
            this.shouldStartWaveTimer = true;

            this.game.worldMap.HealEverythingOnMap();


            if (this.currentWave == 35 && this.game.worldMap.archimondeDummy) {
                PauseUnitBJ(false, this.game.worldMap.archimondeDummy);
                IssueTargetDestructableOrder(this.game.worldMap.archimondeDummy, 'attack', this.testStucture);


            }
            if (this.currentWave == this.game.worldMap.waveCreeps.length - 1) {
                this.game.GameWin();
            }


        }

        /*


    private function RoundEnd takes nothing returns nothing



            // Reward players for finishing the wave
            call GiveWaveGoldReward()

            // Start new timers
            set udg_IsWaveInProgress = false
            set udg_StartWaveTimer = true

            // Heal every unit on the map (mostly for towers)
            call HealEverythingOnMap()

            if(udg_CreepLevel == 35) then
                call PauseUnitBJ( false, udg_ArchimondeDummy )
                call IssueTargetDestructableOrder(udg_ArchimondeDummy, "attack", gg_dest_B000_0160)
            endif

            if(udg_CreepLevel == 36) then
                call GameWin()
            endif
        endif

        call ForGroupBJ(udg_TowerEndOfTurnGroup, function EndOfTurnTower)
         */
    }

    CreepFoodConditions(): boolean {
        for (let enemy of settings.enemies) {
            if (!(GetPlayerState(enemy.wcPlayer, PLAYER_STATE_RESOURCE_FOOD_USED) == 0)) {
                Log.Debug(`${enemy.id} still has food`);
                return false;
            }
        }
        Log.Debug(`nobody has food`);

        return true;
    }

    private SpawnCreeps() {
        let wave = this.game.worldMap.waveCreeps[this.currentWave - 1];
        print(`Level ${this.currentWave} - ${wave.name}`);

        let spawnAmount: number = 10;
        switch (wave.getCreepType()) {
            case CREEP_TYPE.CHAMPION:
                spawnAmount = 4;
                break;
            case CREEP_TYPE.BOSS:
                spawnAmount = 1;
                break;

        }
        if (this.currentWave == 35) {
            SetTimeOfDay(0.00);
            SetWaterBaseColorBJ(100, 33.00, 33.00, 0);
        }
        this.startSpawning(spawnAmount, wave);
    }

    private startSpawning(amount: number, wave: WaveCreep) {
        let creepOwner = 0;
        if (!this.game.worldMap.spawnedCreeps) {
            return;
        }
        let spawned = this.game.worldMap.spawnedCreeps.unitMap;
        for (let y = 0; y < amount; y++) {
            for (let i = 0; i < this.game.worldMap.playerSpawns.length; i++) {
                const spawn = this.game.worldMap.playerSpawns[i];
                if (!spawn.isOpen) {
                    continue;
                }
                if (spawn.spawnOne) {

                    let creep = CreateUnit(
                        Player(13 + creepOwner % 4),
                        FourCC(wave.id),
                        GetRectCenterX(spawn.spawnOne.rectangle),
                        GetRectCenterY(spawn.spawnOne.rectangle),
                        this.getSpawnFace(i));
                    spawned.set(GetHandleId(creep), new Creep(creep));

                    if (spawn.spawnTwo) {

                        creep = CreateUnit(
                            Player(13 + creepOwner % 4),
                            FourCC(wave.id),
                            GetRectCenterX(spawn.spawnTwo.rectangle),
                            GetRectCenterY(spawn.spawnTwo.rectangle),
                            this.getSpawnFace(i));
                        spawned.set(GetHandleId(creep), new Creep(creep));
                    }
                }
            }
            creepOwner++;
            TriggerSleepAction(0.50);

        }


    }

    getSpawnFace(id: COLOUR) {
        switch (id) {
            case COLOUR.RED:
            case COLOUR.PINK:
                return 180;
            case COLOUR.BLUE:
            case COLOUR.PURPLE:
            case COLOUR.YELLOW:
            case COLOUR.ORANGE:
            case COLOUR.GRAY:
            case COLOUR.BROWN:
            case COLOUR.MAROON:
                return 270;
            case COLOUR.TEAL:
            case COLOUR.GREEN:
                return 0;
            case COLOUR.LIGHT_BLUE:
            case COLOUR.DARK_GREEN:
                return 90;
            default:
                Log.Error(`getSpawnFace, could not find player: ${id}`);
                return 0;

        }
    }

    private FindThingForBossToDestroy(): destructable | undefined {
        let thingForBossToDestory;

        EnumDestructablesInRectAll(GetPlayableMapRect(), () => {
            if (GetDestructableTypeId(GetEnumDestructable()) == FourCC('B000')) {
                thingForBossToDestory = GetEnumDestructable();
            }
        });
        return thingForBossToDestory;

    }

    private GiveWaveGoldReward() {
        for (let player of settings.players.values()) {
            if (this.currentWave == 15) {
                player.giveLumber(1);
            }
            if (player.id == COLOUR.GRAY) {
                player.giveGold(2 * this.roundOverGoldReward);
                player.sendMessage(`|c0000cdf9You recieved|r ${2 * this.roundOverGoldReward}|c0000cdf9 extra gold for completing level as the last defender|r ${(this.currentWave - 1)}`);
            } else {
                player.giveGold(this.roundOverGoldReward);
                player.sendMessage(`|c0000cdf9You recieved|r ${this.roundOverGoldReward} |c0000cdf9extra gold for completing level|r ${(this.currentWave - 1)}`);

            }
        }
    }


    BonusRoundEffects() {
        let t = CreateTimer();
        TimerStart(t, 0.03, true, () => this.SpamBonusEffects());
    }


    SpamBonusEffects() {
        let x = GetRandomInt(0, 10000) - 5000;
        let y = GetRandomInt(0, 10000) - 5000;
        let loc = Location(x, y);
        DestroyEffect(AddSpecialEffectLocBJ(loc, 'Abilities\\Spells\\Human\\Flare\\FlareCaster.mdl'));
        RemoveLocation(loc);
    }


    BonusRoundsOver() {
        print('|cFFF48C42That\'s all the bonus levels, see you next time!|r');
        this.isWaveInProgress = false;
        this.game.gameEndTimer = settings.GAME_END_TIME;
        this.game.gameEnded = true;
        let ship = this.game.worldMap.ship;
        if (ship) {
            ship.MoveShip();
        }
        this.BonusRoundEffects();

    }


}
