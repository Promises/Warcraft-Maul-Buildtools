import { SLKUnit } from './SLKLoader';

export interface SLKUnit {
    Abilties: SLKAbilties;
}

export interface SLKAbilties {
    abilList: string[];

}

export class Unit implements SLKUnit {
    public id: string;
    public Abilties: SLKAbilties = {
        abilList: [],
    };

    constructor(id: string) {
        this.id = id;
    }

}

export module SLKLoader {
    export function loadFile(filePath: string): Map<number, Unit> {
        const units: Map<number, Unit> = new Map<number, Unit>();
        let file: [LuaFile] | [undefined, string, number];
        file = io.open(filePath, 'r');
        if (file[0]) {
            let currentUnit: Unit | undefined;
            for (const [line] of file[0].lines()) {
                if (string.match(line, 'C;X1;Y%d+;K"(.*)"')) {
                    const id: string = <string>(<unknown>string.match(line, 'C;X1;Y%d+;K"(.*)"'));
                    if (id.length === 4) {
                        if (currentUnit) {
                            units.set(FourCC(currentUnit.id), currentUnit);
                        }
                        currentUnit = new Unit(id);
                    }

                }
                if (!currentUnit) {
                    continue;
                }
                const index: number = Number(string.match(line, 'C;X(%d+);'));
                switch (index) {
                    case 1:
                        break;
                    case 2:
                        break;
                    case 3:
                        break;
                    case 4:
                        break;
                    case 5:
                        const abilties: string = <string><unknown>string.match(line, 'C;X%d+;K"(.*)"');
                        if (abilties.length >= 4) {
                            for (const ability of abilties.split(',')) {
                                currentUnit.Abilties.abilList.push(ability);
                            }
                        }
                        break;
                    case 6:
                        break;
                }
            }
        } else {
            print(file[1]);
        }
        // for (const unit of units.values()) {
            // print(`Unit: ${unit.id} - ${Util.ArraysToString(unit.Abilties.abilList)}`);
        // }
        // if (file) {
        //     print(file);
        // }
        return units;
    }
}
