import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { DraeneiSeer } from './DraeneiSeer';
import { Akama } from './Akama';
import { SalamanderLord } from './SalamanderLord';


export class DraeneiTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {
        // Draenei
        list.add(FourCC('h04F'), DraeneiSeer);
        list.add(FourCC('h00I'), Akama);
        list.add(FourCC('h04I'), SalamanderLord);
    }

}
