YACC = bison -d -v
LEX = lex

parser.tab.h parser.tab.c  :
	$(YACC) parser.y

lex.yy.c : parser.tab.h
	$(LEX) lex.l

node.o :

bin/exe : parser.tab.c lex.yy.c node.o
	gcc -o bin/exe parser.tab.c lex.yy.c node.o

clean :
	rm bin/exe parser.tab.c parser.tab.h lex.yy.c node.o