

which_file="cppcheck_res"
for i in {1..24}
do
	file=`sed -n ${i}p $which_file|awk -F ':' '{print $1}'`
	line=`sed -n ${i}p $which_file|awk -F ':' '{print $2}'`
	line_col=`sed -n ${i}p $which_file|awk -F ':' '{print $3}'`
	error_type=`sed -n ${i}p $which_file|awk -F ':' '{print $4}'`
	error=`sed -n ${i}p $which_file|awk -F ':' '{print $5}'`
	#error_2= `sed -n ${i}p $which_file|awk -F ':' '{print $6}'`
	echo -e "$file\t$line:$line_col\t$error_type:$error" #:$error_2"

done
