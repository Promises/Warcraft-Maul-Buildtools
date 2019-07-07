import { WarcraftMaul } from '../../../WarcraftMaul';
import { FinalDamageModificationCreepAbility } from './FinalDamageModificationCreepAbility';
import { Creep } from '../../Creep';
import { AttackActionCreepAbility } from './AttackActionCreepAbility';
import { WaveCreep } from '../../WaveCreep';
import { DivineShield } from '../DivineShield';

export class CreepAbility {

    private abilityId: number;
    private _game: WarcraftMaul;

    constructor(abiID: string, game: WarcraftMaul) {
        this.abilityId = FourCC(abiID);
        this._game = game;
        const u: unit = CreateUnit(Player(bj_PLAYER_NEUTRAL_EXTRA), FourCC('uloc'), 0, 0, 0);
        UnitAddAbilityBJ(FourCC(abiID), u);
        UnitAddAbilityBJ(FourCC('A06B'), u);
        RemoveUnit(u);

    }

    get game(): WarcraftMaul {
        return this._game;
    }

    set game(value: WarcraftMaul) {
        this._game = value;
    }

    public GetID(): number {
        return this.abilityId;
    }


    public IsFinalDamageModificationCreepAbility(): this is FinalDamageModificationCreepAbility {
        return 'ModifyFinalDamage' in this;
    }

    public IsAttackActionCreepAbility(): this is AttackActionCreepAbility {
        return 'AttackAction' in this;
    }

    public AddAbilityToCreep(creep: Creep): void {
        const currentWave: WaveCreep = this.game.worldMap.waveCreeps[this.game.gameRoundHandler.currentWave - 1];
        if (this.GetID() === FourCC('A01E') && currentWave.getCreepType() === CREEP_TYPE.AIR) {
            return;
        }
        UnitAddAbilityBJ(this.GetID(), creep.creep);
        SetUnitAbilityLevelSwapped(this.GetID(), creep.creep, this.game.gameRoundHandler.currentWave + 1);
    }
}
