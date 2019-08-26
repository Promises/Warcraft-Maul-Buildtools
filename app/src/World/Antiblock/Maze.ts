import { Node } from './Node';
import { NodeQueue } from './NodeQueue';
import { Log } from '../../lib/Serilog/Serilog';

export enum Walkable {
    Blocked,
    Walkable,
    Protected,
}

export class Maze {

    constructor(minX: number, minY: number, maxX: number, maxY: number, width: number, height: number, maze: Walkable[][]) {
        this.minX = minX;
        this.minY = minY;
        this.maxX = maxX;
        this.maxY = maxY;
        this.width = width;
        this.height = height;
        this.maze = maze;
    }

    public static readonly ROW_NUM: number[] = [-1, 0, 0, 1];
    public static readonly COL_NUM: number[] = [0, -1, 1, 0];
    public readonly minX: number;
    public readonly minY: number;
    public readonly maxX: number;
    public readonly maxY: number;
    public readonly width: number;
    public readonly height: number;
    public readonly maze: Walkable[][];

    public setWalkable(x: number, y: number, isWalkable: Walkable): void {
        this.maze[x][y] = isWalkable;


        const cornerX: number = (x * 64) + this.minX;
        const cornerY: number = y * 64 + this.minY;

        SetTerrainPathable(cornerX, cornerY, PATHING_TYPE_WALKABILITY, isWalkable === Walkable.Walkable);
        SetTerrainPathable(cornerX, cornerY + 48, PATHING_TYPE_WALKABILITY, isWalkable === Walkable.Walkable);
        SetTerrainPathable(cornerX + 48, cornerY, PATHING_TYPE_WALKABILITY, isWalkable === Walkable.Walkable);
        SetTerrainPathable(cornerX + 48, cornerY + 48, PATHING_TYPE_WALKABILITY, isWalkable === Walkable.Walkable);


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
                    // AddSpecialEffect('Doodads\\\\Cinematic\\\\DemonFootPrint\\\\DemonFootPrint0.mdl', this.minX + 64 * row, this.minY + 64 * col);
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
        for (let x: number = 0; x < this.width; x++) {
            for (let y: number = 0; y < this.height; y++) {
                this.Cleanup(x, y);
            }
        }
    }

}
