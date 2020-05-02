#ifndef MERIY_NODE_H
#define MERIY_NODE_H

void print_test();

typedef enum {
    NODE_FLOAT,
} node_type;

#define NODE_HEADER node_type type; const char* fname; int lineno

typedef struct node {
    NODE_HEADER;
} node;

typedef struct node_float {
    NODE_HEADER;
    double value;
} node_float;

extern node* node_float_new(double);
extern void node_print(node*);
#endif
