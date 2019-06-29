import { Item } from '../Specs/Item';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Log } from '../../../../lib/Serilog/Serilog';

export class LootBagItem extends Item {
    constructor(game: WarcraftMaul) {
        super('I02B', game);
    }


    public ManipulateAction(): void {
        const roll: number = Util.RandomInt(1, 100);

        if (roll <= 40) {
            UnitAddItemByIdSwapped(FourCC('I029'), GetTriggerUnit());
        } else if (roll <= 80) {
            UnitAddItemByIdSwapped(FourCC('I02F'), GetTriggerUnit());
        } else if (roll <= 95) {
            UnitAddItemByIdSwapped(FourCC('I028'), GetTriggerUnit());
        } else {
            UnitAddItemByIdSwapped(FourCC('I02A'), GetTriggerUnit());
        }


    }

}
