#!/bin/bash
sh Unix-Build.sh
status=$?
## take some decision ## 
if [ $status -ne 0 ]; then
    exit 1
fi
sh BuildFiles/Scripts/macrun.sh
