import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { CitadelOfNaxxramas } from './CitadelOfNaxxramas';
import { StalaggFeugen } from './StalaggFeugen';


export class NaxxramasTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {

        // Naxxramas
        list.add(FourCC('oC7C'), CitadelOfNaxxramas);
        list.add(FourCC('oC7D'), StalaggFeugen);
        list.add(FourCC('oC7E'), StalaggFeugen);
    }

}
