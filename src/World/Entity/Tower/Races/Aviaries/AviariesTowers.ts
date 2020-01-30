import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';

import { Wyvern } from './Wyvern';
import { Gyrocopter } from './Gyrocopter';

export class AviariesTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {


        // Aviaries
        list.add(FourCC('oC60'), Wyvern);
        list.add(FourCC('hC36'), Gyrocopter);

    }

}
