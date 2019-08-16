/**
 *  UnchargedRuneMorph (Elementalist)
 *  Forces target unit to move
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../Players/Defender';
import { Tower } from '../../Tower/Specs/Tower';


export class UnchargedRuneMorph extends GenericAbility implements AbilityOnEffectTargetsUnit {
    private abilities: number[] = [
        FourCC('A0BO'),
        FourCC('A0BS'),
        FourCC('A0C0'),
        FourCC('A0C1'),
        FourCC('A0C2'),
        FourCC('A0C3'),
    ];
    private towers: number[] = [
        FourCC('n01R'),
        FourCC('n01S'),
        FourCC('n022'),
        FourCC('n023'),
        FourCC('n024'),
        FourCC('n025'),
    ];


    constructor(game: WarcraftMaul) {
        super('A0BO', game);
    }

    public Condition(): boolean {
        return this.abilities.indexOf(GetSpellAbilityId()) >= 0;
    }

    public TargetOnEffectAction(): void {
        const u: unit = GetTriggerUnit();
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(u)));
        if (owner) {

            const tower: Tower | undefined = owner.GetTower(GetHandleId(u));
            if (tower) {
                tower.Upgrade(this.towers[this.abilities.indexOf(GetSpellAbilityId())]);
            }
        }

    }


}
