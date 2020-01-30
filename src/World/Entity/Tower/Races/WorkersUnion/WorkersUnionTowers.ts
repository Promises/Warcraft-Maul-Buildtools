import { RaceTowers } from '../RaceTowers';
import { NagaSlave } from './NagaSlave';
import { OrcPeon } from './OrcPeon';
import { HumanPeasant } from './HumanPeasant';
import { UndeadAcolyte } from './UndeadAcolyte';
import { NightElfWisp } from './NightElfWisp';
import { TowerMap } from '../../Specs/TowerMap';

export class WorkersUnionTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {

        // WorkersUnion
        list.add(FourCC('h03G'), NagaSlave);
        list.add(FourCC('h03E'), OrcPeon);
        list.add(FourCC('h03F'), HumanPeasant);
        list.add(FourCC('h03I'), UndeadAcolyte);
        list.add(FourCC('h03H'), NightElfWisp);

    }

}
