export class Image {
    readonly img: image;

    constructor(imagePath: string, size: number, x: number, y: number, z: number) {
        this.img = CreateImage(imagePath, size, size, 0, x - (size / 2), y - (size / 2), z, 0, 0, 0, 2);
    }

    public Destroy() {
        DestroyImage(this.img);
    }

    public SetImageRenderAlways(flag: boolean) {
        SetImageRenderAlways(this.img, flag);
    }

    public ShowImage(flag: boolean) {
        ShowImage(this.img, flag);
    }
}