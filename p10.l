%{
#include<stdio.h>
%}

%S S1 S2 S3 S4 S5 S6 S7

%%
<INITIAL>b BEGIN INITIAL;
<INITIAL>a BEGIN S1;
<INITIAL>\n {printf("Not Accepted\n"); BEGIN INITIAL;}

<S1>a BEGIN S2;
<S1>b BEGIN S5;
<S1>\n {printf("Not Accepted\n"); BEGIN INITIAL;}

<S2>a BEGIN S3;
<S2>b BEGIN S7;
<S2>\n {printf("Not Accepted\n"); BEGIN INITIAL;}

<S3>a BEGIN S3;
<S3>b BEGIN S7;
<S3>\n {printf("Accepted\n"); BEGIN INITIAL;}

<S4>a BEGIN S1;
<S4>b BEGIN INITIAL;
<S4>\n {printf("Accepted\n"); BEGIN INITIAL;}

<S5>a BEGIN S6;
<S5>b BEGIN S4;
<S5>\n {printf("Not Accepted\n"); BEGIN INITIAL;}

<S6>a BEGIN S2;
<S6>b BEGIN S5;
<S6>\n {printf("Accepted\n"); BEGIN INITIAL;}

<S7>a BEGIN S6;
<S7>b BEGIN S4;
<S7>\n {printf("Accepted\n"); BEGIN INITIAL;}

%%

int yywrap() { return 1; }

int main()
{
    yylex();
    return 0;
}

/*  Design a DFA in LEX Code which accepts string containing third last element ‘a’ over the 
input alphabet {a, b}. 
*/