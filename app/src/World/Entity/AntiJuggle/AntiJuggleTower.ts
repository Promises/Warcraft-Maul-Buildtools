import { Maze, Walkable } from '../../Antiblock/Maze';
import * as settings from '../../GlobalSettings';
import { Log } from '../../../lib/Serilog/Serilog';
import { WarcraftMaul } from '../../WarcraftMaul';
import { Destructable } from '../../../lib/common/destructable';
import { Tower } from '../Tower/Specs/Tower';

export class AntiJuggleTower {

    private readonly x: number;
    private readonly y: number;
    private readonly leftSide: number = 0;
    private readonly rightSide: number = 0;
    private readonly topSide: number = 0;
    private readonly bottomSide: number = 0;
    private readonly game: WarcraftMaul;
    private readonly destructable: Destructable;

    constructor(game: WarcraftMaul, tower: Tower) {
        this.game = game;
        // super(tower, owner, game);
        this.x = GetUnitX(tower.tower);
        this.y = GetUnitY(tower.tower);
        RemoveUnit(tower.tower);
        this.destructable = Destructable.Create(FourCC('YTpc'), this.x, this.y, bj_UNIT_FACING, 1, 1);

        let playerSpawnId: undefined | number;
        for (let i: number = 0; i < settings.PLAYER_AREAS.length; i++) {
            if (settings.PLAYER_AREAS[i].ContainsDestructable(this.destructable)) {
                playerSpawnId = i;
                break;
            }
        }

        if (playerSpawnId === undefined) {
            Log.Error('Unable to locate the correct player spawn');
            return;
        }
        const maze: Maze = this.game.worldMap.playerMazes[playerSpawnId];
        maze.AddAntiJuggler(this);
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
        this.destructable.Destroy();
    }
}
