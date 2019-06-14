export class Ship {
    ship: unit;

    destination = Rect(-5440.0, -5664.0, -5184.0, -4864.0); // Ship moves to here when game ends



    constructor(ship: unit){
        this.ship = ship;
    }
}
