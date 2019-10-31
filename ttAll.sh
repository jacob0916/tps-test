# 10m-2m-25-13

cd ~/wanchain/src/github.com/wanchain/go-wanchain
git pull
#git log --pretty=oneline | grep 10m-2m-25-13 | grep nodelay | grep -v grep | awk '{print $2}'
cd ~/wanchain/tps-test
jobs1=($(cat ./jobs/jobs1.txt))
# 20m-4m-25-13
#jobs2=($(git log --pretty=oneline | grep 10m-4m-25-13 | grep nodelay | grep -v grep | awk '{print $2}'))
jobs2=($(cat ./jobs/jobs2.txt))
# 20m-4m-50-25
#jobs3=($(git log --pretty=oneline | grep 20m-4m-50-25 | grep nodelay | grep -v grep | awk '{print $2}'))
jobs3=($(cat ./jobs/jobs3.txt))
echo "=========Jobs1========="
echo ${jobs1[@]}
echo "=========Jobs2========="
echo ${jobs2[@]}
echo "=========Jobs3========="
echo ${jobs3[@]}

function doJob(){
	cd ~/wanchain/src/github.com/wanchain/go-wanchain
        #commits=($(git log --pretty=oneline | grep ${job} | grep nodelay | grep -v grep | awk '{print $1}'))
        commits=($(git log --pretty=oneline | grep $1 | grep nodelay | grep -v grep | awk '{print $1}'))
        #10m-2m-25-13-50-nodelay
        #slotTime=$( echo ${job} | awk -F- '{print $5}')
        slotTime=$( echo $1 | awk -F- '{print $5}')
        echo ${commits[0]}
        echo ${slotTime}

        cd ~/wanchain/tps-test
        . ./stt.sh ${commits[0]} ${slotTime}
        #. ./ett.sh ${job}
        . ./ett.sh $1
}

if [ ${#jobs1[@]} -ne 0 ]; then
	#  Execute Jobs1
	cd ~/wanchain/tps-test
	cp ip_index25.txt ip_index.txt
	. buildIP.sh
	. ./limitSpeed.sh

	for job in ${jobs1[@]}
	do
        	echo ${job}
        	doJob  ${job}
	done
	
fi

if [ ${#jobs2[@]} -ne 0 ]; then
	#  Execute Jobs2
	cd ~/wanchain/tps-test
	cp ip_index25.txt ip_index.txt
	. buildIP.sh
	. ./clearLimit.sh
	for job in ${jobs2[@]}
	do
        	echo ${job}
        	doJob  ${job}
	done
	
fi

if [ ${#jobs3[@]} -ne 0 ]; then
	
	# Execute Jobs3
	cd ~/wanchain/tps-test
	cp ip_index50.txt ip_index.txt
	. buildIP.sh
	. ./clearLimit.sh
	for job in ${jobs3[@]}
	do
  		echo ${job} 
  		doJob  ${job}	
	done
fi

