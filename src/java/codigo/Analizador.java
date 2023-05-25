package codigo;

import java.io.BufferedReader;
import java.io.Reader;
import java.io.StringReader;
import java_cup.runtime.Symbol;

public class Analizador {

    public String analizadorLexico(String entrada) {
        try {
            int cont = 1;
            Reader lector = new BufferedReader(new StringReader(entrada));
            Lexer lexer = new Lexer(lector);
            String tarjeta = "";

            String resultado = "LINEA " + cont + "\t\t\t\tSIMB-NUM        IDENT        ERROR\n";
            while (true) {
                Tokens token = lexer.yylex();
                if (token == null) {
                    return resultado;
                }
                switch (token) {
                    case Linea:
                        cont++;
                        resultado += "LINEA " + cont + "\n";
                        break;
                    case Comillas:
                        tarjeta = "  <Comillas>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //PAQUETE
                    case Pckg:
                        tarjeta = "  <Reservada Pckg>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //IMPORT
                    case Imprt:
                        tarjeta = "  <Reservada Imprt>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //IMPORT
                    case Jtcs:
                        tarjeta = "  <Reservada Jtcs>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //MODIFICADORES DE ACCESO PUBLICO
                    case Plub:
                        tarjeta = "  <Reservada Plub>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //MODIFICADORES DE ACCESO PRIVADO
                    case Prit:
                        tarjeta = "  <Reservada Prit>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //MODIFICADORES DE ACCESO PROTEGIDO
                    case Ptg:
                        tarjeta = "  <Reservada Ptg>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //CLASE
                    case Ctg:
                        tarjeta = "  <Reservada Ctg>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //TIPO DE DATO
                    case T_dato:
                        tarjeta = "  <Tipo de dato>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //TEXTO
                    case Tx:
                        tarjeta = "  <Tipo de dato>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //ESTACIA
                    case Stc:
                        tarjeta = "  <Modificador Stc>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //VOID
                    case Vid:
                        tarjeta = "  <Modificador Vid>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //IF
                    case Cond:
                        tarjeta = "  <Reservada cond>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //ELSE
                    case Condcc:
                        tarjeta = "  <Reservada condcc>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //DO
                    case Ejt:
                        tarjeta = "  <Reservada ejt>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //WHILE
                    case Mtrt:
                        tarjeta = "  <Reservada mtrt>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //FOR
                    case Rptr:
                        tarjeta = "  <Reservada rptr>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //SWITCH
                    case Itp:
                        tarjeta = "  <Reservada itp>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //CASE
                    case Op:
                        tarjeta = "  <Reservada op>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //BREAK
                    case Detn:
                        tarjeta = "  <Reservada detn>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //VARIABLE SIN VALOR
                    case Cero:
                        tarjeta = "  <Reservada cero>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //LISTA
                    case Lista:
                        tarjeta = "  <Reservada lista";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //CONJUNTO VALORES UNICOS
                    case Cjt:
                        tarjeta = "  <Reservada cjt>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //RESERVADO
                    case Reserv:
                        tarjeta = "  <Reservada reserv>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //GENERAL
                    case Gen:
                        tarjeta = "  <Reservada gen>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //HEREDAR
                    case Hrd:
                        tarjeta = "  <Reservada hrd>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //EXCLUSION
                    case Exc:
                        tarjeta = "  <Reservada exc>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //FINALIZAR
                    case Fnz:
                        tarjeta = "  <Reservada fnz>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //REINTENTAR
                    case Rtn:
                        tarjeta = "  <Reservada rtn>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //FUNCION
                    case Fcn:
                        tarjeta = "  <Reservada fcn>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //RETORNO
                    case Rtr:
                        tarjeta = "  <Reservada rtr>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //MAIN
                    case Min:
                        tarjeta = "  <Reservada min>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //CADENA STRING
                    case Strg:
                        tarjeta = "  <Tipo de dato>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //ARGS
                    case Ars:
                        tarjeta = "  <Reservada ars>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //SYSTEM
                    case Sysm:
                        tarjeta = "  <Reservada sysm>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //OUT
                    case Ot:
                        tarjeta = "  <Reservada ot>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //IMPRIMIR
                    case Impr:
                        tarjeta = "  <Reservada impr>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    //SIGNOS
                    case Igual:
                        tarjeta = "  <Operador igual>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Suma:
                        tarjeta = "  <Operador suma>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Resta:
                        tarjeta = "  <Operador resta>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Multiplicacion:
                        tarjeta = "  <Operador multiplicacion>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Division:
                        tarjeta = "  <Operador division>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Op_logico:
                        tarjeta = "  <Operador logico>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Op_incremento:
                        tarjeta = "  <Operador incremento>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Op_relacional:
                        tarjeta = "  <Operador relacional>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Op_atribucion:
                        tarjeta = "  <Operador atribucion>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Op_booleano:
                        tarjeta = "  <Operador booleano>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Parentesis_a:
                        tarjeta = "  <Parentesis de apertura>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Parentesis_c:
                        tarjeta = "  <Parentesis de cierre>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Llave_a:
                        tarjeta = "  <Llave de apertura>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Llave_c:
                        tarjeta = "  <Llave de cierre>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Corchete_a:
                        tarjeta = "  <Corchete de apertura>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Corchete_c:
                        tarjeta = "  <Corchete de cierre>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case P_coma:
                        tarjeta = "  <Punto y coma>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Coma:
                        tarjeta = "  <Coma>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Punto:
                        tarjeta = "  <Punto>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Identificador:
                        tarjeta = "  <Identificador>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    case Numero_positivo:
                        tarjeta = "  <Numero_positivo>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Numero_negativo:
                        tarjeta = "  <Numero_negativo>";
                        resultado += calculoEspacios(tarjeta, 0) + lexer.lexeme + "\n";
                        break;
                    case Cadena:
                        tarjeta = "  <Cadena>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        break;
                    case IdentClasePaquete:
                        tarjeta = "  <Identificador>";
                        resultado += calculoEspacios(tarjeta, 1) + lexer.lexeme + "\n";
                        //resultado += "  <Indentificador>\t\t" + lexer.lexeme + "\n";
                        break;
                    case ERROR:
                        tarjeta = "  <ERROR SIMBOLO>";
                        resultado += calculoEspacios(tarjeta, 2) + lexer.lexeme + "\n";
                        break;
                    default:
                        resultado += "  < " + lexer.lexeme + " >\n";
                        break;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public String analizadorLexicoErrores(String entrada) {
        try {
            int cont = 1;
            int noErrores = 0;
            Reader lector = new BufferedReader(new StringReader(entrada));
            Lexer lexer = new Lexer(lector);

            String resultado = "";
            Boolean errorEncontrado = false;
            while (true) {
                Tokens token = lexer.yylex();
                if (token == null) {
                    if (!errorEncontrado) {
                        resultado += "FELICIDADES NO SE HAN ENCONTRADO ERRORES LEXICOS";
                    }
                    return resultado;
                }

                switch (token) {
                    case Linea:
                        cont++;
                        break;
                    case ERROR:
                        noErrores++;
                        if (!errorEncontrado) {
                        resultado += "+----+--------------+-----------------------+--------------+----------+----------+\n";
                        resultado += "| NO | CODIGO ERROR | DESCRIPCION DEL ERROR |  TIPO ERROR  | SIMBOLO  |  LINEA   |\n";
                        resultado += "+----+--------------+-----------------------+--------------+----------+----------+\n";
                        }
                        resultado += "| "+noErrores+"  |   NO: 00001  |  SIMBOLO NO DEFINIDO  | TIPO: LEXICO |    "+lexer.lexeme+"     | FILA: " + cont + " |\n";
                        resultado += "+----+--------------+-----------------------+--------------+----------+----------+\n";
                        errorEncontrado = true;
                        break;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public String calculoEspacios(String entrada, int tipo) {
        if (tipo == 0) {
            int espaciosR = 32 - entrada.length();
            for (int i = 0; i < espaciosR; i++) {
                entrada += " ";
            }
        } else if (tipo == 1) {
            int espaciosR = 48 - entrada.length();
            for (int i = 0; i < espaciosR; i++) {
                entrada += " ";
            }
        } else if (tipo == 2) {
            int espaciosR = 61 - entrada.length();
            for (int i = 0; i < espaciosR; i++) {
                entrada += " ";
            }
        }
        return entrada;
    }
    
    public String analizadorSintactico(String entrada) {
        String ST = entrada;
        Sintax s = new Sintax(new codigo.LexerCup(new StringReader(ST)));
        String resultado;
        try {
            resultado = "";
            s.parse();
            resultado += "FELICIDADES NO SE HAN ENCONTRADO ERRORES SINTACTICOS";
        } catch (Exception ex) {
            Symbol sym = s.getS();
            resultado = "";
            resultado += "+----+--------------+-----------------------+------------------+-----------+-----------+\n";
            resultado += "| NO | CODIGO ERROR | DESCRIPCION DEL ERROR |    TIPO ERROR    |   LINEA   |   TEXTO   |\n";
            resultado += "+----+--------------+-----------------------+------------------+-----------+-----------+\n";
            resultado += "| x  |   NO: 00001  |  ESTRUCTURA ERRONEA   | TIPO: SINTACTICO |     " + (sym.right + 1) + "     |     " + sym.value + " |\n";
            resultado += "+----+--------------+-----------------------+------------------+-----------+-----------+\n"; 
//            resultado += "Error de sintaxis. Linea: " + (sym.right + 1) + " Columna: " + (sym.left + 1) + ", Texto: \"" + sym.value + "\"";
        }
        return resultado;
    }
}
