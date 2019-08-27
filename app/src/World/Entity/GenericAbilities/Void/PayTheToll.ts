/**
 *  [Void] PayTheToll
 *  Pay a sum to remove a husk
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../Players/Defender';
import { Tower } from '../../Tower/Specs/Tower';
import { AntiJuggleTower } from '../../AntiJuggle/AntiJuggleTower';


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
                    this.game.worldMap.antiBlock.CleanUpRemovedConstruction(tower.tower);
                    if (this.game.gameRoundHandler.isWaveInProgress) {
                        const antijuggle: AntiJuggleTower = new AntiJuggleTower(this.game, tower);
                    }
                    owner.giveGold(-50);
                    if (tower.GetTypeID() === FourCC('h02S')) {
                        owner.SetVoidFragmentTick(owner.GetVoidFragmentTick() - 1);
                    }
                }
            }
        }

    }


}
