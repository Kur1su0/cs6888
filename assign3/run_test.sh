#!/bin/bash

total_line=$(wc -l testcase | awk -F ' ' '{print $1}')

make clean
make 
rm -r tcas_out
mkdir tcas_out
mkdir tcas_out/P/
mkdir tcas_out/F/

echo "$total_line"
Error_command=1579


for i in {1..1608}
do
	val=`sed -n ${i}p runtests.sh|bash |awk -F ':' '{print $2}'` > /dev/null
	#echo $val
	gcov tcas.c  > /dev/null
	echo $i $val 
	if [ $val == 'P' ] 
	then 
		#echo $i $val 
		#val= echo $val
		mv tcas.c.gcov tcas_out/P/${i}.c.gcov
		#mv ${i}.c.gcov tcas_out/$val/
		echo "tcas_out/P/${i}.c.gcov" >> tcas_out/P/P_path.txt
	else
		#val= echo $val
		mv tcas.c.gcov tcas_out/F/${i}.c.gcov
		#mv ${i}.c.gcov tcas_out/$val/
		echo "tcas_out/F/${i}.c.gcov" >> tcas_out/F/F_path.txt

	fi
	rm *.gcda

done
make clean

sh run_py.sh


