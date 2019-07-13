import { WarcraftMaul } from '../../WarcraftMaul';
import { CreepAbility } from './specs/CreepAbility';
import { DivineShield } from './DivineShield';
import { CrippleAura } from './CrippleAura';
import { WaveCreep } from '../WaveCreep';
import { VampiricAura } from './VampiricAura';
import { WalkItOff } from './WalkItOff';
import { HardnedSkin } from './HardnedSkin';
import { Evasion } from './Evasion';
import { ArmorBonus } from './ArmorBonus';
import { SpellShield } from './SpellShield';
import { TornadoAura } from './TornadoAura';
import { MorningPerson } from './MorningPerson';

export class CreepAbilityHandler {
    private game: WarcraftMaul;
    private abilities: object[] = [];
    private activeAbilities: CreepAbility[] = [];


    constructor(game: WarcraftMaul) {
        this.game = game;
        this.AddAbilitiesToList();
        this.SetupAbilities();
    }

    private AddAbilitiesToList(): void {
        this.abilities.push(HardnedSkin);
        this.abilities.push(Evasion);
        this.abilities.push(ArmorBonus);
        this.abilities.push(CrippleAura);
        this.abilities.push(SpellShield);
        this.abilities.push(TornadoAura);
        this.abilities.push(VampiricAura);
        this.abilities.push(DivineShield);
        this.abilities.push(WalkItOff);
        this.abilities.push(MorningPerson);
    }


    private SetupAbilities(): void {

        for (const ability of this.abilities) {
            // @ts-ignore
            const ObjectExtendsAbility: CreepAbility = new ability(this.game);


            if (ObjectExtendsAbility.IsFinalDamageModificationCreepAbility()) {
                this.game.gameDamageEngine.AddFinalDamageModificationCreepAbility(ObjectExtendsAbility);
            }

            if (ObjectExtendsAbility.IsAttackActionCreepAbility()) {
                this.game.gameDamageEngine.AddInitialDamageEventCreepAbility(ObjectExtendsAbility);
            }


            this.activeAbilities.push(ObjectExtendsAbility);
        }

    }

    public GetAbilitiesForWave(wave: WaveCreep): CreepAbility[] {
        let currentDiff: number = this.game.diffVote.difficulty;
        if (currentDiff === 100) {
            return [];
        }
        currentDiff -= 100;
        const allAbilities: CreepAbility[] = this.activeAbilities.slice(0, this.activeAbilities.length - 1);
        // allAbilities.sort(() => 0.5 - Math.random());
        this.ShuffleArray(allAbilities);
        let picks: number = Math.floor(currentDiff / 100);
        const rest: number = currentDiff % 100;

        if (Util.RandomInt(1, 100) <= rest) {
            picks++;
        }
        if (picks === 0) {
            return [];
        }
        return allAbilities.slice(0, IMinBJ(picks - 1, allAbilities.length - 1));
    }

    private ShuffleArray(arr: any[]): void {
        for (let i: number = arr.length - 1; i > 0; i--) {
            let j: number = Math.floor(Math.random() * (i + 1)); // random index from 0 to i
            // [arr[i], arr[j]] = [arr[j], arr[i]]; // swap elements

            const temp: any = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
        }
    }
}
