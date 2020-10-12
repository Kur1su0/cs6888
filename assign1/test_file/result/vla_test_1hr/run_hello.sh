
gcc_PATH="/root/git/cs6888/assign1/tcc-0.9.27/tcc"

#gcc_PATH="/root/git/cs6888/assign1/afl-2.52b/afl-gcc"


#$gcc_PATH -I /root/git/cs6888/assign1/tcc-0.9.27/lib/tcc/include -funsigned-char -r -mms-bitfields -bt 5 -m64 -bench -Dsym -g  -bench -Dsym -g -MD -o hello -c hello.c 
$gcc_PATH -I /root/git/cs6888/assign1/tcc-0.9.27/lib/tcc/include  -bench -g -Wall -o vla -c vla_test.c 
