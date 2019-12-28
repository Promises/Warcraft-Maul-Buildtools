import { OrderId } from './order';
import { AbilId, BuffId } from './ability';
import { ItemId } from './item';
import { Widget } from './widget';

export class UnitPool {
    constructor(pool: unitpool) {
        this.pool = pool;
    }

    public pool: unitpool;

    public static create(): UnitPool {
        return new UnitPool(CreateUnitPool());
    }

    public static pickRandomCreep(level: number): UnitId {
        return UnitId.byId(ChooseRandomCreep(level));
    }

    public static pickRandomNPBuilding(): UnitId {
        return UnitId.byId(ChooseRandomNPBuilding());
    }

    public destroy(): void {
        DestroyUnitPool(this.pool);
    }

    public addId(unitId: UnitId, weight: number): void {
        UnitPoolAddUnitType(this.pool, unitId.id, weight);
    }

    public removeId(unitId: UnitId): void {
        UnitPoolRemoveUnitType(this.pool, unitId.id);
    }

    public placeRandom(forWhichPlayer: player, x: number, y: number, facing: number): unit {
        return PlaceRandomUnit(this.pool, forWhichPlayer, x, y, facing);
    }
}

export type unitclass = unittype;

export class UnitId {
    constructor(id: number) {
        this.id = id;
    }

    public id: number;

    public static byId(id: number): UnitId {
        return new UnitId(id);
    }

    public static trainedUnitType(): UnitId {
        return this.byId(GetTrainedUnitType());
    }

    public toString(): string {
        return UnitId2String(this.id);
    }

    public foodMade(): number {
        return GetFoodMade(this.id);
    }

    public foodUsed(): number {
        return GetFoodUsed(this.id);
    }

    public heroUnitId(): boolean {
        return IsHeroUnitId(this.id);
    }

    public unitIdType(whichUnitType: unitclass): boolean {
        return IsUnitIdType(this.id, whichUnitType);
    }
}

export class Unit extends Widget {

    constructor(unit: unit) {
        super(unit);

        this.unit = unit;
        Unit.instByTrig.set(unit, this);
    }

    public static instByTrig: Map<unit, Unit> = new Map<unit, Unit>();

    public unit: unit;

    public static byUnit(unit: unit): Unit {
        if (Unit.instByTrig.has(unit)) {
            return Unit.instByTrig.get(unit) as Unit;
        }

        return new Unit(unit);
    }

    public static createBlightedGoldmine(id: player, x: number, y: number, face: number): Unit {
        const unit: unit = CreateBlightedGoldmine(id, x, y, face);

        return this.byUnit(unit);
    }

    public static create(id: player, unitid: number, x: number, y: number, face: number): Unit {
        const unit: unit = CreateUnit(id, unitid, x, y, face);

        return this.byUnit(unit);
    }

    public static createByName(whichPlayer: player, unitname: string, x: number, y: number, face: number): Unit {
        const unit: unit = CreateUnitByName(whichPlayer, unitname, x, y, face);

        return this.byUnit(unit);
    }

    public static createCorpse(whichPlayer: player, unitid: UnitId, x: number, y: number, face: number): Unit {
        const unit: unit = CreateCorpse(whichPlayer, unitid.id, x, y, face);

        return this.byUnit(unit);
    }

    public static filterUnit(): Unit {
        return this.byUnit(GetFilterUnit());
    }

    public static enumUnit(): Unit {
        return this.byUnit(GetEnumUnit());
    }

    public static revivableUnit(): Unit {
        return this.byUnit(GetRevivableUnit());
    }

    public static revivingUnit(): Unit {
        return this.byUnit(GetRevivingUnit());
    }

    public static attacker(): Unit {
        return this.byUnit(GetAttacker());
    }

    public static rescuer(): Unit {
        return this.byUnit(GetRescuer());
    }

    public static dyingUnit(): Unit {
        return this.byUnit(GetDyingUnit());
    }

    public static killingUnit(): Unit {
        return this.byUnit(GetKillingUnit());
    }

    public static decayingUnit(): Unit {
        return this.byUnit(GetDecayingUnit());
    }

    public static constructingStructure(): Unit {
        return this.byUnit(GetConstructingStructure());
    }

    public static cancelledStructure(): Unit {
        return this.byUnit(GetCancelledStructure());
    }

    public static constructedStructure(): Unit {
        return this.byUnit(GetConstructedStructure());
    }

    public static researchingUnit(): Unit {
        return this.byUnit(GetResearchingUnit());
    }

    public static trainedUnit(): Unit {
        return this.byUnit(GetTrainedUnit());
    }

    public static detectedUnit(): Unit {
        return this.byUnit(GetDetectedUnit());
    }

    public static summoningUnit(): Unit {
        return this.byUnit(GetSummoningUnit());
    }

    public static summonedUnit(): Unit {
        return this.byUnit(GetSummonedUnit());
    }

    public static transportUnit(): Unit {
        return this.byUnit(GetTransportUnit());
    }

    public static loadedUnit(): Unit {
        return this.byUnit(GetLoadedUnit());
    }

    public static sellingUnit(): Unit {
        return this.byUnit(GetSellingUnit());
    }

    public static soldUnit(): Unit {
        return this.byUnit(GetSoldUnit());
    }

    public static buyingUnit(): Unit {
        return this.byUnit(GetBuyingUnit());
    }

