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
        super('A095', game);
    }

    public TargetOnCastAction(): void {
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(GetSpellAbilityUnit())));
        if (owner) {
            const tower: Tower | undefined = owner.GetTower(GetHandleId(GetSpellAbilityUnit()));
            const target: Tower | undefined = owner.GetTower(GetHandleId(GetSpellTargetUnit()));
            if (tower && target) {
                CreateTextTagUnitBJ('TRIGSTR_7924', target.tower, 0, 10, 100, 100, 100, 0);
                SetTextTagVelocityBJ(GetLastCreatedTextTag(), 40.00, 90);
                SetTextTagPermanentBJ(GetLastCreatedTextTag(), false);
                SetTextTagLifespanBJ(GetLastCreatedTextTag(), 4.00);
                SetTextTagFadepointBJ(GetLastCreatedTextTag(), 2.00);
                owner.SetVoidFragments(owner.GetVoidFragments() + 10);
                if (owner.getVoidBuilder()) {
                    SetUnitManaBJ(<unit>owner.getVoidBuilder(), owner.GetVoidFragments());

                }

            }
        }

    }


}
