/* Imports. */

%{

open Type
open Ast.AstSyntax
%}


%token <int> ENTIER
%token <string> ID
%token RETURN
%token PV
%token AO
%token AF
%token PF
%token PO
%token EQUAL
%token CONST
%token PRINT
%token IF
%token ELSE
%token WHILE
%token BOOL
%token INT
%token RAT
%token CALL 
%token CO
%token CF
%token SLASH
%token NUM
%token DENOM
%token TRUE
%token FALSE
%token PLUS
%token MULT
%token INF
%token EOF
(*Ajout token pour pointeur*)
%token NEW
%token ADRESSE
%token NULL
(*Ajout conditionnelle ternaire*)
%token DP
%token PI
(*Ajout loop*)
%token LOOP
%token BREAK
%token CONTINUE


(* Type de l'attribut synthétisé des non-terminaux *)
%type <programme> prog
%type <instruction list> bloc
%type <fonction> fonc
%type <instruction> i
%type <typ> typ
%type <typ*string> param
%type <expression> e 
%type <affectable> af 

(* Type et définition de l'axiome *)
%start <Ast.AstSyntax.programme> main

%%

main : lfi=prog EOF     {lfi}

prog : lf=fonc* ID li=bloc  {Programme (lf,li)}

fonc : t=typ n=ID PO lp=param* PF li=bloc {Fonction(t,n,lp,li)}

param : t=typ n=ID  {(t,n)}

bloc : AO li=i* AF      {li}

i :
| t=typ n=ID EQUAL e1=e PV          {Declaration (t,n,e1)}
| n=af EQUAL e1=e PV                {Affectation (n,e1)}    (*Modification pour pointeur*)
| CONST n=ID EQUAL e=ENTIER PV      {Constante (n,e)}
| PRINT e1=e PV                     {Affichage (e1)}
| IF exp=e li1=bloc ELSE li2=bloc   {Conditionnelle (exp,li1,li2)}
| IF exp=e li=bloc                  {Conditionnelle (exp,li,[])} (*Ajout pour le bloc else optionnel*)
| WHILE exp=e li=bloc               {TantQue (exp,li)}
| RETURN exp=e PV                   {Retour (exp)}
| LOOP li=bloc                      {Loop (li)}
| n=ID DP LOOP li=bloc              {IdLoop (n,li)}
| BREAK PV                          {Break}
| BREAK n=ID PV                     {IdBreak (n)}
| CONTINUE PV                       {Continue}
| CONTINUE n=ID PV                  {IdContinue (n)}

(*Création affectable*)
af :
| n = ID {Ident n}
| PO MULT n = af PF  {Deref n}

typ :
| BOOL    {Bool}
| INT     {Int}
| RAT     {Rat}
| t=typ MULT {Pointeur t} (*Ajout règle typage pour pointeur*)
| PO t=typ PF {t}         (*Ajout règle pour la gestion des types parenthésés*)

e : 
| CALL n=ID PO lp=e* PF   {AppelFonction (n,lp)}
| CO e1=e SLASH e2=e CF   {Binaire(Fraction,e1,e2)}
| TRUE                    {Booleen true}
| FALSE                   {Booleen false}
| e=ENTIER                {Entier e}
| NUM e1=e                {Unaire(Numerateur,e1)}
| DENOM e1=e              {Unaire(Denominateur,e1)}

| PO e1=e PLUS e2=e PF    {Binaire (Plus,e1,e2)}
| PO e1=e MULT e2=e PF    {Binaire (Mult,e1,e2)}
| PO e1=e EQUAL e2=e PF   {Binaire (Equ,e1,e2)}
| PO e1=e INF e2=e PF     {Binaire (Inf,e1,e2)}
| PO exp=e PF             {exp}
| ADRESSE n=ID            {Adresse n}           (*Ajout pour pointeur*)
| n=af                    {Affectable n}        (*Ajout pour pointeur*)
| NULL                    {Null}                (*Ajout pour pointeur*)
| PO NEW t=typ PF         {New t}               (*Ajout pour pointeur*)
| PO expC=e PI exp1=e DP exp2=e PF {Ternaire (expC,exp1,exp2)}  (*Ajout pour la condionnelle ternaire*)
(*| n=ID                    {Ident n}*)



