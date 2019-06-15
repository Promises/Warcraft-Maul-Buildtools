import { Defender } from '../../Entity/Players/Defender';
import { WarcraftMaul } from '../../WarcraftMaul';
import { WorldMap } from '../../WorldMap';

export class Race {
    id: string;
    name: string;
    itemid: string;
    enabled: boolean;
    map: WorldMap;

    constructor(id: string, name: string, itemid: string, map: WorldMap, enabled = true) {
        this.id = id;
        this.name = name;
        this.itemid = itemid;
        this.enabled = enabled;
        this.map = map;
        if (!enabled) {
            map.disabledRaces++;
        }
    }


    pickAction(player: Defender) {
        let x = GetRectCenterX(player.getArea());
        let y = GetRectCenterY(player.getArea());
        CreateUnit(player.wcPlayer, FourCC(this.id), x, y, bj_UNIT_FACING);
    }
}
