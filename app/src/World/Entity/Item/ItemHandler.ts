import { WarcraftMaul } from '../../WarcraftMaul';
import { Item } from './Specs/Item';
import { Log } from '../../../lib/Serilog/Serilog';
import { Trigger } from '../../../JassOverrides/Trigger';
import { LootBagItem } from './LootBoxer/LootBagItem';
import { StackingItem } from './Specs/StackingItem';
import { Rocks } from './LootBoxer/Rocks';
import { GoldCoin } from './LootBoxer/GoldCoin';
import { PlatinumToken } from './LootBoxer/PlatinumToken';
import { WoodenSticks } from './LootBoxer/WoodenSticks';


export class ItemHandler {
    private game: WarcraftMaul;
    private items: object[] = [];
    private activeItems: Item[] = [];
    private useItemTrigger: Trigger;
    private pickupItemTrigger: Trigger;
    private stackingItems: StackingItem[] = [];

    constructor(game: WarcraftMaul) {
        this.game = game;
        this.AddItemsToList();
        this.SetupItems();
        this.useItemTrigger = new Trigger();
        this.useItemTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_USE_ITEM);
        this.useItemTrigger.AddAction(() => this.UseItem());

        this.pickupItemTrigger = new Trigger();
        this.pickupItemTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_PICKUP_ITEM);
        this.pickupItemTrigger.AddAction(() => this.PickupItem());


    }

    private AddItemsToList(): void {
        this.items.push(LootBagItem);
        this.items.push(Rocks);
        this.items.push(GoldCoin);
        this.items.push(PlatinumToken);
        this.items.push(WoodenSticks);
    }

    private SetupItems(): void {

        for (const item of this.items) {
            // @ts-ignore
            const ObjectExtendsItem: Item = new item(this.game);
            if (ObjectExtendsItem.IsStackingItem()) {
                this.stackingItems.push(ObjectExtendsItem);
            }
            this.activeItems.push(ObjectExtendsItem);
        }

    }

    private UseItem(): void {

        Log.Debug(`[${DecodeFourCC(GetItemTypeId(GetManipulatedItem()))}]: ${GetItemName(GetManipulatedItem())}`);
        // UnitAddItemByIdSwapped(FourCC('I02B'), GetTriggerUnit());

        for (const item of this.activeItems) {
            if (item.ManipulateCondition()) {
                item.ManipulateAction();
            }
        }
    }

    private PickupItem(): void {
        for (const item of this.stackingItems) {
            if (item.StackingCondition()) {
                item.MakeStack();
            }
        }
    }
}
