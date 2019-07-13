import { Creep } from '../World/Entity/Creep';

export class Rectangle {
    private readonly area: number[];

    constructor(area: number[]) {
        this.area = area;
    }

    public ContainsCreep(whichCreep: Creep): boolean {
        return this.ContainsUnit(whichCreep.creep);
    }

    public ContainsUnit(whichUnit: unit): boolean {
        if (GetUnitX(whichUnit) < this.area[0]) {
            return false;
        }

        if (GetUnitX(whichUnit) > this.area[2]) {
            return false;
        }

        if (GetUnitY(whichUnit) < this.area[1]) {
            return false;
        }

        if (GetUnitY(whichUnit) > this.area[3]) {
            return false;
        }

        return true;
    }

    public toString(): string {
        return `{ x: ${this.minX}}, y: ${this.minY} }, { x: ${this.maxX}, y: ${this.maxY} }`;
    };


    public get minX(): number {
        return this.area[0];
    }

    public get minY(): number {
        return this.area[1];
    }

    public get maxX(): number {
        return this.area[2];
    }

    public get maxY(): number {
        return this.area[3];
    }

    public toRect(): rect {
        return Rect(this.minX, this.minY, this.maxX, this.maxY);
    }


    public GetCenterX(): number {
        const x1: number = this.minX;
        const x2: number = this.maxX;

        return (x1 + x2) / 2;
    }

    public GetCenterY(): number {
        const y1: number = this.minY;
        const y2: number = this.maxY;

        return (y1 + y2) / 2;
    }
}
