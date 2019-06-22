import { Defender } from '../Players/Defender';
import { WarcraftMaul } from '../../WarcraftMaul';

export class Tower {
    tower: unit;
    handleId: number;
    owner: Defender;

    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {

        this.tower = tower;
        this.handleId = GetHandleIdBJ(tower);
        this.owner = owner;
        owner.AddTower(this);

    }

    EndOfRoundAction(): void {

    }


}
