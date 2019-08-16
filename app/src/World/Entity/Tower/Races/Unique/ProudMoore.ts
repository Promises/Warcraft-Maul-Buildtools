import { Tower } from '../../Specs/Tower';
import { LimitedTower } from '../../Specs/LimitedTower';
import { ConstructActionTower } from '../../Specs/ConstructActionTower';
import { SellActionTower } from '../../Specs/SellActionTower';

export class ProudMoore extends Tower implements LimitedTower, ConstructActionTower, SellActionTower {
    public MaxCount(): number {
        return 1;
    }

    public ConstructionFinished(): void {
        for (let i: number = 0; i < 8; i++) {
            this.SpawnSeaElemental(i);
        }
    }

    private SpawnSeaElemental(i: number): void {
        if (this.owner.seaElemetals < 8) {
            const towerLoc: location = GetUnitLoc(this.tower);
            const targetLoc: location = PolarProjectionBJ(towerLoc, 400.00, (i * (360.00 / 8.00)));
            CreateUnitAtLoc(this.owner.wcPlayer, FourCC('u041'), targetLoc, bj_UNIT_FACING);
            this.owner.seaElemetals++;
            RemoveLocation(targetLoc);
            RemoveLocation(towerLoc);
        }

    }

    public SellAction(): void {
        const towerLoc: location = GetUnitLoc(this.tower);
        const grp: group = GetUnitsInRangeOfLocAll(512, towerLoc);
        ForGroupBJ(grp, () => this.RemoveElemental());
        DestroyGroup(grp);
        RemoveLocation(towerLoc);

    }

    private RemoveElemental(): void {
        if (GetUnitTypeId(GetEnumUnit()) === FourCC('u041')) {
            RemoveUnit(GetEnumUnit());
            this.owner.seaElemetals--;
        }
    }
}
