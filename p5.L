%{
#include <stdio.h>
int chars=0, words=0, spaces=0, lines=0;
extern FILE *yyin;
extern FILE *yyout;
%}

%%
\n        { lines++; }
" "       { spaces++; chars++; }
\t        { spaces++; chars++; }

[a-zA-Z0-9]+  { words++; chars += yyleng; }

.         { chars++; }
%%

int yywrap()
{
    return 1;
}

int main()
{
    yyin = fopen("Input.txt","r");
    yyout = fopen("output.txt","w");

    if(!yyin || !yyout)
    {
        printf("File error\n");
        return 0;
    }

    yylex();

    printf("Characters: %d\n", chars);
    printf("Words: %d\n", words);
    printf("Spaces: %d\n", spaces);
    printf("Lines: %d\n", lines);

    fprintf(yyout,"Characters: %d\n", chars);
    fprintf(yyout,"Words: %d\n", words);
    fprintf(yyout,"Spaces: %d\n", spaces);
    fprintf(yyout,"Lines: %d\n", lines);

    fclose(yyin);
    fclose(yyout);

    return 0;
}