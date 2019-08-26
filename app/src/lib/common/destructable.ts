export class Destructable {

    constructor(destr: destructable) {
        this.destr = destr;
        Destructable._byDestr.set(destr, this);
    }

    public static _byDestr: Map<destructable, Destructable> = new Map<destructable, Destructable>();

    public destr: destructable;

    public static Create(objectid: number, x: number, y: number, face: number, scale: number, variation: number): Destructable {
        return new Destructable(CreateDestructable(objectid, x, y, face, scale, variation));
    }

    public static CreateZ(objectid: number, x: number, y: number, z: number, face: number, scale: number, variation: number): Destructable {
        return new Destructable(CreateDestructableZ(objectid, x, y, z, face, scale, variation));
    }

    public static CreateDead(objectid: number, x: number, y: number, face: number, scale: number, variation: number): Destructable {
        return new Destructable(CreateDeadDestructable(objectid, x, y, face, scale, variation));
    }

    public static CreateDeadZ(objectid: number,
                              x: number,
                              y: number,
                              z: number,
                              face: number,
                              scale: number,
                              variation: number): Destructable {
        return new Destructable(CreateDeadDestructableZ(objectid, x, y, z, face, scale, variation));
    }

    public static ByDestr(destr: destructable): Destructable {
        return Destructable._byDestr.has(destr) ? Destructable._byDestr.get(destr) as Destructable : new Destructable(destr);
    }

    public static FilterDestructable(): Destructable {
        return this.ByDestr(GetFilterDestructable());
    }

    public static EnumDestructable(): Destructable {
        return this.ByDestr(GetEnumDestructable());
    }

    public static OrderTargetDestructable(): Destructable {
        return this.ByDestr(GetOrderTargetDestructable());
    }

    public static SpellTargetDestructable(): Destructable {
        return this.ByDestr(GetSpellTargetDestructable());
    }

    public static TriggerDestructable(): Destructable {
        return this.ByDestr(GetTriggerDestructable());
    }

    public static EnumInRect(r: rect, filter: boolexpr, actionFunc: () => void): void {
        EnumDestructablesInRect(r, filter, () => actionFunc);
    }

    public Destroy(): void {
        RemoveDestructable(this.destr);
    }

    public Kill(): void {
        KillDestructable(this.destr);
    }

    public SetInvulnerable(flag: boolean): void {
        SetDestructableInvulnerable(this.destr, flag);
    }

    public IsInvulnerable(): boolean {
        return IsDestructableInvulnerable(this.destr);
    }

    public TypeId(): number {
        return GetDestructableTypeId(this.destr) as number;
    }

    public x(): number {
        return GetDestructableX(this.destr);
    }

    public y(): number {
        return GetDestructableY(this.destr);
    }

    public life(): number {
        return GetDestructableLife(this.destr);
    }

    public SetLife(life: number): void {
        SetDestructableLife(this.destr, life);
    }

    public MaxLife(): number {
        return GetDestructableMaxLife(this.destr);
    }

    public SetMaxLife(max: number): void {
        SetDestructableMaxLife(this.destr, max);
    }

    public RestoreLife(life: number, birth: boolean): void {
        DestructableRestoreLife(this.destr, life, birth);
    }

    public SetAnimation(whichAnimation: string): void {
        SetDestructableAnimation(this.destr, whichAnimation);
    }

    public QueueAnimation(whichAnimation: string): void {
        QueueDestructableAnimation(this.destr, whichAnimation);
    }

    public SetAnimationSpeed(speedFactor: number): void {
        SetDestructableAnimationSpeed(this.destr, speedFactor);
    }

    public Show(flag: boolean): void {
        ShowDestructable(this.destr, flag);
    }

    public OccluderHeight(): number {
        return GetDestructableOccluderHeight(this.destr);
    }

    public SetOccluderHeight(height: number): void {
        SetDestructableOccluderHeight(this.destr, height);
    }

    public GetName(): string {
        return GetDestructableName(this.destr);
    }
}
