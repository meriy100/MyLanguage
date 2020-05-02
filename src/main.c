#include <stdio.h>
#include "parser.tab.h"

int main(int argc, char *argv[]) {
    if (argc == 0) {
       fprintf(stderr, 'Source File is empty1');
       exit(-1);
    }
    parser(argv[1]);
}
