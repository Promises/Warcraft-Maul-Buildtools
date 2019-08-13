/**
 *  [Void] PayTheToll
 *  Pay a sum to remove a husk
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../Players/Defender';
import { Tower } from '../../Tower/Specs/Tower';


export class PayTheToll extends GenericAbility implements AbilityOnCastTargetsUnit {

    constructor(game: WarcraftMaul) {
        super('A0BF', game);
    }

    public TargetOnCastAction(): void {
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(GetSpellAbilityUnit())));
        if (owner) {
            const tower: Tower | undefined = owner.GetTower(GetHandleId(GetSpellAbilityUnit()));
            if (tower) {
                if (owner.getGold() >= 50) {
                    tower.Sell();
                    RemoveUnit(tower.tower);
                    owner.giveGold(-50);
                    if (tower.GetID() === FourCC('h02S')) {
                        owner.SetVoidFragmentTick(owner.GetVoidFragmentTick() - 1);
                    }
                }
            }
        }

    }


}
