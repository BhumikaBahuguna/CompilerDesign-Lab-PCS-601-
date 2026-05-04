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
input:input stmt
      | /* empty */
    ;

stmt:
      E NL { printf("Result = %d\n", $1); } ;

E: E '+' E   { $$ = $1 + $3; }
 | E '-' E   { $$ = $1 - $3; }
 | E '*' E   { $$ = $1 * $3; }
 | E '/' E   {
                if ($3 == 0) {
                    printf("Division by zero\n");
                    exit(1);
                }
                $$ = $1 / $3;
             }
 | '(' E ')' { $$ = $2; }  
 | NUM       { $$ = $1; }
 ;
%%

void yyerror(const char *s)
{
    printf("Invalid Expression\n");
}

int main()
{
    printf("Enter expressions:\n");
    yyparse();
    return 0;
}