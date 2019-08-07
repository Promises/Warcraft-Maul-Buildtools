#!/bin/bash 

sh build-lin.sh
status=$?
## take some decision ##
if [ $status -ne 0 ]; then 
    echo "FAILED!"  
    exit 1 
fi 
currentWINEdir="Z:\\$(pwd | sed 's#/#\\#g'  )"

#/Applications/Warcraft\ III/x86_64/Warcraft\ III.app/Contents/MacOS/Warcraft\ III -loadfile target/map.w3x
exec wine64 ~/.wine/drive_c/Program\ Files/Warcraft\ III/x86_64/Warcraft\ III.exe -windowmode windowed -loadfile ${currentWINEdir}\\target\\map.w3x


