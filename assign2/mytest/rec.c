#include <stdio.h> 
#include <klee/klee.h>
  
// Factorial function 
int f(int n) 
{ 
    // Stop condition 
    if (n == 0 || n == 1) 
        return 1; 
  
    // Recursive condition 
    else
        return n * f(n - 1); 
} 
  
// Driver method 
int main() 
{ 
    int n = 5; 
    klee_make_symbolic(&n,sizeof(n),"n");
    return f(n); 
} 
