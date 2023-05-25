package codigo;

import java.io.File;

public class Principal {
    public static void main(String[] args) {
        String ruta = "C:/Users/Marco Muralles/Documents/NetBeansProjects/WebAnalizadorLexSint/src/codigo/Lexer.flex"; 
        generarLexer(ruta);
        
    }
    
    public static void generarLexer(String ruta){
        File archivo = new File(ruta);
        JFlex.Main.generate(archivo);
    }
}