#!/bin/bash
echo "Setting myid to $ZK_MY_ID"
if [[ -n $ZK_MY_ID ]];then
	echo $ZK_MY_ID > ${ZK_DATA}/myid
fi

echo "Adding servers config to zoo.cfg "

servers=${ZK_SERVERS//;/ }
i=0
for s in ${servers[@]}
do
	echo "server.$i=$s" >> $ZK_HOME/conf/zoo.cfg
	i=$(($i+1))
done

echo "Starting zookeeper"
sh $ZK_HOME/bin/zkServer.sh start-foreground