    public static spellTargetUnit(): Unit {
        return this.byUnit(GetSpellTargetUnit());
    }

    public static triggerUnit(): Unit {
        return this.byUnit(GetTriggerUnit());
    }

    public static eventDamageSource(): Unit {
        return this.byUnit(GetEventDamageSource());
    }

    public static eventTargetUnit(): Unit {
        return this.byUnit(GetEventTargetUnit());
    }

    public static enteringUnit(): Unit {
        return this.byUnit(GetEnteringUnit());
    }

    public static leavingUnit(): Unit {
        return this.byUnit(GetLeavingUnit());
    }

    public static levelingUnit(): Unit {
        return this.byUnit(GetLevelingUnit());
    }

    public static learningUnit(): Unit {
        return this.byUnit(GetLearningUnit());
    }

    public static changingUnit(): Unit {
        return this.byUnit(GetChangingUnit());
    }

    public static manipulatingUnit(): Unit {
        return this.byUnit(GetManipulatingUnit());
    }

    public static orderedUnit(): Unit {
        return this.byUnit(GetOrderedUnit());
    }

    public static orderTargetUnit(): Unit {
        return this.byUnit(GetOrderTargetUnit());
    }

    public static spellAbilityUnit(): Unit {
        return this.byUnit(GetSpellAbilityUnit());
    }

    public static clearSelection(): void {
        ClearSelection();
    }

    public static addItemToAllStock(itemId: ItemId, currentStock: number, stockMax: number): void {
        AddItemToAllStock(itemId.id, currentStock, stockMax);
    }

    public static addUnitIdToAllStock(unitId: UnitId, currentStock: number, stockMax: number): void {
        AddUnitToAllStock(unitId.id, currentStock, stockMax);
    }

    public static removeItemFromAllStock(itemId: ItemId): void {
        RemoveItemFromAllStock(itemId.id);
    }

    public static removeUnitIdFromAllStock(unitId: UnitId): void {
        RemoveUnitFromAllStock(unitId.id);
    }

    public static setAllItemIdSlots(slots: number): void {
        SetAllItemTypeSlots(slots);
    }

    public static setAllUnitIdSlots(slots: number): void {
        SetAllUnitTypeSlots(slots);
    }

    public destroy(): void {
        RemoveUnit(this.unit);
    }

    public removeGuardPosition(): void {
        RemoveGuardPosition(this.unit);
    }

    public recycleGuardPosition(): void {
        RecycleGuardPosition(this.unit);
    }

    public booleanField(whichField: unitbooleanfield): boolean {
        return BlzGetUnitBooleanField(this.unit, whichField);
    }

    public intField(whichField: unitintegerfield): number {
        return BlzGetUnitIntegerField(this.unit, whichField);
    }

    public realField(whichField: unitrealfield): number {
        return BlzGetUnitRealField(this.unit, whichField);
    }

    public stringField(whichField: unitstringfield): string {
        return BlzGetUnitStringField(this.unit, whichField);
    }

    public setBooleanField(whichField: unitbooleanfield, value: boolean): boolean {
        return BlzSetUnitBooleanField(this.unit, whichField, value);
    }

    public setIntField(whichField: unitintegerfield, value: number): boolean {
        return BlzSetUnitIntegerField(this.unit, whichField, value);
    }

    public setRealField(whichField: unitrealfield, value: number): boolean {
        return BlzSetUnitRealField(this.unit, whichField, value);
    }

    public setStringField(whichField: unitstringfield, value: string): boolean {
        return BlzSetUnitStringField(this.unit, whichField, value);
    }

    public weaponBooleanField(whichField: unitweaponbooleanfield, index: number): boolean {
        return BlzGetUnitWeaponBooleanField(this.unit, whichField, index);
    }

    public weaponIntField(whichField: unitweaponintegerfield, index: number): number {
        return BlzGetUnitWeaponIntegerField(this.unit, whichField, index);
    }

    public weaponRealField(whichField: unitweaponrealfield, index: number): number {
        return BlzGetUnitWeaponRealField(this.unit, whichField, index);
    }

    public weaponStringField(whichField: unitweaponstringfield, index: number): string {
        return BlzGetUnitWeaponStringField(this.unit, whichField, index);
    }

    public setWeaponBooleanField(whichField: unitweaponbooleanfield, index: number, value: boolean): boolean {
        return BlzSetUnitWeaponBooleanField(this.unit, whichField, index, value);
    }

    public setWeaponIntField(whichField: unitweaponintegerfield, index: number, value: number): boolean {
        return BlzSetUnitWeaponIntegerField(this.unit, whichField, index, value);
    }

    public setWeaponRealField(whichField: unitweaponrealfield, index: number, value: number): boolean {
        return BlzSetUnitWeaponRealField(this.unit, whichField, index, value);
    }

    public setWeaponStringField(whichField: unitweaponstringfield, index: number, value: string): boolean {
        return BlzSetUnitWeaponStringField(this.unit, whichField, index, value);
    }

    public maxLife(): number {
        return BlzGetUnitMaxHP(this.unit);
    }

    public setMaxLife(hp: number): void {
        BlzSetUnitMaxHP(this.unit, hp);
    }

    public maxMana(): number {
        return BlzGetUnitMaxMana(this.unit);
    }

    public setMaxMana(mana: number): void {
        BlzSetUnitMaxMana(this.unit, mana);
    }

