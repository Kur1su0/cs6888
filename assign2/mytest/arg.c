#include <stdio.h>
#include <klee/klee.h>


int main(int argc, char *argv[]){
	
	int n= 4;
	klee_make_symbolic(&n,sizeof(n),"n");
        if((argv[1][0] - '0') > n ) return -1;
	else return 0;


}
