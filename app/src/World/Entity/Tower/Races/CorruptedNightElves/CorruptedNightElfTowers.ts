import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { CorruptedTreeofLife } from './CorruptedTreeofLife';
import { CorruptedAncientProtector } from './CorruptedAncientProtector';



export class CorruptedNightElfTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {
        // CorruptedNightaddes
        list.add(FourCC('n00P'), CorruptedTreeofLife);
        list.add(FourCC('n00L'), CorruptedAncientProtector);
    }

}
