import { Log, LogLevel } from './lib/Serilog/Serilog';
import './lib/translators';

import '../spec/ceresmocking';

import { WarcraftMaul } from './World/WarcraftMaul';
import { StringSinkTest } from './lib/Serilog/Sinks/StringSinkTest';
import { Defender } from './World/Entity/Players/Defender';
import { CheckPoint } from './World/Entity/CheckPoint';
import { HologramCheckpointDistance } from './World/Holograms/HologramCheckpointDistance';
import { SLKLoader, Unit } from './lib/SLKLoader/SLKLoader';


Log.Init([
             new StringSinkTest(LogLevel.Error, print),
         ]);


describe('Warcraft Maul', () => {

    let game: WarcraftMaul = new WarcraftMaul();


    it('there should be 13 players', () => {

        assert.equals(game.players.size, 13);

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

        for (let j = 0; j < Util.RandomInt(1, 100); j++) {
            game = new WarcraftMaul();

            const randomNum: number = Util.RandomInt(1, 2);
            if (randomNum === 1) {
                game.gameRoundHandler.isWaveInProgress = true;
            } else {
                game.gameRoundHandler.isWaveInProgress = false;
            }
            print(`RoundInProgress: ${game.gameRoundHandler.isWaveInProgress}`);


            for (let i: number = 0; i < Util.RandomInt(1, game.players.size - 1); i++) {

                const player: Defender = <Defender>game.players.get(Util.GetRandomKey(game.players));
                createTowersForPlayer(game, player);
                assert.is_not_truthy(player.towers.size === 0);

                player.PlayerLeftTheGame(game);
                // print(player.towers.size);

                const playerb: Defender = <Defender>game.players.get(Util.GetRandomKey(game.players));

                playerb.SellAll();
                playerb.towers.forEach((tower) => {
                    assert.equals(GetUnitTypeId(tower.tower), FourCC('uC14'),
                                  `Not anti-juggle: ${DecodeFourCC(GetUnitTypeId(tower.tower))}`);
                });
            }
        }


        // }


    });
    it('No duplicate defined towers', () => {

        for (const key of Util.GetAllKeys(game.worldMap.towerConstruction.towerTypes)) {
            for (const keyb of Util.GetAllKeys(game.worldMap.towerConstruction.towerTypes)) {
                if (!(key === keyb)) {
                    const a: any = game.worldMap.towerConstruction.towerTypes.get(key);
                    assert.falsy(
                        a === game.worldMap.towerConstruction.towerTypes.get(keyb),
                        `Found ${DecodeFourCC(key)} and ${DecodeFourCC(keyb)} defined as ${a.name}`);
                }
            }
        }
        assert.equal(0, game.worldMap.towerConstruction.towerTypes.duplicateKeys.length,
                     `Found duplicate keys: ${KeysToList(game.worldMap.towerConstruction.towerTypes.duplicateKeys)}`);
    });

    it('Loads slk files', () => {
        SLKLoader.loadFile('maps/map/Units/UnitAbilities.slk');
    });

    it('Check defined towers are in slk files', () => {
        let slkUnits: Map<number, Unit> = SLKLoader.loadFile('maps/map/Units/UnitAbilities.slk');
        for (const key of Util.GetAllKeys(game.worldMap.towerConstruction.towerTypes)) {
            assert.truthy(slkUnits.has(key));
        }

    });


});

function KeysToList(duplicateKeys: number[]): string {
    let output = '[';
    for (let i = 0; i < duplicateKeys.length; i++) {
        if (i == duplicateKeys.length - 1) {
            output += `"${DecodeFourCC(duplicateKeys[i])}"`;
            continue;
        }
        output += `"${duplicateKeys[i]}", `;
    }
    output += ']';
    return output;

}


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
