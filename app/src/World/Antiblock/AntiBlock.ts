import * as settings from '../GlobalSettings';
import { WorldMap } from '../WorldMap';
import { Rectangle } from '../../JassOverrides/Rectangle';
import { Trigger } from '../../JassOverrides/Trigger';
import { Defender } from '../Entity/Players/Defender';

export class AntiBlock {

    private _eventTrigger: Trigger;
    private _worldMap: WorldMap;

    constructor(worldMap: WorldMap) {
        this._worldMap = worldMap;
        this._eventTrigger = new Trigger();
        this._eventTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_CONSTRUCT_START);
        this._eventTrigger.AddAction(() => this.Action());
    }

    public Action() {
        const consUnit = GetConstructingStructure();
        const player = settings.players.get(GetPlayerId(GetOwningPlayer(consUnit)));
        if (!player) {
            return;
        }

        if (GetUnitAbilityLevelSwapped(FourCC('A0CR'), consUnit) > 0) {
            if (!player.getRectangle().ContainsUnit(consUnit)) {
                this.homesick(consUnit, player);
                return;
            }
        }

        let playerSpawnId;
        for (let i = 0; i < settings.PLAYER_AREAS.length; i++) {
            if (settings.PLAYER_AREAS[i].ContainsUnit(consUnit)) {
                playerSpawnId = i;
                break;
            }
        }

        if (!playerSpawnId) {
            return;
        }

        const maze = this._worldMap.playerMazes[playerSpawnId];
        const x = GetUnitX(GetConstructingStructure());
        const y = GetUnitY(GetConstructingStructure());
        const leftSide = ((x - 64) - maze.minX) / 64;
        const rightSide = (x - maze.minX) / 64;
        const topSide = (y - maze.minY) / 64;
        const bottomSide = ((y - 64) - maze.minY) / 64;
        maze.setWalkable(leftSide + bottomSide * maze.width, false);
        maze.setWalkable(rightSide + bottomSide * maze.width, false);
        maze.setWalkable(leftSide + topSide * maze.width, false);
        maze.setWalkable(rightSide + topSide * maze.width, false);

        const playerSpawn = this._worldMap.playerSpawns[playerSpawnId];
        if (!playerSpawn) {
            return;
        }

        const spawnOne = playerSpawn.spawnOne;
        if (spawnOne === undefined) {
            return;
        }

        const firstCheckpoint = spawnOne.next;
        if (firstCheckpoint === undefined) {
            return;
        }

        const spawnX = Math.max(Math.min(Math.floor((GetRectCenterX(spawnOne.rectangle) - maze.minX) / 64), maze.width - 1), 0);
        const spawnY = Math.max(Math.min(Math.floor((GetRectCenterY(spawnOne.rectangle) - maze.minY) / 64), maze.height - 1), 0);
        const firstCheckpointX = Math.floor((GetRectCenterX(firstCheckpoint.rectangle) - maze.minX) / 64);
        const firstCheckpointY = Math.floor((GetRectCenterY(firstCheckpoint.rectangle) - maze.minY) / 64);
        const isAbleToReachFirstCheckpoint = maze.breathFirstSearch(spawnX, spawnY, firstCheckpointX, firstCheckpointY);
        if (!isAbleToReachFirstCheckpoint) {
            maze.setWalkable(leftSide + bottomSide * maze.width, true);
            maze.setWalkable(rightSide + bottomSide * maze.width, true);
            maze.setWalkable(leftSide + topSide * maze.width, true);
            maze.setWalkable(rightSide + topSide * maze.width, true);
            this.blocking(consUnit, player);
            return;
        }

        const secondCheckpoint = firstCheckpoint.next;
        if (secondCheckpoint === undefined) {
            return;
        }

        const secondCheckpointX = Math.floor((GetRectCenterX(secondCheckpoint.rectangle) - maze.minX) / 64);
        const secondCheckpointY = Math.floor((GetRectCenterY(secondCheckpoint.rectangle) - maze.minY) / 64);
        const isAbleToReachSecondCheckpoint = maze.breathFirstSearch(firstCheckpointX, firstCheckpointY, secondCheckpointX, secondCheckpointY);
        if (!isAbleToReachSecondCheckpoint) {
            maze.setWalkable(leftSide + bottomSide * maze.width, true);
            maze.setWalkable(rightSide + bottomSide * maze.width, true);
            maze.setWalkable(leftSide + topSide * maze.width, true);
            maze.setWalkable(rightSide + topSide * maze.width, true);
            this.blocking(consUnit, player);
            return;
        }

        const end = secondCheckpoint.next;
        if (end === undefined) {
            return;
        }

        const endX = Math.max(Math.min(Math.floor((GetRectCenterX(end.rectangle) - maze.minX) / 64), maze.width - 1), 0);
        const endY = Math.max(Math.min(Math.floor((GetRectCenterY(end.rectangle) - maze.minY) / 64), maze.height - 1), 0);
        const isAbleToReachEnd = maze.breathFirstSearch(secondCheckpointX, secondCheckpointY, endX, endY);
        if (!isAbleToReachEnd) {
            maze.setWalkable(leftSide + bottomSide * maze.width, true);
            maze.setWalkable(rightSide + bottomSide * maze.width, true);
            maze.setWalkable(leftSide + topSide * maze.width, true);
            maze.setWalkable(rightSide + topSide * maze.width, true);
            this.blocking(consUnit, player);
            return;
        }
    }

    private blocking(consUnit: unit, player: Defender) {
        player.sendMessage('|CFFFF0303[Anti-Block]|r |CFFFFFF01Detected a possible blocking attempt. Your building has been cancelled and you have been refunded the full cost.|r');
        this.cancelBuilding(consUnit);
    }

    private homesick(consUnit: unit, player: Defender) {
        player.sendMessage('|CFFFF0303Your tower got|r ' + '|CFFFFFF01homesick|r' + ' |CFFFF0303for being too far away from your spawn.|r');
        this.cancelBuilding(consUnit);
    }

    private cancelBuilding(consUnit: unit) {
        TriggerSleepAction(0.01);
        IssueImmediateOrderById(consUnit, settings.UNIT_ORDER_CANCEL_UPGRADE);
    }
}
