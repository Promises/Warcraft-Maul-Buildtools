import { WarcraftMaul } from '../../../WarcraftMaul';
import { Log } from '../../../../lib/Serilog/Serilog';
import { StackingItem } from './StackingItem';

export class Item {


    private buffID: number;
    private _game: WarcraftMaul;

    constructor(buffID: string, game: WarcraftMaul) {
        this.buffID = FourCC(buffID);
        this._game = game;

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

    get game(): WarcraftMaul {
        return this._game;
    }

    set game(value: WarcraftMaul) {
        this._game = value;
    }


}
