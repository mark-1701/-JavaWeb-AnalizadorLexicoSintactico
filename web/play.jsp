<%@page import="java.io.StringReader"%>
<%@page import="codigo.Analizador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/4664e51d0b.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <link rel="stylesheet" href="css/stylesPlay.css"> 
        <title>System</title>
    </head>
    <body>

        <%
            Analizador analizador = new Analizador();
            String resultado = "";
            String cajaEntrada = "";

            if (request.getParameter("analizadorLexico") != null) {
                cajaEntrada = request.getParameter("cajaEntrada");
                resultado = analizador.analizadorLexico(cajaEntrada);
            }
            if (request.getParameter("analizadorLexicoErrores") != null) {
                cajaEntrada = request.getParameter("cajaEntrada");
                resultado = analizador.analizadorLexicoErrores(cajaEntrada);
            }
            if (request.getParameter("analizadorSintactico") != null) {
                cajaEntrada = request.getParameter("cajaEntrada");
                resultado = analizador.analizadorSintactico(cajaEntrada);
            }
        %>

        <header>
            <div class="icon-menu">
                <label for="btn-menu" id="barras-btn">☰</label>
            </div>

            <div class="logo">
                <img src="img/snorlax.png" />
                <h4>Snorlax System</h4>
            </div>
        </header>

        <input type="checkbox" id="btn-menu" />

        <div class="menu-side">
            <div class="cards-opciones">
                <a href="#" class="selected">
                    <div class="option">
                        <span class="material-symbols-outlined">play_arrow</span>
                        <p>Ejecutar</p>
                    </div>
                </a>

                <a href="#">
                    <div class="option">
                        <span class="material-symbols-outlined"> download </span>
                        <p>Descarga</p>
                    </div>
                </a>

                <a href="#">
                    <div class="option">
                        <span class="material-symbols-outlined">description</span>
                        <p>Documentación</p>
                    </div>
                </a>

                <a href="#">
                    <div class="option">
                        <span class="material-symbols-outlined">settings</span>
                        <p>Configuraciones</p>
                    </div>
                </a>

            </div>

            <div class="logout">
                <a href="index.html">
                    <div class="option">
                        <span class="material-symbols-outlined">logout</span>
                        <p>Cerrar Sesión</p>
                    </div>
                </a>
            </div>
        </div>

        <form action="play.jsp" method="POST" class="main">
            <div class="boxes">

                <textarea id="contenido-archivo" name="cajaEntrada"><%out.print(cajaEntrada);%></textarea>
                <textarea><%out.print(resultado);%></textarea>

                <!--<textarea id="contenido-archivo" class="box"></textarea>
                <textarea class="box"></textarea>-->
            </div>

            <div>
                <input type="file" id="load" />
                <label for="load" class="btn-enviar">Abrir Archivo</label>
                <input type="submit" value="Analisis Lexico" name="analizadorLexico" class="btn-enviar"/>
                <input type="submit" value="Analisis Lexico Errores" name="analizadorLexicoErrores" class="btn-enviar" />
                <input type="submit" value="Analisis Sintactico" name="analizadorSintactico" class="btn-enviar" />
            </div>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <script src="js/logic.js"></script>
</body>
</html>
