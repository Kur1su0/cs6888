#include<tcclib.h> 
#include <unistd.h>  
#include <stdlib.h>  
#include <errno.h>  
#include <sys/types.h>
#include <sys/wait.h>
#include <float.h>
#include <stdbool.h>
#include <stddef.h>
#include <sys/types.h> 
#include <sys/socket.h> 
#include <netinet/in.h> 
#include <arpa/inet.h> 
#include <netdb.h> 
#include <unistd.h> 
#include <string.h> 
#include <stdlib.h> 
#include <netinet/ip_icmp.h> 
#include <time.h> 
#include <fcntl.h> 
#include <signal.h> 
#include <time.h> 
  
// Define the Packet Constants 
// ping packet size 
#define PING_PKT_S 64 
   
// Automatic port number 
#define PORT_NO 0  
  
// Automatic port number 
#define PING_SLEEP_RATE 1000000 x 
  
// Gives the timeout delay for receiving packets 
// in seconds 
#define RECV_TIMEOUT 1  
  
// Define the Ping Loop 
int pingloop=1; 
struct timespec time_start, time_end, tfs, tfe; 
int main(int argc, char* argv[])  
{  
  clock_gettime(CLOCK_MONOTONIC, &tfs); 
	printf("%i\n",tfs);
        pid_t pid=fork();  
        if(pid==0)  
        {  
                int j ;  
                for(j=0;j<3;j++)  
                {  
                        printf("child: %d\n",j);  
                        //sleep(1);  
                }  
        }  
        else if (pid>0)  
        {  
                int i;  
                for(i=0;i<3;i++)  
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
	wait(&pid);
	int src = 1;
	int dst;   
	  asm ("mov %1, %0\n\t"
    	"add $1, %0"
    	: "=r" (dst) 
    	: "r" (src));   
	printf("This is the end !\n"); 
	



	printf("%d\n", dst);
	
	printf("fewfwe\n");
}  
