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
        0;
        this.abilities.push(Evasion);
        1;
        this.abilities.push(ArmorBonus);
        2;
        this.abilities.push(CrippleAura);
        3;
        this.abilities.push(SpellShield);
        4;
        this.abilities.push(TornadoAura);
        5;
        this.abilities.push(VampiricAura);
        6;
        this.abilities.push(DivineShield);
        7;
        this.abilities.push(WalkItOff);
        8;
        this.abilities.push(MorningPerson);
        9;
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
        const abilities: CreepAbility[] = [];
        while (currentDiff > 0) {
            const chance: number = RMinBJ(currentDiff, 100);
            if (Util.RandomInt(1, 100) <= chance) {
                const ability: CreepAbility = this.activeAbilities[Util.RandomInt(0, this.activeAbilities.length - 1)];
                if (!(abilities.indexOf(ability) >= 0)) {
                    if (!(wave.getCreepType() === CREEP_TYPE.AIR && ability instanceof DivineShield)) {
                        abilities.push(ability);
                        currentDiff -= 100;
                    } else {
                        if (abilities.length === this.activeAbilities.length - 1) {
                            currentDiff = 0;
                        }
                    }

                } else {
                    if (abilities.length === this.activeAbilities.length) {
                        currentDiff = 0;
                    }
                }
            }
        }

        return abilities;
    }
}
