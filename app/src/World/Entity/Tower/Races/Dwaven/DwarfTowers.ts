import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { DwarfKing } from './DwarfKing';
import { FlyingDwarf } from './FlyingDwarf';


export class DwarfTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {

        // Dwarven
        list.add(FourCC('n05Q'), DwarfKing);
        list.add(FourCC('n05N'), FlyingDwarf);
    }

}
