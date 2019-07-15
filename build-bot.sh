#!/bin/bash

# Environment settings
bt_mapname=map
# build settings
bt_alwaysnpm=true
bt_alwaysgeneratedefinitions=true
# Game settings
# example: set gamepath=C:\Program Files (x86)\Warcraft III\Warcraft III.exe
bt_gamepath="fse" # path to executable to start game CHANGE THIS
bt_arguments="-windowmode windowed"


sh ./clean.sh
mkdir src
cp -r tools/extras/app src/app




if [ "$bt_alwaysnpm" = true ]; then
    npm i
fi



if [ "$bt_gamepath" = "" ]
then
    echo "ERROR: gamepath not configured"
    echo "Open up 'build.sh' and add the path to your warcraft III installation like shown"
    exit 1
fi

map=map.w3x

input=maps
output=target

mkdir "$output"
cp "$input/$map" "$output/$map"


echo "Exporting original map script ..."

#currentWINEdir="Z:\\$(pwd | sed 's#/#\\#g'  )"
toolsDir="tools/MPQEditor/Win32"
mapfilesdir=$currentWINEdir//mapfiles


WINEDEBUG=-all wine "$toolsDir\\MPQEditor.exe" extract "$input/$map" "war3map.lua" "$input/map"
## get status ##
status=$?
## take some decision ## 
if [ $status -ne 0 ]; then
    echo "FAILED!" 
    exit 1
fi


if [ "$bt_alwaysgeneratedefinitions" = true ]; then
    node node_modules/convertjasstots/dist/index.js 
    echo "Converting standard libraries ..."
    node node_modules/convertjasstots/dist/index.js  "app/src/lib/core/blizzard.j" "app/src/lib/core/blizzard.d.ts"
    node node_modules/convertjasstots/dist/index.js  "app/src/lib/core/common.j" "app/src/lib/core/common.d.ts"
fi

echo "Converting TypeScript to Lua ..."
node node_modules/typescript-to-lua/dist/tstl.js  -p tsconfig.json
mv src/app/src/main.lua src/



echo "Processing map script ..."
 ./tools/ceres/ceres-linux build "map"
## get status ##
status=$?
## take some decision ## 
if [ $status -ne 0 ]; then
    echo "FAILED!" 
    exit 1
fi
#mv target/map/war3map.lua src/compiled.lua
#./node_modules/luamin/bin/luamin -f src/compiled.lua > target/map/war3map.lua
LC_ALL=C sed -i "s/local function __module_/function __module_/g" "target/map/war3map.lua"

echo "Importing processed map script ..."
WINEDEBUG=-all wine "$toolsDir\\MPQEditor.exe" add "$output/$map" "$output/map/*" "/c" "/auto" "/r"
## get status ##
status=$?
## take some decision ## 
if [ $status -ne 0 ]; then
    echo "FAILED!" 
    exit 1
fi
