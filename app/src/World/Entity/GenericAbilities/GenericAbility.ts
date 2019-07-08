import { WarcraftMaul } from '../../WarcraftMaul';

export class GenericAbility {

    private abilityId: number;
    private _game: WarcraftMaul;
    constructor(abiID: string, game: WarcraftMaul){
        this.abilityId = FourCC(abiID);
        this._game = game;
    }

    get game(): WarcraftMaul {
        return this._game;
    }

    set game(value: WarcraftMaul) {
        this._game = value;
    }


    public Condition(): boolean{
        return GetSpellAbilityId() === this.abilityId;
    }

    public IsAttackActionAbility(): this is AttackActionAbility {
        return 'AttackAction' in this;
    }

    public IsAbilityOnEffectTargetsUnit(): this is AbilityOnEffectTargetsUnit {
        return 'TargetOnEffectAction' in this;
    }
    public IsAbilityOnCastTargetsUnit(): this is AbilityOnCastTargetsUnit {
        return 'TargetOnCastAction' in this;
    }
}
