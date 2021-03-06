all: lexbi spirale

spirale: spirale.c
	gcc -o spirale spirale.c

lex.yy.c: lex.l
	lex lex.l

lexbi: lex.yy.c y.tab.c
	gcc -o lexbixec lex.yy.c y.tab.c -lfl -lm `pkg-config --cflags --libs cairo`

lexbee: lex.yy.c y.tab.c
	gcc -o lexbixec lex.yy.c y.tab.c -lfl -lm -lpixman-1 `pkg-config --cflags --libs cairo`

y.tab.c:
	bison -d -y bi.y

clean:
	rm -f lexec lexbixec lex.yy.c y.tab.c y.tab.h