%option noyywrap
%{
#include <stdio.h>
%}

KEYWORD int|float|if|else|while
ID [a-zA-Z_][a-zA-Z0-9_]*
NUMBER [0-9]+(\.[0-9]+)?
OP [+\-*/=<>]+
SEP [;,(){}]

%%
{KEYWORD} {printf("Keyword: %s\n",yytext);}
{ID} {printf("Identifier: %s\n",yytext);}
{NUMBER} {printf("Number: %s\n",yytext);}
{OP} {printf("Operator: %s\n",yytext);}
{SEP} {printf("Separator: %s\n",yytext);}
[ \n\t] ;
. ;
%%

int main()
{
printf("Paste fragment (CTRL+D to stop):\n");
yylex();
}
