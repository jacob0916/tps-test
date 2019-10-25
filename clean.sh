#!/bin/bash
pem=$(cat pem.txt)

index=0
ids=($(awk '{print $1}' ip_index.txt))
for ip in $(awk '{print $2}' ip_index.txt)
do 
  echo ${index} ${ip} ${ids[$index]}

  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "rm -rf ~/data/gwan && mkdir -p ~/data/gwan"
  scp -o StrictHostKeyChecking=no -i ${pem} ./nodekeys/n${ids[$index]} ubuntu@${ip}:~/data/gwan/nodekey
  scp -o StrictHostKeyChecking=no -i ${pem} ./static-nodes.json  ubuntu@${ip}:~/data/gwan/static-nodes.json
  #scp -o StrictHostKeyChecking=no -i ${pem} ~/molin.pem  ubuntu@${ip}:~/molin.pem
  ((index++))
done
