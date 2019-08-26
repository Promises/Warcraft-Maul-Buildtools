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
    private readonly leftSide: number = 0;
    private readonly rightSide: number = 0;
    private readonly topSide: number = 0;
    private readonly bottomSide: number = 0;

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
        this.leftSide = ((this.x - 64) - maze.minX) / 64;
        this.rightSide = (this.x - maze.minX) / 64;
        this.topSide = (this.y - maze.minY) / 64;
        this.bottomSide = ((this.y - 64) - maze.minY) / 64;





        maze.setWalkable(this.leftSide, this.bottomSide, Walkable.Protected);
        maze.setWalkable(this.rightSide, this.bottomSide, Walkable.Protected);
        maze.setWalkable(this.leftSide, this.topSide, Walkable.Protected);
        maze.setWalkable(this.rightSide, this.topSide, Walkable.Protected);

    }

    public EndOfRoundAction(): void {
        this.Sell();
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
        maze.Cleanup(this.leftSide, this.bottomSide);
        maze.Cleanup(this.rightSide, this.bottomSide);
        maze.Cleanup(this.leftSide, this.topSide);
        maze.Cleanup(this.rightSide, this.topSide);

        RemoveUnit(this.tower);
    }
}
