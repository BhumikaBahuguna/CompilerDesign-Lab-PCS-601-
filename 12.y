%{ 
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror(const char *s);
%} 
  
%token A B NL
  
%% 
stmt: S NL {printf("Valid string\n"); exit(0);};
S: A S B
   | A B; 
%% 
  
void yyerror(const char *s) 
{ 
printf("invalid string\n");
exit(0);
} 
  
void main() 
{ 
printf("enter the string\n"); 
yyparse();
}