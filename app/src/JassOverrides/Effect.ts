export class Effect {
    readonly eff: effect;

    constructor(eff: effect) {
        this.eff = eff;
    }

    public Destroy(): void {
        DestroyEffect(this.eff);
    }
}
