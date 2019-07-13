import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { GargoyleSpire } from './GargoyleSpire';
import { Varimathras } from './Varimathras';


export class ForsakenTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {


        // Forsaken
        list.add(FourCC('u00F'), GargoyleSpire);
        list.add(FourCC('u012'), Varimathras);

    }

}
