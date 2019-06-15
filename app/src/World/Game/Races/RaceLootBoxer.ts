import { Race } from './Race';
import { Defender } from '../../Entity/Players/Defender';

export class RaceLootBoxer extends Race {
    pickAction(player: Defender) {
        let x = GetRectCenterX(player.getArea());
        let y = GetRectCenterY(player.getArea());
        player.lootBoxer = CreateUnit(player.wcPlayer, FourCC(this.id), x, y, bj_UNIT_FACING);

    }
}
