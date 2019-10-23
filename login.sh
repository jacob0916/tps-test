pem=$(cat pem.txt)
ips=($(awk '{print $2}' ip_index.txt))
echo $1
echo ${ips[$1]}
ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ips[$1]}

