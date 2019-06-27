import { WarcraftMaul } from '../../../WarcraftMaul';
import { DamageEngine } from '../../../Game/DamageEngine';
import { DamageEngineGlobals } from '../../../Game/DamageEngineGlobals';
import { DamageModificationTower } from '../../Tower/Specs/DamageModificationTower';
import { DamageModificationBuff } from './DamageModificationBuff';
import { AttackActionBuff } from './AttackActionBuff';

export class Buff {



    private buffID: number;
    private game: WarcraftMaul;
    private _damageEngine: DamageEngine;
    private _damageEngineGlobals: DamageEngineGlobals;

    constructor(buffID: string, game: WarcraftMaul) {
        this.buffID = FourCC(buffID);
        this.game = game;
        this._damageEngine = this.game.gameDamageEngine;
        this._damageEngineGlobals = this.game.gameDamageEngineGlobals;

    }

    public Condition(target: unit): boolean {
        return (UnitHasBuffBJ(target, this.buffID));
    }

    get damageEngine(): DamageEngine {
        return this._damageEngine;
    }


    get damageEngineGlobals(): DamageEngineGlobals {
        return this._damageEngineGlobals;
    }

    public IsDamageModificationBuff(): this is DamageModificationBuff {
        return 'ModifyDamage' in this;
    }
    public IsAttackActionBuff(): this is AttackActionBuff {
        return 'AttackAction' in this;
    }

}
