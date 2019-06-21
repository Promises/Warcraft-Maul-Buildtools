import { Trigger } from '../../../JassOverrides/Trigger';
import * as settings from '../../GlobalSettings';

export class SellTower {

    sellTrigger: Trigger;

    constructor() {
        this.sellTrigger = new Trigger();
        this.sellTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_EFFECT);
        this.sellTrigger.AddCondition(() => this.AreWeSellingTheTower());
        this.sellTrigger.AddAction(() => this.SellTower());
    }


    private AreWeSellingTheTower() {
        return GetSpellAbilityId() == FourCC('A02D');
    }


    private SellTower() {
        let u = GetTriggerUnit();
        let value = GetUnitPointValue(u);
        let txt = CreateTextTagUnitBJ(I2S(value), u, 1, 10, 100, 80.00, 0.00, 0);

        SetTextTagPermanentBJ(txt, false);
        SetTextTagLifespanBJ(txt, 2.00);
        SetTextTagVelocityBJ(txt, 64, 90);
        DestroyEffect(AddSpecialEffect('Abilities\\Spells\\Items\\ResourceItems\\ResourceEffectTarget.mdl', GetUnitX(u), GetUnitY(u)));
        PlaySoundOnUnitBJ(settings.Sounds.goldSound, 100, u);
        let player = settings.players.get(GetPlayerId(GetOwningPlayer(u)));
        if (player) {
            player.giveGold(value);
        }
        ShowUnitHide(u);
        RemoveUnit(u);
    }
}
