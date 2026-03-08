%{
#include <stdio.h>
%}

%%
[0-9]+"."[0-9]+   {
                    printf("Float: %s\n", yytext);
                 }

[0-9]+           {
                    printf("Integer: %s\n", yytext);
                 }

(.|\n)           ;      /* ignore everything else */
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter numbers (Press CTRL+D to stop):\n\n");
    yylex();
    return 0;
}
