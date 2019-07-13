/** @noSelfInFile **/

import './mocking/WCPlayer';
import './mocking/units';
import './mocking/common';
import './mocking/blizzard';
import './mocking/trigger';
import { Rectangle } from '../src/JassOverrides/Rectangle';

_G.ceres = {
    addHook(hookname: string, callback: () => void): void {
        print(hookname);
    },
};


_G.FourCC = function (this: void, input: string): number {
    // @ts-ignore
    return string.unpack('>I4', input)[0];
};


_G.Rect = function (area: number[]): Rectangle {
    return new Rectangle(area);
};
