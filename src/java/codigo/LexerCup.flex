package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
verdadero = [Vv][Ee][Rr][Dd][Aa][Dd][Ee][Rr][Oo]
falso = [Ff][Aa][Ll][Ss][Oo]
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

{espacio} {/*Ignore*/}
( "--*"(.)*"--*" ) {/*Ignore*/}
( "\n" ) {return new Symbol(sym.S_linea, yychar, yyline, yytext());}
( "\"" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());}

//PAQUETE
( pckg ) {return new Symbol(sym.Pckg, yychar, yyline, yytext());}
//IMPORT
( imprt ) {return new Symbol(sym.Imprt, yychar, yyline, yytext());}
//IMPORT JTCS
( jtcs ) {return new Symbol(sym.Jtcs, yychar, yyline, yytext());}

//MODIFICADOR DE ACCESO PUBLICO
( plub ) {return new Symbol(sym.Plub, yychar, yyline, yytext());}
//MODIFICADOR DE ACCESO PRIVADO
( prit ) {return new Symbol(sym.Prit, yychar, yyline, yytext());}
//MODIFICADOR DE ACCESO PROTEGIDO
( ptg ) {return new Symbol(sym.Ptg, yychar, yyline, yytext());}

//CLASE
( ctg ) {return new Symbol(sym.Ctg, yychar, yyline, yytext());}
//TIPOS DE DATOS
( log | nme | nmd | nmf ) {return new Symbol(sym.T_dato, yychar, yyline, yytext());}
//TEXTO
( tx ) {return new Symbol(sym.Tx, yychar, yyline, yytext());}
//ESTATICA
( stc ) {return new Symbol(sym.Stc, yychar, yyline, yytext());}

//ESTRUCTURAS
//VOID
( vid ) {return new Symbol(sym.Vid, yychar, yyline, yytext());}
//IF
( cond ) {return new Symbol(sym.Cond, yychar, yyline, yytext());}
//ELSE
( condcc ) {return new Symbol(sym.Condcc, yychar, yyline, yytext());}
//DO
( ejt ) {return new Symbol(sym.Ejt, yychar, yyline, yytext());}
//WHILE
( mtrt ) {return new Symbol(sym.Mtrt, yychar, yyline, yytext());}
//FOR
( rptr ) {return new Symbol(sym.Rptr, yychar, yyline, yytext());}
//SWITCH
( itp ) {return new Symbol(sym.Itp, yychar, yyline, yytext());}
//CASE
( op ) {return new Symbol(sym.Op, yychar, yyline, yytext());}
//BREAK
( detn ) {return new Symbol(sym.Detn, yychar, yyline, yytext());}

//EXCEPCIONES
//TRY
( itn ) {return new Symbol(sym.Itn, yychar, yyline, yytext());}
//CATCH
( trp ) {return new Symbol(sym.Trp, yychar, yyline, yytext());}

//OTROS TIPOS DE DATOS
//VARIABLE SIN VALOR
( cero ) {return new Symbol(sym.Cero, yychar, yyline, yytext());}
//LISTA
( lista ) {return new Symbol(sym.Lista, yychar, yyline, yytext());}
//CONJUNTO VALORES UNICOS
( cjt ) {return new Symbol(sym.Cjt, yychar, yyline, yytext());}
//RESERVADO
( reserv ) {return new Symbol(sym.Reserv, yychar, yyline, yytext());}
//GENERAL
( gen ) {return new Symbol(sym.Gen, yychar, yyline, yytext());}
//HEREDAR
( hrd ) {return new Symbol(sym.Hrd, yychar, yyline, yytext());}
//EXCLUSION
( exc ) {return new Symbol(sym.Exc, yychar, yyline, yytext());}
//FINALIZAR
( fnz ) {return new Symbol(sym.Fnz, yychar, yyline, yytext());}
//REINTENTAR
( rtn ) {return new Symbol(sym.Rtn, yychar, yyline, yytext());}
//FUNCION
( fcn ) {return new Symbol(sym.Fcn, yychar, yyline, yytext());}
//RETORNO
( rtr ) {return new Symbol(sym.Rtr, yychar, yyline, yytext());}
//MAIN
( min ) {return new Symbol(sym.Min, yychar, yyline, yytext());}
//CADENA STRING
( strg ) {return new Symbol(sym.Strg, yychar, yyline, yytext());}
//ARGS
( ars ) {return new Symbol(sym.Ars, yychar, yyline, yytext());}
//SYSTEM
( sysm ) {return new Symbol(sym.Sysm, yychar, yyline, yytext());}
//OUT
( ot ) {return new Symbol(sym.Ot, yychar, yyline, yytext());}
//IMPRIMIR
( impr ) {return new Symbol(sym.Impr, yychar, yyline, yytext());}

//SIGNOS
( "=" ) {return new Symbol(sym.Igual, yychar, yyline, yytext());}
( "+" ) {return new Symbol(sym.Suma, yychar, yyline, yytext());}
( "-" ) {return new Symbol(sym.Resta, yychar, yyline, yytext());}
( "*" ) {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}
( "/" ) {return new Symbol(sym.Division, yychar, yyline, yytext());}
( "&&" | "||" | "!" | "&" | "|" ) {return new Symbol(sym.Op_logico, yychar, yyline, yytext());}
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {return new Symbol(sym.Op_relacional, yychar, yyline, yytext());}
( "+=" | "-="  | "*=" | "/=" | "%=" ) {return new Symbol(sym.Op_atribucion, yychar, yyline, yytext());}
( "++" | "--" ) {return new Symbol(sym.Op_incremento, yychar, yyline, yytext());}
(true | false) {return new Symbol(sym.Op_booleano, yychar, yyline, yytext());}
( "(" ) {return new Symbol(sym.Parentesis_a, yychar, yyline, yytext());}
( ")" ) {return new Symbol(sym.Parentesis_c, yychar, yyline, yytext());}
( "{" ) {return new Symbol(sym.Llave_a, yychar, yyline, yytext());}
( "}" ) {return new Symbol(sym.Llave_c, yychar, yyline, yytext());}
( "[" ) {return new Symbol(sym.Corchete_a, yychar, yyline, yytext());}
( "]" ) {return new Symbol(sym.Corchete_c, yychar, yyline, yytext());}
( ";" ) {return new Symbol(sym.P_coma, yychar, yyline, yytext());}
( "," ) {return new Symbol(sym.Coma, yychar, yyline, yytext());}
( "." ) {return new Symbol(sym.Punto, yychar, yyline, yytext());}

//VERDADERO Y FALSO
{verdadero} {return new Symbol(sym.Verdadero, yychar, yyline, yytext());}
{falso} {return new Symbol(sym.Falso, yychar, yyline, yytext());}

//IDENTIFICADOR Y ERRORES
"@"({L}|{D})+ {return new Symbol(sym.Identificador, yychar, yyline, yytext());}
{D}+|({D}+"."{D}+) {return new Symbol(sym.Numero_positivo, yychar, yyline, yytext());}
("-"{D}+)|("-"{D}+"."{D}+) {return new Symbol(sym.Numero_negativo, yychar, yyline, yytext());}
("\""|"\'")(.)*("\""|"\'") {return new Symbol(sym.Cadena, yychar, yyline, yytext());}
{L}({L}|{D})* {return new Symbol(sym.IdentClasePaquete, yychar, yyline, yytext());}
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}

