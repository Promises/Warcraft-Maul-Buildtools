export class Rectangle {
    private area: number[];

    constructor(area: number[]) {
        this.area = area;
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
}
