%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%
input:
      | input line
      ;

line:
      expr '\n' { printf("Valid Expression\n"); }
      ;

expr:
      expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | '(' expr ')'
    | NUMBER
    ;
%%

void yyerror(const char *s)
{
   printf("Invalid Expression\n");
}

int main()
{
   printf("Enter expression:\n");
   yyparse();
   return 0;
}