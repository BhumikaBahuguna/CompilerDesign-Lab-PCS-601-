%{
    #include<stdio.h>
%}
%S S1 S2 S3 S4 S5
%%
<INITIAL>[a-zA-Z_] BEGIN S1;
<INITIAL>[0-9]     BEGIN S2;
<INITIAL>.         BEGIN S5;
<INITIAL>\n        {printf("Not Valid\n");}

<S1>[a-zA-Z0-9_]   BEGIN S1;
<S1>.              BEGIN S5;
<S1>\n { printf("Identifier \n"); BEGIN INITIAL; }

<S2>[0-9]          BEGIN S2;
<S2>"."            BEGIN S3;
<S2>.              BEGIN S5;
<S2>\n             {printf("Integer Constant\n"); BEGIN INITIAL;}

<S3>[0-9]          BEGIN S4;
<S3>.              BEGIN S5;
<S3>\n             {printf("Not Valid\n"); BEGIN INITIAL;}

<S4>[0-9]          BEGIN S4;
<S4>.              BEGIN S5;
<S4>\n             {printf("Float Constant\n"); BEGIN INITIAL;}

<S5>.              BEGIN S5;
<S5>\n             {printf("Not Valid\n"); BEGIN INITIAL;}
%%

int main()
{
    yylex();
    return 0;
}

int yywrap() 
{ 
    return 1; 
}

/* Design a DFA in LEX Code to identify and print integer & float constants and identifier. */