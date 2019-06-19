export class Rectangle {
    _rect: rect;


    constructor(area: number[]) {
        this._rect = Rect(area[0],area[1],area[2],area[3])
    }



    ContainsUnit(whichUnit: unit): boolean {
        return RectContainsUnit(this._rect, GetConstructingStructure());
    }


}