    public setName(name: string): void {
        BlzSetUnitName(this.unit, name);
    }

    public setHeroProperName(heroProperName: string): void {
        BlzSetHeroProperName(this.unit, heroProperName);
    }

    public baseDamage(weaponIndex: number): number {
        return BlzGetUnitBaseDamage(this.unit, weaponIndex);
    }

    public setBaseDamage(baseDamage: number, weaponIndex: number): void {
        BlzSetUnitBaseDamage(this.unit, baseDamage, weaponIndex);
    }

    public diceNumber(weaponIndex: number): number {
        return BlzGetUnitDiceNumber(this.unit, weaponIndex);
    }

    public setDiceNumber(diceNumber: number, weaponIndex: number): void {
        BlzSetUnitDiceNumber(this.unit, diceNumber, weaponIndex);
    }

    public diceSides(weaponIndex: number): number {
        return BlzGetUnitDiceSides(this.unit, weaponIndex);
    }

    public setDiceSides(diceSides: number, weaponIndex: number): void {
        BlzSetUnitDiceSides(this.unit, diceSides, weaponIndex);
    }

    public attackCooldown(weaponIndex: number): number {
        return BlzGetUnitAttackCooldown(this.unit, weaponIndex);
    }

    public setAttackCooldown(cooldown: number, weaponIndex: number): void {
        BlzSetUnitAttackCooldown(this.unit, cooldown, weaponIndex);
    }

    public armor(): number {
        return BlzGetUnitArmor(this.unit);
    }

    public setArmor(armorAmount: number): void {
        BlzSetUnitArmor(this.unit, armorAmount);
    }

    public hideAbility(abilId: AbilId, flag: boolean): void {
        BlzUnitHideAbility(this.unit, abilId.id, flag);
    }

    public disableAbility(abilId: AbilId, flag: boolean, hideUI: boolean): void {
        BlzUnitDisableAbility(this.unit, abilId.id, flag, hideUI);
    }

    public cancelTimedLife(): void {
        BlzUnitCancelTimedLife(this.unit);
    }

    public isSelectable(): boolean {
        return BlzIsUnitSelectable(this.unit);
    }

    public isInvulnerable(): boolean {
        return BlzIsUnitInvulnerable(this.unit);
    }

    public interruptAttack(): void {
        BlzUnitInterruptAttack(this.unit);
    }

    public collisionSize(): number {
        return BlzGetUnitCollisionSize(this.unit);
    }

    public abilityCooldown(abilId: AbilId, level: number): number {
        return BlzGetUnitAbilityCooldown(this.unit, abilId.id, level);
    }

    public abilityCooldownRemaining(abilId: AbilId): number {
        return BlzGetUnitAbilityCooldownRemaining(this.unit, abilId.id);
    }

    public setAbilityCooldown(abilId: AbilId, level: number, cooldown: number): void {
        BlzSetUnitAbilityCooldown(this.unit, abilId.id, level, cooldown);
    }

    public endAbilityCooldown(abilId: AbilId): void {
        BlzEndUnitAbilityCooldown(this.unit, abilId.id);
    }

    public endAllAbilityCooldowns(): void {
        UnitResetCooldown(this.unit);
    }

    public abilityManaCost(abilId: AbilId, level: number): number {
        return BlzGetUnitAbilityManaCost(this.unit, abilId.id, level);
    }

    public setAbilityManaCost(abilId: AbilId, level: number, manaCost: number): void {
        BlzSetUnitAbilityManaCost(this.unit, abilId.id, level, manaCost);
    }

    public localZ(): number {
        return BlzGetLocalUnitZ(this.unit);
    }

    public z(): number {
        return BlzGetUnitZ(this.unit);
    }

    public alive(): boolean {
        return UnitAlive(this.unit);
    }

    public kill(): void {
        KillUnit(this.unit);
    }

    public show(show: boolean): void {
        ShowUnit(this.unit, show);
    }

    public life(): number {
        return GetUnitState(this.unit, UNIT_STATE_LIFE);
    }

    public setLife(newVal: number): void {
        SetUnitState(this.unit, UNIT_STATE_LIFE, newVal);
    }

    public mana(): number {
        return GetUnitState(this.unit, UNIT_STATE_MANA);
    }

    public setMana(newVal: number): void {
        SetUnitState(this.unit, UNIT_STATE_MANA, newVal);
    }

    public x(): number {
        return GetUnitX(this.unit);
    }

    public setX(newX: number): void {
        SetUnitX(this.unit, newX);
    }

    public y(): number {
        return GetUnitY(this.unit);
    }

    public setY(newY: number): void {
        SetUnitY(this.unit, newY);
    }

    public setXYWithCollision(x: number, y: number): void {
        SetUnitPosition(this.unit, x, y);
    }

    public setFacing(facingAngle: number, duration?: number): void {
        if (duration === undefined) {
            SetUnitFacing(this.unit, facingAngle);
        } else {
            SetUnitFacingTimed(this.unit, facingAngle, duration);
        }
    }

    public moveSpeed(): number {
        return GetUnitMoveSpeed(this.unit);
    }

    public defaultMoveSpeed(): number {
        return GetUnitDefaultMoveSpeed(this.unit);
    }

    public setMoveSpeed(newSpeed: number): void {
        SetUnitMoveSpeed(this.unit, newSpeed);
    }

