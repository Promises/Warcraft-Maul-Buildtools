import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { Adventurer } from './Adventurer';
import { Scavenger } from './Scavenger';

export class AllianceOfBladesTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {
        // Alliance Of Blades
        list.add(FourCC('n02T'), Adventurer);
        list.add(FourCC('n02X'), Scavenger);
    }

}
