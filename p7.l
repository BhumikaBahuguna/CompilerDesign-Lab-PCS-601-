%{
#include <stdio.h>
extern FILE *yyin;
extern FILE *yyout;
%}

%%

"//".*                          ;   /* ignore single-line comments */

"/*"(.|\n)*?"*/"      ;   /* ignore multi-line comments */

.|\n  { 
        printf("%s", yytext);           /* print to terminal */
        fprintf(yyout, "%s", yytext);   /* write to out.c */
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

