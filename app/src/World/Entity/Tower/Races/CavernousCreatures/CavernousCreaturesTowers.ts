import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';

import { CavernDruid } from './CavernDruid';
import { CavernHermit } from './CavernHermit';
import { CavernMushroom } from './CavernMushroom';
import { CavernRevenant } from './CavernRevenant';
import { CavernTurtle } from './CavernTurtle';
import { GrowthLvl2 } from './Growth/GrowthLvl2';
import { GrowthLvl3 } from './Growth/GrowthLvl3';

export class CavernousCreaturesTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {

        // Cavernous Creaaddes
        list.add(FourCC('h04Q'), CavernDruid);
        list.add(FourCC('h04M'), CavernHermit);
        list.add(FourCC('h04T'), CavernMushroom);
        list.add(FourCC('h04O'), CavernRevenant);
        list.add(FourCC('h04N'), CavernTurtle);
        list.add(FourCC('h04S'), GrowthLvl2);
        list.add(FourCC('h04L'), GrowthLvl3);

    }

}
