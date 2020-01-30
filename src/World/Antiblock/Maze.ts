import { Node } from './Node';
import { NodeQueue } from './NodeQueue';
import { Log } from '../../lib/Serilog/Serilog';
import { AntiJuggleTower } from '../Entity/AntiJuggle/AntiJuggleTower';

export enum Walkable {
    Walkable,
    Blocked,
    Protected,
}

export class Maze {


    public static readonly ROW_NUM: number[] = [-1, 0, 0, 1];
    public static readonly COL_NUM: number[] = [0, -1, 1, 0];
    public readonly minX: number;
    public readonly minY: number;
    public readonly maxX: number;
    public readonly maxY: number;
    public readonly width: number;
    public readonly height: number;
    public readonly maze: Walkable[][];
    private antiJugglers: AntiJuggleTower[] = [];


    constructor(minX: number, minY: number, maxX: number, maxY: number, width: number, height: number, maze: Walkable[][]) {
        this.minX = minX;
        this.minY = minY;
        this.maxX = maxX;
        this.maxY = maxY;
        this.width = width;
        this.height = height;
        this.maze = maze;
    }

    public setWalkable(x: number, y: number, isWalkable: Walkable): void {
        this.maze[x][y] = isWalkable;
    }

    public getWalkable(x: number, y: number): Walkable {
        return this.maze[x][y];
    }

    public breathFirstSearch(sourceX: number, sourceY: number, destinationX: number, destinationY: number): number {
        if (this.maze[sourceX][sourceY] !== Walkable.Walkable || this.maze[destinationX][destinationY] !== Walkable.Walkable) {
            return -1;
        }

        const visited: boolean[] = [];
        for (let i: number = 0; i < this.width; i++) {
            for (let j: number = 0; j < this.height; j++) {
                visited[i + j * this.width] = false;
            }
        }

        visited[sourceX + sourceY * this.width] = true;

        const q: NodeQueue = new NodeQueue();
        const s: Node = new Node(sourceX, sourceY, 0);
        q.push(s);

        while (!q.empty()) {
            const curr: Node = q.front();

            if (curr.x === destinationX && curr.y === destinationY) {
                return curr.distance;
            }

            q.pop();

            for (let i: number = 0; i < 4; i++) {
                const row: number = curr.x + Maze.ROW_NUM[i];
                const col: number = curr.y + Maze.COL_NUM[i];

                if (this.isValid(row, col) && this.maze[row][col] === Walkable.Walkable && visited[row + col * this.width] === false) {
                    visited[row + col * this.width] = true;
                    q.push(new Node(row, col, curr.distance + 1));
                }
            }
        }

        return -1;
    }

    private isValid(row: number, col: number): boolean {
        return (row >= 0 && row < this.width && col >= 0 && col < this.height);
    }

    public Cleanup(x: number, y: number): void {

        if (this.maze[x][y] === Walkable.Protected) {
            this.setWalkable(x, y, Walkable.Walkable);
        }
    }

    public CleanAll(): void {
        for (const antijuggle of this.antiJugglers) {
            antijuggle.EndOfRoundAction();
        }
        this.antiJugglers = [];
        for (let x: number = 0; x < this.width; x++) {
            for (let y: number = 0; y < this.height; y++) {
                this.Cleanup(x, y);
            }
        }
    }

    public SanityCheck(): void {
        for (let x: number = 0; x < this.width; x++) {
            for (let y: number = 0; y < this.height; y++) {
                const cornerX: number = (x * 64) + this.minX;
                const cornerY: number = y * 64 + this.minY;
                if (IsTerrainPathable(cornerX, cornerY, PATHING_TYPE_WALKABILITY) === (this.maze[x][y] === Walkable.Walkable) ||
                    IsTerrainPathable(cornerX, cornerY + 32, PATHING_TYPE_WALKABILITY) === (this.maze[x][y] === Walkable.Walkable) ||
                    IsTerrainPathable(cornerX + 32, cornerY, PATHING_TYPE_WALKABILITY) === (this.maze[x][y] === Walkable.Walkable) ||
                    IsTerrainPathable(cornerX + 32, cornerY + 32, PATHING_TYPE_WALKABILITY) === (this.maze[x][y] === Walkable.Walkable)) {
                    Log.Error(`${x}, ${y} is a missmatch, ${Walkable[this.maze[x][y]]}`);
                }
            }
        }
    }

    public CheckAll(): void {

        for (let x: number = 0; x < this.width; x++) {
            for (let y: number = 0; y < this.height; y++) {
                const cornerX: number = (x * 64) + this.minX;
                const cornerY: number = y * 64 + this.minY;
                if (IsTerrainPathable(cornerX, cornerY, PATHING_TYPE_WALKABILITY) ||
                    IsTerrainPathable(cornerX, cornerY + 32, PATHING_TYPE_WALKABILITY) ||
                    IsTerrainPathable(cornerX + 32, cornerY, PATHING_TYPE_WALKABILITY) ||
                    IsTerrainPathable(cornerX + 32, cornerY + 32, PATHING_TYPE_WALKABILITY)) {
                    Log.Debug(`${x}, ${y} is a unwalkable`);
                }
            }
        }
    }

    public AddAntiJuggler(antijuggle: AntiJuggleTower): void {
        this.antiJugglers.push(antijuggle);
    }

    public GetAntiJugglers(): AntiJuggleTower[] {
        return this.antiJugglers;
    }
}
