klee_include="~/flee_src/include" #PATH TO klee_src/include
CFLAGS = -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone 

all: g1 g2 g3 g4 g5 b1 b2 b3 b4 b5 

#good 1
g1: glob.c
	clang -I ${klee_include} $(CFLAGS) glob.c
# good 2 internal func_call
g2: func_call.c
	clang -I ${klee_include} $(CFLAGS) func_call.c

#good 3
g3: rec.c
	clang -I ${klee_include} $(CFLAGS) rec.c

#good 4
g4: binary_tree.c
	clang -I ${klee_include} $(CFLAGS) binary_tree.c
#good 5
g5: arg.c
	clang -I ${klee_include} $(CFLAGS) arg.c

#--------------------------------------------------------------
#bad 1 ext_func
b1: sleep_test.c
	clang -I ${klee_include} $(CFLAGS) sleep_test.c


#bad 2
b2: float_num.c
	clang -I ${klee_include} $(CFLAGS) float_num.c

#bad 3 
b3: alloc_mem.c
	clang -I ${klee_include} $(CFLAGS) alloc_mem.c

file_test: file_test.c
	clang -I ${klee_include} $(CFLAGS) file_test.c
#bad 4
b4: fork.c
	clang -I ${klee_include} $(CFLAGS) fork.c
#bad 5
b5: _asm.c
	clang -I ${klee_include} $(CFLAGS) _asm.c

clean: 
	rm *.bc
rm_klee:
	rm -r klee-*

run_klee:
	sh run_klee.sh
