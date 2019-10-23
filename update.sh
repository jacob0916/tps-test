#!/bin/bash
pem=$(cat pem.txt)

cd ~/wanchain/src/github.com/wanchain/go-wanchain && git pull &&git checkout tps-test-delay && git pull && make

#cp ~/wanchain/src/github.com/wanchain/go-wanchain ~/jacob_bin
#cd ~/jacob_bin
#git add -u
#gitc "update"
#git push

cd ~/wanchain/tps-test

for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  scp -o StrictHostKeyChecking=no -i ${pem} ~/wanchain/src/github.com/wanchain/go-wanchain/build/bin/gwan ubuntu@${ip}:~/gwan
  scp -o StrictHostKeyChecking=no -i ${pem} ~/wanchain/tps-test/run.sh ubuntu@${ip}:~/ 
  scp -o StrictHostKeyChecking=no -i ${pem} ~/wanchain/tps-test/tx.sh ubuntu@${ip}:~/ 
  #scp -o StrictHostKeyChecking=no -i ${pem} ~/tps-test/watch.sh ubuntu@${ip}:~/ 
  ((index++))

done


