import { CheckPoint } from './CheckPoint';
import { WorldMap } from '../WorldMap';
import { WarcraftMaul } from '../WarcraftMaul';
import { Sounds } from '../GlobalSettings';

export class Ship extends CheckPoint {
    ship: unit;
    private game: WarcraftMaul;
    worldMap: WorldMap;

    destination = Rect(-5440.0, -5664.0, -5184.0, -4864.0); // Ship moves to here when game ends

    // killzone: CheckPoint;

    constructor(ship: unit, worldMap: WorldMap) {
        super(Rect(-768.00, -4992.00, 768.00, -4800.00), worldMap);
        this.ship = ship;
        this.worldMap = worldMap;
        this.game = this.worldMap.game;

    }

    MoveShip() {
        IssuePointOrder(this.ship, 'move', GetRectCenterX(this.destination), GetRectCenterY(this.destination));
    }

    checkPointAction() {
        let u = GetEnteringUnit();

        if (this.game.gameEnded) {
            return;
        }
        if (this.game.gameRoundHandler.currentWave >= 36) {
            RemoveUnit(u);
        }
        let spawnedCreeps = this.worldMap.spawnedCreeps;
        if (spawnedCreeps) {
            let creep = spawnedCreeps.unitMap.get(GetHandleIdBJ(GetEnteringUnit()));
            if (creep) {
                if (creep.getId() == FourCC('uC72')) {
                    print('Archimonde has boarded the ship! |cFFFF0000YOU LOSE!|r');
                    this.game.gameLives = 0;
                } else {
                    print('|c00ff0000A unit has boarded the ship! |r' + this.game.gameLives + ' |c00ff0000chances left|r');
                    this.game.gameLives--;
                }


                creep.targetCheckpoint = undefined;
                spawnedCreeps.unitMap.delete(GetHandleIdBJ(GetEnteringUnit()))
                RemoveUnit(creep.creep);

                PlaySoundBJ(Sounds.loseALifeSound);
                if (this.game.scoreBoard) {
                    MultiboardSetItemValueBJ(this.game.scoreBoard.board, 2, 4, this.game.gameLives + '');
                }

                if (this.game.gameLives <= 0) {
                    this.game.GameOver();
                }
            }
        }
    }
}
