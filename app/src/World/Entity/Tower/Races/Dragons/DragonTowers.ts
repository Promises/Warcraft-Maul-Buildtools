import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { BronzeDragonWhelp } from './BronzeDragonWhelp';
import { BronzeDrake } from './BronzeDrake';
import { BronzeDragon } from './BronzeDragon';


export class DragonTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {

        // Dragons
        list.add(FourCC('o00M'), BronzeDragonWhelp);
        list.add(FourCC('o01F'), BronzeDrake);
        list.add(FourCC('o01K'), BronzeDragon);
    }

}
