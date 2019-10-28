. ./txStop.sh

cd ~/scanPos

node dumpPosBlockIpc.js  -b 0 -e 500

cd -

. ./stop.sh

