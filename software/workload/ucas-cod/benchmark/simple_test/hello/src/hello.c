/**
 * Modified from https://raw.githubusercontent.com/mludvig/mini-printf/master/test1.c
 */
#include "printf.h"
#include "trap.h"

int main(void)
{
	printf("testing %d %d %07d\n", 1, 2, 3);
	printf("faster %s %ccheaper%c\n", "and", 34, 34);
	printf("%x %% %X\n", 0xdeadf00d, 0xdeadf00d);
	printf("%09d%09d%09d%09d%09d\n", 1, 2, 3, 4, 5);
	printf("%d %u %d %u\n", 50, 50, -50, -50);
	return 0;
}
