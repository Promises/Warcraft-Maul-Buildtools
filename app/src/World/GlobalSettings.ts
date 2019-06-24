import { Defender } from './Entity/Players/Defender';
import { Attacker } from './Entity/Players/Attacker';
import { Rectangle } from '../JassOverrides/Rectangle';

export const players: Map<number, Defender> = new Map<number, Defender>();

export const enemies: Attacker[] = [];

export interface Point {
    x: number;
    y: number;
}

export const ALLOW_PLAYER_TOWER_LOCATIONS: Point[] = [
    { x: -1536.0, y: 5376.0 }, // Red
    { x: 640.0, y: 4992.0 }, // Blue
    { x: 1536.0, y: 5376.0 }, // Teal
    { x: 5120.0, y: 448.0 }, // Purple
    { x: 768.0, y: 1984.0 }, // Yellow
    { x: -3616.0, y: 448.0 }, // Orange
    { x: -4736.0, y: -2816.0 }, // Green
    { x: 4736.0, y: -2816.0 }, // Pink
    { x: 512.0, y: -2176.0 }, // Grey
    { x: -1536.0, y: -2176.0 }, // Lightblue
    { x: 2816.0, y: -2176.0 }, // Darkgreen
    { x: -3712.0, y: 3456.0 }, // Brown
    { x: 4992.0, y: 3456.0 }, // Maroon
];


// GAME SETTINGS:
export const INITIAL_LIVES: number = 20;
export const GAME_END_TIME: number = 600;
export const GAME_TIME_BEFORE_START: number = 90;
export const GAME_TIME_BEFORE_WAVE: number = 20;
export const GAME_GOLD_REWARD_BASE: number = 20;

export const GAME_NAME: string = 'Warcraft Maul Reimagined';


export const DIFFICULTIES: number[] = [
    100,
    200,
    300,
    400,
];

export const DIFFICULTY_STRINGS: string[] = [
    'Normal',
    'Medium',
    'Hard',
    'Extreme',
];
export const DIFFICULTY_COLOURS: string[] = [
    '00A651',
    'FFCD00',
    'FF0000',
    '383838',
];


export const COLOUR_CODES: string[] = [
    'ff0303',
    '0042ff',
    '1ce6b9',
    '540081',
    'fffc00',
    'fe8a0e',
    '20c000',
    'e55bb0',
    '959697',
    '7ebff1',
    '106246',
    '4a2a04',
    '9b0000',
    '0000c3',
    '00eaff',
    'be00fe',
    'ebcd87',
    'f8a48b',
    'bfff80',
    'dcb9eb',
    '282828',
    'ebf0ff',
    '00781e',
    'a46f33',
];

export const CREEP_TYPE_NAMES: string[] = [
    'NORMAL',
    'AIR',
    'CHAMPION',
    'BOSS',
];
export const ARMOUR_TYPE_NAMES: string[] = [
    'UNARMOURED',
    'LIGHT',
    'MEDIUM',
    'HEAVY',
    'FORTIFIED',
    'HERO',

];

export const PLAYER_AREAS: Rectangle[] = [
    new Rectangle([-4224.0, 3968.0, -1792.0, 5504.0]), // Red area
    new Rectangle([-768.0, 2304.0, 768.0, 4736.0]), // Blue area
    new Rectangle([1792.0, 3968.0, 4224.0, 5504.0]), // Teal area
    new Rectangle([3584.0, -2304.0, 5120.0, 128.0]), // Purple area
    new Rectangle([-768.0, -768.0, 768.0, 1664.0]), // Yellow area
    new Rectangle([-5120.0, -2304.0, -3584.0, 128.0]), // Orange area
    new Rectangle([-4480.0, -4224.0, -2048.0, -2688.0]), // Green area
    new Rectangle([2048.0, -4224.0, 4480.0, -2688.0]), // Pink area
    new Rectangle([-768.0, -4864.0, 768.0, -2432.0]), // Grey area
    new Rectangle([-2944.0, -1920.0, -1408.0, 512.0]), // Lightblue area
    new Rectangle([1408.0, -1920.0, 2944.0, 512.0]), // Darkgreen area
    new Rectangle([-5120.0, 768.0, -3584.0, 3200.0]), // Brown area
    new Rectangle([3584.0, 768.0, 5120.0, 3200.0]), // Maroon area
];

