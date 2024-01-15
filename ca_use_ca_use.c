#include <stdio.h> /* printf  */
#include <stdlib.h> /* EXIT_SUCCESS */
#include <unistd.h> /* sleep */

int main(void){
  int i;
  for (i = 1; i <= 30; i++) {
    printf("%d km ..., %d km à pied, ca use les souliers. \n", i, i);
    sleep(1); // Place le processus en pause pour 1 seconde
  }
  return EXIT_SUCCESS;
}
