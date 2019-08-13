/**
 *  Awaken a dormant pheonix egg
 */
import { GenericAbility } from '../GenericAbility';
import { Defender } from '../../Players/Defender';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Tower } from '../../Tower/Specs/Tower';


export class AwakenDormantPheonixEgg extends GenericAbility implements AbilityOnEffectTargetsUnit {
    constructor(game: WarcraftMaul) {
        super('A0DV', game);
    }


    public TargetOnEffectAction(): void {
        const u: unit = GetTriggerUnit();
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(u)));
        if (owner) {

            const tower: Tower | undefined = owner.GetTower(GetHandleId(u));
            if (tower) {
                if (GetUnitStateSwap(UNIT_STATE_MANA, tower.tower) >= 5) {
                    tower.Sell();
                    this.game.worldMap.towerConstruction.SetupTower(
                        ReplaceUnitBJ(tower.tower, FourCC('h006'), bj_UNIT_STATE_METHOD_DEFAULTS),
                        tower.owner);
                }
            }
        }

    }


}
