#!/bin/bash

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
