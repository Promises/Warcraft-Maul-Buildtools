import { Log, LogLevel } from './lib/Serilog/Serilog';
import './lib/translators';

import '../spec/ceresmocking';

import { WarcraftMaul } from './World/WarcraftMaul';
import { StringSinkTest } from './lib/Serilog/Sinks/StringSinkTest';
import * as settings from './World/GlobalSettings';
import { Defender } from './World/Entity/Players/Defender';
import { Tower } from './World/Entity/Tower/Specs/Tower';

Log.Init([
    new StringSinkTest(LogLevel.Fatal, print),
]);


describe('Warcraft Maul', () => {
    const game: WarcraftMaul = new WarcraftMaul();

    it('there should be 13 players', () => {

        assert.equals(settings.players.size, 13);
        assert.equals(game.PrettifyGameTime(1000), '|cFF99999900:16:40|r');

    });

    it('Prettify game time', () => {

        assert.equals(game.PrettifyGameTime(1000), '|cFF99999900:16:40|r');

    });

    it('player constructs a tower, and leaves', () => {
        const player: Defender = <Defender>settings.players.get(0);
        assert.equals(player.id, 0);
        print(player.towers.size);
        const tower: Tower = game.worldMap.towerConstruction.SetupTower(
            CreateUnit(player.wcPlayer, FourCC('n00U'), player.getCenterX(), player.getCenterY(), bj_UNIT_FACING), player);
        print(player.towers.size);
        assert.equals(player.towers.size, 1);
        assert.equals(tower.owner, player);

        // @ts-ignore
        player.PlayerLeftTheGame(game);
        assert.equals(player.towers.size, 0);
        print(settings.players.size);
        let foundPlayer: Defender | undefined;
        settings.players.forEach((playerb) => {
            if (playerb.towers.size > 0) {
                foundPlayer = playerb;
            }
        });
        assert.truthy(foundPlayer);
        // @ts-ignore
        assert.are_not(foundPlayer.getGold(), 100);


    });
});
