import { WarcraftMaul } from '../../WarcraftMaul';
import { GenericAbility } from './GenericAbility';
import { FrostAttack } from './FrostAttack';
import { Trigger } from '../../../JassOverrides/Trigger';
import { Move } from './Move';

export class GenericAbilityHandler {
    private game: WarcraftMaul;
    private abilities: object[] = [];
    private activeAbilities: GenericAbility[] = [];
    private targetUnitAbilities: (GenericAbility & AbilityTargetsUnit)[] = [];
    private targetUnitAbilitiesTrigger: Trigger;

    constructor(game: WarcraftMaul) {
        this.game = game;
        this.AddAbilitiesToList();
        this.SetupAbilities();
        this.targetUnitAbilitiesTrigger = new Trigger();
        this.targetUnitAbilitiesTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_EFFECT);
        this.targetUnitAbilitiesTrigger.AddAction(() => this.DoTargetUnitAbilities());
    }

    private AddAbilitiesToList(): void {
        this.abilities.push(FrostAttack);
        this.abilities.push(Move);

    }


    private DoTargetUnitAbilities(): void {
        for (const tower of this.targetUnitAbilities) {
            if (tower.Condition()) {
                tower.TargetAction();
            }
        }
    }

    private SetupAbilities(): void {

        for (const ability of this.abilities) {
            // @ts-ignore
            const ObjectExtendsAbility: GenericAbility = new ability(this.game);


            if (ObjectExtendsAbility.IsAttackActionAbility()) {
                this.game.gameDamageEngine.AddInitialDamageEventAbility(ObjectExtendsAbility);
            }

            if (ObjectExtendsAbility.IsAbilityTargetsUnit()) {
                this.targetUnitAbilities.push(ObjectExtendsAbility);
            }

            this.activeAbilities.push(ObjectExtendsAbility);
        }

    }
}
