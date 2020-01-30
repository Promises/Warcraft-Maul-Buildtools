import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { Kael } from './Kael';


export class HighElvenTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {

        // High Elven
        list.add(FourCC('o00N'), Kael);

    }

}
