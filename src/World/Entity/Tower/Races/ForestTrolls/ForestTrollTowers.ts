import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { ForestTrollHighPriest } from './ForestTrollHighPriest';


export class ForestTrollTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {

        // Forest Trolls
        list.add(FourCC('n03I'), ForestTrollHighPriest);
    }

}
