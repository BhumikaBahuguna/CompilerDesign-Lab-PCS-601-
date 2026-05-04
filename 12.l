%{ 
#include "y.tab.h" 
%} 
  
%% 
[a] {return A;} 
[b] {return B;} 
[\n] {return NL;} 
%% 

int yywrap()  
{  
return 1;  
}  

/* Design YACC/LEX code to recognize the valid string from the language L= {anbn | n>=1}. */