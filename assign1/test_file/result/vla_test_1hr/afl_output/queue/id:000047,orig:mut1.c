#include<tcclib.h> 
#include <unistd.h>  
#include <stdlib.h>  
#include <errno.h>  
#include <sys/types.h>
#include <sys/wait.h>
int main(void)  
{  
        pid_t pid=fork();  
        if(pid==0)  
        {  
                int j ;  
                for(j=0;j<10;j++)  
                {  
                        printf("child: %d\n",j);  
                        //sleep(1);  
                }  
        }  
        else if (pid>0)  
        {  
                int i;  
                for(i=0;i<10;i++)  
                {  
                        printf("parent: %d\n",i);  
                        //sleep(1);  
                }  
        }  
        else  
        {  
                fprintf(stderr,"can't fork ,error %d\n",errno);  
                exit(1);  
        }  
	wait(0);        
	printf("This is the end !\n");  
}  