export class Sounds {
    public static loseALifeSound: sound = CreateSound(
        'Abilities/Spells/Other/LoadUnload/Loading.wav',
        false,
        false,
        true,
        10,
        10,
        'DefaultEAXON',
    );
    public static goldSound: sound = CreateSound(
        'Abilities/Spells/Items/ResourceItems/ReceiveGold.wav',
        false,
        true,
        true,
        10,
        10,
        'DefaultEAXON',
    );
    public static victorySound: sound = CreateSound(
        'Sound/Music/mp3Music/PH1.mp3',
        false,
        false,
        false,
        10,
        10,
        'DefaultEAXON',
    );
    public static defeatSound: sound = CreateSound(
        'Sound/Music/mp3Music/TragicConfrontation.mp3',
        false,
        false,
        false,
        10,
        10,
        'DefaultEAXON',
    );
    public static impossibleDifficultySound: sound = CreateSound('Sound/Music/mp3Music/PursuitTheme.mp3',
                                                                 false,
                                                                 false,
                                                                 false,
                                                                 10,
                                                                 10,
                                                                 'DefaultEAXON',
    );
}


export function InitializeStaticSounds(): void {
    SetSoundParamsFromLabel(Sounds.loseALifeSound, 'LoadUnload');
    SetSoundDuration(Sounds.loseALifeSound, 740);
    SetSoundParamsFromLabel(Sounds.goldSound, 'ReceiveGold');
    SetSoundDuration(Sounds.goldSound, 589);
    SetSoundChannel(Sounds.goldSound, 0);
    SetSoundDistances(Sounds.goldSound, 750.0, 1000.0);
}


export const UNIT_ORDER_CANCEL_UPGRADE: number = 851976;

/**
 * DAMAGE ENGINE CONFIG
 *  - these are global constants that you can manually configure
 */

// Damage type classifications
export const DamageTypePureExplosive: number = -2;
export const DamageTypeExplosive: number = -1;
export const DamageTypeCode: number = 1;
export const DamageTypePure: number = 2;
export const DamageTypeHeal: number = 3;
export const DamageTypeBlocked: number = 4;
export const DamageTypeReduced: number = 5;
export const DamageTypeCriticalStrike: number = 6;

// Allows detection of Bash or Pulverize or AOE spread
export const DamageEventAOE: number = 1;
export const DamageEventLevel: number = 1;

// Attack types
export const ATTACK_TYPE_SPELLS: number = 0;
export const ATTACK_TYPE_NORMAL: number = 1;
export const ATTACK_TYPE_PIERCE: number = 2;
export const ATTACK_TYPE_SIEGE: number = 3;
export const ATTACK_TYPE_MAGIC: number = 4;
export const ATTACK_TYPE_CHAOS: number = 5;
export const ATTACK_TYPE_HERO: number = 6;

export const DAMAGE_TYPE_UNKNOWN: number = 0;
export const DAMAGE_TYPE_NORMAL: number = 4;
export const DAMAGE_TYPE_ENHANCED: number = 5;
export const DAMAGE_TYPE_FIRE: number = 8;
export const DAMAGE_TYPE_COLD: number = 9;
export const DAMAGE_TYPE_LIGHTNING: number = 10;
export const DAMAGE_TYPE_POISON: number = 11;
export const DAMAGE_TYPE_DISEASE: number = 12;
export const DAMAGE_TYPE_DIVINE: number = 13;
export const DAMAGE_TYPE_MAGIC: number = 14;
export const DAMAGE_TYPE_SONIC: number = 15;
export const DAMAGE_TYPE_ACID: number = 16;
export const DAMAGE_TYPE_FORCE: number = 17;
export const DAMAGE_TYPE_DEATH: number = 18;
export const DAMAGE_TYPE_MIND: number = 19;
export const DAMAGE_TYPE_PLANT: number = 20;
export const DAMAGE_TYPE_DEFENSIVE: number = 21;
export const DAMAGE_TYPE_DEMOLITION: number = 22;
export const DAMAGE_TYPE_SLOW_POISON: number = 23;
export const DAMAGE_TYPE_SPIRIT_LINK: number = 24;
export const DAMAGE_TYPE_SHADOW_STRIKE: number = 25;
export const DAMAGE_TYPE_UNIVERSAL: number = 26;

