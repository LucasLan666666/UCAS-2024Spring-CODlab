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

#ifdef NDEBUG
  #define assert(ignore) ((void)0)
#else
  #define assert(cond) \
    do { \
      if (!(cond)) { \
        printk("Assertion fail at %s:%d\n", __FILE__, __LINE__); \
        _halt(1); \
      } \
    } while (0)
#endif

#ifdef __cplusplus
}
#endif

