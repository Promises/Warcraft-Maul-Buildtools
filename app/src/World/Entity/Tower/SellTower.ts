import { Trigger } from '../../../JassOverrides/Trigger';
import * as settings from '../../GlobalSettings';
import { WarcraftMaul } from '../../WarcraftMaul';
import { Log } from '../../../lib/Serilog/Serilog';
import { Defender } from '../Players/Defender';
import { Maze } from '../../Antiblock/Maze';
import { Tower } from './Specs/Tower';

export class SellTower {
    private _sellTrigger: Trigger;
    private _game: WarcraftMaul;

    constructor(game: WarcraftMaul) {
        this._game = game;
        this._sellTrigger = new Trigger();
        this._sellTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_EFFECT);
        this._sellTrigger.AddCondition(() => this.AreWeSellingTheTower());
        this._sellTrigger.AddAction(() => this.SellTower());
    }

    private AreWeSellingTheTower(): boolean {
        return GetSpellAbilityId() === FourCC('A02D');
    }

    private SellTower(): void {
        const unit: unit = GetTriggerUnit();
        let value: number = GetUnitPointValue(unit);
        let playerSpawnId: undefined | number;
        for (let i: number = 0; i < settings.PLAYER_AREAS.length; i++) {
            if (settings.PLAYER_AREAS[i].ContainsUnit(unit)) {
                playerSpawnId = i;
                break;
            }
        }

        if (playerSpawnId === undefined) {
            Log.Error('Unable to locate the correct player spawn');
            return;
        }

        const owningPlayer: player = GetOwningPlayer(unit);
        const player: Defender = <Defender>settings.players.get(GetPlayerId(owningPlayer));
        if (player) {
            const tower: Tower | undefined = player.towers.get(GetHandleIdBJ(unit));
            if (tower) {
                value = tower.GetSellValue();
                Log.Debug(`SellValue: ${value}`);
                tower.Sell();
            }
            player.giveGold(value);

        }

        // if (GetOwningPlayer(unit) === GetLocalPlayer()) {
        // }
        const txt: texttag = CreateTextTagUnitBJ(ToString(value), unit, 1, 10, 100, 80.00, 0.00, 0);

        SetTextTagPermanentBJ(txt, false);
        SetTextTagLifespanBJ(txt, 2.00);
        SetTextTagVelocityBJ(txt, 64, 90);
        DestroyEffect(AddSpecialEffect('Abilities\\Spells\\Items\\ResourceItems\\ResourceEffectTarget.mdl',
                                       GetUnitX(unit), GetUnitY(unit)));
        PlaySoundOnUnitBJ(settings.Sounds.goldSound, 100, unit);

        const isWaveInProgress: boolean = this._game.gameRoundHandler.isWaveInProgress;
        const x: number = GetUnitX(unit);
        const y: number = GetUnitY(unit);
        if (isWaveInProgress) {
            this._game.worldMap.towerConstruction.SetupTower(ReplaceUnitBJ(unit, FourCC('uC14'), bj_UNIT_STATE_METHOD_DEFAULTS), player);
        } else {
            const maze: Maze = this._game.worldMap.playerMazes[playerSpawnId];
            const leftSide: number = ((x - 64) - maze.minX) / 64;
            const rightSide: number = (x - maze.minX) / 64;
            const topSide: number = (y - maze.minY) / 64;
            const bottomSide: number = ((y - 64) - maze.minY) / 64;
            maze.setWalkable(leftSide + bottomSide * maze.width, true);
            maze.setWalkable(rightSide + bottomSide * maze.width, true);
            maze.setWalkable(leftSide + topSide * maze.width, true);
            maze.setWalkable(rightSide + topSide * maze.width, true);
            RemoveUnit(unit);
        }
    }
}
