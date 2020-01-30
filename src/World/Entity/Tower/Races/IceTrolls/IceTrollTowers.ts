import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { IceTrollKing } from './IceTrollKing';
import { IceTrollEmperor } from './IceTrollEmperor';
import { IceTrollPriest } from './IceTrollPriest';


export class IceTrollTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {


        list.add(FourCC('n01B'), IceTrollKing);
        list.add(FourCC('n01C'), IceTrollEmperor);
        list.add(FourCC('n018'), IceTrollPriest);

    }

}
