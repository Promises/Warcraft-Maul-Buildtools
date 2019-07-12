import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { GoblinMineLayer } from './GoblinMineLayer';
import { GoblinTinkerer } from './GoblinTinkerer';
import { GoblinBlademaster } from './GoblinBlademaster';
import { GoblinSapper } from './GoblinSapper';
import { GoblinAlchemist } from './GoblinAlchemist';


export class GoblinTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {

        // Goblin
        list.add(FourCC('o01R'), GoblinMineLayer);
        list.add(FourCC('o01S'), GoblinTinkerer);
        list.add(FourCC('o01P'), GoblinBlademaster);
        list.add(FourCC('o01M'), GoblinSapper);
        list.add(FourCC('o01O'), GoblinAlchemist);

    }

}
