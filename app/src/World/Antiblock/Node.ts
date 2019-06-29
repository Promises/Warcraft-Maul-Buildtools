export class Node {
    public readonly x: number;
    public readonly y: number;
    public readonly distance: number;

    constructor(x: number, y: number, distance: number) {
        this.x = x;
        this.y = y;
        this.distance = distance;
    }
}
