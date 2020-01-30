import { Tower } from '../../Entity/Tower/Specs/Tower';
import { EndOfRoundTower } from '../../Entity/Tower/Specs/EndOfRoundTower';

export class GameTurn {

    private _endOfTurnTowerArray: (Tower & EndOfRoundTower)[] = [];

    public EndOfRoundTowers(): (Tower & EndOfRoundTower)[] {
        return this._endOfTurnTowerArray;
    }


    public AddEndOfRoundTower(id: number, endOfRoundTower: EndOfRoundTower & Tower): void {
        this._endOfTurnTowerArray.push(endOfRoundTower);
    }

    public RemoveEndOfRoundTower(id: number): void {
        this._endOfTurnTowerArray = this._endOfTurnTowerArray.filter((tower) => {
            return tower.UniqueID !== id;
        });

    }
}
