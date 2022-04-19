
%{
open Syntax
%}
%token <int64> NUMBER
%token LPAREN
%token RPAREN
%token ADD1
%token SUB1
%token LET
%token <string> IDENTIFIER
%token EQUAL
%token IN
%token PLUS
%token MINUS
%token TIMES
%token EOF

%start <expr> start

%%

(* reglas aqui *)

start: 
| e = expr EOF { e}
expr:
 | n = NUMBER { Num n }
 | ADD1 LPAREN e = expr RPAREN  { Add1 e } 
 | SUB1 LPAREN e = expr RPAREN  { Sub1 e }
 | LET id = IDENTIFIER EQUAL e1 = expr IN e2 = expr { Let (id, e1, e2) }
 | id = IDENTIFIER { Id id }
 | LPAREN e1 = expr RPAREN {e1}
 | e1 = expr PLUS e2= expr {EPrim2 (Plus, e1, e2)}
 | e1 = expr MINUS e2= expr {EPrim2 (Minus, e1, e2)}
 | e1 = expr TIMES e2= expr {EPrim2 (Times, e1, e2)}
 
