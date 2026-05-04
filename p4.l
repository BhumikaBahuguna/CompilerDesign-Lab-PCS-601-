%{
#include <stdio.h>
%}

KEYWORD  \b(int|float|char|double|if|else|while|for|return|void|break|continue|switch|case|default|do|long|short|unsigned|signed|const|static|struct|union|typedef|enum|sizeof|volatile|register|extern|goto)\b

ID       [a-zA-Z_][a-zA-Z0-9_]*
INVALIDID [0-9]+[a-zA-Z_][a-zA-Z0-9_]*

NUMBER   ([0-9]+\.[0-9]+)|([0-9]+)|(\.[0-9]+)

OP       (==|!=|<=|>=|\+\+|--|&&|\|\||[+\-*/=<>])

SEP      [;,(){}]

%%

{KEYWORD}   { printf("Keyword: %s\n", yytext); }

{INVALIDID} { printf("Invalid Identifier: %s\n", yytext); }

{ID}        { printf("Identifier: %s\n", yytext); }

{NUMBER}    { printf("Number: %s\n", yytext); }

{OP}        { printf("Operator: %s\n", yytext); }

{SEP}       { printf("Separator: %s\n", yytext); }

[ \t\n]+    ;   /* ignore whitespace */

.           { printf("Unknown: %s\n", yytext); }

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Paste fragment (CTRL+D to stop):\n");
    yylex();
    return 0;
}
