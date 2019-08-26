import { Tower } from '../Specs/Tower';
import { EndOfRoundTower } from '../Specs/EndOfRoundTower';
import { Maze, Walkable } from '../../../Antiblock/Maze';
import * as settings from '../../../GlobalSettings';
import { Log } from '../../../../lib/Serilog/Serilog';
import { Defender } from '../../Players/Defender';
import { WarcraftMaul } from '../../../WarcraftMaul';

export class AntiJuggleTower extends Tower implements EndOfRoundTower {

    private readonly x: number;
    private readonly y: number;

    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {
        super(tower, owner, game);

        this.x = GetUnitX(this.tower);
        this.y = GetUnitY(this.tower);
        let playerSpawnId: undefined | number;
        for (let i: number = 0; i < settings.PLAYER_AREAS.length; i++) {
            if (settings.PLAYER_AREAS[i].ContainsUnit(this.tower)) {
                playerSpawnId = i;
                break;
            }
        }

        if (playerSpawnId === undefined) {
            Log.Error('Unable to locate the correct player spawn');
            return;
        }
        const maze: Maze = this.game.worldMap.playerMazes[playerSpawnId];
        const leftSide: number = ((this.x - 64) - maze.minX) / 64;
        const rightSide: number = (this.x - maze.minX) / 64;
        const topSide: number = (this.y - maze.minY) / 64;
        const bottomSide: number = ((this.y - 64) - maze.minY) / 64;
        maze.setWalkable(leftSide, bottomSide, Walkable.Protected);
        maze.setWalkable(rightSide, bottomSide, Walkable.Protected);
        maze.setWalkable(leftSide, topSide, Walkable.Protected);
        maze.setWalkable(rightSide, topSide, Walkable.Protected);

    }

    public EndOfRoundAction(): void {
        this.Sell();
        SendMessage('end of round');

        let playerSpawnId: undefined | number;
        for (let i: number = 0; i < settings.PLAYER_AREAS.length; i++) {
            if (settings.PLAYER_AREAS[i].ContainsUnit(this.tower)) {
                playerSpawnId = i;
                break;
            }
        }

        if (playerSpawnId === undefined) {
            Log.Error('Unable to locate the correct player spawn');
            return;
        }

        const x: number = GetUnitX(this.tower);
        const y: number = GetUnitY(this.tower);
        const maze: Maze = this.game.worldMap.playerMazes[playerSpawnId];
        const leftSide: number = ((x - 64) - maze.minX) / 64;
        const rightSide: number = (x - maze.minX) / 64;
        const topSide: number = (y - maze.minY) / 64;
        const bottomSide: number = ((y - 64) - maze.minY) / 64;
        maze.Cleanup(leftSide, bottomSide);
        maze.Cleanup(rightSide, bottomSide);
        maze.Cleanup(leftSide, topSide);
        maze.Cleanup(rightSide, topSide);


        SendMessage('removing anti-juggle');
        RemoveUnit(this.tower);
    }
}
