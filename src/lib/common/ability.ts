export class BuffId {
    constructor(id: number) {
        this.id = id;
    }

    public id: number;

    public static byId(id: number): BuffId {
        return new BuffId(id);
    }
}

export class AbilId {
    constructor(id: number) {
        this.id = id;
    }

    public static FIRST_LEVEL: number = 0;

    public id: number;

    public static byId(id: number): AbilId {
        return new AbilId(id);
    }

    public static fromString(abilityIdString: string): AbilId {
        return this.byId(AbilityId(abilityIdString));
    }

    public static learnedSkill(): AbilId {
        return this.byId(GetLearnedSkill());
    }

    public static learnedSkillLevel(): number {
        return GetLearnedSkillLevel();
    }

    public static spellAbilityId(): AbilId {
        return this.byId(GetSpellAbilityId());
    }

    public toInt(): number {
        return this.id;
    }

    public toString(): string {
        return AbilityId2String(this.id);
    }

    public tooltip(level?: number): string {
        return BlzGetAbilityTooltip(this.id, level === undefined ? AbilId.FIRST_LEVEL : level);
    }

    public setTooltip(tooltip: string, level?: number): void {
        BlzSetAbilityTooltip(this.id, tooltip, level === undefined ? AbilId.FIRST_LEVEL : level);
    }

    public activatedTooltip(level?: number): string {
        return BlzGetAbilityActivatedTooltip(this.id, level === undefined ? AbilId.FIRST_LEVEL : level);
    }

    public setActivatedTooltip(tooltip: string, level?: number): void {
        BlzSetAbilityActivatedTooltip(this.id, tooltip, level === undefined ? AbilId.FIRST_LEVEL : level);
    }

    public extendedTooltip(level?: number): string {
        return BlzGetAbilityExtendedTooltip(this.id, level === undefined ? AbilId.FIRST_LEVEL : level);
    }

    public setExtendedTooltip(extendedTooltip: string, level?: number): void {
        BlzSetAbilityExtendedTooltip(this.id, extendedTooltip, level === undefined ? AbilId.FIRST_LEVEL : level);
    }

    public activatedExtendedTooltip(level?: number): string {
        return BlzGetAbilityActivatedExtendedTooltip(this.id, level === undefined ? AbilId.FIRST_LEVEL : level);
    }

    public setActivatedExtendedTooltip(extendedTooltip: string, level?: number): void {
        BlzSetAbilityActivatedExtendedTooltip(this.id, extendedTooltip, level === undefined ? AbilId.FIRST_LEVEL : level);
    }

    public researchTooltip(level?: number): string {
        return BlzGetAbilityResearchTooltip(this.id, level === undefined ? AbilId.FIRST_LEVEL : level);
    }

    public setResearchTooltip(researchTooltip: string, level?: number): void {
        BlzSetAbilityResearchTooltip(this.id, researchTooltip, level === undefined ? AbilId.FIRST_LEVEL : level);
    }

    public researchExtendedTooltip(level: number): string {
        return BlzGetAbilityResearchExtendedTooltip(this.id, level === undefined ? AbilId.FIRST_LEVEL : level);
    }

    public setResearchExtendedTooltip(researchExtendedTooltip: string, level?: number): void {
        BlzSetAbilityResearchExtendedTooltip(this.id, researchExtendedTooltip, level === undefined ? AbilId.FIRST_LEVEL : level);
    }

    public icon(): string {
        return BlzGetAbilityIcon(this.id);
    }

    public setIcon(iconPath: string): void {
        BlzSetAbilityActivatedIcon(this.id, iconPath);
    }

    public activatedIcon(): string {
        return BlzGetAbilityActivatedIcon(this.id);
    }

    public setActivatedIcon(iconPath: string): void {
        BlzSetAbilityActivatedIcon(this.id, iconPath);
    }

    public GetX(): number {
        return BlzGetAbilityPosX(this.id);
    }

    public GetY(): number {
        return BlzGetAbilityPosY(this.id);
    }

    public setX(x: number): void {
        BlzSetAbilityPosX(this.id, x);
    }

    public setY(y: number): void {
        BlzSetAbilityPosY(this.id, y);
    }

    public activatedX(): number {
        return BlzGetAbilityActivatedPosX(this.id);
    }

    public activatedY(): number {
        return BlzGetAbilityActivatedPosY(this.id);
    }

    public setActivatedX(x: number): void {
        BlzSetAbilityActivatedPosX(this.id, x);
    }

    public setActivatedY(y: number): void {
        BlzSetAbilityActivatedPosY(this.id, y);
    }

    public manaCost(level?: number): number {
        return BlzGetAbilityManaCost(this.id, level === undefined ? AbilId.FIRST_LEVEL : level);
    }

    public cooldown(level?: number): number {
        return BlzGetAbilityCooldown(this.id, level === undefined ? AbilId.FIRST_LEVEL : level);
    }

    public effect(t: effecttype, index: number): string {
        return GetAbilityEffectById(this.id, t, index);
    }

    public sound(t: soundtype): string {
        return GetAbilitySoundById(this.id, t);
    }
}

export class Abil {
    constructor(abil: ability) {
        this.abil = abil;
    }

    public static FIRST_LEVEL: number = 0;

    public abil: ability;

    public static spellAbility(): Abil {
        return new Abil(GetSpellAbility());
    }

    public booleanField(whichField: abilitybooleanfield): boolean {
        return BlzGetAbilityBooleanField(this.abil, whichField);
    }

