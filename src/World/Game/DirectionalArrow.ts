import { Effect } from '../../JassOverrides/Effect';
import { HologramCheckpointDistance } from '../Holograms/HologramCheckpointDistance';

export class DirectionalArrow {
    private effects: Effect[];

    constructor(modelPath: string,
                firstCheckpointX: number, firstCheckpointY: number, secondCheckpointX: number, secondCheckpointY: number) {
        const dist: HologramCheckpointDistance = new HologramCheckpointDistance(
            secondCheckpointX - firstCheckpointX, secondCheckpointY - firstCheckpointY);
        this.effects = [
            // Before first checkpoint
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 2 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 2 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 3 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 3 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 4 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 4 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 5 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 5 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 6 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 6 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 7 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 7 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 8 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 8 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 9 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 9 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 10 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 10 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 11 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 11 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 12 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 12 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 3 * dist.xDividedBy36 + dist.yDividedBy36, firstCheckpointY - dist.yDividedBy9 - 3 * dist.yDividedBy36 + dist.xDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 4 * dist.xDividedBy36 + 2 * dist.yDividedBy36, firstCheckpointY - dist.yDividedBy9 - 4 * dist.yDividedBy36 + 2 * dist.xDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 5 * dist.xDividedBy36 + 3 * dist.yDividedBy36, firstCheckpointY - dist.yDividedBy9 - 5 * dist.yDividedBy36 + 3 * dist.xDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 3 * dist.xDividedBy36 - dist.yDividedBy36, firstCheckpointY - dist.yDividedBy9 - 3 * dist.yDividedBy36 - dist.xDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 4 * dist.xDividedBy36 - 2 * dist.yDividedBy36, firstCheckpointY - dist.yDividedBy9 - 4 * dist.yDividedBy36 - 2 * dist.xDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 5 * dist.xDividedBy36 - 3 * dist.yDividedBy36, firstCheckpointY - dist.yDividedBy9 - 5 * dist.yDividedBy36 - 3 * dist.xDividedBy36)),

            // Between checkpoints
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 2 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 2 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 3 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 3 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 4 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 4 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 5 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 5 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 6 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 6 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 7 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 7 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 8 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 8 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 9 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 9 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 10 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 10 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 11 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 11 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 12 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 12 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 11 * dist.xDividedBy36 + dist.yDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 11 * dist.yDividedBy36 + dist.xDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 10 * dist.xDividedBy36 + 2 * dist.yDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 10 * dist.yDividedBy36 + 2 * dist.xDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 9 * dist.xDividedBy36 + 3 * dist.yDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 9 * dist.yDividedBy36 + 3 * dist.xDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 11 * dist.xDividedBy36 - dist.yDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 11 * dist.yDividedBy36 - dist.xDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 10 * dist.xDividedBy36 - 2 * dist.yDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 10 * dist.yDividedBy36 - 2 * dist.xDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 9 * dist.xDividedBy36 - 3 * dist.yDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 9 * dist.yDividedBy36 - 3 * dist.xDividedBy36)),

            // After second checkpoint
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 2 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 2 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 3 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 3 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 4 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 4 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 5 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 5 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 6 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 6 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 7 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 7 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 8 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 8 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 9 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 9 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 10 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 10 * dist.yDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 9 * dist.xDividedBy36 + dist.yDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 9 * dist.yDividedBy36 + dist.xDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 8 * dist.xDividedBy36 + 2 * dist.yDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 8 * dist.yDividedBy36 + 2 * dist.xDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 7 * dist.xDividedBy36 + 3 * dist.yDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 7 * dist.yDividedBy36 + 3 * dist.xDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 9 * dist.xDividedBy36 - dist.yDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 9 * dist.yDividedBy36 - dist.xDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 8 * dist.xDividedBy36 - 2 * dist.yDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 8 * dist.yDividedBy36 - 2 * dist.xDividedBy36)),
            new Effect(AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 7 * dist.xDividedBy36 - 3 * dist.yDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 7 * dist.yDividedBy36 - 3 * dist.xDividedBy36)),
        ];
    }

    public Destroy(): void {
        let eff: Effect | undefined = this.effects.pop();
        while (eff !== undefined) {
            eff.Destroy();
            eff = this.effects.pop();
        }
    }
}
