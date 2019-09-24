import { WarcraftMaul } from '../../../WarcraftMaul';
import { FinalDamageModificationCreepAbility } from './FinalDamageModificationCreepAbility';
import { Creep } from '../../Creep';
import { AttackActionCreepAbility } from './AttackActionCreepAbility';
import { WaveCreep } from '../../WaveCreep';
import { DivineShield } from '../DivineShield';

export class CreepAbility {

    private readonly abilityId: number;
    private _game: WarcraftMaul | undefined;

    constructor(abiID: string, abilityUnit: unit) {
        this.abilityId = FourCC(abiID);
        UnitAddAbility(abilityUnit, this.abilityId);
    }

    public SetupGame(game: WarcraftMaul): void {
        this._game = game;
    }

    get game(): WarcraftMaul | undefined {
        return this._game;
    }

    set game(value: WarcraftMaul | undefined) {
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
        if (!this.game || !this.game.worldMap.gameRoundHandler) {
            return;
        }
        const currentWave: WaveCreep = this.game.worldMap.waveCreeps[this.game.worldMap.gameRoundHandler.currentWave - 1];
        if (this.GetID() === FourCC('A01E') && currentWave.getCreepType() === CREEP_TYPE.AIR) {
            return;
        }
        UnitAddAbilityBJ(this.GetID(), creep.creep);
        SetUnitAbilityLevelSwapped(this.GetID(), creep.creep, this.game.worldMap.gameRoundHandler.currentWave + 1);
    }
}
