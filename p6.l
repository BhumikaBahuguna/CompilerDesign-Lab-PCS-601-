%option noyywrap
%{
#include <stdio.h>
extern FILE *yyin;
extern FILE *yyout;
%}
%x COMMENT
%%
"//".*              ;                 /* remove single line comment */
"/*"                BEGIN(COMMENT);   /* start multiline comment */
<COMMENT>"*/"       BEGIN(INITIAL);   /* end comment */
<COMMENT>.|\n       ;                 /* ignore comment content */
.|\n { printf("%s",yytext); fprintf(yyout,"%s",yytext); }
%%
int main()
{
yyin = fopen("in.c","r");
yyout = fopen("out.c","w");
if(!yyin || !yyout)
{
    printf("File error\n");
    return 0;
}
yylex();
fclose(yyin);
fclose(yyout);
}