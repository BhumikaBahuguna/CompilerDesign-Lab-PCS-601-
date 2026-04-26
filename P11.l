%{
#include <stdio.h>
%}
%s INT FLOAT ID
%%
[0-9]+\.[0-9]+          { 
                            BEGIN(FLOAT); 
                            printf("Float Constant: %s\n", yytext); 
                            BEGIN(INITIAL); 
                        }
[0-9]+                  { 
                            BEGIN(INT); 
                            printf("Integer Constant: %s\n", yytext); 
                            BEGIN(INITIAL); 
                        }
[a-zA-Z_][a-zA-Z0-9_]* { 
                            BEGIN(ID); 
                            printf("Identifier: %s\n", yytext); 
                            BEGIN(INITIAL); 
                        }
[ \t\n]+                ;
.                       { printf("Invalid: %s\n", yytext); }
%%

int yywrap() 
{
    return 1;
}

int main() 
{
    printf("Enter input:\n");
    yylex();
    return 0;
}