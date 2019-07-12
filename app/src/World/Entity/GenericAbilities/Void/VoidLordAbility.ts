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
            const tower: Tower | undefined = owner.towers.get(GetHandleId(GetSpellAbilityUnit()));
            const target: Tower | undefined = owner.towers.get(GetHandleId(GetSpellTargetUnit()));
            if (tower && target) {
                if (tower.GetID() === FourCC('h01O') && target.GetID() === FourCC('h02G')) {
                    BlzSetUnitBaseDamage(tower.tower, (BlzGetUnitBaseDamage(tower.tower, 0) + 250), 0);
                    target.Sell();
                    const newTarget: unit = ReplaceUnitBJ(target.tower, FourCC('h02S'), bj_UNIT_STATE_METHOD_DEFAULTS);
                    this.game.worldMap.towerConstruction.SetupTower(newTarget, owner);
                }
            }
        }

    }


}
