%{ 
#include <stdio.h> 
extern int yylex(void);
extern int yyerror(char *);
%}
%token NAME NUMBER
%%
statement: NAME '=' expression { printf("%c = %d\n", $1, $3); }
     | expression  { printf("%d\n", $1); }
     ;

expression: expression '+' NUMBER { $$ = $1 + $3; }
     | expression '-' NUMBER { $$ = $1 - $3; }
     | NUMBER { $$ = $1; }
     ;
%%
