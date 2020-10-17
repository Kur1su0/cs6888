#include <stdio.h>

int main(){
	int *ptr=NULL;
	int val;
	ptr = &val;
	*ptr = 32;
	printf("%d\n",val);

}
