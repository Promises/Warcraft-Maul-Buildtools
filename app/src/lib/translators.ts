class console {
    static log(input: string) {
        BJDebugMsg(input)
    }
}

class Util {
    static ColourString(colour: string, string: string): string {
        return `|cFF${colour}${string}|r`
    }
}


// reference: https://docs.google.com/spreadsheets/d/1wzWIYzRW9pqpo1ZuEcU-qJTg-H4z5-PaTnHIXPezaRQ/edit#gid=1812483906

enum COLOUR {
    RED,
    BLUE,
    TEAL,
    PURPLE,
    YELLOW,
    ORANGE,
    GREEN,
    PINK,
    GRAY,
    LIGHT_BLUE,
    DARK_GREEN,
    BROWN,
    MAROON,
    NAVY,
    TURQUOISE,
    VOILET,
    WHEAT,
    PEACH,
    MINT,
    LEVANDER,
    COAL,
    SNOW,
    EMERALD,
    PEANUT
}

enum CREEP_TYPE {
    NORMAL,
    AIR,
    CHAMPION,
    BOSS
}

enum ARMOUR_TYPE {
    UNARMOURED,
    LIGHT,
    MEDIUM,
    HEAVY,
    FORTIFIED,
    HERO

}

