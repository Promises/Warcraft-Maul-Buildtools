/**
 *  [Void] Purchase void Lord
 *  Buy the void Lord with void fragments
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../Players/Defender';


export class PurchaseVoidLord extends GenericAbility implements AbilityOnCastTargetsUnit {

    constructor(game: WarcraftMaul) {
        super('A0BL', game);
    }

    public TargetOnCastAction(): void {
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(GetSpellAbilityUnit())));
        if (owner) {
            if (owner.GetVoidFragments() >= 1200) {
                owner.SetVoidFragments(owner.GetVoidFragments() - 1200);
            }
        }

    }


}
