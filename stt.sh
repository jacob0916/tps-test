#$1 : the job, the commit comment of the job
#$2 : slot time
	. ./update.sh $1 $2
        . ./clean.sh
        . ./start.sh

        # wait pow->pos switch
        i=1
        while ((i <= 6 ))
        do
                echo "waiting pos switch"
                ((i++))
                sleep 30
        done

        . ./sendTx.sh


        i=1
        while ((i <= $(200*$2)) ))
        do
                ((i++))
                sleep 1 
        done


	
