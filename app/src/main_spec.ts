import { Log, LogLevel } from './lib/Serilog/Serilog';
import './lib/translators';

import '../spec/ceresmocking';

import { WarcraftMaul } from './World/WarcraftMaul';
import { StringSinkTest } from './lib/Serilog/Sinks/StringSinkTest';
import * as settings from './World/GlobalSettings';
import { Defender } from './World/Entity/Players/Defender';
import { CheckPoint } from './World/Entity/CheckPoint';
import { HologramCheckpointDistance } from './World/Holograms/HologramCheckpointDistance';


Log.Init([
    new StringSinkTest(LogLevel.Error, print),
]);

describe('Warcraft Maul', () => {

    let game: WarcraftMaul = new WarcraftMaul();


    it('there should be 13 players', () => {

        assert.equals(settings.players.size, 13);

    });

    it('Prettify game time', () => {

        assert.equals(game.PrettifyGameTime(1000), '|cFF99999900:16:40|r');

    });

    // it('player constructs a tower, and leaves', () => {
    //     const player: Defender = <Defender>settings.players.get(0);
    //     assert.equals(player.id, 0);
    //     print(player.towers.size);
    //     const tower: Tower = game.worldMap.towerConstruction.SetupTower(
    //         CreateUnit(player.wcPlayer, FourCC('n00U'), player.getCenterX(), player.getCenterY(), bj_UNIT_FACING), player);
    //     print(player.towers.size);
    //     assert.equals(player.towers.size, 1);
    //     assert.equals(tower.owner, player);
    //
    //     // @ts-ignore
    //     player.PlayerLeftTheGame(game);
    //     assert.equals(player.towers.size, 0);
    //     print(settings.players.size);
    //     let foundPlayer: Defender | undefined;
    //     settings.players.forEach((playerb) => {
    //         if (playerb.towers.size > 0) {
    //             foundPlayer = playerb;
    //         }
    //     });
    //     assert.truthy(foundPlayer);
    //     // @ts-ignore
    //     assert.are_not(foundPlayer.getGold(), 100);
    //
    //
    // });
    it('player constructs a bunch of  towers, and leaves', () => {

        // const player: Defender = <Defender>settings.players.get(0);

        for (let i: number = 0; i < Util.RandomInt(1, settings.players.size - 1); i++) {
            game.gameRoundHandler.isWaveInProgress = !game.gameRoundHandler.isWaveInProgress;

            const player: Defender = <Defender>settings.players.get(Util.GetRandomKey(settings.players));
            print(`Chose ${player.id} ${game.gameRoundHandler.isWaveInProgress}`);
            createTowersForPlayer(game, player);
            assert.is_not_truthy(player.towers.size === 0);

            player.PlayerLeftTheGame(game);
            // print(player.towers.size);

            const playerb: Defender = <Defender>settings.players.get(Util.GetRandomKey(settings.players));


            playerb.SellAll();
            print(playerb.towers.size);
            playerb.towers.forEach((tower) => assert.equals(GetUnitTypeId(tower.tower), FourCC('uC14')));
        }
        // }


    });


});


