#include <stdio.h> 
#include <sys/types.h> 
#include <unistd.h> 
#include <klee/klee.h>
  
int forkexample(int x) 
{ 
  
    if (fork() == 0){
	if(x>5) return 0;
	else return 1;
    }
    else{
	if (x>5) return 1;
	else return 0;
    }	
} 
int main() 
{ 
	
    int n ;
    klee_make_symbolic(&n,sizeof(n),"n");
    return forkexample(n);
} 
