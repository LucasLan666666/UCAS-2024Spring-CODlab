#pragma once
/*
 * Static runtime library for a system software on AbstractMachine
 */


#include <am.h>
#include <stdarg.h>

#ifdef __cplusplus
extern "C" {
#endif

#ifndef NULL
#define NULL  ((void*)0)
#endif

void *kalloc(size_t);
void kfree(void*);

int atoi(const char* nptr);
int abs(int x);
unsigned long time();
void srand(unsigned int seed);
int rand();

#ifdef __cplusplus
}
#endif

