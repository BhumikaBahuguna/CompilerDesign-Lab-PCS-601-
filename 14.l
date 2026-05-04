%{
#include "y.tab.h"
#include <stdlib.h>
%}
%%
[0-9]+      { yylval = atoi(yytext); return NUM; }
[ \t]       { }   /* ignore whitespace */
[\n]        { return NL; }
"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
"/"         { return '/'; }
"("         { return '('; }
")"         { return ')'; }
.           { printf("Invalid character\n"); }
%%
int yywrap()
{
    return 1;
}