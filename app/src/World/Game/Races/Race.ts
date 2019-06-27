import { Defender } from '../../Entity/Players/Defender';
import { WorldMap } from '../../WorldMap';

export class Race {
    id: string;
    name: string;
    itemid: string;
    enabled: boolean;
    map: WorldMap;

    constructor(id: string, name: string, itemid: string, map: WorldMap, enabled: boolean = true) {
        this.id = id;
        this.name = name;
        this.itemid = itemid;
        this.enabled = enabled;
        this.map = map;
        if (!enabled) {
            map.disabledRaces++;
        }
    }

    public pickAction(player: Defender): void {
        CreateUnit(player.wcPlayer, FourCC(this.id), player.getCenterX(), player.getCenterY(), bj_UNIT_FACING);
    }
}
