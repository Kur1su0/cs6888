#include <stdio.h>
#include <klee/klee.h>
int helper(int a){
	return 1;
	//return sin((double)a);
}


int foo(int a ){
	if(a> helper(a)) return 0;
	else return 1;
	

}

int main(){
	int a;

	klee_make_symbolic(&(a),sizeof(a),"a");
	return foo(a);
}
