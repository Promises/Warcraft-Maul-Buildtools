import { Point } from './GlobalSettings';
import { Rectangle } from '../JassOverrides/Rectangle';
import { WorldMap } from './WorldMap';

export interface IMapSettings {
    ALLOW_PLAYER_TOWER_LOCATIONS: Point[];
    INITIAL_LIVES: number;
    GAME_TIME_BEFORE_START: number;
    GAME_TIME_BEFORE_WAVE: number;
    GAME_GOLD_REWARD_BASE: number;
    GAME_NAME: string;
    GAME_END_TIME: number;
    PLAYER_AREAS: Rectangle[];
    setupCheckpoint: (worldMap: WorldMap) => void;
}
