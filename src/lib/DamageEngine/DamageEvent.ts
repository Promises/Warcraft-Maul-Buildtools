import { DamageEngineGlobals } from './DamageEngineGlobals';

export interface DamageEvent {
    event(globals: DamageEngineGlobals): void;
}
