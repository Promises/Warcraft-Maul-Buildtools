import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { KodoBeast } from './KodoBeast';


export class ShrineOfBuffsTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {
        // Shrine of buffadd
        list.add(FourCC('oC58'), KodoBeast);


    }

}
