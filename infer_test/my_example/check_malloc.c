#include <stdio.h>
#include <stdlib.h>
#include <assert.h>


#define MAX_NUM 10

int* out_of_bound_opt(int* ptr){
	for(int i=0;i<MAX_NUM*2;i++){
		ptr[i]=i;
	}
	ptr[MAX_NUM*10]=MAX_NUM;
	return ptr;
}


int* call_calloc(int* ptr){
	ptr =(int*)calloc(MAX_NUM,sizeof(int));
	//assert(ptr!=NULL);
	return ptr;
}


void FREE(int** ptr){

	free(*ptr);
	*ptr=NULL;
}


void dead_store(){
	int i = 10;

}

void res_leak(){
	FILE *fp;
	fp=fopen("run_malloc.sh","r");
}


int main(){
	int *ptr;
	ptr = call_calloc(ptr);
	ptr[0]=MAX_NUM;
	ptr=out_of_bound_opt(ptr);
	printf("%d\n",ptr[0]);
	
	//FREE(&ptr);
	



}
