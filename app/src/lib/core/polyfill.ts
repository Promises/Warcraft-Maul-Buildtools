/** @noSelfInFile **/

function FourCC(input: string): number {
    // @ts-ignore -- this is required due to a bug in lua-types 2.4.0
    return string.unpack(">I4", input);
}



