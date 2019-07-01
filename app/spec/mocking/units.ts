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
