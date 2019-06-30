import { WarcraftMaul } from '../../WarcraftMaul';
import { GenericAbility } from './GenericAbility';
import { FrostAttack } from './FrostAttack';

export class GenericAbilityHandler {
    private game: WarcraftMaul;
    private abilities: object[] = [];
    private activeAbilities: GenericAbility[] = [];

    constructor(game: WarcraftMaul) {
        this.game = game;
        this.AddAbilitiesToList();
        this.SetupAbilities();
    }

    private AddAbilitiesToList(): void {
        this.abilities.push(FrostAttack);

    }

    private SetupAbilities(): void {

        for (const ability of this.abilities) {
            // @ts-ignore
            const ObjectExtendsAbility: GenericAbility = new ability(this.game);


            if (ObjectExtendsAbility.IsAttackActionAbility()) {
                this.game.gameDamageEngine.AddInitialDamageEventAbility(ObjectExtendsAbility);
            }

            this.activeAbilities.push(ObjectExtendsAbility);
        }

    }
}
