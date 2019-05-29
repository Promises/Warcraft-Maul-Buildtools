sh BuildBot1.sh
Warcraft-Maul-Race-Parser mapfiles/Units/ units.json
python3 BuildFiles/GenerateHybrid.py
sh BuildBot2.sh
status=$?
## take some decision ## 
if [ $status -ne 0 ]; then
    exit 1
fi

dd conv=notrunc bs=512 count=1 of=out.w3x if=BuildFiles/header.bin


LC_ALL=C sed -i "s/PPPPPPPPPppXXXXXXXXXXXXPPPPPPPPPBBBWCMP/TestMap WCMaul Reimagined NaN          /g" out.w3x

