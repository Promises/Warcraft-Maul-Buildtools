import { Tower } from '../Specs/Tower';
import { EndOfRoundTower } from '../Specs/EndOfRoundTower';
import { Maze } from '../../../Antiblock/Maze';
import * as settings from '../../../GlobalSettings';
import { Log } from '../../../../lib/Serilog/Serilog';
import { Defender } from '../../Players/Defender';
import { WarcraftMaul } from '../../../WarcraftMaul';

export class AntiJuggleTower extends Tower implements EndOfRoundTower {

    private readonly x: number;
    private readonly y: number;

    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {
        super(tower, owner, game);

        this.x = GetUnitX(this.tower);
        this.y = GetUnitY(this.tower);
        SetTerrainPathable(this.x, this.y, PATHING_TYPE_WALKABILITY, false);

        SetTerrainPathable(this.x - 48, this.y - 48, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x - 16, this.y - 48, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x, this.y - 48, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x + 16, this.y - 48, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x + 48, this.y - 48, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x - 48, this.y - 48, PATHING_TYPE_WALKABILITY, false);

        SetTerrainPathable(this.x - 48, this.y - 16, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x - 16, this.y - 16, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x, this.y - 16, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x + 16, this.y - 16, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x + 48, this.y - 16, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x - 48, this.y - 16, PATHING_TYPE_WALKABILITY, false);

        SetTerrainPathable(this.x - 48, this.y, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x - 16, this.y, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x, this.y, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x + 16, this.y, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x + 48, this.y, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x - 48, this.y, PATHING_TYPE_WALKABILITY, false);

        SetTerrainPathable(this.x - 48, this.y + 16, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x - 16, this.y + 16, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x, this.y + 16, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x + 16, this.y + 16, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x + 48, this.y + 16, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x - 48, this.y + 16, PATHING_TYPE_WALKABILITY, false);

        SetTerrainPathable(this.x - 48, this.y + 48, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x - 16, this.y + 48, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x, this.y + 48, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x + 16, this.y + 48, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x + 48, this.y + 48, PATHING_TYPE_WALKABILITY, false);
        SetTerrainPathable(this.x - 48, this.y + 48, PATHING_TYPE_WALKABILITY, false);
    }

    public EndOfRoundAction(): void {
        this.Sell();

        let playerSpawnId: undefined | number;
        for (let i: number = 0; i < settings.PLAYER_AREAS.length; i++) {
            if (settings.PLAYER_AREAS[i].ContainsUnit(this.tower)) {
                playerSpawnId = i;
                break;
            }
        }

        if (playerSpawnId === undefined) {
            Log.Error('Unable to locate the correct player spawn');
            return;
        }

        const x: number = GetUnitX(this.tower);
        const y: number = GetUnitY(this.tower);
        const maze: Maze = this.game.worldMap.playerMazes[playerSpawnId];
        const leftSide: number = ((x - 64) - maze.minX) / 64;
        const rightSide: number = (x - maze.minX) / 64;
        const topSide: number = (y - maze.minY) / 64;
        const bottomSide: number = ((y - 64) - maze.minY) / 64;
        maze.setWalkable(leftSide + bottomSide * maze.width, true);
        maze.setWalkable(rightSide + bottomSide * maze.width, true);
        maze.setWalkable(leftSide + topSide * maze.width, true);
        maze.setWalkable(rightSide + topSide * maze.width, true);

        SetTerrainPathable(this.x, this.y, PATHING_TYPE_WALKABILITY, true);

        SetTerrainPathable(this.x - 48, this.y - 48, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x - 16, this.y - 48, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x, this.y - 48, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x + 16, this.y - 48, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x + 48, this.y - 48, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x - 48, this.y - 48, PATHING_TYPE_WALKABILITY, true);

        SetTerrainPathable(this.x - 48, this.y - 16, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x - 16, this.y - 16, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x, this.y - 16, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x + 16, this.y - 16, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x + 48, this.y - 16, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x - 48, this.y - 16, PATHING_TYPE_WALKABILITY, true);

        SetTerrainPathable(this.x - 48, this.y, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x - 16, this.y, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x, this.y, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x + 16, this.y, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x + 48, this.y, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x - 48, this.y, PATHING_TYPE_WALKABILITY, true);

        SetTerrainPathable(this.x - 48, this.y + 16, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x - 16, this.y + 16, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x, this.y + 16, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x + 16, this.y + 16, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x + 48, this.y + 16, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x - 48, this.y + 16, PATHING_TYPE_WALKABILITY, true);

        SetTerrainPathable(this.x - 48, this.y + 48, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x - 16, this.y + 48, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x, this.y + 48, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x + 16, this.y + 48, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x + 48, this.y + 48, PATHING_TYPE_WALKABILITY, true);
        SetTerrainPathable(this.x - 48, this.y + 48, PATHING_TYPE_WALKABILITY, true);

        const loc: location = GetUnitLoc(this.tower);
        ForGroup(GetUnitsInRangeOfLocAll(128.00, loc), () => {
            if (GetUnitTypeId(GetEnumUnit()) !== FourCC('uC14') && IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE)) {
                const structureX: number = GetUnitX(GetEnumUnit());
                const structureY: number = GetUnitY(GetEnumUnit());
                const structureLeftSide: number = ((structureX - 64) - maze.minX) / 64;
                const structureRightSide: number = (structureX - maze.minX) / 64;
                const structureTopSide: number = (structureY - maze.minY) / 64;
                const structureBottomSide: number = ((structureY - 64) - maze.minY) / 64;
                maze.setWalkable(structureLeftSide + structureBottomSide * maze.width, false);
                maze.setWalkable(structureRightSide + structureBottomSide * maze.width, false);
                maze.setWalkable(structureLeftSide + structureTopSide * maze.width, false);
                maze.setWalkable(structureRightSide + structureTopSide * maze.width, false);

                SetTerrainPathable(structureX, structureY, PATHING_TYPE_WALKABILITY, false);

                SetTerrainPathable(structureX - 48, structureY - 48, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX - 16, structureY - 48, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX, structureY - 48, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX + 16, structureY - 48, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX + 48, structureY - 48, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX - 48, structureY - 48, PATHING_TYPE_WALKABILITY, false);

                SetTerrainPathable(structureX - 48, structureY - 16, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX - 16, structureY - 16, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX, structureY - 16, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX + 16, structureY - 16, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX + 48, structureY - 16, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX - 48, structureY - 16, PATHING_TYPE_WALKABILITY, false);

                SetTerrainPathable(structureX - 48, structureY, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX - 16, structureY, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX, structureY, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX + 16, structureY, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX + 48, structureY, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX - 48, structureY, PATHING_TYPE_WALKABILITY, false);

                SetTerrainPathable(structureX - 48, structureY + 16, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX - 16, structureY + 16, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX, structureY + 16, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX + 16, structureY + 16, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX + 48, structureY + 16, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX - 48, structureY + 16, PATHING_TYPE_WALKABILITY, false);

                SetTerrainPathable(structureX - 48, structureY + 48, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX - 16, structureY + 48, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX, structureY + 48, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX + 16, structureY + 48, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX + 48, structureY + 48, PATHING_TYPE_WALKABILITY, false);
                SetTerrainPathable(structureX - 48, structureY + 48, PATHING_TYPE_WALKABILITY, false);
            }
        });
        RemoveLocation(loc);
        RemoveUnit(this.tower);
    }
}
