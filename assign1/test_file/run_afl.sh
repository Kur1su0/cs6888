AFL_COV_PATH="/root/git/cs6888/assign1/afl-cov/"
tcc_include_PATH="/root/git/cs6888/assign1/tcc-0.9.27/lib/tcc/include"
tcc_cov_folder_PATH="/root/git/cs6888/assign1/tcc-0.9.27-cov"
tcc_PATH="/root/git/cs6888/assign1/tcc-0.9.27-cov/tcc"
${AFL_COV_PATH}afl-cov -d afl_output --live --coverage-cmd "$tcc_PATH -I ${tcc_include_PATH} -o hello  AFL_FILE" --code-dir $tcc_cov_folder_PATH --overwrite


