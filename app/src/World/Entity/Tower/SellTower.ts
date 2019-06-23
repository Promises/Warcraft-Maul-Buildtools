import { Trigger } from '../../../JassOverrides/Trigger';
import * as settings from '../../GlobalSettings';
import { WarcraftMaul } from '../../WarcraftMaul';
import { Rectangle } from '../../../JassOverrides/Rectangle';
import { Log } from '../../../lib/Serilog/Serilog';
import { Defender } from '../Players/Defender';
import { Maze } from '../../Antiblock/Maze';
import { Tower } from './Tower';

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


    private AreWeSellingTheTower(): boolean {
        return GetSpellAbilityId() === FourCC('A02D');
    }

    private SellTower(): void {
        const u: unit = GetTriggerUnit();
        const value: number = GetUnitPointValue(u);
        let playerSpawnId: undefined | number;
        for (let i: number = 0; i < settings.PLAYER_AREAS.length; i++) {
            if (settings.PLAYER_AREAS[i].ContainsUnit(u)) {
                playerSpawnId = i;
                break;
            }
        }

        if (playerSpawnId === undefined) {
            Log.Error('Unable to locate the correct player spawn');
            return;
        }

        const player: Defender | undefined = settings.players.get(GetPlayerId(GetOwningPlayer(u)));
        let str: string = '';
        if (GetOwningPlayer(u) === GetLocalPlayer()) {
            str = I2S(value);
        }
        const txt: texttag = CreateTextTagUnitBJ(str, u, 1, 10, 100, 80.00, 0.00, 0);

        SetTextTagPermanentBJ(txt, false);
        SetTextTagLifespanBJ(txt, 2.00);
        SetTextTagVelocityBJ(txt, 64, 90);
        DestroyEffect(AddSpecialEffect('Abilities\\Spells\\Items\\ResourceItems\\ResourceEffectTarget.mdl', GetUnitX(u), GetUnitY(u)));
        PlaySoundOnUnitBJ(settings.Sounds.goldSound, 100, u);

        if (player) {
            player.giveGold(value);
            const tower: Tower | undefined = player.towers.get(GetHandleIdBJ(u));
            if (tower) {
                tower.Sell();
            }
        }
        ShowUnitHide(u);
        RemoveUnit(u);

        const maze: Maze = this.game.worldMap.playerMazes[playerSpawnId];
        const x: number = GetUnitX(u);
        const y: number = GetUnitY(u);
        const leftSide: number = ((x - 64) - maze.minX) / 64;
        const rightSide: number = (x - maze.minX) / 64;
        const topSide: number = (y - maze.minY) / 64;
        const bottomSide: number = ((y - 64) - maze.minY) / 64;
        maze.setWalkable(leftSide + bottomSide * maze.width, true);
        maze.setWalkable(rightSide + bottomSide * maze.width, true);
        maze.setWalkable(leftSide + topSide * maze.width, true);
        maze.setWalkable(rightSide + topSide * maze.width, true);
    }
}
