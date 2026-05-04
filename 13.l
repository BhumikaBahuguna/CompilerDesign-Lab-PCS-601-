%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUM; }

[ \t]       ;   /* ignore spaces */

\n          { return NL; }

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

/* Design YACC/LEX code to recognize valid arithmetic expression with operators +, -, * and /. */