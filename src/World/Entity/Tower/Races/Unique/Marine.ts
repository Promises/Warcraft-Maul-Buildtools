import { TowerForce } from '../../Specs/TowerForce';
import { Tower } from '../../Specs/Tower';
import { Log } from '../../../../../lib/Serilog/Serilog';

export class Marine extends Tower implements TowerForce {
    public UpdateSize(): void {
        SetUnitAbilityLevelSwapped(FourCC('A0EJ'), this.tower, <number>this.owner.towerForces.get(this.GetTypeID()));
    }

}
