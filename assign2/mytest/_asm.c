#include <stdio.h>
#include <klee/klee.h>


int main() { 
int res; 
int n;
	klee_make_symbolic(&n,sizeof(n),"n");

// move value to register %eax 
// move value to register %ebx 
// subtracting and storing result in res 
__asm__ ( "movl $20, %%eax;"
                "movl $10, %%ebx;"
                "subl %%ebx, %%eax ":"=a"(res)); 
   	printf("%d\n",res);
	if(res < n) 
	return 0; 
	else
		return 1;
}
