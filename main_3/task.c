#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include <stdio.h>


void my_task(void* pvParam) {
    while(1) {
        printf("Hello from dynamic code!\n");
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
}


void app_main(int argc, char* argv[], char* envp[])
{
    xTaskCreate(my_task, "dyn_task", 4048, NULL, 5, NULL); 

    while (true)
    {
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
    
}
