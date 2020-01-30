import { WarcraftMaul } from '../../WarcraftMaul';
import { Buff } from './Specs/Buff';
import { CrushedDamageBuff } from './CrushedDamageBuff';
import { DrunkenHaze } from './DrunkenHaze';
import { ForceOfNature } from './ForceOfNature';
import { IceTrollJoker } from './IceTrollJoker';
import { Moonstorm } from './Moonstorm';
import { BattleRoar } from './BattleRoar';
import { SoulCollector } from './CitadelOfNaxxramas';
import { TheDarknessBuff } from './TheDarknessBuff';

export class BuffHandler {
    private readonly game: WarcraftMaul;
    private buffs: object[] = [];
    private activeBuffs: Buff[] = [];

    constructor(game: WarcraftMaul) {
        this.game = game;
        this.AddBuffsToList();
        this.SetupBuffs();

    }

    private AddBuffsToList(): void {
        this.buffs.push(CrushedDamageBuff);
        this.buffs.push(DrunkenHaze);
        this.buffs.push(ForceOfNature);
        this.buffs.push(IceTrollJoker);
        this.buffs.push(Moonstorm);
        this.buffs.push(BattleRoar);
        this.buffs.push(TheDarknessBuff);
        this.buffs.push(SoulCollector);
    }

    private SetupBuffs(): void {

        for (const buff of this.buffs) {
            // @ts-ignore
            const ObjectExtendsBuff: Buff = new buff(this.game);


            if (ObjectExtendsBuff.IsDamageModificationBuff()) {
                this.game.gameDamageEngine.AddMultiplicativeDamageModificationEventBuff(ObjectExtendsBuff);
            }
            if (ObjectExtendsBuff.IsAttackActionBuff()) {
                this.game.gameDamageEngine.AddInitialDamageEventBuff(ObjectExtendsBuff);
            }

            this.activeBuffs.push(ObjectExtendsBuff);
        }

    }
}
