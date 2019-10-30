# 10m-2m-25-13

cd ~/wanchain/src/github.com/wanchain/go-wanchain
#git log --pretty=oneline | grep 10m-2m-25-13 | grep nodelay | grep -v grep | awk '{print $2}'
jobs1=($(git log --pretty=oneline | grep 10m-2m-25-13 | grep nodelay | grep -v grep | awk '{print $2}'))
# 20m-4m-25-13
jobs2=($(git log --pretty=oneline | grep 10m-4m-25-13 | grep nodelay | grep -v grep | awk '{print $2}'))
# 20m-4m-50-25
jobs3=($(git log --pretty=oneline | grep 20m-4m-50-25 | grep nodelay | grep -v grep | awk '{print $2}'))
echo "=========Jobs1========="
echo ${jobs1[@]}
echo "=========Jobs2========="
echo ${jobs1[@]}
echo "=========Jobs3========="
echo ${jobs1[@]}


for job in ${jobs1[@]}
do
  	echo ${job} 
	commits=($(git log --pretty=oneline | grep ${job} | grep nodelay | grep -v grep | awk '{print $1}'))
	#10m-2m-25-13-50-nodelay
	slotTime=$( echo ${job} | awk -F- '{print $5}')
	echo ${commits[0]}
	echo ${slotTime}
	. ./stt.sh ${commits[0]} ${slotTime}

done
