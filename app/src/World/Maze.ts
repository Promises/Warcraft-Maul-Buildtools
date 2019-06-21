import {Node} from "./Node";
import {NodeQueue} from "./NodeQueue";

export class Maze {
    public readonly minX: number;
    public readonly minY: number;
    public readonly maxX: number;
    public readonly maxY: number;
    public readonly width: number;
    public readonly height: number;
    public static readonly ROW_NUM: number[] = [-1, 0, 0, 1];
    public static readonly COL_NUM: number[] = [0, -1, 1, 0];
    private readonly maze: boolean[];

    constructor(minX: number, minY: number, maxX: number, maxY: number, width: number, height: number, maze: boolean[]) {
        this.minX = minX;
        this.minY = minY;
        this.maxX = maxX;
        this.maxY = maxY;
        this.width = width;
        this.height = height;
        this.maze = maze;
    }

    public setBlocked(nodeIndex: number, isBlocked: boolean) {
        if (nodeIndex > this.maze.length) {
            return;
        }

        this.maze[nodeIndex] = isBlocked;
    }

    public breathFirstSearch(sourceX: number, sourceY: number, destinationX: number, destinationY: number): boolean {
        if(this.maze[sourceX + sourceY * this.width] === false || this.maze[destinationX + destinationY * this.width] === false) {
            return false;
        }

        const visited: boolean[] = [];
        for (let i = 0; i < this.width; i++) {
            for (let j = 0; j < this.height; j++) {
                visited[i + j * this.width] = false;
            }
        }

        visited[sourceX + sourceY * this.width] = true;

        const q: NodeQueue = new NodeQueue();
        const s: Node = new Node(sourceX, sourceY, 0);
        q.push(s);

        while(!q.empty()) {
            const curr: Node = q.front();

            if (curr.x === destinationX && curr.y === destinationY) {
                return true;
            }

            q.pop();

            for (let i = 0; i < 4; i++) {
                const row: number = curr.x + Maze.ROW_NUM[i];
                const col: number = curr.y + Maze.COL_NUM[i];

                if (this.isValid(row, col) && this.maze[row + col * this.width] === true && visited[row + col * this.width] === false) {
                    visited[row + col * this.width] = true;
                    q.push(new Node(row, col, curr.distance + 1));
                }
            }
        }

        return false;
    }

    private isValid(row: number, col: number): boolean {
        return (row >= 0 && row < this.width && col >= 0 && col < this.height);
    }
}