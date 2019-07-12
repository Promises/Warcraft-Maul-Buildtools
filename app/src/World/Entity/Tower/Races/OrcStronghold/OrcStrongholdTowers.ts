import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { Rokhan } from './Rokhan';
import { WarchiefThrall } from './WarchiefThrall';
import { Berserker } from './Berserker';


export class OrcStrongholdTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {
        // Orc Stronghold
        list.add(FourCC('h002'), Rokhan);
        list.add(FourCC('oC65'), WarchiefThrall);
        list.add(FourCC('o00E'), Berserker);

    }

}
