export class WaveCreep {
    id: string;
    name: string;
    type: CREEP_TYPE;
    wave: number;

    constructor(wave: number, id: string, name: string) {
        this.wave = wave;
        this.id = id;
        this.name = name;
        this.type = this.getCreepType();
        this.getArmourType();
    }

    getCreepType(): CREEP_TYPE {
        switch (this.wave) {
            case 5:
            case 15:
            case 20:
            case 25:
            case 30:
                return CREEP_TYPE.AIR;
            case 9:
            case 14:
            case 19:
            case 24:
            case 29:
            case 31:
                return CREEP_TYPE.CHAMPION;
            case 35:
                return CREEP_TYPE.BOSS;
            default:
                return CREEP_TYPE.NORMAL;
        }

    }

    getArmourType(): ARMOUR_TYPE{
        switch (this.wave) {
            case 1:
            case 6:
            case 9:
            case 14:
            case 21:
            case 29:
            case 34:
                return ARMOUR_TYPE.UNARMOURED;
            case 4:
            case 8:
            case 11:
            case 16:
            case 19:
            case 23:
            case 27:
            case 32:
                return ARMOUR_TYPE.LIGHT;
            case 3:
            case 7:
            case 12:
            case 17:
            case 24:
            case 28:
            case 33:
                return ARMOUR_TYPE.MEDIUM;
            case 2:
            case 5:
            case 13:
            case 15:
            case 20:
            case 25:
            case 30:
            case 35:
                return ARMOUR_TYPE.HEAVY;
            case 10:
            case 18:
            case 22:
            case 26:
            case 31:
                return ARMOUR_TYPE.FORTIFIED;
            case 36:
                return ARMOUR_TYPE.HERO;
            default:
                    print(`COULD NOT FIND ARMOUR TYPE FOR ${this.wave}:${this.id}:${this.name}`);
                return ARMOUR_TYPE.UNARMOURED;
        }

    }
}
