#!/bin/bash
pem=$(cat pem.txt)

cd ~/wanchain/src/github.com/wanchain/go-wanchain && git pull &&git checkout tps-test-delay && git pull && make

cp ~/wanchain/src/github.com/wanchain/go-wanchain/build/bin/gwan ~/jacob_bin
cd ~/jacob_bin
tar cvfz gwan.tgz gwan
git add -u
git commit -m  "update"
git push

cd ~/wanchain/tps-test


