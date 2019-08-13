import { TowerForce } from '../../Specs/TowerForce';
import { Tower } from '../../Specs/Tower';
import { Log } from '../../../../../lib/Serilog/Serilog';

export class Marine extends Tower implements TowerForce {
    public UpdateSize(): void {
        Log.Debug(`Marine Size: ${this.owner.towerForces.get(this.GetID())}`);
        Log.Debug(`Marine id: ${this.GetID()}`);
        SetUnitAbilityLevelSwapped(FourCC('A0EJ'), this.tower, <number>this.owner.towerForces.get(this.GetID()));
    }

}
