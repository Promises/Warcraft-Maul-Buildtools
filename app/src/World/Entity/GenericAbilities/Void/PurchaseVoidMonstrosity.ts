/**
 *  [Void] Purchase void Monstrosity
 *  Buy the void Monstrosity with void fragments
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../Players/Defender';


export class PurchaseVoidMonstrosity extends GenericAbility implements AbilityOnCastTargetsUnit {

    constructor(game: WarcraftMaul) {
        super('A0BK', game);
    }

    public TargetOnCastAction(): void {
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(GetSpellAbilityUnit())));
        if (owner) {
            if (owner.GetVoidFragments() >= 800) {
                owner.SetVoidFragments(owner.GetVoidFragments() - 800);
            }
        }

    }


}
