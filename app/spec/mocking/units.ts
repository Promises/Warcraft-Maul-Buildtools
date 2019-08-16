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

_G.GetUnitX = function (whichUnit: unit): number {
    return whichUnit.x;
};

_G.GetUnitY = function (whichUnit: unit): number {
    return whichUnit.y;
};


_G.GetOwningPlayer = function (whichUnit: unit): player {
    return whichUnit.owner;
};

_G.CreateTextTagUnitBJ = function (s: string, whichUnit: unit, zOffset: number, size: number, red: number, green: number, blue: number, transparency: number): void {
    return;
};

_G.SetTextTagPermanentBJ = function (tt: texttag, flag: boolean): void {
    return;
};

_G.SetTextTagLifespanBJ = function (tt: texttag, lifespan: number): void {
    return;
};


_G.SetTextTagVelocityBJ = function (tt: texttag, speed: number, angle: number): void {
    return;
};

// declare function SetTextTagVelocityBJ(tt: texttag, speed: number, angle: number): void
_G.PlaySoundOnUnitBJ = function (tt: texttag, speed: number, angle: number): void {
    return;
};

_G.RemoveUnit = function (whichUnit: unit): void {
    // @ts-ignore
    unitTable[unitTable.indexOf(whichUnit)] = null;
};


_G.ReplaceUnitBJ = function (whichUnit: unit, newUnitId: number, unitStateMethod: number): unit {
    whichUnit.unitid = newUnitId;
    return whichUnit;
};
_G.GetUnitAbilityLevel = function (whichUnit: unit, abilcode: number): number {
    if (whichUnit.unitid === FourCC('uC14')) {
        return 0;
    }
    return 1;
};

_G.UnitAddAbilityBJ = function (abilityId: number, whichUnit: unit): void {
    return;
};
