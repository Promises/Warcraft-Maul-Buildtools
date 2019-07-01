import { Log, LogLevel } from './lib/Serilog/Serilog';
import './lib/translators';

import '../spec/ceresmocking';

import { WarcraftMaul } from './World/WarcraftMaul';
import { StringSinkTest } from './lib/Serilog/Sinks/StringSinkTest';
import * as settings from './World/GlobalSettings';

Log.Init([
    new StringSinkTest(LogLevel.Fatal, print),
]);


describe('FourCC', () => {
    it('converts to and from FourCC', () => {

        const game: WarcraftMaul = new WarcraftMaul();
        assert.equals(settings.players.size, 13);
        assert.equals(game.PrettifyGameTime(1000), '|cFF99999900:16:40|r');

    });
});
