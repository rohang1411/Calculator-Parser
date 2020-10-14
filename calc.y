%{

    #include<stdio.h>
    #include<math.h>

    int flag=0;

   

%}

%{
double memvar;
%}
%union
{
   double dval;
}
%token<dval>NUMBER
%type<dval>E
%token<dval>MEM
%token SIN



%%

start:statement'\n'
|start statement'\n'
;

statement:MEM'='E {memvar=$3;}
| E{printf("Answer=%g\n",$1);}
;

E: NUMBER {$$ = $1; }
   | E'+'E {$$ = $1 + $3; }
   | E'-'E {$$ = $1 - $3; }
   | E'*'E {$$ = $1 * $3; }
   | SIN E {$$ = sin($2); }
   ;

%%



int main()

{

   printf("\nEnter Any Arithmetic Expression which can have operations Addition, Subtraction, Multiplication:\n");

   yyparse();

  if(flag==0)

   printf("\nEntered arithmetic expression is Valid\n\n");

   return 0;

}



int yyerror()

{

   printf("\nEntered arithmetic expression is Invalid\n\n");

   flag=1;

}