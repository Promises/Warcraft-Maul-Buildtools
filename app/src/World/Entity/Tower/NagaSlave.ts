import { Tower } from './Tower';
import { Defender } from '../Players/Defender';
import { Log } from '../../../lib/Serilog/Serilog';

export class NagaSlave extends Tower {

    constructor(tower: unit, owner: Defender) {
        super(tower, owner);
        Log.Debug('Built naga');
    }

}
