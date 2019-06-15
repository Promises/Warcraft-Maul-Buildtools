import { Defender } from './Entity/Players/Defender';
import { Attacker } from './Entity/Players/Attacker';

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
    Rect(-4640.0, 3808.0, -1248.0, 5632.0), // Red area
    Rect(-928.0, 2016.0, 928.0, 5344.0), // Blue area
    Rect(1248.0, 3808.0, 4640.0, 5632.0), // Teal area
    Rect(3424.0, -2592.0, 5280.0, 480.0), // Purple area
    Rect(-928.0, -1312.0, 928, 2016.0), // Yellow area
    Rect(-5280.0, -2592.0, -3224.0, 480.0), // Orange area
    Rect(-5024.0, -4384.0, -1504.0, -2560.0),// Green area
    Rect(1504.0, -4384.0, 5024.0, -2560.0), // Pink area
    Rect(-928.0, -4992.0, 928.0, -1888.0), // Grey area
    Rect(-3104.0, -2464.0, -1248.0, 928.0), // Lightblue area
    Rect(1248.0, -2464.0, 3104.0, 928.0), // Darkgreen area
    Rect(-5280.0, 480.0, -3424.0, 3776.0), // Brown area
    Rect(3424.0, 480.0, 5280.0, 3776.0), // Maroon area
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



