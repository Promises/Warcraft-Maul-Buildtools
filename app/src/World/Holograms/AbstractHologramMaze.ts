import { Image } from '../../JassOverrides/Image';

export abstract class AbstractHologramMaze {
    protected images: Image[] = [];

    public Destroy(): void {
        let img: Image | undefined = this.images.pop();
        while (img !== undefined) {
            img.Destroy();
            img = this.images.pop();
        }
    }
}
