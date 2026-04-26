%{
#include<stdio.h>
#include<stdlib.h>

int yylex();       
int yyerror();
%}
%token A B NL
%%
stmt: S NL { printf("Valid string\n"); exit(0); };
S: A S B
 | ;
%%
int yyerror()
{
    printf("invalid string\n");
    exit(0);
}
void main()
{
    printf("enter the string: ");
    yyparse();
}