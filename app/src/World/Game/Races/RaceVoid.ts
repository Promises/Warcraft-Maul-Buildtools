import { Race } from './Race';
import { Defender } from '../../Entity/Players/Defender';

export class RaceVoid extends Race {
    pickAction(player: Defender): void {
        player.voidBuilder = CreateUnit(player.wcPlayer, FourCC(this.id), player.getCenterX(), player.getCenterY(), bj_UNIT_FACING);
        const voidBuilder: unit | undefined = player.getVoidBuilder();
        if (voidBuilder !== undefined) {
            UnitAddItemByIdSwapped(FourCC('I01Y'), voidBuilder);
            UnitAddItemByIdSwapped(FourCC('I01Z'), voidBuilder);
            UnitAddItemByIdSwapped(FourCC('I020'), voidBuilder);
            UnitAddItemByIdSwapped(FourCC('I01X'), voidBuilder);
        }
        player.builders.push(player.voidBuilder);

    }
}
