%{
#include <stdio.h>
extern FILE *yyin;
extern FILE *yyout;
%}

%%

"//".*                          ;   

"/*"(.|\n)*?"*/"      ;   

.|\n  { 
        printf("%s", yytext);          
        fprintf(yyout, "%s", yytext);   
      }

%%

int main()
{
    yyin  = fopen("in.c","r");
    yyout = fopen("out.c","w");

    if(!yyin || !yyout)
    {
        printf("File error\n");
        return 0;
    }

    yylex();

    fclose(yyin);
    fclose(yyout);

    printf("\nComments removed. Check out.c\n");
    return 0;
}

int yywrap()
{
    return 1;
}
