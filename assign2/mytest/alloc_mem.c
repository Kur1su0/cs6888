#include<stdio.h>
#include<unistd.h>
#include <stdlib.h>
#include <klee/klee.h>
int call_malloc(int n){
    int* ptr = NULL;
    ptr = (int*)malloc(n*sizeof(int));
    if(ptr==NULL){
    	return -1;
    }else{
        for(int i=0; i<n; i++){
            if(i!=0 && i%2==0) ptr[i]=i+n;
	    else if(i!=0 && i%3==0)ptr[i]=i+3*n;
	    else ptr[i]=i;
	}
    }
    free(ptr);
    ptr=NULL;
    return 1;

}


int main(){
	int n;

	klee_make_symbolic(&n,sizeof(n),"n");
	//klee_make_symbolic(&(ptr),sizeof(ptr),"ptr");
	//klee_make_symbolic(&(ptr2),sizeof(ptr2),"ptr2");
	//printf("%d\n",call_malloc(ptr,ptr2,a,b));
	return call_malloc(n);

}
