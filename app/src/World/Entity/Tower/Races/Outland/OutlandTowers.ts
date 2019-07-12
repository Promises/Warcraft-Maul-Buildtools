import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { Magtheridon } from './Magtheridon';


export class OutlandTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {
        // Outland
        list.add(FourCC('u01C'), Magtheridon);


    }

}
