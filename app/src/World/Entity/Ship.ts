import { CheckPoint } from './CheckPoint';
import { WorldMap } from '../WorldMap';

export class Ship {
    ship: unit;

    destination = Rect(-5440.0, -5664.0, -5184.0, -4864.0); // Ship moves to here when game ends

    killzone: CheckPoint;

    constructor(ship: unit, worldMap: WorldMap){
        this.ship = ship;
        this.killzone = new CheckPoint(Rect(-768.00, -4992.00, 768.00, -4800.00), worldMap);
    }
}