// Weapon sounds
// - Metal Light/Medium/Heavy -
export const WEAPON_TYPE_NONE: number = 0;
export const WEAPON_TYPE_ML_CHOP: number = 1;
export const WEAPON_TYPE_MM_CHOP: number = 2;
export const WEAPON_TYPE_MH_CHOP: number = 3;
export const WEAPON_TYPE_ML_SLICE: number = 4;
export const WEAPON_TYPE_MM_SLICE: number = 5;
export const WEAPON_TYPE_MH_SLICE: number = 6;
export const WEAPON_TYPE_MM_BASH: number = 7;
export const WEAPON_TYPE_MH_BASH: number = 8;
export const WEAPON_TYPE_MM_STAB: number = 9;
export const WEAPON_TYPE_MH_STAB: number = 10;

// - Wood Light/Medium/Heavy -
export const WEAPON_TYPE_WL_SLICE: number = 11;
export const WEAPON_TYPE_WM_SLICE: number = 12;
export const WEAPON_TYPE_WH_SLICE: number = 13;
export const WEAPON_TYPE_WL_BASH: number = 14;
export const WEAPON_TYPE_WM_BASH: number = 15;
export const WEAPON_TYPE_WH_BASH: number = 16;
export const WEAPON_TYPE_WL_STAB: number = 17;
export const WEAPON_TYPE_WM_STAB: number = 18;

// - Claw Light/Medium/Heavy -
export const WEAPON_TYPE_CL_SLICE: number = 19;
export const WEAPON_TYPE_CM_SLICE: number = 20;
export const WEAPON_TYPE_CH_SLICE: number = 21;

// - Axe Medium -
export const WEAPON_TYPE_AM_CHOP: number = 22;

// - Rock Heavy -
export const WEAPON_TYPE_RH_BASH: number = 23;

// Strings
export const udg_AttackTypeDebugStr = ['SPELLS', 'NORMAL', 'PIERCE', 'SIEGE', 'MAGIC', 'CHAOS', 'HERO'];
export const udg_DamageTypeDebugStr = ['UNKNOWN', undefined, undefined, undefined, 'NORMAL', 'ENHANCED', undefined, undefined, 'FIRE', 'COLD', 'LIGHTNING', 'POISON', 'DISEASE', 'DIVINE', 'MAGIC', 'SONIC', 'ACID', 'FORCE', 'DEATH', 'MIND', 'PLANT', 'DEFENSIVE', 'DEMOLITION', 'SLOW_POISON', 'SPIRIT_LINK', 'SHADOW_STRIKE', 'UNIVERSAL'];
export const udg_WeaponTypeDebugStr = ['NONE', 'METAL_LIGHT_CHOP', 'METAL_MEDIUM_CHOP', 'METAL_HEAVY_CHOP', 'METAL_LIGHT_SLICE', 'METAL_MEDIUM_SLICE', 'METAL_HEAVY_SLICE', 'METAL_MEDIUM_BASH', 'METAL_HEAVY_BASH', 'METAL_MEDIUM_STAB', 'METAL_HEAVY_STAB', 'WOOD_LIGHT_SLICE', 'WOOD_MEDIUM_SLICE', 'WOOD_HEAVY_SLICE', 'WOOD_LIGHT_BASH', 'WOOD_MEDIUM_BASH', 'WOOD_HEAVY_BASH', 'WOOD_LIGHT_STAB', 'WOOD_MEDIUM_STAB', 'CLAW_LIGHT_SLICE', 'CLAW_MEDIUM_SLICE', 'CLAW_HEAVY_SLICE', 'AXE_MEDIUM_CHOP', 'ROCK_HEAVY_BASH'];
