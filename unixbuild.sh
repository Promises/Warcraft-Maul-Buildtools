sh bb1.sh
Warcraft-Maul-Race-Parser mapfiles/Units/ units.json
python3 GenerateHybrid.py
sh bb2.sh


dd conv=notrunc bs=512 count=1 of=out.w3x if=BuildFiles/header.bin


LC_ALL=C sed -i "s/PPPPPPPPPppXXXXXXXXXXXXPPPPPPPPPBBBWCMP/TestMap WCMaul Reimagined NaN          /g" out.w3x

