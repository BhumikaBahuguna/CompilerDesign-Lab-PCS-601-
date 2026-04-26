%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%token A B NL

%%
stmt: S NL { printf("Valid string\n"); exit(0); };
S: A S B
 | A B
 ;
%%

void yyerror(const char *s)
{
    printf("Invalid string\n");
    
}
int main()
{
    printf("Enter the string\n");
    yyparse();
    return 0;
}


run commands
/*
lex P12.l
yacc -d P12.y
cc lex.yy.c y.tab.c
./a.out
*/