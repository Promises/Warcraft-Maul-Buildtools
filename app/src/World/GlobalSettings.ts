import {Defender} from './Entity/Players/Defender';
import {Attacker} from './Entity/Players/Attacker';

export const players: Map<number, Defender> = new Map<number, Defender>();

export const enemies: Attacker[] = [];

export const ALLOW_PLAYER_TOWER_LOCATIONS = [
    {x: -1536.0, y: 5376.0}, // Red
    {x: 640.0, y: 4992.0}, // Blue
    {x: 1536.0, y: 5376.0}, // Teal
    {x: 5120.0, y: 448.0}, // Purple
    {x: 768.0, y: 1984.0}, // Yellow
    {x: -3616.0, y: 448.0}, // Orange
    {x: -4736.0, y: -2816.0}, // Green
    {x: 4736.0, y: -2816.0}, // Pink
    {x: 512.0, y: -2176.0}, // Grey
    {x: -1536.0, y: -2176.0}, // Lightblue
    {x: 2816.0, y: -2176.0}, // Darkgreen
    {x: -3712.0, y: 3456.0}, // Brown
    {x: 4992.0, y: 3456.0}, // Maroon
];


// GAME SETTINGS:
export const INITIAL_LIVES = 20;
export const GAME_END_TIME = 600;
export const GAME_TIME_BEFORE_START = 90;
export const GAME_NAME = 'Warcraft Maul Reimagined';


export const DIFFICULTIES = [
    100,
    200,
    300,
    400
];

export const DIFFICULTY_STRINGS = [
    'Normal',
    'Medium',
    'Hard',
    'Extreme',
];
export const DIFFICULTY_COLOURS = [
    '00A651',
    'FFCD00',
    'FF0000',
    '383838'
];


export const COLOUR_CODES = [
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
    'a46f33'
];

export const CREEP_TYPE_NAMES = [
    'NORMAL',
    'AIR',
    'CHAMPION',
    'BOSS'
];
export const ARMOUR_TYPE_NAMES = [
    'UNARMOURED',
    'LIGHT',
    'MEDIUM',
    'HEAVY',
    'FORTIFIED',
    'HERO'

];

export const PLAYER_AREAS = [
    [-4224.0, 3968.0, -1792.0, 5504.0], // Red area
    [-768.0, 2304.0, 768.0, 4736.0], // Blue area
    [1792.0, 3968.0, 4224.0, 5504.0], // Teal area
    [3584.0, -2304.0, 5120.0, 128.0], // Purple area
    [-768.0, -768.0, 768.0, 1664.0], // Yellow area
    [-5120.0, -2304.0, -3584.0, 128.0], // Orange area
    [-4480.0, -4224.0, -2048.0, -2688.0],// Green area
    [2048.0, -4224.0, 4480.0, -2688.0], // Pink area
    [-768.0, -4864.0, 768.0, -2432.0], // Grey area
    [-2944.0, -1920.0, -1408.0, 512.0], // Lightblue area
    [1408.0, -1920.0, 2944.0, 512.0], // Darkgreen area
    [-5120.0, 768.0, -3584.0, 3200.0], // Brown area
    [3584.0, 768.0, 5120.0, 3200.0], // Maroon area
];

export class Sounds {
    public static loseALifeSound = CreateSound(
        'Abilities/Spells/Other/LoadUnload/Loading.wav',
        false,
        false,
        true,
        10,
        10,
        'DefaultEAXON'
    );
    public static goldSound = CreateSound(
        'Abilities/Spells/Items/ResourceItems/ReceiveGold.wav',
        false,
        true,
        true,
        10,
        10,
        'DefaultEAXON'
    );
    public static victorySound = CreateSound(
        'Sound/Music/mp3Music/PH1.mp3',
        false,
        false,
        false,
        10,
        10,
        'DefaultEAXON'
    );
    public static defeatSound = CreateSound(
        'Sound/Music/mp3Music/TragicConfrontation.mp3',
        false,
        false,
        false,
        10,
        10,
        'DefaultEAXON'
    );
    public static impossibleDifficultySound = CreateSound('Sound/Music/mp3Music/PursuitTheme.mp3',
        false,
        false,
        false,
        10,
        10,
        'DefaultEAXON'
    );
}


export function InitializeStaticSounds() {
    SetSoundParamsFromLabel(Sounds.loseALifeSound, 'LoadUnload');
    SetSoundDuration(Sounds.loseALifeSound, 740);
    SetSoundParamsFromLabel(Sounds.goldSound, 'ReceiveGold');
    SetSoundDuration(Sounds.goldSound, 589);
    SetSoundChannel(Sounds.goldSound, 0);
    SetSoundDistances(Sounds.goldSound, 750.0, 1000.0);
}


export const UNIT_ORDER_CANCEL_UPGRADE = 851976;