    public intField(whichField: abilityintegerfield): number {
        return BlzGetAbilityIntegerField(this.abil, whichField);
    }

    public realField(whichField: abilityrealfield): number {
        return BlzGetAbilityRealField(this.abil, whichField);
    }

    public stringField(whichField: abilitystringfield): string {
        return BlzGetAbilityStringField(this.abil, whichField);
    }

    public booleanLevelField(whichField: abilitybooleanlevelfield, level?: number): boolean {
        return BlzGetAbilityBooleanLevelField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level);
    }

    public intLevelField(whichField: abilityintegerlevelfield, level?: number): number {
        return BlzGetAbilityIntegerLevelField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level);
    }

    public realLevelField(whichField: abilityreallevelfield, level?: number): number {
        return BlzGetAbilityRealLevelField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level);
    }

    public stringLevelField(whichField: abilitystringlevelfield, level?: number): string {
        return BlzGetAbilityStringLevelField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level);
    }

    public booleanLevelArrayField(whichField: abilitybooleanlevelarrayfield, index: number, level?: number): boolean {
        return BlzGetAbilityBooleanLevelArrayField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, index);
    }

    public intLevelArrayField(whichField: abilityintegerlevelarrayfield, index: number, level?: number): number {
        return BlzGetAbilityIntegerLevelArrayField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, index);
    }

    public realLevelArrayField(whichField: abilityreallevelarrayfield, index: number, level?: number): number {
        return BlzGetAbilityRealLevelArrayField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, index);
    }

    public stringLevelArrayField(whichField: abilitystringlevelarrayfield, index: number, level?: number): string {
        return BlzGetAbilityStringLevelArrayField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, index);
    }

    public setBooleanField(whichField: abilitybooleanfield, value: boolean): boolean {
        return BlzSetAbilityBooleanField(this.abil, whichField, value);
    }

    public setIntField(whichField: abilityintegerfield, value: number): boolean {
        return BlzSetAbilityIntegerField(this.abil, whichField, value);
    }

    public setRealField(whichField: abilityrealfield, value: number): boolean {
        return BlzSetAbilityRealField(this.abil, whichField, value);
    }

    public setStringField(whichField: abilitystringfield, value: string): boolean {
        return BlzSetAbilityStringField(this.abil, whichField, value);
    }

    public setBooleanLevelField(whichField: abilitybooleanlevelfield, value: boolean, level?: number): boolean {
        return BlzSetAbilityBooleanLevelField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, value);
    }

    public setIntLevelField(whichField: abilityintegerlevelfield, value: number, level?: number): boolean {
        return BlzSetAbilityIntegerLevelField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, value);
    }

    public setRealLevelField(whichField: abilityreallevelfield, value: number, level?: number): boolean {
        return BlzSetAbilityRealLevelField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, value);
    }

    public setStringLevelField(whichField: abilitystringlevelfield, value: string, level?: number): boolean {
        return BlzSetAbilityStringLevelField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, value);
    }

    public setBooleanLevelArrayField(whichField: abilitybooleanlevelarrayfield, index: number, value: boolean, level?: number): boolean {
        return BlzSetAbilityBooleanLevelArrayField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, index, value);
    }

    public setIntLevelArrayField(whichField: abilityintegerlevelarrayfield, index: number, value: number, level?: number): boolean {
        return BlzSetAbilityIntegerLevelArrayField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, index, value);
    }

    public setRealLevelArrayField(whichField: abilityreallevelarrayfield, index: number, value: number, level?: number): boolean {
        return BlzSetAbilityRealLevelArrayField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, index, value);
    }

    public setStringLevelArrayField(whichField: abilitystringlevelarrayfield, index: number, value: string, level?: number): boolean {
        return BlzSetAbilityStringLevelArrayField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, index, value);
    }

    public addBooleanLevelArrayField(whichField: abilitybooleanlevelarrayfield, value: boolean, level?: number): boolean {
        return BlzAddAbilityBooleanLevelArrayField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, value);
    }

    public addIntLevelArrayField(whichField: abilityintegerlevelarrayfield, value: number, level?: number): boolean {
        return BlzAddAbilityIntegerLevelArrayField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, value);
    }

    public addRealLevelArrayField(whichField: abilityreallevelarrayfield, value: number, level?: number): boolean {
        return BlzAddAbilityRealLevelArrayField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, value);
    }

    public addStringLevelArrayField(whichField: abilitystringlevelarrayfield, value: string, level?: number): boolean {
        return BlzAddAbilityStringLevelArrayField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, value);
    }

    public removeBooleanLevelArrayField(whichField: abilitybooleanlevelarrayfield, value: boolean, level?: number): boolean {
        return BlzRemoveAbilityBooleanLevelArrayField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, value);
    }

    public removeIntLevelArrayField(whichField: abilityintegerlevelarrayfield, value: number, level?: number): boolean {
        return BlzRemoveAbilityIntegerLevelArrayField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, value);
    }

    public removeRealLevelArrayField(whichField: abilityreallevelarrayfield, value: number, level?: number): boolean {
        return BlzRemoveAbilityRealLevelArrayField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, value);
    }

    public removeStringLevelArrayField(whichField: abilitystringlevelarrayfield, value: string, level?: number): boolean {
        return BlzRemoveAbilityStringLevelArrayField(this.abil, whichField, level === undefined ? Abil.FIRST_LEVEL : level, value);
    }
}
