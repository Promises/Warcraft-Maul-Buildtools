import { Race } from './Race';
import { Defender } from '../../Entity/Players/Defender';

export class RaceLootBoxer extends Race {
    pickAction(player: Defender) {

        player.lootBoxer = CreateUnit(player.wcPlayer, FourCC(this.id), player.getCenterX(), player.getCenterY(), bj_UNIT_FACING);

    }
}
