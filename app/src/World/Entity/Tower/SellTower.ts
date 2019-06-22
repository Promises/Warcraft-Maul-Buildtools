import {Trigger} from '../../../JassOverrides/Trigger';
import * as settings from '../../GlobalSettings';
import {WarcraftMaul} from "../../WarcraftMaul";
import {Rectangle} from "../../../JassOverrides/Rectangle";
import {Log} from "../../../lib/Serilog/Serilog";

export class SellTower {

    sellTrigger: Trigger;
    game: WarcraftMaul;

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
        let playerSpawnId: undefined | number = undefined;
        for (let i = 0; i < settings.PLAYER_AREAS.length; i++) {
            if (new Rectangle(settings.PLAYER_AREAS[i]).ContainsUnit(u)) {
                playerSpawnId = i;
                break;
            }
        }

        if (playerSpawnId === undefined) {
            Log.Error("Unable to locate the correct player spawn");
            return;
        }

        const player = settings.players.get(GetPlayerId(GetOwningPlayer(u)));
        const txt = CreateTextTagUnitBJ(I2S(value), u, 1, 10, 100, 80.00, 0.00, 0);

        SetTextTagPermanentBJ(txt, false);
        SetTextTagLifespanBJ(txt, 2.00);
        SetTextTagVelocityBJ(txt, 64, 90);
        DestroyEffect(AddSpecialEffect('Abilities\\Spells\\Items\\ResourceItems\\ResourceEffectTarget.mdl', GetUnitX(u), GetUnitY(u)));
        PlaySoundOnUnitBJ(settings.Sounds.goldSound, 100, u);

        if (player) {
            player.giveGold(value);
        }
        ShowUnitHide(u);
        RemoveUnit(u);

        const maze = this.game.worldMap.playerMazes[playerSpawnId];
        const x = GetUnitX(u);
        const y = GetUnitY(u);
        const leftSide = ((x - 64) - maze.minX) / 64;
        const rightSide = (x - maze.minX) / 64;
        const topSide = (y - maze.minY) / 64;
        const bottomSide = ((y - 64) - maze.minY) / 64;
        maze.setWalkable(leftSide + bottomSide * maze.width, true);
        maze.setWalkable(rightSide + bottomSide * maze.width, true);
        maze.setWalkable(leftSide + topSide * maze.width, true);
        maze.setWalkable(rightSide + topSide * maze.width, true);
    }
}
