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

void* memset(void* v, int c, size_t n);
void* memcpy(void* dst, const void* src, size_t n);
void* memmove(void* dst, const void* src, size_t n);
int memcmp(const void* s1, const void* s2, size_t n);
size_t strlen(const char* s);
char* strcat(char* dst, const char* src);
char* strcpy(char* dst, const char* src);
char* strncpy(char* dst, const char* src, size_t n);
int strcmp(const char* s1, const char* s2);
int strncmp(const char* s1, const char* s2, size_t n);
char* strtok(char* s,const char* delim);
char *strstr(const char *, const char *);
const char *strchr(const char *s, int c);

#ifdef __cplusplus
}
#endif

