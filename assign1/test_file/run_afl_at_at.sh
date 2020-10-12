AFL_COV_PATH="/root/git/cs6888/assign1/afl-cov/"
tcc_include_PATH="/root/git/cs6888/assign1/tcc-0.9.27/lib/tcc/include"
tcc_cov_folder_PATH="/root/git/cs6888/assign1/tcc-0.9.27-cov"
tcc_PATH="/root/git/cs6888/assign1/tcc-0.9.27/tcc" 
afl_fuzz_PATH="/root/git/cs6888/assign1/afl-2.52b"


#${afl_fuzz_PATH}/afl-fuzz -i afl_input -o afl_output ${tcc_PATH} -I $tcc_include_PATH -Wall -bench -g -o /root/git/cs6888/assign1/test_file/vla @@

${afl_fuzz_PATH}/afl-fuzz -i afl_input -o afl_output ${tcc_PATH} -I $tcc_include_PATH  -o /root/git/cs6888/assign1/test_file/hello @@