    public flyHeight(): number {
        return GetUnitFlyHeight(this.unit);
    }

    public defaultFlyHeight(): number {
        return GetUnitDefaultFlyHeight(this.unit);
    }

    public setFlyHeight(newHeight: number, rate?: number): void {
        if (rate === undefined) {
            SetUnitFlyHeight(this.unit, newHeight, 0);
        } else {
            SetUnitFlyHeight(this.unit, newHeight, rate);
        }
    }

    public turnSpeed(): number {
        return GetUnitTurnSpeed(this.unit);
    }

    public defaultTurnSpeed(): number {
        return GetUnitDefaultTurnSpeed(this.unit);
    }

    public setTurnSpeed(newTurnSpeed: number): void {
        SetUnitTurnSpeed(this.unit, newTurnSpeed);
    }

    public propWindow(): number {
        return GetUnitPropWindow(this.unit);
    }

    public defaultPropWindow(): number {
        return GetUnitDefaultPropWindow(this.unit);
    }

    public setPropWindow(newPropWindowAngle: number): void {
        SetUnitPropWindow(this.unit, newPropWindowAngle);
    }

    public acquireRange(): number {
        return GetUnitAcquireRange(this.unit);
    }

    public defaultAcquireRange(): number {
        return GetUnitDefaultAcquireRange(this.unit);
    }

    public setAcquireRange(newAcquireRange: number): void {
        SetUnitAcquireRange(this.unit, newAcquireRange);
    }

    public setCreepGuard(creepGuard: boolean): void {
        SetUnitCreepGuard(this.unit, creepGuard);
    }

    public setOwner(whichPlayer: player, changeColor: boolean): void {
        SetUnitOwner(this.unit, whichPlayer, changeColor);
    }

    public setColor(whichColor: playercolor): void {
        SetUnitColor(this.unit, whichColor);
    }

    public setScale(x: number, y: number, z: number): void {
        SetUnitScale(this.unit, x, y, z);
    }

    public setTimeScale(timeScale: number): void {
        SetUnitTimeScale(this.unit, timeScale);
    }

    public setBlendTime(blendTime: number): void {
        SetUnitBlendTime(this.unit, blendTime);
    }

    public setVertexColor(red: number, green: number, blue: number, alpha: number): void {
        SetUnitVertexColor(this.unit, red, green, blue, alpha);
    }

    public queueAnimation(whichAnimation: string): void {
        QueueUnitAnimation(this.unit, whichAnimation);
    }

    public setAnimation(whichAnimation: string): void {
        SetUnitAnimation(this.unit, whichAnimation);
    }

    public setAnimationByIndex(whichAnimation: number): void {
        SetUnitAnimationByIndex(this.unit, whichAnimation);
    }

    public setAnimationWithRarity(whichAnimation: string, rarity: raritycontrol): void {
        SetUnitAnimationWithRarity(this.unit, whichAnimation, rarity);
    }

    public addAnimationProperties(animProperties: string, add: boolean): void {
        AddUnitAnimationProperties(this.unit, animProperties, add);
    }

    public setLookAt(whichBone: string, lookAtTarget: unit, x: number, y: number, z: number): void {
        SetUnitLookAt(this.unit, whichBone, lookAtTarget, x, y, z);
    }

    public resetLookAt(): void {
        ResetUnitLookAt(this.unit);
    }

    public setRescuable(byWhichPlayer: player, flag: boolean): void {
        SetUnitRescuable(this.unit, byWhichPlayer, flag);
    }

    public setRescueRange(range: number): void {
        SetUnitRescueRange(this.unit, range);
    }

    public heroStr(includeBonuses: boolean): number {
        return GetHeroStr(this.unit, includeBonuses);
    }

    public setHeroStr(newStr: number, permanent: boolean): void {
        SetHeroStr(this.unit, newStr, permanent);
    }

    public heroAgi(includeBonuses: boolean): number {
        return GetHeroAgi(this.unit, includeBonuses);
    }

    public setHeroAgi(newAgi: number, permanent: boolean): void {
        SetHeroAgi(this.unit, newAgi, permanent);
    }

    public heroInt(includeBonuses: boolean): number {
        return GetHeroInt(this.unit, includeBonuses);
    }

    public setHeroInt(newInt: number, permanent: boolean): void {
        SetHeroInt(this.unit, newInt, permanent);
    }

    public stripHeroLevel(howManyLevels: number): boolean {
        return UnitStripHeroLevel(this.unit, howManyLevels);
    }

    public heroXP(): number {
        return GetHeroXP(this.unit);
    }

    public setHeroXP(newXpVal: number, showEyeCandy: boolean): void {
        SetHeroXP(this.unit, newXpVal, showEyeCandy);
    }

    public addHeroXP(xpToAdd: number, showEyeCandy: boolean): void {
        AddHeroXP(this.unit, xpToAdd, showEyeCandy);
    }

    public suspendedXP(): boolean {
        return IsSuspendedXP(this.unit);
    }

    public suspendHeroXP(flag: boolean): void {
        SuspendHeroXP(this.unit, flag);
    }

    public heroSkillPoints(): number {
        return GetHeroSkillPoints(this.unit);
    }

    public modifySkillPoints(skillPointDelta: number): boolean {
        return UnitModifySkillPoints(this.unit, skillPointDelta);
    }

    public heroLevel(): number {
        return GetHeroLevel(this.unit);
    }

