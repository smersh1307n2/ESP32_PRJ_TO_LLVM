#include "test.h"

void test(int some_int, double some_double, const char* some_string)
{
    printf("--- ESPB 'test' function called! ---\n");

    // Просто выводим полученные значения
    printf("Received integer: %d\n", some_int);
    printf("Received double:  %f\n", some_double);

    if (some_string) {
        printf("Received string:  \"%s\"\n", some_string);
    } else {
        printf("Received string:  (null)\n");
    }
    
    printf("----------------------------------\n");
}