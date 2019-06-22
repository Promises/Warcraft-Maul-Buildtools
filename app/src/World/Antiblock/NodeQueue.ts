import { Node } from './Node';

export class NodeQueue {
    private _nodes: Node[] = [];
    private _i: number = 0;

    public push(node: Node): void {
        this._nodes.push(node);
    }

    public empty(): boolean {
        return this._i >= this._nodes.length;
    }

    public front(): Node {
        return this._nodes[this._i];
    }

    public pop(): void {
        this._nodes.shift();
    }
}
