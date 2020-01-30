import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { SacrificialPit } from './SacrificialPit';

export class UndeadTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {
        list.add(FourCC('h00R'), SacrificialPit);
    }

}
