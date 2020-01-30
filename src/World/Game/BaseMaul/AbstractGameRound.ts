import { WarcraftMaul } from '../../WarcraftMaul';
import { WaveCreep } from '../../Entity/WaveCreep';
import { Creep } from '../../Entity/Creep';
import { PlayerSpawns } from '../../Entity/PlayerSpawns';
import { CreepAbility } from '../../Entity/CreepAbilities/specs/CreepAbility';

export abstract class AbstractGameRound {


    public readonly game: WarcraftMaul;
    private _isWaveInProgress: boolean = false;
    private _currentWave: number = 1;
    public antiJuggleEnabled: boolean = true;

    constructor(game: WarcraftMaul) {
        this.game = game;
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

    set isWaveInProgress(value: boolean) {
        this._isWaveInProgress = value;
    }



    public SpawnCreeps(): void {
        const wave: WaveCreep = this.game.worldMap.waveCreeps[this._currentWave - 1];
        SendMessage(`Level ${this._currentWave} - ${wave.GetName()}`);

        let spawnAmount: number = 10;
        switch (wave.getCreepType()) {
            case CREEP_TYPE.CHAMPION:
                spawnAmount = 4;
                break;
            case CREEP_TYPE.BOSS:
                spawnAmount = 1;
                break;

        }
        if (wave.GetWaveNumber() > 35) {
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
        this.FinishedSpawning();
    }




    public abstract GameTimeUpdateEvent(): void;

    public abstract FinishedSpawning(): void;

}
