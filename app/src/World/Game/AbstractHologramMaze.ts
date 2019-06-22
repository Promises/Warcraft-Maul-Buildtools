import {Image} from "../../JassOverrides/Image";

export abstract class AbstractHologramMaze {
    protected images: Image[] = [];

    public Destroy() {
        let img = this.images.pop();
        while (img !== undefined) {
            img.Destroy();
            img = this.images.pop();
        }
    }
}