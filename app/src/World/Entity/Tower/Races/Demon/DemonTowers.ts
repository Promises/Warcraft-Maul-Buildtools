import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { FelGuard } from './FelGuard';
import { Mannoroth } from './Mannoroth';
import { SummoningShrine } from './SummoningShrine';
import { KilJaeden } from './KilJaeden';
import { DemonizedDreadlord } from './DemonizedDreadlord';



export class DemonTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {
        // Demon
        list.add(FourCC('h03W'), FelGuard);
        list.add(FourCC('o00L'), Mannoroth);
        list.add(FourCC('n00U'), SummoningShrine);
        list.add(FourCC('eC93'), KilJaeden);
        list.add(FourCC('h00F'), DemonizedDreadlord);
    }

}
