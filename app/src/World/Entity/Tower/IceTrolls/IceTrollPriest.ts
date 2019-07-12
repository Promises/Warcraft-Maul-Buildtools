import { Tower } from '../Specs/Tower';
import { TickingTower } from '../Specs/TickingTower';
import { Log } from '../../../../lib/Serilog/Serilog';

export class IceTrollPriest extends Tower implements TickingTower {
    private targets: unit[] = [];

    private FrostNova(): void {
        const loc: location = GetUnitLoc(this.tower);
        const grp: group = GetUnitsInRangeOfLocMatching(500.00, loc, Condition(() => this.InitializeFrostNovaGroupConditions()));
        if (this.targets.length > 0) {
            const indx: number = Util.RandomInt(0, this.targets.length - 1);
            const x: number = GetUnitX(this.tower);
            const y: number = GetUnitY(this.tower);
            const dummy: unit = CreateUnit(this.owner.wcPlayer, FourCC('u008'), x, y, 0);
            UnitApplyTimedLifeBJ(1.00, FourCC('BTLF'), dummy);
            UnitAddAbilityBJ(FourCC('A08J'), dummy);
            IssueTargetOrderBJ(dummy, 'frostnova', this.targets[indx]);
        } else {
            Log.Debug('No Target');
        }
        RemoveLocation(loc);
        DestroyGroup(grp);
    }

    public Action(): void {

        this.FrostNova();
    }

    public GetTickModulo(): number {
        return 49;
    }


    private InitializeFrostNovaGroupConditions(): boolean {

        if (!(Util.isUnitCreep(GetFilterUnit()))) {
            Log.Debug('NOt Creep');
            return false;
        }


        if (!IsUnitAliveBJ(GetFilterUnit())) {
            Log.Debug('Dead');
            return false;
        }


        this.targets.push(GetFilterUnit());
        return true;
    }
}
