#include <stdio.h>
#include <klee/klee.h>

int a,b;

int glob_comp(){

	if(a > b) return 1;
	else return 0;
}

int main(){

	klee_make_symbolic(&(a),sizeof(a),"a");
	klee_make_symbolic(&(b),sizeof(b),"b");
	return glob_comp();

}
