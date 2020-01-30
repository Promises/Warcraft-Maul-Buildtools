import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { AcidSpittingSpider } from './AcidSpittingSpider';
import { NerubianBehemoth } from './NerubianBehemoth';
import { ParasiticBroodmother } from './ParasiticBroodmother';
import { CrackedBarrel } from './CrackedBarrel';

export class ArachnidTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {
        // Arachnid
        list.add(FourCC('o019'), AcidSpittingSpider);
        list.add(FourCC('h00W'), NerubianBehemoth);
        list.add(FourCC('o01A'), ParasiticBroodmother);
        list.add(FourCC('h03T'), CrackedBarrel);


    }

}
