#!/bin/bash
echo "Starting build"
currentWINEdir="Z:\\$(pwd | sed 's#/#\\#g'  )"
toolsDir="$currentWINEdir\\BuildFiles"
mapfilesdir=$currentWINEdir//mapfiles
echo "Creating temp map.."
mkdir temp
cp "BuildFiles/base.w3x" "temp/out.w3x"
tempdir=$currentWINEdir\\temp
echo "Adding files to map.."

WINEDEBUG=-all wine "$toolsDir\\MPQEditor.exe" "add" "$tempdir\\out.w3x" "$mapfilesdir\\*" "/c" "/auto" "/r"
jasshelperdir=$toolsDir\\JassHelper
common=$jasshelperdir\\common.j
blizzard=$jasshelperdir\\Blizzard.j
echo "Compiling jass.."

WINEDEBUG=-all wine "$toolsDir\\JassHelper\\clijasshelper.exe" "$common" "$blizzard" "$tempdir\\out.w3x"
echo "Adding patched jass and rebuilding.."

WINEDEBUG=-all wine "$toolsDir\\MPQEditor.exe" "extract" "$tempdir\\out.w3x" "war3map.j" "temp"
sed -i '' '1s/^/\/\/! import \"scripts\/imports.j\"\n/' "temp/war3map.j"

python3 GenerateHybrid.py
echo "Recompiling jass.."
WINEDEBUG=-all wine "$toolsDir\\JassHelper\\clijasshelper.exe" "$common" "$blizzard" "$tempdir\\war3map.j" "$tempdir\\out.w3x"


echo "Cleaning up.."
rm "temp/war3map.j"
WINEDEBUG=-all wine "$toolsDir\\MPQEditor.exe" "extract" "$tempdir\\out.w3x" "war3map.j" "$tempdir"


mv "temp/out.w3x" "."
mv "temp/war3map.j" "lastrig.j"
rmdir temp
echo "Done!"


# //! import "jass/TestLib.j"
