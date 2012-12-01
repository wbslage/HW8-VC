#include "cma.h"
#include "stdlib.h"


 
int main(int argc, char * argv[]) {
          int i;
          int n = 0; //to hold last good value for i
	printf("Enter a number to specify size of the initial block of memory:\n");
	scanf("%d", &i);
          int size = atoi(argv[i]);
          
          class_memory(malloc(size),size); // give it to memory allocator
                
          while (i != '\0')
          {
                printf("i=%d\n",i);  //used to test while loop
                n = -(i/2);
                
                i *= 2;
                
          }
          
 
printf("here is the value of the largest block allocated %d\n",n);
          
          
}
