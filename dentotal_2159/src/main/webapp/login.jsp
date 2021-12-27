<%-- 
    Document   : index
    Created on : 22/12/2021, 09:52:19 AM
    Author     : Adrián Eze Angió - #2159
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es-AR">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--Bootstrap need it-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

        <!--Google Fonts need it-->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Baumans&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/estilo.css">

        <!--linkeo el favicon, esto solo en el index.html-->
        <link rel="icon" type="image/vnd.microsoft.icon" href="favicon.ico">

        <title>DENTotal | Odontología</title>
    </head>

    <body class="ContenedorGrid">
        <header class="Encabezado">
            <h1 class="H1">DENTotal</h1>
            <h2 class="H2">Odontología de 1<span class=SuperIndice>er</span> Nivel a Su Alcance</h2>
        </header>

        <nav class="Navegacion">
            <a class="EnlaceNav" href="index.html">Inicio</a>
            <a class="EnlaceNav" href="staff.html">Staff</a>
            <a class="EnlaceNav" href="coberturas.html">Coberturas</a>
            <a class="EnlaceNav" href="contacto.html">Contáctenos</a>
            <a class="EnlaceNav" href="ubicacion.html">Dónde estamos</a>
            <a class="EnlaceNav" href="login.jsp">[Usuario Interno]</a>
        </nav>

        <div class="container h-100 d-flex align-items-center">
            <!--pongo para aliner en el centro horizontal y verticalmente -->
            <div class="row">
      
                <div class="col" style="margin-left: 150px;">
                    <div >

                        <form action="UsuarioController" method="post">

                            <label for="uname"><b>Usuario:</b></label>
                            <input type="text" placeholder="Ingrese Usuario" name="usuario" required>

                            <label for="psw"><b>Password:</b></label>
                            <input type="password" placeholder="Ingrese Password" name="password" required>

                            <button class="btn btn-primary" type="submit">Aceptar</button>
                        </form>
                    </div>


                </div>
                <div class="col-sm">

                </div>
            </div>
        </div>


        <footer class="Footer">
            <div>
                DENTotal | Odontología <p class="Diseño">// Diseño web por <span class="NegritaCursiva">Adrián Eze
                        Angió</span></p>
            </div>
        </footer>

        <!--Bootstrap's Carousel need it-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
                integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
        crossorigin="anonymous"></script>
    </body>

</html>
