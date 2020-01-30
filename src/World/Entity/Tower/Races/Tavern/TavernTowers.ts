import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { EarthPandaren } from './EarthPandaren';
import { StormPandaren } from './StormPandaren';
import { FirePandaren } from './FirePandaren';

export class TavernTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {
        // Tavern
        list.add(FourCC('h01F'), EarthPandaren);
        list.add(FourCC('h01J'), StormPandaren);
        list.add(FourCC('h01I'), FirePandaren);


    }

}
