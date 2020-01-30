import { WarcraftMaul } from '../../../WarcraftMaul';
import { Log } from '../../../../lib/Serilog/Serilog';
import { StackingItem } from './StackingItem';

export class WCItem {


    private _itemID: number;
    private _game: WarcraftMaul;

    constructor(buffID: string, game: WarcraftMaul) {
        this._itemID = FourCC(buffID);
        this._game = game;

    }

    public ManipulateCondition(): boolean {
        return GetItemTypeId(GetManipulatedItem()) === this._itemID;
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

    get itemID(): number {
        return this._itemID;
    }

    set itemID(value: number) {
        this._itemID = value;
    }


}
