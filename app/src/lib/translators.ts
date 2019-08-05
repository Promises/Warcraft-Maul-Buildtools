// tslint:disable-next-line:class-name
class console {
    public static log(input: string): void {
        SendMessage(input);
    }
}

function SendMessage(this: void, msg: any): void {
    DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 10, `${msg}`);
}

function SendMessageUnlogged(this: void, msg: any): void {
    DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 10, `${msg}`);
}

interface ColourToIndex {
    [key: string]: number;
}

function ToString(input: any): string {
    return `${input}`;
}

function DecodeFourCC(fourcc: number): string {
    // tslint:disable-next-line:no-bitwise
    return string.char((fourcc >>> 24) & 255, (fourcc >>> 16) & 255, (fourcc >>> 8) & 255, (fourcc) & 255);
}

class Util {

    public static COLOUR_IDS: ColourToIndex = {
        RED: 0,
        BLUE: 1,
        TEAL: 2,
        PURPLE: 3,
        YELLOW: 4,
        ORANGE: 5,
        GREEN: 6,
        PINK: 7,
        GRAY: 8,
        GREY: 8,
        LIGHT_BLUE: 9,
        LIGHTBLUE: 9,
        LB: 9,
        DARK_GREEN: 10,
        DARKGREEN: 10,
        DG: 10,
        BROWN: 11,
        MAROON: 12,
        NAVY: 13,
        TURQUOISE: 14,
        VOILET: 15,
        WHEAT: 16,
        PEACH: 17,
        MINT: 18,
        LAVENDER: 19,
        COAL: 20,
        SNOW: 21,
        EMERALD: 22,
        PEANUT: 23,
    };

    public static isUnitCreep(u: unit): boolean {
        const ownerID: COLOUR = GetPlayerId(GetOwningPlayer(u));
        switch (ownerID) {
            case COLOUR.NAVY:
            case COLOUR.TURQUOISE:
            case COLOUR.VOILET:
            case COLOUR.WHEAT:
                return true;
            default:
                return false;
        }
    }

    public static ColourString(colour: string, str: string): string {
        return `|cFF${colour}${str}|r`;
    }

    public static RandomInt(min: number, max: number): number {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    public static ShuffleArray(arr: any[]): void {
        for (let i: number = arr.length - 1; i > 0; i--) {
            const j: number = Math.floor(Math.random() * (i + 1)); // random index from 0 to i
            // [arr[i], arr[j]] = [arr[j], arr[i]]; // swap elements

            const temp: any = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
        }
    }


    public static RandomHash(length: number): string {
        let result: string = '';
        const characters: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        const charactersLength: number = characters.length;
        for (let i: number = 0; i < length; i++) {
            result += characters.charAt(Math.floor(Math.random() * charactersLength));
        }
        return result;
    }


    public static GetRandomKey(collection: Map<any, any>): any {
        const index: number = Math.floor(Math.random() * collection.size);
        let cntr: number = 0;
        for (const key of collection.keys()) {
            if (cntr++ === index) {
                return key;
            }
        }
    }

    public static GetAllKeys(collection: Map<any, any>): any[] {
        const keys: any[] = [];
        for (const key of collection.keys()) {
            keys.push(key);
        }
        return keys;
    }

    public static ArraysToString(arr: any[]): string {
        let output: string = '[';
        for (let i: number = 0; i < arr.length; i++) {
            if (i === arr.length - 1) {
                output += `"${arr[i]}"`;
                continue;
            }
            output += `"${arr[i]}", `;
        }
        output += ']';
        return output;
    }

    public static ParseInt(str: string): number {
        return +str;
    }

    public static ParsePositiveInt(str: string): number {
        const int: number = Number(str);
        if (int < 0) {
            return 0;
        }
        return int;
    }

    public static Round(x: number): number {
        return Math.floor(x + 0.5 - (x + 0.5) % 1);
    }
}


// reference: https://docs.google.com/spreadsheets/d/1wzWIYzRW9pqpo1ZuEcU-qJTg-H4z5-PaTnHIXPezaRQ/edit#gid=1812483906

enum COLOUR {
    RED,
    BLUE,
    TEAL,
    PURPLE,
    YELLOW,
    ORANGE,
    GREEN,
    PINK,
    GRAY,
    LIGHT_BLUE,
    DARK_GREEN,
    BROWN,
    MAROON,
    NAVY,
    TURQUOISE,
    VOILET,
    WHEAT,
    PEACH,
    MINT,
    LAVENDER,
    COAL,
    SNOW,
    EMERALD,
    PEANUT,
}


enum CREEP_TYPE {
    NORMAL,
    AIR,
    CHAMPION,
    BOSS,
}

enum ARMOUR_TYPE {
    UNARMOURED,
    LIGHT,
    MEDIUM,
    HEAVY,
    FORTIFIED,
    HERO,

}

