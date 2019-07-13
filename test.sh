#!/bin/bash

# Environment settings
# build settings
bt_alwaysnpm=false
bt_alwaysgeneratedefinitions=true

sh ./clean.sh
sh ./wcm_generate.sh


if [ "$bt_alwaysnpm" = true ]; then
    npm i
fi


if [ "$bt_alwaysgeneratedefinitions" = true ]; then
    node node_modules/convertjasstots/dist/index.js 
    echo "Converting standard libraries ..."
    node node_modules/convertjasstots/dist/index.js  "app/src/lib/core/blizzard.j" "app/src/lib/core/blizzard.d.ts"
    node node_modules/convertjasstots/dist/index.js  "app/src/lib/core/common.j" "app/src/lib/core/common.d.ts"
fi

echo "Converting TypeScript to Lua ..."
node node_modules/typescript-to-lua/dist/tstl.js  -p tsconfig.json
cp src/app/src/main.lua src/


busted src
