#include<stdio.h>

%S S1 S2 S3 S4 S5 S6
%%
<INITIAL>[A-Za-z0-9] {BEGIN S1;}
<INITIAL>[@\.] {BEGIN S6;}
<INITIAL>\n {printf("Not Accepted\n");BEGIN INITIAL;}
<S1>[A-Za-z0-9_\.] {BEGIN S1;}
<S1>@ {BEGIN S2;}
<S1>\n {printf("Not Accepted\n");BEGIN INITIAL;}
<S2>[A-Za-z0-9] {BEGIN S3;}
<S2>[@ \.] {BEGIN S6;}
<S2>\n {printf("Not Accepted\n");BEGIN INITIAL;}
<S3>[A-Za-z0-9] {BEGIN S3;}
<S3>"." {BEGIN S4;}
<S3>[@ _] {BEGIN S6;}
<S3>\n {printf("Not Accepted\n");BEGIN INITIAL;}
<S4>[A-Za-z0-9] {BEGIN S5;}
<S4>[@ \.] {BEGIN S6;}
<S4>\n {printf("Not Accepted\n");BEGIN INITIAL;}
<S5>[A-Za-z0-9] {BEGIN S5;}
<S5>"." {BEGIN S4;}
<S5>[@ _] {BEGIN S6;}
<S5>\n {printf("Accepted\n");BEGIN INITIAL;}
<S6>[A-Za-z0-9@_\.] {BEGIN S6;}
<S6>\n {printf("Not Accepted\n");BEGIN INITIAL;}
%%
int yywrap(){ return 1;}
int main(){
  yylex();
  return 0;
}