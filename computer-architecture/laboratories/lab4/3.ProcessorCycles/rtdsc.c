#include <stdio.h>
unsigned long long rdtsc() ;
int main()
{
printf ("%llu\n", rdtsc()) ;
printf ("%llu\n", rdtsc()) ;
printf ("%llu\n", rdtsc()) ;
printf ("%llu\n", rdtsc()) ;
return 0 ;
} 
