import { WarcraftMaul } from '../../WarcraftMaul';
import { Buff } from './Specs/Buff';
import { CrushedDamageBuff } from './CrushedDamageBuff';
import { DrunkenHaze } from './DrunkenHaze';
import { ForceOfNature } from './ForceOfNature';

export class BuffHandler {
    private game: WarcraftMaul;
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
