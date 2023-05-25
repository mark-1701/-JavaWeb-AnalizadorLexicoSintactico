package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t\r]+
verdadero = [Vv][Ee][Rr][Dd][Aa][Dd][Ee][Rr][Oo]
falso = [Ff][Aa][Ll][Ss][Oo]
%{
    public String lexeme;
%}
%%
{espacio} {/*Ignore*/}
( "--*"(.)*"--*" ) {/*Ignore*/}
( "\n" ) {return Linea;}
( "\"" ) {lexeme=yytext(); return Comillas;}
//PAQUETE
( pckg ) {lexeme=yytext(); return Pckg;}
//IMPORT
( imprt ) {lexeme=yytext(); return Imprt;}
//IMPORT JTCS
( jtcs ) {lexeme=yytext(); return Jtcs;}

//MODIFICADOR DE ACCESO PUBLICO
( plub ) {lexeme=yytext(); return Plub;}
//MODIFICADOR DE ACCESO PRIVADO
( prit ) {lexeme=yytext(); return Prit;}
//MODIFICADOR DE ACCESO PROTEGIDO
( ptg ) {lexeme=yytext(); return Ptg;}

//CLASE
( ctg ) {lexeme=yytext(); return Ctg;}
//TIPOS DE DATOS
( log | nme | nmd | nmf ) {lexeme=yytext(); return T_dato;}
//TEXTO
( tx ) {lexeme=yytext(); return Tx;}
//ESTATICA
( stc ) {lexeme=yytext(); return Stc;}

//ESTRUCTURAS
//VOID
( vid ) {lexeme=yytext(); return Vid;}
//IF
( cond ) {lexeme=yytext(); return Cond;}
//ELSE
( condcc ) {lexeme=yytext(); return Condcc;}
//DO
( ejt ) {lexeme=yytext(); return Ejt;}
//WHILE
( mtrt ) {lexeme=yytext(); return Mtrt;}
//FOR
( rptr ) {lexeme=yytext(); return Rptr;}
//SWITCH
( itp ) {lexeme=yytext(); return Itp;}
//CASE
( op ) {lexeme=yytext(); return Op;}
//BREAK
( detn ) {lexeme=yytext(); return Detn;}

//EXCEPCIONES
//TRY
( itn ) {lexeme=yytext(); return Int;}
//CATCH
( trp ) {lexeme=yytext(); return Trp;}

//OTROS TIPOS DE DATOS
//VARIABLE SIN VALOR
( cero ) {lexeme=yytext(); return Cero;}
//LISTA
( lista ) {lexeme=yytext(); return Lista;}
//CONJUNTO VALORES UNICOS
( cjt ) {lexeme=yytext(); return Cjt;}
//RESERVADO
( reserv ) {lexeme=yytext(); return Reserv;}
//GENERAL
( gen ) {lexeme=yytext(); return Gen;}
//HEREDAR
( hrd ) {lexeme=yytext(); return Hrd;}
//EXCLUSION
( exc ) {lexeme=yytext(); return Exc;}
//FINALIZAR
( fnz ) {lexeme=yytext(); return Fnz;}
//REINTENTAR
( rtn ) {lexeme=yytext(); return Rtn;}
//FUNCION
( fcn ) {lexeme=yytext(); return Fcn;}
//RETORNO
( rtr ) {lexeme=yytext(); return Rtr;}
//MAIN
( min ) {lexeme=yytext(); return Min;}
//CADENA STRING
( strg ) {lexeme=yytext(); return Strg;}
//ARGS
( ars ) {lexeme=yytext(); return Ars;}
//SYSTEM
( sysm ) {lexeme=yytext(); return Sysm;}
//OUT
( ot ) {lexeme=yytext(); return Ot;}
//IMPRIMIR
( impr ) {lexeme=yytext(); return Impr;}

//SIGNOS
( "=" ) {lexeme=yytext(); return Igual;}
( "+" ) {lexeme=yytext(); return Suma;}
( "-" ) {lexeme=yytext(); return Resta;}
( "*" ) {lexeme=yytext(); return Multiplicacion;}
( "/" ) {lexeme=yytext(); return Division;}
( "&&" | "||" | "!" | "&" | "|" ) {lexeme=yytext(); return Op_logico;}
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexeme = yytext(); return Op_relacional;}
( "+=" | "-="  | "*=" | "/=" | "%=" ) {lexeme = yytext(); return Op_atribucion;}
( "++" | "--" ) {lexeme = yytext(); return Op_incremento;}
(true | false) {lexeme = yytext(); return Op_booleano;}
( "(" ) {lexeme=yytext(); return Parentesis_a;}
( ")" ) {lexeme=yytext(); return Parentesis_c;}
( "{" ) {lexeme=yytext(); return Llave_a;}
( "}" ) {lexeme=yytext(); return Llave_c;}
( "[" ) {lexeme = yytext(); return Corchete_a;}
( "]" ) {lexeme = yytext(); return Corchete_c;}
( ";" ) {lexeme=yytext(); return P_coma;}
( "," ) {lexeme=yytext(); return Coma;}
( "." ) {lexeme=yytext(); return Punto;}

//VERDADERO Y FALSO
{verdadero} {lexeme=yytext(); return Verdadero;}
{falso} {lexeme=yytext(); return Falso;}

//IDENTIFICADOR Y ERRORES
"@"({L}|{D})+ {lexeme=yytext(); return Identificador;}
//{D}+|("-"{D}+)|({D}+"."{D}+)|("-"{D}+"."{D}+) {lexeme=yytext(); return Numero;}
{D}+|({D}+"."{D}+) {lexeme=yytext(); return Numero_positivo;}
("-"{D}+)|("-"{D}+"."{D}+) {lexeme=yytext(); return Numero_negativo;}
("\""|"\'")(.)*("\""|"\'") {lexeme=yytext(); return Cadena;}
{L}({L}|{D})* {lexeme=yytext(); return IdentClasePaquete;}
//{L}+({D}|{S}|{L})+{L}+ {lexeme=yytext(); return ERRORIDENTIFICADOR;}
 . {lexeme=yytext(); return ERROR;}
