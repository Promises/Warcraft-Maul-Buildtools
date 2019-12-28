export class ItemId {
    constructor(id: number) {
        this.id = id;
    }

    public id: number;

    public static byId(id: number): ItemId {
        return new ItemId(id);
    }

    public isPowerup(): boolean {
        return IsItemIdPowerup(this.id);
    }

    public isSellable(): boolean {
        return IsItemIdSellable(this.id);
    }

    public isPawnable(): boolean {
        return IsItemIdPawnable(this.id);
    }
}

export class ItemPool {
    constructor() {
        this.pool = CreateItemPool();
    }

    public pool: itempool;

    public static pickRandomIdFromLevel(level: number): number {
        return ChooseRandomItem(level);
    }

    public static pickRandomIdFromTypeAndLevel(whichType: itemtype, level: number): number {
        return ChooseRandomItemEx(whichType, level);
    }

    public destroy(): void {
        DestroyItemPool(this.pool);
    }

    public addId(itemId: number, weight: number): void {
        ItemPoolAddItemType(this.pool, itemId, weight);
    }

    public removeId(itemId: number): void {
        ItemPoolRemoveItemType(this.pool, itemId);
    }

    public placeRandom(x: number, y: number): item {
        return PlaceRandomItem(this.pool, x, y);
    }
}

export class Item {

    constructor(item: item) {
        this._item = item;
    }

    public static _byItem: Map<item, Item> = new Map<item, Item>();

    public _item: item;

    public static byItem(item: item): Item {
        return this._byItem.has(item) ? this._byItem.get(item) as Item : new Item(item);
    }

    public static createItem(itemid: number, x: number, y: number): Item {
        return new Item(CreateItem(itemid, x, y));
    }

    public static filterItem(): Item {
        return this.byItem(GetFilterItem());
    }

    public static enumItem(): Item {
        return this.byItem(GetEnumItem());
    }

    public static soldItem(): Item {
        return this.byItem(GetSoldItem());
    }

    public static manipulatedItem(): Item {
        return this.byItem(GetManipulatedItem());
    }

    public static orderTargetItem(): Item {
        return this.byItem(GetOrderTargetItem());
    }

    public static spellTargetItem(): Item {
        return this.byItem(GetSpellTargetItem());
    }

    public destroy(): void {
        RemoveItem(this._item);
    }

    public booleanField(whichField: itembooleanfield): boolean {
        return BlzGetItemBooleanField(this._item, whichField);
    }

    public intField(whichField: itemintegerfield): number {
        return BlzGetItemIntegerField(this._item, whichField);
    }

    public realField(whichField: itemrealfield): number {
        return BlzGetItemRealField(this._item, whichField);
    }

    public stringField(whichField: itemstringfield): string {
        return BlzGetItemStringField(this._item, whichField);
    }

    public setBooleanField(whichField: itembooleanfield, value: boolean): boolean {
        return BlzSetItemBooleanField(this._item, whichField, value);
    }

    public setIntField(whichField: itemintegerfield, value: number): boolean {
        return BlzSetItemIntegerField(this._item, whichField, value);
    }

    public setRealField(whichField: itemrealfield, value: number): boolean {
        return BlzSetItemRealField(this._item, whichField, value);
    }

    public setStringField(whichField: itemstringfield, value: string): boolean {
        return BlzSetItemStringField(this._item, whichField, value);
    }

    public ability(abilId: number): ability {
        return BlzGetItemAbility(this._item, abilId);
    }

    public abilityByIndex(index: number): ability {
        return BlzGetItemAbilityByIndex(this._item, index);
    }

    public addAbility(abilId: number): boolean {
        return BlzItemAddAbility(this._item, abilId);
    }

    public removeAbility(abilId: number): boolean {
        return BlzItemRemoveAbility(this._item, abilId);
    }

    public setName(name: string): void {
        BlzSetItemName(this._item, name);
    }

    public description(): string {
        return BlzGetItemDescription(this._item);
    }

    public setDescription(description: string): void {
        BlzSetItemDescription(this._item, description);
    }

    public tooltip(): string {
        return BlzGetItemTooltip(this._item);
    }

    public setTooltip(tooltip: string): void {
        BlzSetItemTooltip(this._item, tooltip);
    }

    public extendedTooltip(): string {
        return BlzGetItemExtendedTooltip(this._item);
    }

    public setExtendedTooltip(extendedTooltip: string): void {
        BlzSetItemExtendedTooltip(this._item, extendedTooltip);
    }

    public setIconPath(iconPath: string): void {
        BlzSetItemIconPath(this._item, iconPath);
    }

    public iconPath(): string {
        return BlzGetItemIconPath(this._item);
    }

    public player(): player {
        return GetItemPlayer(this._item);
    }

    public typeId(): number {
        return GetItemTypeId(this._item);
    }

    public x(): number {
        return GetItemX(this._item);
    }

    public y(): number {
        return GetItemY(this._item);
    }

    public xy(): [number, number] {
        return [this.x(), this.y()];
    }

    public setXYWithCollision(xy: [number, number]): void {
        SetItemPosition(this._item, xy[0], xy[1]);
    }

    public setDropOnDeath(flag: boolean): void {
        SetItemDropOnDeath(this._item, flag);
    }

    public setDroppable(flag: boolean): void {
        SetItemDroppable(this._item, flag);
    }

    public setPlayer(whichPlayer: player, changeColor: boolean): void {
        SetItemPlayer(this._item, whichPlayer, changeColor);
    }

    public isInvulnerable(): boolean {
        return IsItemInvulnerable(this._item);
    }

    public setInvulnerable(flag: boolean): void {
        SetItemInvulnerable(this._item, flag);
    }

    public isVisible(): boolean {
        return IsItemVisible(this._item);
    }

    public setVisible(show: boolean): void {
        SetItemVisible(this._item, show);
    }

    public isOwned(): boolean {
        return IsItemOwned(this._item);
    }

    public isPowerup(): boolean {
        return IsItemPowerup(this._item);
    }

    public isSellable(): boolean {
        return IsItemSellable(this._item);
    }

    public isPawnable(): boolean {
        return IsItemPawnable(this._item);
    }

    public setPawnable(flag: boolean): void {
        SetItemPawnable(this._item, flag);
    }

    public level(): number {
        return GetItemLevel(this._item);
    }

    public type(): itemtype {
        return GetItemType(this._item);
    }

    public setDropID(unitId: number): void {
        SetItemDropID(this._item, unitId);
    }

    public name(): string {
        return GetItemName(this._item);
    }

    public charges(): number {
        return GetItemCharges(this._item);
    }

    public setCharges(charges: number): void {
        SetItemCharges(this._item, charges);
    }
}
