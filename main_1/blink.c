/*
 * SPDX-FileCopyrightText: 2021-2022 Espressif Systems (Shanghai) CO LTD
 *
 * SPDX-License-Identifier: CC0-1.0
 */

#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#include "esp_log.h"
#include "sdkconfig.h"
#include "test.h"

// Tag for logging
static const char *TAG = "BLINK_EXAMPLE";

// --- CONFIGURATION ---
// GPIO number for the LED.
// Change this value according to your board.
// For most ESP32-C3 DevKits, this is GPIO_NUM_8.
#define BLINK_GPIO GPIO_NUM_8

// Blink period in milliseconds
#define BLINK_PERIOD_MS 1000
// --- END OF CONFIGURATION ---

void app_main(void)
{
    ESP_LOGI(TAG, "Configuring GPIO...");

    /*
     * Modern way to configure GPIO in ESP-IDF v4.0 and later.
     * We use a gpio_config_t struct to set up the pin.
     */
    gpio_config_t io_conf = {};
    // Bit mask for selecting the pins. We only use one pin.
    io_conf.pin_bit_mask = (1ULL << BLINK_GPIO);
    // Set the pin mode: output
    io_conf.mode = GPIO_MODE_OUTPUT;
    // Disable pull-up
    io_conf.pull_up_en = GPIO_PULLUP_DISABLE;
    // Disable pull-down
    io_conf.pull_down_en = GPIO_PULLDOWN_DISABLE;
    // Disable interrupts for this pin
    io_conf.intr_type = GPIO_INTR_DISABLE;
    
    // Apply the configuration
    esp_err_t err = gpio_config(&io_conf);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "GPIO config error: %s", esp_err_to_name(err));
        return;
    }

    ESP_LOGI(TAG, "Starting blink loop...");

    int num=0;
    while (num<10) {
        ESP_LOGI(TAG, "Turning the LED on (HIGH level)");
        // Set high level on the pin
        gpio_set_level(BLINK_GPIO, 1);
        
        // Wait for half the period
        vTaskDelay(pdMS_TO_TICKS(BLINK_PERIOD_MS / 2));
        
        ESP_LOGI(TAG, "Turning the LED off (LOW level)");
        // Set low level on the pin
        gpio_set_level(BLINK_GPIO, 0);
        
        // Wait for the second half of the period
        vTaskDelay(pdMS_TO_TICKS(BLINK_PERIOD_MS / 2));
        num++;
    }
}