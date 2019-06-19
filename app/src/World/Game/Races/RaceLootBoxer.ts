import { Race } from './Race';
import { Defender } from '../../Entity/Players/Defender';

export class RaceLootBoxer extends Race {
    pickAction(player: Defender) {
        if(player.lootBoxer){
            player.sendMessage("I'm sorry Dave, I'm afraid I can't do that");
            player.giveLumber(1);
            return;
        }

        player.lootBoxer = CreateUnit(player.wcPlayer, FourCC(this.id), player.getCenterX(), player.getCenterY(), bj_UNIT_FACING);

    }
}
