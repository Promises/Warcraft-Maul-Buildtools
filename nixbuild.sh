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
echo "Cleaning up.."

mv "temp/out.w3x" "."
rmdir temp
echo "Done!"