function createTowersForPlayer(game: WarcraftMaul, player: Defender): void {
    const firstSpawn: CheckPoint | undefined = game.worldMap.playerSpawns[player.id].spawnOne;
    if (firstSpawn === undefined) {
        return;
    }

    const firstCheckpoint: CheckPoint | undefined = firstSpawn.next;
    if (firstCheckpoint === undefined) {
        return;
    }

    const secondCheckpoint: CheckPoint | undefined = firstCheckpoint.next;
    if (secondCheckpoint === undefined) {
        return;
    }

    const firstCheckpointX: number = GetRectCenterX(firstCheckpoint.rectangle);
    const firstCheckpointY: number = GetRectCenterY(firstCheckpoint.rectangle);
    const secondCheckpointX: number = GetRectCenterX(secondCheckpoint.rectangle);
    const secondCheckpointY: number = GetRectCenterY(secondCheckpoint.rectangle);
    const dist: HologramCheckpointDistance = new HologramCheckpointDistance(
        secondCheckpointX - firstCheckpointX,
        secondCheckpointY - firstCheckpointY);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX + dist.yDividedBy9,
        firstCheckpointY + dist.xDividedBy9, bj_UNIT_FACING), player);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX + dist.xDividedBy9,
        firstCheckpointY + dist.yDividedBy9, bj_UNIT_FACING), player);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX - dist.yDividedBy9,
        firstCheckpointY - dist.xDividedBy9, bj_UNIT_FACING), player);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX - dist.xDividedBy9 - dist.yDividedBy18,
        firstCheckpointY - dist.yDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), player);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX - dist.xDividedBy9 - dist.xDividedBy18 + dist.yDividedBy9 - dist.yDividedBy18,
        firstCheckpointY - dist.yDividedBy9 - dist.yDividedBy18 + dist.xDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), player);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX - dist.xDividedBy9 - dist.xDividedBy18 + 2 * dist.yDividedBy9 - dist.yDividedBy18,
        firstCheckpointY - dist.yDividedBy9 - dist.yDividedBy18 + 2 * dist.xDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), player);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX - dist.xDividedBy18 + 3 * dist.yDividedBy9 - dist.yDividedBy18,
        firstCheckpointY - dist.yDividedBy18 + 3 * dist.xDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), player);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX + dist.xDividedBy18 + 3 * dist.yDividedBy9 - dist.yDividedBy18,
        firstCheckpointY + dist.yDividedBy18 + 3 * dist.xDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), player);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX + dist.xDividedBy9 + dist.xDividedBy18 + 2 * dist.yDividedBy9 - dist.yDividedBy18,
        firstCheckpointY + dist.yDividedBy9 + dist.yDividedBy18 + 2 * dist.xDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), player);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX + 2 * dist.xDividedBy9 + dist.xDividedBy18 + dist.yDividedBy9 - dist.yDividedBy18,
        firstCheckpointY + 2 * dist.yDividedBy9 + dist.yDividedBy18 + dist.xDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), player);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX + 2 * dist.xDividedBy9 + dist.xDividedBy18 - dist.yDividedBy18,
        firstCheckpointY + 2 * dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy18, bj_UNIT_FACING), player);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX + dist.xDividedBy9 + dist.xDividedBy18 - dist.yDividedBy9 - dist.yDividedBy18,
        firstCheckpointY + dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), player);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX + dist.xDividedBy18 - 2 * dist.yDividedBy9 - dist.yDividedBy18,
        firstCheckpointY + dist.yDividedBy18 - 2 * dist.xDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), player);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX - dist.xDividedBy9 + dist.xDividedBy18 - 2 * dist.yDividedBy9 - dist.yDividedBy18,
        firstCheckpointY - dist.yDividedBy9 + dist.yDividedBy18 - 2 * dist.xDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), player);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX - 2 * dist.xDividedBy9 + dist.xDividedBy18 - 2 * dist.yDividedBy9,
        firstCheckpointY - 2 * dist.yDividedBy9 + dist.yDividedBy18 - 2 * dist.xDividedBy9, bj_UNIT_FACING), player);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX - 3 * dist.xDividedBy9 + dist.xDividedBy18 - dist.yDividedBy9,
        firstCheckpointY - 3 * dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy9, bj_UNIT_FACING), player);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX - 3 * dist.xDividedBy9,
        firstCheckpointY - 3 * dist.yDividedBy9, bj_UNIT_FACING), player);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX - 3 * dist.xDividedBy9 + dist.yDividedBy9,
        firstCheckpointY - 3 * dist.yDividedBy9 + dist.xDividedBy9, bj_UNIT_FACING), player);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX - 3 * dist.xDividedBy9 + 2 * dist.yDividedBy9,
        firstCheckpointY - 3 * dist.yDividedBy9 + 2 * dist.xDividedBy9, bj_UNIT_FACING), player);
    game.worldMap.towerConstruction.SetupTower(CreateUnit(player.wcPlayer, FourCC('h03G'),
        firstCheckpointX - 2 * dist.xDividedBy9 + 3 * dist.yDividedBy9,
        firstCheckpointY - 2 * dist.yDividedBy9 + 3 * dist.xDividedBy9, 0.00), player);

}
