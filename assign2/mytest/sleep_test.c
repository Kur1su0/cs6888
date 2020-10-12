#include <stdio.h>
#include <unistd.h>
#include <klee/klee.h>
int _sleep(int a){
	if(sleep(a)>0){
		return 0;
	}else{
		return 1;
	}

}



int main(){
	int a;
	klee_make_symbolic(&a, sizeof(a), "a");
	return _sleep(a);

}

