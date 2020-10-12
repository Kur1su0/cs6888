bad1="sleep_test"
bad2="float_num"
bad3="alloc_mem"
bad4="fork"
bad5="_asm"

good1="glob"
good2="func_call"
good3="rec"
good4="binary_tree"
good5="arg"

sizes="$good1 $good2 $good3 $good4 $bad2 $bad3 $bad4"
sizes2="$bad1 $bad5"

list_all="$good1 $good2 $good3 $good4 $good5 $bad1 $bad2 $bad3 $bad4 $bad5"

rm -r out_*
klee --output-dir=out_${good5} ${good5}.bc 2

for listsize in $sizes ; do
	timeout 10 klee --output-dir=out_${listsize} ${listsize}.bc
done

for listsize in $sizes2 ; do
	klee --libc=uclibc --posix-runtime  --output-dir=out_${listsize} ${listsize}.bc
done



for listsize in $list_all; do
	klee-stats out_${listsize}
done
	
