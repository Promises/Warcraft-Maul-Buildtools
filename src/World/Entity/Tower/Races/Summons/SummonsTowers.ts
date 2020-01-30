import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { Prawn } from './Prawn';
import { LavaSpawn } from './LavaSpawn';


export class SummonsTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {

        // Summons
        list.add(FourCC('h027'), Prawn);
        list.add(FourCC('h026'), LavaSpawn);


    }

}
