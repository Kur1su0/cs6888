#include <stdio.h>
#include <klee/klee.h>

int _float(float a){
	if (a>3.14) return 0;
	else if(a == 3.14) return 1;
	else return -1;

}


int main(){
	float a;
	klee_make_symbolic(&a, sizeof(a), "a");

	return _float(a);
}
