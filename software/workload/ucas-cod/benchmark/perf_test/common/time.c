#include "machine.h"
#include "time.h"
#include "printf.h"

//counter unit: micro second (us)
volatile unsigned int *counter = (void *)(TIMER_ADDR);
volatile unsigned int *cnt_start = (void *)(TIMER_ADDR + 0x8);

unsigned long mul(unsigned long a, unsigned long b)
{
	return mul_ll(a, b);
}

unsigned long _get_count()
{
	return *counter;
}

unsigned long get_count()
{
	return  _get_count();
}

unsigned long clock_gettime(int sel, struct timespec *tmp)
{
	unsigned long n = 0;
	n = _get_count();
	tmp->tv_nsec = mod(mul(n, div(NSEC_PER_USEC, CPU_COUNT_PER_US)), NSEC_PER_USEC);
	tmp->tv_usec = mod(div(n, CPU_COUNT_PER_US), USEC_PER_MSEC);
	tmp->tv_msec = mod(div(div(n, CPU_COUNT_PER_US), USEC_PER_MSEC), MSEC_PER_SEC);
	tmp->tv_sec  = div(div(n, CPU_COUNT_PER_US), USEC_PER_SEC);
	printf("clock ns=%d,sec=%d\n",tmp->tv_nsec,tmp->tv_sec);
	return 0;
}

unsigned long get_clock()
{
	unsigned long n=0;
	n=_get_count();
	return n;
}

unsigned long get_ns(void)
{
	unsigned long n=0;
	n = _get_count();
	n=mul(n, NSEC_PER_USEC);
	return n;
}

unsigned long get_us(void)
{
	unsigned long n=0;
	n = _get_count();
	return n;
}

void control_counter(int ctrl_val)
{
	*cnt_start = ctrl_val;
}
