%{
#include <stdio.h>
%}

KEYWORD   (int|float|char|double|if|else|while|for|return)
ID        [a-zA-Z_][a-zA-Z0-9_]*
INVALIDID [0-9]+[a-zA-Z_][a-zA-Z0-9_]*
%%
{KEYWORD}     { printf("keyword: %s\n", yytext); }
{INVALIDID}   { printf("Invalid Identifier: %s\n", yytext); }
{ID}          { printf("Valid Identifier: %s\n", yytext); }
(.|\n)        ;

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter code (Press CTRL+D to stop):\n\n");
    yylex();
    return 0;
}
