import { Trigger } from '../../../JassOverrides/Trigger';
import * as settings from '../../GlobalSettings';
import {WarcraftMaul} from "../../WarcraftMaul";

export class SellTower {

    sellTrigger: Trigger;
    game: WarcraftMaul

    constructor(game: WarcraftMaul) {
        this.game = game;
        this.sellTrigger = new Trigger();
        this.sellTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_EFFECT);
        this.sellTrigger.AddCondition(() => this.AreWeSellingTheTower());
        this.sellTrigger.AddAction(() => this.SellTower());
    }


    private AreWeSellingTheTower() {
        return GetSpellAbilityId() == FourCC('A02D');
    }


    private SellTower() {
        const u = GetTriggerUnit();
        const value = GetUnitPointValue(u);
        const txt = CreateTextTagUnitBJ(I2S(value), u, 1, 10, 100, 80.00, 0.00, 0);

        SetTextTagPermanentBJ(txt, false);
        SetTextTagLifespanBJ(txt, 2.00);
        SetTextTagVelocityBJ(txt, 64, 90);
        DestroyEffect(AddSpecialEffect('Abilities\\Spells\\Items\\ResourceItems\\ResourceEffectTarget.mdl', GetUnitX(u), GetUnitY(u)));
        PlaySoundOnUnitBJ(settings.Sounds.goldSound, 100, u);
        const playerId = GetPlayerId(GetOwningPlayer(u));
        const player = settings.players.get(playerId);
        if (player) {
            player.giveGold(value);
        }
        ShowUnitHide(u);
        RemoveUnit(u);

        const maze = this.game.worldMap.playerMazes[playerId];
        const x = GetUnitX(u);
        const y = GetUnitY(u);
        const leftSide = ((x - 64) - maze.minX) / 64;
        const rightSide = (x - maze.minX) / 64;
        const topSide = (y - maze.minY) / 64;
        const bottomSide = ((y - 64) - maze.minY) / 64;
        maze.setBlocked(leftSide + bottomSide * maze.width, true);
        maze.setBlocked(rightSide + bottomSide * maze.width, true);
        maze.setBlocked(leftSide + topSide * maze.width, true);
        maze.setBlocked(rightSide + topSide * maze.width, true);
    }
}
