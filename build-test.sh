#!/bin/bash 

sh build.sh 
status=$? 
## take some decision ## 
if [ $status -ne 0 ]; then 
    echo "FAILED!"  
    exit 1 
fi 

/Applications/Warcraft\ III/x86_64/Warcraft\ III.app/Contents/MacOS/Warcraft\ III -loadfile target/map.w3x
