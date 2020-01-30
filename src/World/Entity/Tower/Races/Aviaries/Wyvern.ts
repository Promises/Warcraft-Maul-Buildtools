import { Tower } from '../../Specs/Tower';
import { AttackActionTower } from '../../Specs/AttackActionTower';

export class Wyvern extends Tower implements AttackActionTower {
    public AttackAction(): void {
        if (this.game.worldMap.gameRoundHandler && this.game.worldMap.gameRoundHandler.currentWave + 1 === 35) {
            return;
        }

        if (this.game.worldMap.gameRoundHandler && this.game.worldMap.gameRoundHandler.currentWave + 1 === 36) {
            return;
        }


        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        if (u === this.tower) {

            const loc: location = GetUnitLoc(this.tower);
            const grp: group = GetUnitsInRangeOfLocAll(128, loc);
            ForGroupBJ(grp, () => this.AttackGroup());
            DestroyGroup(grp);
            RemoveLocation(loc);


        }
    }

    private AttackGroup(): void {
        if (GetPlayerId(GetOwningPlayer(GetEnumUnit())) > COLOUR.NAVY) {
            SetUnitLifeBJ(GetEnumUnit(), RMaxBJ(1.00, GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()) * 0.85));
            DestroyEffect(AddSpecialEffectTargetUnitBJ(
                'origin', GetEnumUnit(), 'Abilities\\Spells\\Orc\\LightningShield\\LightningShieldTarget.mdl'));
        }
    }
}
