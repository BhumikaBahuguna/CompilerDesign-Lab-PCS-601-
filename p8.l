%option noyywrap
%{
#include <stdio.h>
int a=0,b=0;
%}
%%
a {a++;}
b {b++;}
\n {
if(a%2==0 && b%2==0) printf("Accepted\n");
else printf("Rejected\n");
a=b=0;
}
. ;
%%
int main()
{
printf("Enter string:\n");
yylex();
}