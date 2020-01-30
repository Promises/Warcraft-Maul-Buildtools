/**
 *  [Void] VoidLordAbility
 *  Consume void worshipper for 250 extra dmg
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../Players/Defender';
import { Tower } from '../../Tower/Specs/Tower';


export class VoidLordAbility extends GenericAbility implements AbilityOnCastTargetsUnit {

    constructor(game: WarcraftMaul) {
        super('A09E', game);
    }

    public TargetOnCastAction(): void {
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(GetSpellAbilityUnit())));
        if (owner) {
            const tower: Tower | undefined = owner.GetTower(GetHandleId(GetSpellAbilityUnit()));
            const target: Tower | undefined = owner.GetTower(GetHandleId(GetSpellTargetUnit()));
            if (tower && target) {
                if (tower.GetTypeID() === FourCC('h01O') && target.GetTypeID() === FourCC('h02G')) {
                    BlzSetUnitBaseDamage(tower.tower, (BlzGetUnitBaseDamage(tower.tower, 0) + 250), 0);
                    target.Upgrade(FourCC('h02S'));
                }
            }
        }

    }


}
