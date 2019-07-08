import { WarcraftMaul } from '../../WarcraftMaul';
import { GenericAbility } from './GenericAbility';
import { FrostAttack } from './FrostAttack';
import { Trigger } from '../../../JassOverrides/Trigger';
import { Move } from './Move';
import { FelineSwiftness } from './NightElfAncientProtector/FelineSwiftness';
import { NaturesNourishment } from './NightElfAncientProtector/NaturesNourishment';
import { WolvenFury } from './NightElfAncientProtector/WolvenFury';

export class GenericAbilityHandler {
    private game: WarcraftMaul;
    private abilities: object[] = [];
    private activeAbilities: GenericAbility[] = [];
    private targetUnitOnEffectAbilities: (GenericAbility & AbilityOnEffectTargetsUnit)[] = [];
    private targetUnitOnCastAbilities: (GenericAbility & AbilityOnCastTargetsUnit)[] = [];
    private targetUnitOnEffectAbilitiesTrigger: Trigger;
    private targetUnitOnCastAbilitiesTrigger: Trigger;

    constructor(game: WarcraftMaul) {
        this.game = game;
        this.AddAbilitiesToList();
        this.SetupAbilities();
        this.targetUnitOnEffectAbilitiesTrigger = new Trigger();
        this.targetUnitOnEffectAbilitiesTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_EFFECT);
        this.targetUnitOnEffectAbilitiesTrigger.AddAction(() => this.DoTargetUnitOnEffectAbilities());
        this.targetUnitOnCastAbilitiesTrigger = new Trigger();
        this.targetUnitOnCastAbilitiesTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_CAST);
        this.targetUnitOnCastAbilitiesTrigger.AddAction(() => this.DoTargetUnitOnCastAbilities());
    }

    private AddAbilitiesToList(): void {
        this.abilities.push(FrostAttack);
        this.abilities.push(Move);
        this.abilities.push(FelineSwiftness);
        this.abilities.push(NaturesNourishment);
        this.abilities.push(WolvenFury);

    }


    private DoTargetUnitOnEffectAbilities(): void {
        for (const tower of this.targetUnitOnEffectAbilities) {
            if (tower.Condition()) {
                tower.TargetOnEffectAction();
            }
        }
    }
    private DoTargetUnitOnCastAbilities(): void {
        for (const tower of this.targetUnitOnCastAbilities) {
            if (tower.Condition()) {
                tower.TargetOnCastAction();
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

            if (ObjectExtendsAbility.IsAbilityOnEffectTargetsUnit()) {
                this.targetUnitOnEffectAbilities.push(ObjectExtendsAbility);
            }

            if (ObjectExtendsAbility.IsAbilityOnCastTargetsUnit()) {
                this.targetUnitOnCastAbilities.push(ObjectExtendsAbility);
            }

            this.activeAbilities.push(ObjectExtendsAbility);
        }

    }
}
