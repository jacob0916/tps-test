. ./update.sh
. ./clean.sh
. ./start.sh

# wait pow->pos switch
i=1
while ((i <= 6 ))
do
        echo "hello"
        ((i++))
        sleep 30 
done

. ./sendTx.sh
