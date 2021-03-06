#include <stdio.h>
#include <unistd.h>

#include "../spi.h"

int main() {
  if (spi_init()) {
    return 1;
  }
  for (;;) {
    uint8_t d0[] = {2, 0, 2, 0, 0};  // clear
    if (spi_write(d0, sizeof(d0), 0)) {
      return 1;
    }
    sleep(1);
    uint8_t d1[] = {2, 0, 2, 0xFF, 0xFF};  // white
    if (spi_write(d1, sizeof(d1), 0)) {
      return 1;
    }
    sleep(1);
  }
  if (spi_deinit()) {
    return 1;
  }
  return 0;
}