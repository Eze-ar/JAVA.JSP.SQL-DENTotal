<%@page import="modelo.EmpleadoDAO"%>
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
            <a class="EnlaceNav nav-link active" href="alta.jsp">[Alta Empleado]</a>
            <a class="EnlaceNav" href="empleado.jsp">[Lista Empleados]</a>
        </nav>
        <% //chequeo de sesión activa con user/pass válidos
            HttpSession sesion = request.getSession();
            String usuario = (String) sesion.getAttribute("usuario");
            //sin usuario válido mando al index:
            if (usuario == null) {
                response.sendRedirect("index.html");
            }
        %>

        <div class="container" style="margin-left: 150px; margin-top: 70px;">
            <div class="row">
                <h3 class="H3">Alta Empleado / Usuario</h3>  
            </div>
            <div class="row">   
                <form action="EmpleadoController?accion=insert" method="POST" class="mb-3">
                    <!-- pongo a dónde envío el formulario y con qué método: POST -->    
                    <div class="form">
                        <div class="name">Nombre</div>
                        <div class="value">
                            <div class="input-group">
                                <input class="input--style-5" type="text" name="nombre">
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Apellido</div>
                        <div class="value">
                            <div class="input-group">
                                <input class="input--style-5" type="text" name="apellido">
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Usuario</div>
                        <div class="value">
                            <div class="input-group">
                                <input class="input--style-5" type="text" name="usuario">
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Contraseña</div>
                        <div class="value">
                            <div class="input-group">
                                <input class="input--style-5" type="password" name="password">
                            </div>
                        </div>
                    </div> 
                    <div>
                        <button class="btn btn-primary" type="submit">Aceptar</button>
                    </div>
                </form>

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