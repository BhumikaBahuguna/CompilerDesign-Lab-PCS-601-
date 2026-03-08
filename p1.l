%{
#include <stdio.h>
int newline = 0, space = 0, tab = 0, ch = 0;
%}

%%
\n      { newline++; }
\t      { tab++; }
" "     { space++; }
.       { ch++; }
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter text (Press CTRL+D to stop):\n\n");
    yylex();

    printf("\n------ OUTPUT ------\n");
    printf("Number of lines: %d\n", newline);
    printf("Number of tabs: %d\n", tab);
    printf("Number of spaces: %d\n", space);
    printf("Number of characters: %d\n", ch);

    return 0;
}
