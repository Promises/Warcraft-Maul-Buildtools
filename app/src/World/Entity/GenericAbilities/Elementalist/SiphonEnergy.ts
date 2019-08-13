/**
 *  Siphon Energy (Elementalist)
 *  Combines two runes to one tower
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../Players/Defender';
import { Tower } from '../../Tower/Specs/Tower';


export class SiphonEnergy extends GenericAbility implements AbilityOnEffectTargetsUnit {
    constructor(game: WarcraftMaul) {
        super('A0CT', game);
    }

    public TargetOnEffectAction(): void {
        const u: unit = GetTriggerUnit();
        const t: unit = GetSpellTargetUnit();
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(u)));
        if (owner) {

            const source: Tower | undefined = owner.GetTower(GetHandleId(u));
            const target: Tower | undefined = owner.GetTower(GetHandleId(t));
            if (source && target) {
                if (this.game.abilityHandler.elementalistSettings.HasCombination(
                    DecodeFourCC(source.GetID()), DecodeFourCC(target.GetID()))) {
                    source.Sell();
                    target.Sell();
                    const newSource: unit = ReplaceUnitBJ(
                        source.tower,
                        FourCC(this.game.abilityHandler.elementalistSettings.GetCombination(
                            DecodeFourCC(source.GetID()), DecodeFourCC(target.GetID()))),
                        bj_UNIT_STATE_METHOD_DEFAULTS);
                    const newTarget: unit = ReplaceUnitBJ(
                        target.tower,
                        FourCC('n027'),
                        bj_UNIT_STATE_METHOD_DEFAULTS);
                    this.game.worldMap.towerConstruction.SetupTower(newSource, owner);
                    this.game.worldMap.towerConstruction.SetupTower(newTarget, owner);
                }

            }
        }

    }


}
