%{

    #include<stdio.h>
    #include<math.h>

    int flag=0;
    int flag1=0;

   

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
%token SIN COS TAN COT SEC COSEC LOG LN ASEC ASIN ACOS ATAN ACOSEC ACOT SQRT


%left '(' ')'
%left '+' '-'
%left '*' '/'
%right '^'

%%

start:statement'\n'
|start statement'\n'
;

statement:MEM'='E {memvar=$3;}
| E{if(flag1==0) printf("Answer=%g\n",$1);}
;

E: NUMBER {$$ = $1; }
   |E'/'E {if($3==0) { flag1=1; yyerror();} else $$ = $1 / $3;} 
   |'('E')' {$$ = $2; }
   |'-'E {$$ = (-1) * $2; }
   | E'+'E {$$ = $1 + $3; }
   | E'-'E {$$ = $1 - $3; }
   | E'*'E {$$ = $1 * $3; }
   | SIN'('E')' {$$ = sin($3); }
   | COS'('E')' {$$ = cos($3); }
   | TAN'('E')' {$$ = cos($3); }
   | COT'('E')' {$$ = 1/tan($3); }
   | COSEC'('E')' {$$ = 1/sin($3); }
   | SEC'('E')' {$$ = 1/cos($3); }
   | LOG'('E')' {$$ = log($3); }
   | ASIN'('E')' {$$ = asin($3); }
   | ACOS'('E')' {$$ = acos($3); }
   | ATAN'('E')' {$$ = acos($3); }
   | ACOT'('E')' {$$ = 1/atan($3); }
   | ACOSEC'('E')' {$$ = 1/asin($3); }
   | ASEC'('E')' {$$ = 1/acos($3); }
   | SQRT'('E')' {$$ = sqrt($3); }
   | E'^'E {$$ = pow($1,$3); }
   | E'%'E {$$ = (int)$1 % (int)$3; }
   ;

%%



int main()

{

   printf("\nEnter Any Arithmetic Expression which can have operations Addition, Subtraction, Multiplication:\n");
   flag1 = 0;
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
