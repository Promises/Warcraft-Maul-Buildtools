import { Log, LogLevel } from './lib/Serilog/Serilog';
import './lib/translators';

import '../spec/ceresmocking';

import { WarcraftMaul } from './World/WarcraftMaul';
import { StringSinkTest } from './lib/Serilog/Sinks/StringSinkTest';

Log.Init([
    new StringSinkTest(LogLevel.Fatal, print),
]);


describe('FourCC', () => {
    it('converts to and from FourCC', () => {

        const game: WarcraftMaul = new WarcraftMaul();

    });
});
