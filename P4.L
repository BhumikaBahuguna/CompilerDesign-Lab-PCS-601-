%option noyywrap

%{
#include <stdio.h>
int chars=0, words=0, spaces=0, lines=0;
extern FILE *yyin;
%}

%%
\n        { lines++; }
" "       { spaces++; chars++; }
\t        { spaces++; chars++; }

[a-zA-Z0-9]+  { words++; chars += yyleng; }

.         { chars++; }
%%

int main()
{
    yyin = fopen("Input.txt","r");

    if(!yyin)
    {
        printf("File not found\n");
        return 0;
    }

    yylex();

    printf("Characters: %d\n", chars);
    printf("Words: %d\n", words);
    printf("Spaces: %d\n", spaces);
    printf("Lines: %d\n", lines);

    return 0;
}