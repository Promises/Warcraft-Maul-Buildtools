/**
 *  [Night Elf] Wolven Fury
 *  Gives tower increased damage
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';


export class NaturesNourishment extends GenericAbility implements AbilityOnCastTargetsUnit {
    private givesAbilityOne: number = FourCC('A0BX');
    private givesAbilityTwo: number = FourCC('S009');
    private maxLevel: number = 5;

    constructor(game: WarcraftMaul) {
        super('A0BI', game);
    }

    public TargetOnCastAction(): void {
        const target: unit = GetSpellTargetUnit();

        if (target) {
            if (!(GetUnitAbilityLevelSwapped(this.givesAbilityOne, target) >= this.maxLevel)) {
                if (GetUnitAbilityLevelSwapped(this.givesAbilityOne, target) >= 1) {
                    IncUnitAbilityLevelSwapped(this.givesAbilityOne, target);
                } else {
                    UnitAddAbilityBJ(this.givesAbilityOne, target);
                }
            }
            if (!(GetUnitAbilityLevelSwapped(this.givesAbilityTwo, target) >= this.maxLevel)) {
                if (GetUnitAbilityLevelSwapped(this.givesAbilityTwo, target) >= 1) {
                    IncUnitAbilityLevelSwapped(this.givesAbilityTwo, target);
                } else {
                    UnitAddAbilityBJ(this.givesAbilityTwo, target);
                }
            }

        }

    }


}
