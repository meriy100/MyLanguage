#include <stdio.h>
#include <stdlib.h>
#include "node.h"

void print_test() {
    printf("hello world1");
}

void node_parse_init(parser_state* p) {
  p->nerr = 0;
  p->lval = NULL;
  p->fname = NULL;
  p->lineno = 1;
  p->tline = 1;
}

node* node_float_new(double d) {
    node_float* nf = malloc(sizeof(node_float));

    nf->type = NODE_FLOAT;
    nf->value = d;
    return (node*)nf;
}

void node_print(node* np) {
    switch(np->type) {
        case NODE_FLOAT:
            printf("node value : %lf\n", ((node_float*)np)->value);
            break;
    }
}
