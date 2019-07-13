import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { DemonicIllidan } from './DemonicIllidan';
import { CorruptedIllidan } from './CorruptedIllidan';
import { Warden } from './Warden';
import { Wisp } from './Wisp';
import { AncientProtector } from './AncientProtector';
import { ChimaeraRoost } from './ChimaeraRoost';


export class NightElfTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {

        // Night Elf
        list.add(FourCC('h00S'), DemonicIllidan);
        list.add(FourCC('eC83'), CorruptedIllidan);
        list.add(FourCC('h00G'), Warden);
        list.add(FourCC('e00E'), Wisp);
        list.add(FourCC('hC82'), AncientProtector);
        list.add(FourCC('hC86'), ChimaeraRoost);
    }

}
