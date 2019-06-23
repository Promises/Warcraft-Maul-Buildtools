import { Defender } from '../Players/Defender';
import { WarcraftMaul } from '../../WarcraftMaul';
import { EndOfRoundTower } from './EndOfRoundTower';
import { AttackActionTower } from './AttackActionTower';
import { GenericAutoAttackTower } from './GenericAutoAttackTower';

export class Tower {
    private _tower: unit;
    private _handleId: number;
    private _owner: Defender;
    private _game: WarcraftMaul;

    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {
        this._game = game;
        this._tower = tower;
        this._handleId = GetHandleIdBJ(tower);
        this._owner = owner;
        owner.AddTower(this);

    }

    public get game(): WarcraftMaul {
        return this._game;
    }

    public get handleId(): number {
        return this._handleId;
    }

    public get owner(): Defender {
        return this._owner;
    }

    public get tower(): unit {
        return this._tower;
    }

    public IsEndOfRoundTower(): this is EndOfRoundTower {
        return 'EndOfRoundAction' in this;
    }

    public IsAttackActionTower(): this is AttackActionTower {
        return 'AttackAction' in this;
    }

    public IsGenericAutoAttackTower(): this is GenericAutoAttackTower {
        return 'GenericAttack' in this;
    }

}
