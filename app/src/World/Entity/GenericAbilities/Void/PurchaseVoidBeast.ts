/**
 *  [Void] Purchase void Beast
 *  Buy the void bEast with void fragments
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../Players/Defender';


export class PurchaseVoidBeast extends GenericAbility implements AbilityOnCastTargetsUnit {

    constructor(game: WarcraftMaul) {
        super('A0BJ', game);
    }

    public TargetOnCastAction(): void {
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(GetSpellAbilityUnit())));
        if (owner) {
            if (owner.GetVoidFragments() >= 400) {
                owner.SetVoidFragments(owner.GetVoidFragments() - 400);
            }
        }

    }


}
