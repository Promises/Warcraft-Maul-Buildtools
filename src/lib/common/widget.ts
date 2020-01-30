export abstract class Widget {

    protected constructor(widget: widget) {
        this.widget = widget;
    }
    public static _byWidget: Map<widget, Widget> = new Map<widget, Widget>();

    public widget: widget;

    public static byWidget(widget: widget): Widget {
        return this._byWidget.get(widget) as Widget;
    }

    public static orderTarget(): Widget {
        return this.byWidget(GetOrderTarget());
    }

    public static triggerWidget(): Widget {
        return this.byWidget(GetTriggerWidget());
    }

    public abstract life(): number;

    public abstract setLife(newLife: number): void;

    public GetX(): number {
        return GetWidgetX(this.widget);
    }

    public GetY(): number {
        return GetWidgetY(this.widget);
    }


    public addIndicator(red: number, green: number, blue: number, alpha: number): void {
        AddIndicator(this.widget, red, green, blue, alpha);
    }
}
