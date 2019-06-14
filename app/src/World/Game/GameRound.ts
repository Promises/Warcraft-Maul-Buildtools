import { enemies, players } from '../GlobalSettings';
import { WarcraftMaul } from '../WarcraftMaul';
import { WaveCreep } from '../Entity/WaveCreep';
import { Creep } from '../Entity/Creep';
import { CheckPoint } from '../Entity/CheckPoint';

export class GameRound {
    gameTimeTrigger: trigger;
    roundEndTrigger: trigger;
    game: WarcraftMaul;
    shouldStartWaveTimer: boolean = false;
    isWaveInProgress: boolean = false;


    currentWave: number = 1;

    waitBetweenWaveTime: number = 20;

    constructor(game: WarcraftMaul) {
        this.game = game;
        this.gameTimeTrigger = CreateTrigger();
        TriggerRegisterTimerEventPeriodic(this.gameTimeTrigger, 1.00);
        TriggerAddAction(this.gameTimeTrigger, () => this.UpdateGameTime());

        this.roundEndTrigger = CreateTrigger();
        for (let enemy of enemies) {
            TriggerRegisterPlayerStateEvent(this.roundEndTrigger, enemy.wcPlayer, PLAYER_STATE_RESOURCE_FOOD_USED, EQUAL, 0.00);
        }
        TriggerAddCondition(this.roundEndTrigger, Condition(() => this.CreepFoodConditions()));
        TriggerAddAction(this.roundEndTrigger, () => this.RoundEnd());
    }

    UpdateGameTime() {
        if (this.game.gameEnded) {
            this.game.gameEndTimer--;
            //TODO: Multiboard stuff
            //     call MultiboardSetItemValueBJ( udg_Scoreboard, 1, 1, "End Time" )
            //     call MultiboardSetItemValueBJ( udg_Scoreboard, 2, 1, PrettifyGameTime(udg_GameEndTimer) )
            if (this.game.gameEndTimer <= 0) {
                this.game.DefeatAllPlayers();
            }
        } else {
            this.game.gameTime++;

            if (this.shouldStartWaveTimer) {
                this.shouldStartWaveTimer = false;
                this.game.waveTimer = this.waitBetweenWaveTime + 1;
                //TODO: Multiboard stuff

                // this.UpdateScoreBoardForWave();
            }

            if (this.isWaveInProgress) {
                //TODO: Multiboard stuff

                //         call MultiboardSetItemValueBJ( udg_Scoreboard, 2, 1, PrettifyGameTime(udg_GameTime) )

            } else {
                this.game.waveTimer = this.game.waveTimer - 1;
                print(this.game.waveTimer);
                //TODO: Multiboard stuff
                //         call MultiboardSetItemValueBJ( udg_Scoreboard, 2, 1, "|cFF999999" + I2S(udg_WaveTimer) + "|r")
            }

            if (this.game.waveTimer == 0 && !this.isWaveInProgress) {
                this.isWaveInProgress = true;
                //TODO: Multiboard stuff

                //         call MultiboardSetItemValueBJ( udg_Scoreboard, 1, 1, "Game Time" )
                this.SpawnCreeps();

            }


        }


        //     if(GetBooleanAnd(udg_WaveTimer == 0, not(udg_IsWaveInProgress)))then
        //         set udg_IsWaveInProgress = true
        //         call MultiboardSetItemValueBJ( udg_Scoreboard, 1, 1, "Game Time" )
        //         call SpawnCreeps()
        //     endif
        // endif
    }

    RoundEnd() {

    }

    CreepFoodConditions(): boolean {
        for (let enemy of enemies) {
            if (!(GetPlayerState(enemy.wcPlayer, PLAYER_STATE_RESOURCE_FOOD_USED) == 0)) {
                return false;
            }
        }
        return true;
    }

    private SpawnCreeps() {
        let wave = this.game.worldMap.waveCreeps[this.currentWave];
        for (let player of players.values()) {
            player.sendMessage(`Level ${this.currentWave} - ${wave.name}`);
        }
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
        if(!this.game.worldMap.spawnedCreeps){
            return;
        }
        let spawned = this.game.worldMap.spawnedCreeps.unitMap
        for (let y = 0; y < amount; y++) {
            for (let i = 0; i < this.game.worldMap.playerSpawns.length; i++) {
                const spawn = this.game.worldMap.playerSpawns[i];
                if (!spawn.isOpen) {
                    return;
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
            TriggerSleepAction( 0.50 );

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
                print(`getSpawnFace, could not find player: ${id}`);
                return 0;

        }
    }
}
