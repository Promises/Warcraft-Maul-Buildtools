import * as settings from '../GlobalSettings';
import { WorldMap } from '../WorldMap';
import { Trigger } from '../../JassOverrides/Trigger';
import { Defender } from '../Entity/Players/Defender';
import { Creep } from '../Entity/Creep';
import { Log } from '../../lib/Serilog/Serilog';
import { Maze } from './Maze';
import { PlayerSpawns } from '../Entity/PlayerSpawns';
import { CheckPoint } from '../Entity/CheckPoint';

export class AntiBlock {

    private _eventTrigger: Trigger;
    private _worldMap: WorldMap;

    constructor(worldMap: WorldMap) {
        this._worldMap = worldMap;
        this._eventTrigger = new Trigger();
        this._eventTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_CONSTRUCT_START);
        this._eventTrigger.AddAction(() => this.Action());
    }

    private Action(): void {
        const consUnit: unit = GetConstructingStructure();
        const x: number = GetUnitX(GetConstructingStructure());
        const y: number = GetUnitY(GetConstructingStructure());
        const loc: location = GetUnitLoc(consUnit);
        const antiJuggleTowers: unit[] = [];
        let hasBuiltOnAntiJuggle: boolean = false;
        ForGroup(GetUnitsInRangeOfLocAll(128.00, loc), () => {
            if (GetUnitTypeId(GetEnumUnit()) === FourCC('uC14')) {
                if (GetUnitX(GetEnumUnit()) === x && GetUnitY(GetEnumUnit()) === y) {
                    hasBuiltOnAntiJuggle = true;
                    RemoveUnit(GetEnumUnit());
                } else {
                    antiJuggleTowers.push(GetEnumUnit());
                }
            }
        });

        const player: Defender | undefined = settings.players.get(GetPlayerId(GetOwningPlayer(consUnit)));
        if (player === undefined) {
            return;
        }

        const isWaveInProgress: boolean = this._worldMap.game.gameRoundHandler.isWaveInProgress;
        const antiJuggleCreeps: Creep[] = [];
        if (isWaveInProgress && hasBuiltOnAntiJuggle === false) {
            let isJuggling: boolean = false;
            ForGroup(GetUnitsInRangeOfLocAll(128.00, loc), () => {
                const ownerID: COLOUR = GetPlayerId(GetOwningPlayer(GetEnumUnit()));
                switch (ownerID) {
                    case COLOUR.NAVY:
                    case COLOUR.TURQUOISE:
                    case COLOUR.VOILET:
                    case COLOUR.WHEAT:
                        if (IsUnitAliveBJ(GetEnumUnit())) {
                            const creep: Creep | undefined = this._worldMap.spawnedCreeps.unitMap.get(GetHandleId(GetEnumUnit()));
                            if (creep !== undefined) {
                                antiJuggleCreeps.push(creep);
                            } else {
                                Log.Debug('Creep is missing in spawnedCreeps unitMap');
                            }
                            isJuggling = true;
                        }
                        break;
                    default:
                        break;
                }
            });

            if (isJuggling) {
                RemoveLocation(loc);
                return this.juggling(consUnit, player, antiJuggleCreeps);
            }
        }

        RemoveLocation(loc);

        if (GetUnitAbilityLevelSwapped(FourCC('A0CR'), consUnit) > 0) {
            if (!player.getRectangle().ContainsUnit(consUnit)) {
                return this.homesick(consUnit, player);
            }
        }

        let playerSpawnId: number | undefined;
        for (let i: number = 0; i < settings.PLAYER_AREAS.length; i++) {
            if (settings.PLAYER_AREAS[i].ContainsUnit(consUnit)) {
                playerSpawnId = i;
                break;
            }
        }

        if (playerSpawnId === undefined) {
            return;
        }

        const maze: Maze = this._worldMap.playerMazes[playerSpawnId];
        const leftSide: number = ((x - 64) - maze.minX) / 64;
        const rightSide: number = (x - maze.minX) / 64;
        const topSide: number = (y - maze.minY) / 64;
        const bottomSide: number = ((y - 64) - maze.minY) / 64;
        maze.setWalkable(leftSide + bottomSide * maze.width, false);
        maze.setWalkable(rightSide + bottomSide * maze.width, false);
        maze.setWalkable(leftSide + topSide * maze.width, false);
        maze.setWalkable(rightSide + topSide * maze.width, false);
        const playerSpawn: PlayerSpawns = this._worldMap.playerSpawns[playerSpawnId];
        const spawnOne: CheckPoint = <CheckPoint>playerSpawn.spawnOne;
        const firstCheckpoint: CheckPoint = <CheckPoint>spawnOne.next;

        const spawnX: number = Math.max(Math.min(Math.floor((GetRectCenterX(spawnOne.rectangle) - maze.minX) / 64), maze.width - 1), 0);
        const spawnY: number = Math.max(Math.min(Math.floor((GetRectCenterY(spawnOne.rectangle) - maze.minY) / 64), maze.height - 1), 0);
        const firstCheckpointX: number = Math.floor((GetRectCenterX(firstCheckpoint.rectangle) - maze.minX) / 64);
        const firstCheckpointY: number = Math.floor((GetRectCenterY(firstCheckpoint.rectangle) - maze.minY) / 64);
        const firstCheckpointBFS: number = maze.breathFirstSearch(spawnX, spawnY, firstCheckpointX, firstCheckpointY);
        if (firstCheckpointBFS === -1) {
            maze.setWalkable(leftSide + bottomSide * maze.width, true);
            maze.setWalkable(rightSide + bottomSide * maze.width, true);
            maze.setWalkable(leftSide + topSide * maze.width, true);
            maze.setWalkable(rightSide + topSide * maze.width, true);
            antiJuggleTowers.forEach((antiJuggleTower) => {
                const antiJuggleX: number = GetUnitX(antiJuggleTower);
                const antiJuggleY: number = GetUnitY(antiJuggleTower);
                const antiJuggleLeftSide: number = ((antiJuggleX - 64) - maze.minX) / 64;
                const antiJuggleRightSide: number = (antiJuggleX - maze.minX) / 64;
                const antiJuggleTopSide: number = (antiJuggleY - maze.minY) / 64;
                const antiJuggleBottomSide: number = ((antiJuggleY - 64) - maze.minY) / 64;
                maze.setWalkable(antiJuggleLeftSide + antiJuggleBottomSide * maze.width, false);
                maze.setWalkable(antiJuggleRightSide + antiJuggleBottomSide * maze.width, false);
                maze.setWalkable(antiJuggleLeftSide + antiJuggleTopSide * maze.width, false);
                maze.setWalkable(antiJuggleRightSide + antiJuggleTopSide * maze.width, false);
            });
            return this.blocking(consUnit, player);
        }

        const secondCheckpoint: CheckPoint = <CheckPoint>firstCheckpoint.next;
        const secondCheckpointX: number = Math.floor((GetRectCenterX(secondCheckpoint.rectangle) - maze.minX) / 64);
        const secondCheckpointY: number = Math.floor((GetRectCenterY(secondCheckpoint.rectangle) - maze.minY) / 64);
        const secondCheckpointBFS: number =
            maze.breathFirstSearch(firstCheckpointX, firstCheckpointY, secondCheckpointX, secondCheckpointY);
        if (secondCheckpointBFS === -1) {
            maze.setWalkable(leftSide + bottomSide * maze.width, true);
            maze.setWalkable(rightSide + bottomSide * maze.width, true);
            maze.setWalkable(leftSide + topSide * maze.width, true);
            maze.setWalkable(rightSide + topSide * maze.width, true);
            antiJuggleTowers.forEach((antiJuggleTower) => {
                const antiJuggleX: number = GetUnitX(antiJuggleTower);
                const antiJuggleY: number = GetUnitY(antiJuggleTower);
                const antiJuggleLeftSide: number = ((antiJuggleX - 64) - maze.minX) / 64;
                const antiJuggleRightSide: number = (antiJuggleX - maze.minX) / 64;
                const antiJuggleTopSide: number = (antiJuggleY - maze.minY) / 64;
                const antiJuggleBottomSide: number = ((antiJuggleY - 64) - maze.minY) / 64;
                maze.setWalkable(antiJuggleLeftSide + antiJuggleBottomSide * maze.width, false);
                maze.setWalkable(antiJuggleRightSide + antiJuggleBottomSide * maze.width, false);
                maze.setWalkable(antiJuggleLeftSide + antiJuggleTopSide * maze.width, false);
                maze.setWalkable(antiJuggleRightSide + antiJuggleTopSide * maze.width, false);
            });
            return this.blocking(consUnit, player);
        }

        const end: CheckPoint = <CheckPoint>secondCheckpoint.next;
        const endX: number = Math.max(Math.min(Math.floor((GetRectCenterX(end.rectangle) - maze.minX) / 64), maze.width - 1), 0);
        const endY: number = Math.max(Math.min(Math.floor((GetRectCenterY(end.rectangle) - maze.minY) / 64), maze.height - 1), 0);
        const exitPointBFS: number = maze.breathFirstSearch(secondCheckpointX, secondCheckpointY, endX, endY);
        if (exitPointBFS === -1) {
            maze.setWalkable(leftSide + bottomSide * maze.width, true);
            maze.setWalkable(rightSide + bottomSide * maze.width, true);
            maze.setWalkable(leftSide + topSide * maze.width, true);
            maze.setWalkable(rightSide + topSide * maze.width, true);
            antiJuggleTowers.forEach((antiJuggleTower) => {
                const antiJuggleX: number = GetUnitX(antiJuggleTower);
                const antiJuggleY: number = GetUnitY(antiJuggleTower);
                const antiJuggleLeftSide: number = ((antiJuggleX - 64) - maze.minX) / 64;
                const antiJuggleRightSide: number = (antiJuggleX - maze.minX) / 64;
                const antiJuggleTopSide: number = (antiJuggleY - maze.minY) / 64;
                const antiJuggleBottomSide: number = ((antiJuggleY - 64) - maze.minY) / 64;
                maze.setWalkable(antiJuggleLeftSide + antiJuggleBottomSide * maze.width, false);
                maze.setWalkable(antiJuggleRightSide + antiJuggleBottomSide * maze.width, false);
                maze.setWalkable(antiJuggleLeftSide + antiJuggleTopSide * maze.width, false);
                maze.setWalkable(antiJuggleRightSide + antiJuggleTopSide * maze.width, false);
            });
            return this.blocking(consUnit, player);
        }

        player.totalMazeLength = firstCheckpointBFS + secondCheckpointBFS + exitPointBFS;
    }

    private blocking(consUnit: unit, player: Defender): void {
        player.sendMessage('|CFFFF0303[Anti-Block]|r |CFFFFFF01Detected a possible blocking attempt.' +
                               ' Your building has been cancelled and you have been refunded the full cost.|r');
        this.cancelBuilding(consUnit);
    }

    private juggling(consUnit: unit, player: Defender, antiJuggleCreeps: Creep[]): void {
        player.sendMessage('|CFFFF0303[Anti-Juggle]|r |CFFFFFF01Detected a possible juggling attempt.' +
                               ' Your building has been cancelled and you have been refunded the full cost.|r');
        this.cancelBuilding(consUnit);
        antiJuggleCreeps.forEach(creep => creep.ReapplyMovement());
    }

    private homesick(consUnit: unit, player: Defender): void {
        player.sendMessage('|CFFFF0303Your tower got|r ' + '|CFFFFFF01homesick|r' + ' |CFFFF0303for being too far away from your spawn.|r');
        this.cancelBuilding(consUnit);
    }

    private cancelBuilding(consUnit: unit): void {
        TriggerSleepAction(0.01);
        IssueImmediateOrderById(consUnit, settings.UNIT_ORDER_CANCEL_UPGRADE);
    }
}
