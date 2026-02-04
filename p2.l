%option noyywrap
%{
#include <stdio.h>
%}
KEYWORD   (int|float|double|char|if|else|while|for|return|break|continue|void|long|short|signed|unsigned|switch|case|default|do|static|struct|typedef|union|const|enum|extern|register|goto|sizeof)
ID        [a-zA-Z_][a-zA-Z0-9_]*
%%
{KEYWORD}      ;       
{ID} {
    printf("Valid Identifier: %s\n", yytext);
}
(.|\n)        ;        
%%
int main()
{
    printf("Enter code (Press CTRL+D to stop):\n\n");
    yylex();
    return 0;
}
