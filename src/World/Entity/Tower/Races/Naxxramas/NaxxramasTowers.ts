import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { CitadelOfNaxxramas } from './CitadelOfNaxxramas';
import { StalaggFeugen } from './StalaggFeugen';
import { KelThuzad } from './KelThuzad';
import { Sapphiron } from './Sapphiron';
import { Maexxna } from './Maexxna';
import { Thaddius } from './Thaddius';


export class NaxxramasTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {

        // Naxxramas
        list.add(FourCC('oC7C'), CitadelOfNaxxramas);
        list.add(FourCC('oC7D'), StalaggFeugen);
        list.add(FourCC('oC7E'), StalaggFeugen);
        list.add(FourCC('oC7K'), KelThuzad);
        list.add(FourCC('oC7J'), Sapphiron);
        list.add(FourCC('oC7G'), Maexxna);
        list.add(FourCC('oC7F'), Thaddius);

    }
}
