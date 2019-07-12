import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { VoidPriest } from './VoidPriest';
import { VoidFissure } from './VoidFissure';
import { VoidWorshipper } from './VoidWorshipper';
import { VoidBeing } from './VoidBeing';
import { VoidCorrupter } from './VoidCorrupter';
import { VoidWorshipperHusk } from './VoidWorshipperHusk';

export class VoidTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {

        // Void
        list.add(FourCC('h02F'), VoidPriest);
        list.add(FourCC('h01M'), VoidFissure);
        list.add(FourCC('h02G'), VoidWorshipper);
        list.add(FourCC('h02S'), VoidWorshipperHusk);
        list.add(FourCC('h00T'), VoidBeing);
        list.add(FourCC('h01A'), VoidCorrupter);
    }

}