    public setHeroLevel(level: number, showEyeCandy: boolean): void {
        SetHeroLevel(this.unit, level, showEyeCandy);
    }

    public level(): number {
        return GetUnitLevel(this.unit);
    }

    public heroProperName(): string {
        return GetHeroProperName(this.unit);
    }

    public selectHeroSkill(abilcode: AbilId): void {
        SelectHeroSkill(this.unit, abilcode.id);
    }

    public abilityLevel(abilcode: AbilId): number {
        return GetUnitAbilityLevel(this.unit, abilcode.id);
    }

    public decAbilityLevel(abilcode: AbilId): number {
        return DecUnitAbilityLevel(this.unit, abilcode.id);
    }

    public incAbilityLevel(abilcode: AbilId): number {
        return IncUnitAbilityLevel(this.unit, abilcode.id);
    }

    public setAbilityLevel(abilcode: AbilId, level: number): number {
        return SetUnitAbilityLevel(this.unit, abilcode.id, level);
    }

    public reviveHero(x: number, y: number, doEyecandy: boolean): boolean {
        return ReviveHero(this.unit, x, y, doEyecandy);
    }

    public setExploded(exploded: boolean): void {
        SetUnitExploded(this.unit, exploded);
    }

    public setInvulnerable(flag: boolean): void {
        SetUnitInvulnerable(this.unit, flag);
    }

    public paused(): boolean {
        return IsUnitPaused(this.unit);
    }

    public pause(flag: boolean): void {
        PauseUnit(this.unit, flag);
    }

    public setPathing(flag: boolean): void {
        SetUnitPathing(this.unit, flag);
    }

    public select(flag: boolean): void {
        SelectUnit(this.unit, flag);
    }

    public pointValue(): number {
        return GetUnitPointValue(this.unit);
    }

    public pointValueByType(unitType: UnitId): number {
        return GetUnitPointValueByType(unitType.id);
    }

    public addItem(whichItem: item): boolean {
        return UnitAddItem(this.unit, whichItem);
    }

    public addItemById(itemId: ItemId): item {
        return UnitAddItemById(this.unit, itemId.id);
    }

    public addItemToSlotById(itemId: ItemId, itemSlot: number): boolean {
        return UnitAddItemToSlotById(this.unit, itemId.id, itemSlot);
    }

    public removeItem(whichItem: item): void {
        UnitRemoveItem(this.unit, whichItem);
    }

    public removeItemFromSlot(itemSlot: number): item {
        return UnitRemoveItemFromSlot(this.unit, itemSlot);
    }

    public containsItem(whichItem: item): boolean {
        return UnitHasItem(this.unit, whichItem);
    }

    public itemInSlot(itemSlot: number): item {
        return UnitItemInSlot(this.unit, itemSlot);
    }

    public inventorySize(): number {
        return UnitInventorySize(this.unit);
    }

    public dropItemPoint(whichItem: item, x: number, y: number): boolean {
        return UnitDropItemPoint(this.unit, whichItem, x, y);
    }

    public dropItemSlot(whichItem: item, slot: number): boolean {
        return UnitDropItemSlot(this.unit, whichItem, slot);
    }

    public dropItemTarget(whichItem: item, target: widget): boolean {
        return UnitDropItemTarget(this.unit, whichItem, target);
    }

    public useItem(whichItem: item): boolean {
        return UnitUseItem(this.unit, whichItem);
    }

    public useItemPoint(whichItem: item, x: number, y: number): boolean {
        return UnitUseItemPoint(this.unit, whichItem, x, y);
    }

    public useItemTarget(whichItem: item, target: widget): boolean {
        return UnitUseItemTarget(this.unit, whichItem, target);
    }

    public facing(): number {
        return GetUnitFacing(this.unit);
    }

    public state(whichUnitState: unitstate): number {
        return GetUnitState(this.unit, whichUnitState);
    }

    public owningPlayer(): player {
        return GetOwningPlayer(this.unit);
    }

    public typeId(): UnitId {
        return UnitId.byId(GetUnitTypeId(this.unit));
    }

    public race(): race {
        return GetUnitRace(this.unit);
    }

    public name(): string {
        return GetUnitName(this.unit);
    }

    public foodUsed(): number {
        return GetUnitFoodUsed(this.unit);
    }

    public foodMade(): number {
        return GetUnitFoodMade(this.unit);
    }

    public setUseFood(useFood: boolean): void {
        SetUnitUseFood(this.unit, useFood);
    }

    public rallyUnit(): unit {
        return GetUnitRallyUnit(this.unit);
    }

    public rallyDestructable(): destructable {
        return GetUnitRallyDestructable(this.unit);
    }

    public isInGroup(whichGroup: group): boolean {
        return IsUnitInGroup(this.unit, whichGroup);
    }

    public isInForce(whichForce: force): boolean {
        return IsUnitInForce(this.unit, whichForce);
    }

    public isOwnedByPlayer(whichPlayer: player): boolean {
        return IsUnitOwnedByPlayer(this.unit, whichPlayer);
    }

    public isAlly(whichPlayer: player): boolean {
        return IsUnitAlly(this.unit, whichPlayer);
    }

    public isEnemy(whichPlayer: player): boolean {
        return IsUnitEnemy(this.unit, whichPlayer);
    }

