%{

#include<stdio.h>

#include "y.tab.h"

void yyerror(char *);

%}


digit [0-9]

%%

{digit}*(\.)?{digit}+ {

          yylval.dval=atof(yytext);

          return NUMBER;

       }

[-+*/()\n] return *yytext;
mem {return MEM;}
sin {return SIN;}
cos {return COS;}
tan {return TAN;}
log {return LOG;}
cot {return COT;}
cosec {return COSEC;}
sec {return SEC;}

[\t] ;

.     yyerror("Invalid character");


%%

int yywrap()

{

return 1;

}