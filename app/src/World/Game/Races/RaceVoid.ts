import { Race } from './Race';
import { Defender } from '../../Entity/Players/Defender';

export class RaceVoid  extends Race{
    pickAction(player:Defender){

        player.voidBuilder = CreateUnit(player.wcPlayer, FourCC(this.id), player.getCenterX(), player.getCenterY(), bj_UNIT_FACING);
        let voidBuilder = player.getVoidBuilder();
        if(voidBuilder){
            UnitAddItemByIdSwapped(FourCC('I01Y'), voidBuilder);
            UnitAddItemByIdSwapped(FourCC('I01Z'), voidBuilder);
            UnitAddItemByIdSwapped(FourCC('I020'), voidBuilder);
            UnitAddItemByIdSwapped(FourCC('I01X'), voidBuilder);
        }


    }
}
