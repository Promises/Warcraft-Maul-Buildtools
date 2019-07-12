import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { AncientMonstrosity } from './AncientMonstrosity';
import { Hydralisk } from './Hydralisk';
import { Marine } from './Marine';
import { ProudMoore } from './ProudMoore';
import { Sammy } from './Sammy';
import { ZerglingHive } from './ZerglingHive';
import { TheDarkness } from './TheDarkness';

export class UniqueTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {
        // Unique
        list.add(FourCC('h02K'), AncientMonstrosity);
        list.add(FourCC('h02L'), Hydralisk);
        list.add(FourCC('h02H'), Marine);
        list.add(FourCC('h02J'), ProudMoore);
        list.add(FourCC('u03F'), Sammy);
        list.add(FourCC('u03E'), ZerglingHive);
        list.add(FourCC('u040'), TheDarkness);
    }

}
