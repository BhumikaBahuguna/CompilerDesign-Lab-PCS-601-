%option noyywrap
%{
#include <stdio.h>
char str[100];
int i=0;
%}
%%
[a|b] {str[i++]=yytext[0];}
\n {
if(i>=3 && str[i-3]=='a') printf("Accepted\n");
else printf("Rejected\n");
i=0;
}
. ;
%%
int main()
{
printf("Enter string:\n");
yylex();
}