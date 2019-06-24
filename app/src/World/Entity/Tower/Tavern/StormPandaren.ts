import { Tower } from '../Specs/Tower';
import { AttackActionTower } from '../Specs/AttackActionTower';

export class StormPandaren extends Tower implements AttackActionTower {
    public AttackAction(): void {
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        if (u === this.tower) {
            const randomInt: number = Util.RandomInt(1, 6);
            const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;
            if (!target) {
                return;
            }
            const spellPoint: location = GetUnitLoc(this.tower);
            const loc: location = GetUnitLoc(target);
            const tempUnit: unit = CreateUnitAtLocSaveLast(this.owner.wcPlayer, FourCC('u008'), spellPoint, bj_UNIT_FACING);
            UnitApplyTimedLifeBJ(3.00, FourCC('BTLF'), tempUnit);
            switch (randomInt) {
                case 1:
                    UnitAddAbilityBJ(FourCC('A078'), tempUnit); // Dazzle
                    IssuePointOrderLocBJ(tempUnit, 'clusterrockets', loc);
                    break;
                case 2:
                    UnitAddAbilityBJ(FourCC('A00F'), tempUnit); // Flame Strike
                    IssuePointOrderLocBJ(tempUnit, 'flamestrike', loc);
                    break;
                case 3:
                    UnitAddAbilityBJ(FourCC('A02N'), tempUnit); // Impale
                    IssuePointOrderLocBJ(tempUnit, 'impale', loc);
                    break;
                case 4:
                    UnitAddAbilityBJ(FourCC('A02M'), tempUnit); // Carrion Swarm
                    IssuePointOrderLocBJ(tempUnit, 'carrionswarm', loc);
                    break;
                case 5:
                    UnitAddAbilityBJ(FourCC('A08P'), tempUnit); // Rain of Fire
                    IssuePointOrderLocBJ(tempUnit, 'rainoffire', loc);
                    break;
                default:
                    UnitAddAbilityBJ(FourCC('A00J'), tempUnit); // Fan of Knives
                    IssuePointOrderLocBJ(tempUnit, 'fanofknives', loc);
                    break;
            }


            RemoveLocation(spellPoint);
            RemoveLocation(loc);

        }
    }

}
