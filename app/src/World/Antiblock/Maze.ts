import { Node } from './Node';
import { NodeQueue } from './NodeQueue';

export class Maze {

    constructor(minX: number, minY: number, maxX: number, maxY: number, width: number, height: number, maze: boolean[]) {
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
    private readonly maze: boolean[];

    public setWalkable(nodeIndex: number, isWalkable: boolean): void {
        if (nodeIndex > this.maze.length) {
            return;
        }

        this.maze[nodeIndex] = isWalkable;
    }

    public breathFirstSearch(sourceX: number, sourceY: number, destinationX: number, destinationY: number): number {
        if (this.maze[sourceX + sourceY * this.width] === false || this.maze[destinationX + destinationY * this.width] === false) {
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

                if (this.isValid(row, col) && this.maze[row + col * this.width] === true && visited[row + col * this.width] === false) {
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
}
