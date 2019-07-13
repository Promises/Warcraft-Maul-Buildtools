import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { VenomTower } from './VenomTower';
import { SirGalahad } from './SirGalahad';


export class HumanTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {


        // Human
        list.add(FourCC('h045'), VenomTower);
        list.add(FourCC('n05C'), SirGalahad);

    }

}
