%{
#include <stdio.h>
extern FILE *yyin;
extern FILE *yyout;
%}

%%
[ \t]+   { printf(" "); fprintf(yyout," "); }
\n       { printf("\n"); fprintf(yyout,"\n"); }
.        { printf("%s",yytext); fprintf(yyout,"%s",yytext); }
%%

int yywrap()
{
    return 1;
}

int main()
{
    yyin = fopen("Input.txt","r");
    yyout = fopen("Output.txt","w");

    if(!yyin || !yyout)
    {
        printf("File error\n");
        return 0;
    }

    yylex();

    fclose(yyin);
    fclose(yyout);

    return 0;
}
