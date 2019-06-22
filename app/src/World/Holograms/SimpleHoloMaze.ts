import { AbstractHologramMaze } from './AbstractHologramMaze';
import { Image } from '../../JassOverrides/Image';
import { HologramCheckpointDistance } from './HologramCheckpointDistance';

export class SimpleHoloMaze extends AbstractHologramMaze {
    constructor(imagePath: string, firstCheckpointX: number, firstCheckpointY: number, secondCheckpointX: number, secondCheckpointY: number) {
        super();
        const dist = new HologramCheckpointDistance(secondCheckpointX - firstCheckpointX, secondCheckpointY - firstCheckpointY);

        // Between Checkpoints
        this.images.push(new Image(imagePath, 192, firstCheckpointX + dist.xDividedBy9, firstCheckpointY + dist.yDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX + 2 * dist.xDividedBy9, firstCheckpointY + 2 * dist.yDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX + 3 * dist.xDividedBy9, firstCheckpointY + 3 * dist.yDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX + 4 * dist.xDividedBy9, firstCheckpointY + 4 * dist.yDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX + 5 * dist.xDividedBy9, firstCheckpointY + 5 * dist.yDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX + 6 * dist.xDividedBy9, firstCheckpointY + 6 * dist.yDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX + 7 * dist.xDividedBy9, firstCheckpointY + 7 * dist.yDividedBy9, 0.00));

        // Around first checkpoint
        this.images.push(new Image(imagePath, 192, firstCheckpointX - dist.yDividedBy9, firstCheckpointY - dist.xDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX - dist.xDividedBy9, firstCheckpointY - dist.yDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX + dist.yDividedBy9 - dist.xDividedBy18, firstCheckpointY - dist.yDividedBy18 + dist.xDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX + dist.yDividedBy9 + dist.yDividedBy18 + dist.xDividedBy18, firstCheckpointY + dist.yDividedBy18 + dist.xDividedBy9 + dist.xDividedBy18, 0.00));

        // Around second checkpoint
        this.images.push(new Image(imagePath, 192, firstCheckpointX + 8 * dist.xDividedBy9, firstCheckpointY + 8 * dist.yDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX + dist.yDividedBy9 + 9 * dist.xDividedBy9, firstCheckpointY + 9 * dist.yDividedBy9 + dist.xDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX + 10 * dist.xDividedBy9, firstCheckpointY + 10 * dist.yDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX - dist.yDividedBy9 + 9 * dist.xDividedBy9 + dist.xDividedBy18, firstCheckpointY + 9 * dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy9, 0.00));

        // Left side
        this.images.push(new Image(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18, firstCheckpointY + dist.yDividedBy18 + dist.xDividedBy18 + dist.xDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + 2 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 2 * dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + 3 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 3 * dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + 4 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 4 * dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + 5 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 5 * dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + 6 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 6 * dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + 7 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 7 * dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0.00));

        // Right side
        this.images.push(new Image(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 8 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 8 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 7 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 7 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 6 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 6 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 5 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 5 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 4 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 4 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 3 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 3 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 2 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 2 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0.00));
        this.images.push(new Image(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0.00));

        this.images.forEach(img => {
            img.SetImageRenderAlways(true);
            img.ShowImage(true);
        });
    }
}
