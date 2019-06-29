import * as settings from '../GlobalSettings';
import { WorldMap } from '../WorldMap';
import { Trigger } from '../../JassOverrides/Trigger';
import { Defender } from '../Entity/Players/Defender';
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

    public Action(): void {
        const consUnit: unit = GetConstructingStructure();
        const player: Defender | undefined = settings.players.get(GetPlayerId(GetOwningPlayer(consUnit)));
        if (player === undefined) {
            return;
        }

        if (GetUnitAbilityLevelSwapped(FourCC('A0CR'), consUnit) > 0) {
            if (!player.getRectangle().ContainsUnit(consUnit)) {
                this.homesick(consUnit, player);
                return;
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
        const x: number = GetUnitX(GetConstructingStructure());
        const y: number = GetUnitY(GetConstructingStructure());
        const leftSide: number = ((x - 64) - maze.minX) / 64;
        const rightSide: number = (x - maze.minX) / 64;
        const topSide: number = (y - maze.minY) / 64;
        const bottomSide: number = ((y - 64) - maze.minY) / 64;
        maze.setWalkable(leftSide + bottomSide * maze.width, false);
        maze.setWalkable(rightSide + bottomSide * maze.width, false);
        maze.setWalkable(leftSide + topSide * maze.width, false);
        maze.setWalkable(rightSide + topSide * maze.width, false);

        const playerSpawn: PlayerSpawns = this._worldMap.playerSpawns[playerSpawnId];
        if (!playerSpawn) {
            return;
        }

        const spawnOne: CheckPoint | undefined = playerSpawn.spawnOne;
        if (spawnOne === undefined) {
            return;
        }

        const firstCheckpoint: CheckPoint | undefined = spawnOne.next;
        if (firstCheckpoint === undefined) {
            return;
        }

        const spawnX: number = Math.max(Math.min(Math.floor((GetRectCenterX(spawnOne.rectangle) - maze.minX) / 64), maze.width - 1), 0);
        const spawnY: number = Math.max(Math.min(Math.floor((GetRectCenterY(spawnOne.rectangle) - maze.minY) / 64), maze.height - 1), 0);
        const firstCheckpointX: number = Math.floor((GetRectCenterX(firstCheckpoint.rectangle) - maze.minX) / 64);
        const firstCheckpointY: number = Math.floor((GetRectCenterY(firstCheckpoint.rectangle) - maze.minY) / 64);
        const isAbleToReachFirstCheckpoint: boolean = maze.breathFirstSearch(spawnX, spawnY, firstCheckpointX, firstCheckpointY);
        if (!isAbleToReachFirstCheckpoint) {
            maze.setWalkable(leftSide + bottomSide * maze.width, true);
            maze.setWalkable(rightSide + bottomSide * maze.width, true);
            maze.setWalkable(leftSide + topSide * maze.width, true);
            maze.setWalkable(rightSide + topSide * maze.width, true);
            this.blocking(consUnit, player);
            return;
        }

        const secondCheckpoint: CheckPoint | undefined = firstCheckpoint.next;
        if (secondCheckpoint === undefined) {
            return;
        }

        const secondCheckpointX: number = Math.floor((GetRectCenterX(secondCheckpoint.rectangle) - maze.minX) / 64);
        const secondCheckpointY: number = Math.floor((GetRectCenterY(secondCheckpoint.rectangle) - maze.minY) / 64);
        const isAbleToReachSecondCheckpoint: boolean =
            maze.breathFirstSearch(firstCheckpointX, firstCheckpointY, secondCheckpointX, secondCheckpointY);
        if (!isAbleToReachSecondCheckpoint) {
            maze.setWalkable(leftSide + bottomSide * maze.width, true);
            maze.setWalkable(rightSide + bottomSide * maze.width, true);
            maze.setWalkable(leftSide + topSide * maze.width, true);
            maze.setWalkable(rightSide + topSide * maze.width, true);
            this.blocking(consUnit, player);
            return;
        }

        const end: CheckPoint | undefined = secondCheckpoint.next;
        if (end === undefined) {
            return;
        }

        const endX: number = Math.max(Math.min(Math.floor((GetRectCenterX(end.rectangle) - maze.minX) / 64), maze.width - 1), 0);
        const endY: number = Math.max(Math.min(Math.floor((GetRectCenterY(end.rectangle) - maze.minY) / 64), maze.height - 1), 0);
        const isAbleToReachEnd: boolean = maze.breathFirstSearch(secondCheckpointX, secondCheckpointY, endX, endY);
        if (!isAbleToReachEnd) {
            maze.setWalkable(leftSide + bottomSide * maze.width, true);
            maze.setWalkable(rightSide + bottomSide * maze.width, true);
            maze.setWalkable(leftSide + topSide * maze.width, true);
            maze.setWalkable(rightSide + topSide * maze.width, true);
            this.blocking(consUnit, player);
            return;
        }
    }

    private blocking(consUnit: unit, player: Defender): void {
        player.sendMessage('|CFFFF0303[Anti-Block]|r |CFFFFFF01Detected a possible blocking attempt.' +
                               ' Your building has been cancelled and you have been refunded the full cost.|r');
        this.cancelBuilding(consUnit);
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
