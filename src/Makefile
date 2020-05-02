YACC = bison -y -d -v
LEX = lex

parser.tab.h parser.tab.c  :
	$(YACC) parser.y

lex.yy.c :
	$(LEX) lex.l

bin/exe : parser.tab.c lex.yy.c
	cc -o bin/exe parser.tab.c lex.yy.c