    public isVisible(whichPlayer: player): boolean {
        return IsUnitVisible(this.unit, whichPlayer);
    }

    public isDetected(whichPlayer: player): boolean {
        return IsUnitDetected(this.unit, whichPlayer);
    }

    public isInvisible(whichPlayer: player): boolean {
        return IsUnitInvisible(this.unit, whichPlayer);
    }

    public isFogged(whichPlayer: player): boolean {
        return IsUnitFogged(this.unit, whichPlayer);
    }

    public isMasked(whichPlayer: player): boolean {
        return IsUnitMasked(this.unit, whichPlayer);
    }

    public isSelected(whichPlayer: player): boolean {
        return IsUnitSelected(this.unit, whichPlayer);
    }

    public isRace(whichRace: race): boolean {
        return IsUnitRace(this.unit, whichRace);
    }

    public isType(whichUnitType: unitclass): boolean {
        return IsUnitType(this.unit, whichUnitType);
    }

    public inRangeUnit(otherUnit: unit, distance: number): boolean {
        return IsUnitInRange(this.unit, otherUnit, distance);
    }

    public inRangeXY(midX: number, midY: number, radius: number): boolean {
        return IsUnitInRangeXY(this.unit, midX, midY, radius);
    }

    public hidden(): boolean {
        return IsUnitHidden(this.unit);
    }

    public illusion(): boolean {
        return IsUnitIllusion(this.unit);
    }

    public inTransport(whichTransport: unit): boolean {
        return IsUnitInTransport(this.unit, whichTransport);
    }

    public loaded(): boolean {
        return IsUnitLoaded(this.unit);
    }

    public shareVision(whichPlayer: player, share: boolean): void {
        UnitShareVision(this.unit, whichPlayer, share);
    }

    public suspendDecay(suspend: boolean): void {
        UnitSuspendDecay(this.unit, suspend);
    }

    public addType(whichUnitType: unitclass): boolean {
        return UnitAddType(this.unit, whichUnitType);
    }

    public removeType(whichUnitType: unitclass): boolean {
        return UnitRemoveType(this.unit, whichUnitType);
    }

    public addAbility(abilityId: AbilId): boolean {
        return UnitAddAbility(this.unit, abilityId.id);
    }

    public removeAbility(abilityId: AbilId): boolean {
        return UnitRemoveAbility(this.unit, abilityId.id);
    }

    public makeAbilityPermanent(permanent: boolean, abilityId: AbilId): boolean {
        return UnitMakeAbilityPermanent(this.unit, permanent, abilityId.id);
    }

    public removeBuffs(removePositive: boolean, removeNegative: boolean): void {
        UnitRemoveBuffs(this.unit, removePositive, removeNegative);
    }

    public removeBuffsEx(removePositive: boolean,
                         removeNegative: boolean,
                         magic: boolean,
                         physical: boolean,
                         timedLife: boolean,
                         aura: boolean,
                         autoDispel: boolean): void {
        UnitRemoveBuffsEx(this.unit, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel);
    }

    public containsBuffsEx(removePositive: boolean,
                           removeNegative: boolean,
                           magic: boolean,
                           physical: boolean,
                           timedLife: boolean,
                           aura: boolean,
                           autoDispel: boolean): boolean {
        return UnitHasBuffsEx(this.unit, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel);
    }

    public countBuffsEx(removePositive: boolean,
                        removeNegative: boolean,
                        magic: boolean,
                        physical: boolean,
                        timedLife: boolean,
                        aura: boolean,
                        autoDispel: boolean): number {
        return UnitCountBuffsEx(this.unit, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel);
    }

    public addSleep(add: boolean): void {
        UnitAddSleep(this.unit, add);
    }

    public canSleep(): boolean {
        return UnitCanSleep(this.unit);
    }

    public addSleepPerm(add: boolean): void {
        UnitAddSleepPerm(this.unit, add);
    }

    public canSleepPerm(): boolean {
        return UnitCanSleepPerm(this.unit);
    }

    public sleeping(): boolean {
        return UnitIsSleeping(this.unit);
    }

    public wakeUp(): void {
        UnitWakeUp(this.unit);
    }

    public applyTimedLife(buffId: BuffId, duration: number): void {
        UnitApplyTimedLife(this.unit, buffId.id, duration);
    }

    public ignoreAlarm(flag: boolean): boolean {
        return UnitIgnoreAlarm(this.unit, flag);
    }

    public ignoreAlarmToggled(): boolean {
        return UnitIgnoreAlarmToggled(this.unit);
    }

    public setConstructionProgress(constructionPercentage: number): void {
        UnitSetConstructionProgress(this.unit, constructionPercentage);
    }

    public setUpgradeProgress(upgradePercentage: number): void {
        UnitSetUpgradeProgress(this.unit, upgradePercentage);
    }

    public pauseTimedLife(flag: boolean): void {
        UnitPauseTimedLife(this.unit, flag);
    }

    public setUsesAltIcon(flag: boolean): void {
        UnitSetUsesAltIcon(this.unit, flag);
    }

    public damagePoint(delay: number,
                       midX: number,
                       midY: number,
                       radius: number,
                       amount: number,
                       attack: boolean,
                       ranged: boolean,
                       attackType: attacktype,
                       damageType: damagetype,
                       weaponType: weapontype): boolean {
        return UnitDamagePoint(this.unit, delay, radius, midX, midY, amount, attack, ranged, attackType, damageType, weaponType);
    }

