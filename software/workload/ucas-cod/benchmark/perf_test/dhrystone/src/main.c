#include "machine.h"
#include "time.h"
#include "printf.h"
#include "trap.h"

#define SIMU 0

int main(void)
{
    unsigned long start_count = 0;
    unsigned long stop_count = 0;
    unsigned long total_count = 0;

    int i,err;

    err = 0;
    printf("dhrystone test begin.\n");
    start_count = get_count();

    if(SIMU)
        err = dhrystone(RUNNUMBERS);
    else {
        for(i=0;i<LOOPTIMES;i++)
             err += dhrystone(RUNNUMBERS);
    }
    stop_count     = get_count();
    total_count    = stop_count - start_count;
    
    if(err == 0)
	    printf("dhrystone PASS!\n");  
    else
            printf("dhrystone ERROR!!!\n");

    printf("dhrystone: Total Count(SoC count) = 0x%x\n", total_count);

    printf("benchmark finished\n");

    if(err == 0) hit_good_trap();
    else nemu_assert(0);

    return 0;
}
