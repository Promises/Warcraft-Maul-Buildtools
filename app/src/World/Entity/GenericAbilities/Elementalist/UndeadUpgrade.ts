/**
 *  Upgrade undead to lvl 2
 */
import { GenericAbility } from '../GenericAbility';
import { Defender } from '../../Players/Defender';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Tower } from '../../Tower/Specs/Tower';


export class UndeadUpgrade extends GenericAbility implements AbilityOnEffectTargetsUnit {
    constructor(game: WarcraftMaul) {
        super('A0E6', game);
    }


    public TargetOnEffectAction(): void {
        const u: unit = GetTriggerUnit();
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(u)));
        if (owner) {

            const tower: Tower | undefined = owner.GetTower(GetHandleId(u));
            if (tower) {
                tower.Sell();
                this.game.worldMap.towerConstruction.SetupTower(
                    ReplaceUnitBJ(tower.tower, FourCC('u038'), bj_UNIT_STATE_METHOD_DEFAULTS),
                    tower.owner);
            }
        }

    }


}
