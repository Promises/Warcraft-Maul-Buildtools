/**
 *  [Night Elf] Feline Swiftness
 *  Gives tower increased speed
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';


export class FelineSwiftness extends GenericAbility implements AbilityOnCastTargetsUnit {
    private givesAbility: number = FourCC('S007');
    private maxLevel: number = 10;

    constructor(game: WarcraftMaul) {
        super('A0B4', game);
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
