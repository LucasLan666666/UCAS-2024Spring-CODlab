#include "machine.h"
#include "time.h"
#include "printf.h"
#include "trap.h"
#include "coremark.h"

#define SIMU 0

int main(void)
{
    unsigned long start_count = 0;
    unsigned long stop_count = 0;
    unsigned long total_count = 0;

    int err, i;

    //clear count
    //SOC_TIMER = 0;

    err = 0;
    printf("coremark test begin.\n");

    start_count = get_count();

    if(SIMU) {
	    err = core_mark(0, 0, 0x66, COREMARK_LOOP, 7, 1, 2000);
    } else {
        for(i = 0; i < LOOPTIMES; i++)
		err += core_mark(0, 0, 0x66, COREMARK_LOOP, 7, 1, 2000);
    }
    stop_count     = get_count();
    total_count    = stop_count - start_count;
    
    if(err == 0)
	    printf("coremark PASS!\n");
    else
	    printf("coremark ERROR!!!\n");
    
    printf("coremark: Total us = 0x%x\n", total_count);

    printf("benchmark finished\n");
	
    if(err == 0) hit_good_trap();
    else nemu_assert(0);
    
    return 0;
}
