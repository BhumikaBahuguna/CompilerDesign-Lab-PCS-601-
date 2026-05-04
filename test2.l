%{
#include <stdio.h>
%}

%s S1 S2 S3

%%

<INITIAL>a          { BEGIN S1; }
<INITIAL>b          { BEGIN INITIAL; }
<INITIAL>\n         { printf("Not Accepted\n"); BEGIN INITIAL; }

<S1>a               { BEGIN S2; }
<S1>b               { BEGIN S2; }
<S1>\n              { printf("Not Accepted\n"); BEGIN INITIAL; }

<S2>a               { BEGIN S3; }
<S2>b               { BEGIN S3; }
<S2>\n              { printf("Not Accepted\n"); BEGIN INITIAL; }

<S3>a               { BEGIN S3; }
<S3>b               { BEGIN S2; }
<S3>\n              { printf("Accepted\n"); BEGIN INITIAL; }

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}