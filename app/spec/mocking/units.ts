/** @noSelfInFile **/

// tslint:disable-next-line:class-name
interface unit {
    owner: player;
    unitid: number;
    x: number;
    y: number;
    face: number;
}

let unitTable: unit[] = [];
_G.CreateUnit = function (owner: player, unitid: number, x: number, y: number, face: number): unit {
    // @ts-ignore
    const u: unit = {
        owner,
        unitid,
        x,
        y,
        face,
    };
    unitTable.push(u);
    return u;
};
// CreateUnit(id: player, unitid: number, x: number, y: number, face: number): unit

// declare function GetUnitTypeId(whichUnit: unit): number
_G.GetUnitTypeId = function (whichUnit: unit): number {
    return whichUnit.unitid;
};

_G.GetHandleIdBJ = function (whichUnit: unit): number {
    return unitTable.indexOf(whichUnit);
};

_G.GetUnitPointValue = function (whichUnit: unit): number {
    return 100;

};

_G.SetUnitOwner = function (whichUnit: unit, whichPlayer: player, changeColor: boolean): void {
    whichUnit.owner = whichPlayer;
};
