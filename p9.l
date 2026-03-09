%{
#include<stdio.h>
%}

%S S1 S2 S3

%%

<INITIAL>a     BEGIN S1;
<INITIAL>b     BEGIN S2;
<INITIAL>\n    { printf("Accepted\n"); }

<S1>a          BEGIN INITIAL;
<S1>b          BEGIN S3;
<S1>\n         { printf("Not Accepted\n"); BEGIN INITIAL; }

<S2>a          BEGIN S3;
<S2>b          BEGIN INITIAL;
<S2>\n         { printf("Not Accepted\n"); BEGIN INITIAL; }

<S3>a          BEGIN S2;
<S3>b          BEGIN S1;
<S3>\n         { printf("Not Accepted\n"); BEGIN INITIAL; }

%%

int yywrap()
{
    return 1;
}

int main()
{
    yylex();
    return 0;
}

