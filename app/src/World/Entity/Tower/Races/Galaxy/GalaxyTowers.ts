import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { MoonDancer } from './MoonDancer';
import { StarChaser } from './StarChaser';
import { CelestialMist } from './CelestialMist';


export class GalaxyTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {


        // Galaxy
        list.add(FourCC('e00K'), MoonDancer);
        list.add(FourCC('e00P'), StarChaser);
        list.add(FourCC('e00R'), CelestialMist);

    }

}
