import { Tower } from '../../Specs/Tower';
import { LimitedTower } from '../../Specs/LimitedTower';

export class CitadelOfNaxxramas extends Tower implements LimitedTower {
    public MaxCount(): number {
        return 1;
    }
}
