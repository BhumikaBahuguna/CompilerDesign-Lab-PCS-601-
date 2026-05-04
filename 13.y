%{
#include<stdio.h>
#include<stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUM NL

%left '+' '-'
%left '*' '/'

%%

stmt: E NL { printf("Valid Expression\n"); };

E: E '+' E
 | E '-' E
 | E '*' E
 | E '/' E
 | '(' E ')'     
 | NUM
 ;
%%

void yyerror(const char *s)
{
    printf("Invalid Expression\n");
    exit(0);
}

int main()
{
    printf("Enter expression:\n");
    yyparse();
}