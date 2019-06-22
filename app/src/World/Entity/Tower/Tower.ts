import { Defender } from '../Players/Defender';

export class Tower {
    tower: unit;
    handleId: number;

    constructor(tower: unit, owner: Defender) {

        this.tower = tower;
        this.handleId = GetHandleIdBJ(tower);
        owner.AddTower(this);

    }


}
