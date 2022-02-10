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

int printf(const char* fmt, ...);
int sprintf(char* out, const char* format, ...);
int snprintf(char* s, size_t n, const char* format, ...);
int vsprintf(char *str, const char *format, va_list ap);
int vsnprintf(char *str, size_t size, const char *format, va_list ap);
int sscanf(const char *str, const char *format, ...);

void qsort(void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *));

#define printk printf

#ifdef __cplusplus
}
#endif

