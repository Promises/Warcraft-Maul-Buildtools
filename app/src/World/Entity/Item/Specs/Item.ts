import { WarcraftMaul } from '../../../WarcraftMaul';
import { Log } from '../../../../lib/Serilog/Serilog';
import { StackingItem } from './StackingItem';

export class Item {



    private buffID: number;
    private game: WarcraftMaul;

    constructor(buffID: string, game: WarcraftMaul) {
        this.buffID = FourCC(buffID);
        this.game = game;

    }

    public ManipulateCondition(): boolean {
        return GetItemTypeId(GetManipulatedItem()) === this.buffID;
    }


    public ManipulateAction(): void {
        Log.Debug('Missing Action');
    }

    public IsStackingItem(): this is StackingItem {
        return 'MakeStack' in this;
    }
}
