import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { Undead } from './Undead';
import { Sapling } from './Sapling';
import { Undead2 } from './Undead2';
import { LowTide } from './LowTide';
import { Bubbles } from './Bubbles';
import { UnchargedRune } from './UnchargedRune';
import { DormantPheonixEgg } from './DormantPheonixEgg';
import { Blaze } from './Blaze';
import { Tornado } from './Tornado';
import { HighTide } from './HighTide';
import { Plague } from './Plague';


export class ElementalistTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {

        // Elementalist
        list.add(FourCC('n00A'), UnchargedRune);
        list.add(FourCC('n026'), Undead);
        list.add(FourCC('u038'), Undead2);
        list.add(FourCC('u01D'), DormantPheonixEgg);
        list.add(FourCC('u01F'), LowTide);
        list.add(FourCC('u029'), HighTide);
        list.add(FourCC('u021'), Sapling);
        list.add(FourCC('u022'), Tornado);
        list.add(FourCC('u026'), Bubbles);
        list.add(FourCC('u027'), Blaze);
        list.add(FourCC('u020'), Plague);
    }

}