    public damageTarget(target: widget,
                        amount: number,
                        attack: boolean,
                        ranged: boolean,
                        attackType: attacktype,
                        damageType: damagetype,
                        weaponType: weapontype): boolean {
        return UnitDamageTarget(this.unit, target, amount, attack, ranged, attackType, damageType, weaponType);
    }

    public currentOrder(): OrderId {
        return OrderId.byId(GetUnitCurrentOrder(this.unit));
    }

    public issueImmediateOrder(order: OrderId): boolean {
        return IssueImmediateOrderById(this.unit, order.id);
    }

    public issuePointOrder(order: OrderId, x: number, y: number): boolean {
        return IssuePointOrderById(this.unit, order.id, x, y);
    }

    public issueTargetOrder(order: OrderId, targetWidget: widget): boolean {
        return IssueTargetOrderById(this.unit, order.id, targetWidget);
    }

    public issueInstantPointOrder(order: OrderId, x: number, y: number, instantTargetWidget: widget): boolean {
        return IssueInstantPointOrderById(this.unit, order.id, x, y, instantTargetWidget);
    }

    public issueInstantTargetOrder(order: OrderId, targetWidget: widget, instantTargetWidget: widget): boolean {
        return IssueInstantTargetOrderById(this.unit, order.id, targetWidget, instantTargetWidget);
    }

    public issueBuildOrder(whichPeon: unit, unitId: UnitId, x: number, y: number): boolean {
        return IssueBuildOrderById(this.unit, unitId.id, x, y);
    }

    public issueNeutralImmediateOrder(forWhichPlayer: player, unitId: UnitId): boolean {
        return IssueNeutralImmediateOrderById(forWhichPlayer, this.unit, unitId.id);
    }

    public issueNeutralPointOrder(forWhichPlayer: player, unitId: UnitId, x: number, y: number): boolean {
        return IssueNeutralPointOrderById(forWhichPlayer, this.unit, unitId.id, x, y);
    }

    public issueNeutralTargetOrder(forWhichPlayer: player, unitId: UnitId, target: widget): boolean {
        return IssueNeutralTargetOrderById(forWhichPlayer, this.unit, unitId.id, target);
    }

    public resourceAmount(): number {
        return GetResourceAmount(this.unit);
    }

    public setResourceAmount(amount: number): void {
        SetResourceAmount(this.unit, amount);
    }

    public addResourceAmount(amount: number): void {
        AddResourceAmount(this.unit, amount);
    }

    public waygateDestinationX(): number {
        return WaygateGetDestinationX(this.unit);
    }

    public waygateDestinationY(): number {
        return WaygateGetDestinationY(this.unit);
    }

    public setWaygateDestination(x: number, y: number): void {
        WaygateSetDestination(this.unit, x, y);
    }

    public waygateEnabled(): boolean {
        return WaygateIsActive(this.unit);
    }

    public waygateEnable(enable: boolean): void {
        WaygateActivate(this.unit, enable);
    }

    public addItemToStock(itemId: ItemId, currentStock: number, stockMax: number): void {
        AddItemToStock(this.unit, itemId.id, currentStock, stockMax);
    }

    public addUnitIdToStock(unitId: UnitId, currentStock: number, stockMax: number): void {
        AddUnitToStock(this.unit, unitId.id, currentStock, stockMax);
    }

    public removeItemFromStock(itemId: ItemId): void {
        RemoveItemFromStock(this.unit, itemId.id);
    }

    public removeUnitIdFromStock(unitId: UnitId): void {
        RemoveUnitFromStock(this.unit, unitId.id);
    }

    public setItemIdSlots(slots: number): void {
        SetItemTypeSlots(this.unit, slots);
    }

    public setUnitIdSlots(slots: number): void {
        SetUnitTypeSlots(this.unit, slots);
    }

    public ability(abilId: AbilId): ability {
        return BlzGetUnitAbility(this.unit, abilId.id);
    }

    public abilityByIndex(index: number): ability {
        return BlzGetUnitAbilityByIndex(this.unit, index);
    }

    public pauseEx(flag: boolean): void {
        BlzPauseUnitEx(this.unit, flag);
    }

    public addIndicator(red: number, green: number, blue: number, alpha: number): void {
        UnitAddIndicator(this.unit, red, green, blue, alpha);
    }
}

export class Group {
    constructor() {
        this.group = CreateGroup();
    }

    public group: group;

    public destroy(): void {
        DestroyGroup(this.group);
    }

    public addUnit(whichUnit: unit): boolean {
        return GroupAddUnit(this.group, whichUnit);
    }

    public removeUnit(whichUnit: unit): boolean {
        return GroupRemoveUnit(this.group, whichUnit);
    }

    public addGroupFast(addGroup: group): number {
        return BlzGroupAddGroupFast(this.group, addGroup);
    }

    public removeGroupFast(removeGroup: group): number {
        return BlzGroupRemoveGroupFast(this.group, removeGroup);
    }

    public clear(): void {
        GroupClear(this.group);
    }

    public size(): number {
        return BlzGroupGetSize(this.group);
    }

    public at(index: number): unit {
        return BlzGroupUnitAt(this.group, index);
    }

    public first(): unit {
        return FirstOfGroup(this.group);
    }

    public enumUnitsOfType(unitname: string, filter: boolexpr): void {
        GroupEnumUnitsOfType(this.group, unitname, filter);
    }

