/**
 *  Construct Thaddius (Naxxramas)
 *  Combines Stalagg and Feugen to Thaddius
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../Players/Defender';
import { Tower } from '../../Tower/Specs/Tower';


export class ConstructThaddius extends GenericAbility implements AbilityOnEffectTargetsUnit {
    constructor(game: WarcraftMaul) {
        super('A0F5', game);
    }

    public TargetOnEffectAction(): void {
        const u: unit = GetTriggerUnit();
        const t: unit = GetSpellTargetUnit();
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(u)));
        if (owner) {

            const source: Tower | undefined = owner.GetTower(GetHandleId(u));
            const target: Tower | undefined = owner.GetTower(GetHandleId(t));
            if (source && target) {
                if ((source.GetTypeID() === FourCC('oC7D') && target.GetTypeID() === FourCC('oC7E')) ||
                    (source.GetTypeID() === FourCC('oC7E') && target.GetTypeID() === FourCC('oC7D'))) {
                    source.Upgrade(FourCC('oC7F'));
                    const newTower: Tower | undefined = target.Upgrade(FourCC('oC76'));
                    newTower.towerValue = 8;
                }
            }
        }

    }


}
