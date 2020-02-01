import { Trigger } from '../../../../JassOverrides/Trigger';
import { Log } from '../../../../lib/Serilog/Serilog';
import { WarcraftMaul } from '../../../WarcraftMaul';

export abstract class AbstractActionButton {


    private _buttonHandle: framehandle;
    private _backdropHandle: framehandle;
    private trig: Trigger;
    private _game: WarcraftMaul;

    constructor(game: WarcraftMaul, name: string, icon: string, x: number, y: number, size: number) {
        this._game = game;
        this._buttonHandle = BlzCreateFrameByType(
            'BUTTON',
            name,
            BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0),
            'StandardButtonTemplate',
            0,
        );
        this._backdropHandle = BlzCreateFrameByType(
            'BACKDROP',
            `${name}BackDrop`,
            BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0),
            'ButtonBackdropTemplate',
            0);

        BlzFrameSetSize(this._buttonHandle, size, size);
        BlzFrameSetSize(this._backdropHandle, size, size);
        BlzFrameSetTexture(this._backdropHandle, icon, 0, true);
        // BlzFrameSetTexture(this._buttonHandle, 'uiImport\\CommandButtons\\BTNNone.dds', 0, true);
        BlzFrameSetAlpha(this._buttonHandle, 0);
        BlzFrameSetAbsPoint(this._buttonHandle, FRAMEPOINT_CENTER, x, y);
        BlzFrameSetPoint(this._backdropHandle, FRAMEPOINT_CENTER, this._buttonHandle, FRAMEPOINT_CENTER, 0.0, 0.0);

        this.trig = new Trigger();
        this.trig.addAction(() => this.clickAction());
        this.trig.registerFrameEvent(this._buttonHandle, FRAMEEVENT_CONTROL_CLICK);
    }

    public disable(): void {
        BlzFrameSetEnable(this._buttonHandle, false);
    }

    public enable(): void {
        BlzFrameSetEnable(this._buttonHandle, true);
    }

    get game(): WarcraftMaul {
        return this._game;
    }
    get backdropHandle(): framehandle {
        return this._backdropHandle;
    }
    get buttonHandle(): framehandle {
        return this._buttonHandle;
    }



    public abstract clickAction(): void;
}

