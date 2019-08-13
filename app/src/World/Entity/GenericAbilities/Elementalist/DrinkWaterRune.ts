/**
 *  Moss consumes water rune
 */
import { GenericAbility } from '../GenericAbility';
import { Defender } from '../../Players/Defender';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Tower } from '../../Tower/Specs/Tower';


export class DrinkWaterRune extends GenericAbility implements AbilityOnEffectTargetsUnit {
    constructor(game: WarcraftMaul) {
        super('A0E3', game);
    }


    public TargetOnEffectAction(): void {
        const u: unit = GetTriggerUnit();
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(u)));
        if (owner) {

            const tower: Tower | undefined = owner.GetTower(GetHandleId(u));
            const target: Tower | undefined = owner.GetTower(GetHandleId(GetSpellTargetUnit()));
            if (tower && target) {
                const mana: number = GetUnitStateSwap(UNIT_STATE_MANA, tower.tower);

                if (target.GetID() === FourCC('n01R')) {
                    target.Sell();
                    const newTarget: unit = ReplaceUnitBJ(target.tower, FourCC('n027'), bj_UNIT_STATE_METHOD_DEFAULTS);
                    this.game.worldMap.towerConstruction.SetupTower(newTarget, target.owner);
                    if (mana > 8) {
                        let newId: number = FourCC('u037');
                        if (Util.RandomInt(1000, 2000) === 1337) {
                            newId = FourCC('h03G');
                        }
                        const newTower: unit = ReplaceUnitBJ(tower.tower, newId, bj_UNIT_STATE_METHOD_DEFAULTS);
                        this.game.worldMap.towerConstruction.SetupTower(newTower, target.owner);

                    } else {
                        SetUnitManaBJ(tower.tower, mana + 1.00);
                    }
                }
            }
        }

    }


}
