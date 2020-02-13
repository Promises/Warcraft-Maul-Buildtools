import { Node } from './Node';

export class LinkedList<T> {
    private head: Node<T> | undefined;
    private size: number;

    constructor(values?: T[]) {
        this.head = undefined;
        this.size = 0;

        if (values) {
            values.forEach(v => this.add(v));
        }
    }

    public isEmpty(): boolean {
        return this.head === undefined;
    }

    public add(value: T): void {
        if (this.isEmpty()) {
            this.head = { value };
            this.size = 1;
        } else {
            this.head = { value, next: this.head as Node<T> };
            this.size++;
        }
    }

    public pop(): Node<T> | undefined {
        if (this.isEmpty()) {
            this.size = 0;
            return undefined;
        }

        const temp: Node<T> = this.head as Node<T>;
        this.head = (this.head as Node<T>).next;
        temp.next = undefined;

        this.size--;
        return temp;
    }

    public getSize(): number {
        return this.size;
    }
}