    public enumUnitsOfPlayer(whichPlayer: player, filter: boolexpr, countLimit?: number): void {
        GroupEnumUnitsOfPlayer(this.group, whichPlayer, filter);
    }

    public enumUnitsInRect(r: rect, filter: boolexpr, countLimit?: number): void {
        if (countLimit === undefined) {
            GroupEnumUnitsInRect(this.group, r, filter);
        } else {
            GroupEnumUnitsInRectCounted(this.group, r, filter, countLimit);
        }
    }

    public enumUnitsInRange(midX: number, midY: number, radius: number, filter?: boolexpr | null, countLimit?: number): void {
        if (countLimit === undefined) {
            GroupEnumUnitsInRange(this.group, midX, midY, radius, filter === undefined ? null : filter);
        } else {
            GroupEnumUnitsInRangeCounted(this.group,
                                         midX,
                                         midY,
                                         radius,
                                         filter === undefined ? null : filter,
                                         countLimit);
        }
    }

    public enumUnitsSelected(whichPlayer: player, filter?: boolexpr | undefined): void {
        GroupEnumUnitsSelected(this.group, whichPlayer, filter === undefined ? null : filter);
    }

    public issueImmediateOrder(order: OrderId): boolean {
        return GroupImmediateOrderById(this.group, order.id);
    }

    public issuePointOrderXY(order: OrderId, x: number, y: number): boolean {
        return GroupPointOrderById(this.group, order.id, x, y);
    }

    public issueTargetOrder(order: OrderId, targetWidget: widget): boolean {
        return GroupTargetOrderById(this.group, order.id, targetWidget);
    }

    public for(callback: () => void): void {

    }
}

type unitBoolExpr = (u: Unit) => boolean;

export class UnitListFactory {
    public static dummyGroup: group = CreateGroup();
    public static resultList: Unit[];
    public static dummyFilter: boolexpr = Filter(() => {
        const u: Unit = Unit.byUnit(GetFilterUnit());

        UnitListFactory.resultList.push(u);

        return false;
    });
    public static dummyFilterWithUserFilter: boolexpr = Filter(() => {
        const u: Unit = Unit.byUnit(GetFilterUnit());

        if (UnitListFactory.userFilter(u)) {
            UnitListFactory.resultList.push(u);
        }

        return false;
    });
    public static userFilter: unitBoolExpr = (u: Unit) => {
        return true;
    };

    public static enumUnitsOfType(unitname: string, filter?: unitBoolExpr | undefined): Unit[] {
        this.resultList = [];

        let proxyFilter: boolexpr;

        if (filter === undefined) {
            proxyFilter = this.dummyFilter;
        } else {
            proxyFilter = this.dummyFilterWithUserFilter;
            this.userFilter = filter;
        }

        GroupEnumUnitsOfType(this.dummyGroup, unitname, proxyFilter);

        return this.resultList;
    }

    public static enumUnitsOfPlayer(whichPlayer: player, filter?: unitBoolExpr | undefined): Unit[] {
        this.resultList = [];

        let proxyFilter: boolexpr;

        if (filter === undefined) {
            proxyFilter = this.dummyFilter;
        } else {
            proxyFilter = this.dummyFilterWithUserFilter;
            this.userFilter = filter;
        }

        GroupEnumUnitsOfPlayer(this.dummyGroup, whichPlayer, proxyFilter);

        return this.resultList;
    }

    public static enumUnitsInRect(r: rect, filter?: unitBoolExpr | undefined, countLimit?: number): Unit[] {
        this.resultList = [];

        let proxyFilter: boolexpr;

        if (filter === undefined) {
            proxyFilter = this.dummyFilter;
        } else {
            proxyFilter = this.dummyFilterWithUserFilter;
            this.userFilter = filter;
        }

        if (countLimit === undefined) {
            GroupEnumUnitsInRect(this.dummyGroup, r, proxyFilter);
        } else {
            GroupEnumUnitsInRectCounted(this.dummyGroup, r, proxyFilter, countLimit);
        }

        return this.resultList;
    }

    public static enumUnitsInRange(midX: number,
                                   midY: number,
                                   radius: number,
                                   filter?: unitBoolExpr | undefined,
                                   countLimit?: number): Unit[] {
        this.resultList = [];

        let proxyFilter: boolexpr;

        if (filter === undefined) {
            proxyFilter = this.dummyFilter;
        } else {
            proxyFilter = this.dummyFilterWithUserFilter;
            this.userFilter = filter;
        }

        if (countLimit === undefined) {
            GroupEnumUnitsInRange(this.dummyGroup, midX, midY, radius, proxyFilter);
        } else {
            GroupEnumUnitsInRangeCounted(this.dummyGroup, midX, midY, radius, proxyFilter, countLimit);
        }

        return this.resultList;
    }

    public static enumUnitsSelected(whichPlayer: player, filter?: unitBoolExpr | undefined): Unit[] {
        this.resultList = [];

        let proxyFilter: boolexpr;

        if (filter === undefined) {
            proxyFilter = this.dummyFilter;
        } else {
            proxyFilter = this.dummyFilterWithUserFilter;
            this.userFilter = filter;
        }

        GroupEnumUnitsSelected(this.dummyGroup, whichPlayer, proxyFilter);

        return this.resultList;
    }
}
