%option noyywrap
%{
#include <stdio.h>
extern FILE *yyin;
extern FILE *yyout;
%}
%%
"<"[^>]*">"   { printf("%s\n",yytext); fprintf(yyout,"%s\n",yytext); }
.|\n          ;
%%
int main()
{
yyin = fopen("input.html","r");
yyout = fopen("output.txt","w");
if(!yyin || !yyout)
{
    printf("File error\n");
    return 0;
}
yylex();
fclose(yyin);
fclose(yyout);
}
