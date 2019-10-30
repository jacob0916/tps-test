. ./txStop.sh

cd ~/scanPos

node dumpPosBlockIpc.js  -b 0 -e 500

cd -

. ./stop.sh

cd ~/scanPos

cp blocks.xlsx  ~/blocks_$1.xlsx
