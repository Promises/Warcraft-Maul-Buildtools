/**
 *  Channel WCItem (Alliance Of Blades)
 *  Give item to another alliance tower
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../Players/Defender';
import { Tower } from '../../Tower/Specs/Tower';


export class ChannelItem extends GenericAbility implements AbilityOnEffectTargetsUnit {
    constructor(game: WarcraftMaul) {
        super('A05H', game);
    }

    private allianceTowers: number[] = [
        FourCC('n02T'),
        FourCC('n02X'),
        FourCC('n02V'),
        FourCC('n02U'),
        FourCC('n007'),
        FourCC('n02W'),
        FourCC('n012'),
    ];


    public TargetOnEffectAction(): void {
        const u: unit = GetTriggerUnit();
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(u)));
        if (owner) {

            const tower: Tower | undefined = owner.GetTower(GetHandleId(u));
            if (tower) {
                if (this.allianceTowers.indexOf(GetUnitTypeId(GetSpellTargetUnit())) >= 0) {
                    UnitAddItemSwapped(UnitItemInSlotBJ(tower.tower, 1), GetSpellTargetUnit());
                }

            }
        }

    }


}
