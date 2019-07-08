/**
 *  [Night Elf] Wolven Fury
 *  Gives tower increased damage
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';


export class WolvenFury extends GenericAbility implements AbilityOnCastTargetsUnit {
    private givesAbility: number = FourCC('A0C4');
    private maxLevel: number = 10;

    constructor(game: WarcraftMaul) {
        super('A0BG', game);
    }

    public TargetOnCastAction(): void {
        const target: unit = GetSpellTargetUnit();

        if (target) {
            if (GetUnitAbilityLevelSwapped(this.givesAbility, target) >= this.maxLevel) {
                return;
            }
            if (GetUnitAbilityLevelSwapped(this.givesAbility, target) >= 1) {
                IncUnitAbilityLevelSwapped(this.givesAbility, target);
            } else {
                UnitAddAbilityBJ(this.givesAbility, target);
            }
        }

    }


}
