export class Rectangle {
    area: number[];

    constructor(area: number[]) {
        this.area = area;
    }

    ContainsUnit(whichUnit: unit): boolean {
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
}
