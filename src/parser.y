%{
#include <stdio.h>
#include <stdlib.h>
#include "node.h"
#define YYDEBUG 1

static void node_lineinfo(parser_state* p, node* node) {
  if (!node) return;
  node->fname = p->fname;
  node->lineno = p->lineno;
}

%}
%union {
  int          int_value;
  double       double_value;
}
%token <double_value>      DOUBLE_LITERAL
%token ADD SUB MUL DIV CR
%type <double_value> expression term primary_expression

%%

line_list
  : line
  | line_list line
  ;
line
  : expression CR
  {
      print_test();
      printf(">>%lf\n", $1);
  }
expression
  : term
  | expression ADD term
  {
      $$ = $1 + $3;
  }
  | expression SUB term
  {
      $$ = $1 - $3;
  }
  ;
term
  : primary_expression
  | term MUL primary_expression
  {
      $$ = $1 * $3;
  }
  | term DIV primary_expression
  {
      $$ = $1 / $3;
  }
  ;
primary_expression
  : DOUBLE_LITERAL
  {
        node_print(node_float_new($1));
        $$ = $1;
  }
  ;

%%

int
yyerror(char const *str)
{
  extern char *yytext;
  fprintf(stderr, "parser error near %s\n", yytext);
  return 0;
}

int parser(char *file_name)
{
  extern int yyparse(void);
  extern FILE *yyin;

  yyin = fopen(file_name, "r");
  if(yyin == NULL) {
      fprintf(stderr, "file be not able to read");
      exit(-1);
  }
  if (yyparse()) {
      fprintf(stderr, "Error ! Error ! Error !\n");
      fclose(yyin);
      exit(1);
  }

  fclose(yyin);
}