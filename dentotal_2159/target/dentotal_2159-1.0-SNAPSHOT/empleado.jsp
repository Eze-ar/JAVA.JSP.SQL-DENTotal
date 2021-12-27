<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="modelo.EmpleadoDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Empleado"%>
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
            <a class="EnlaceNav" href="alta.jsp">[Alta Empleado]</a>
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
                <h3>Lista Empleados / Usuarios</h3>
            </div>
            <div class="row">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Apellido y nombre</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">Password</th>
                            <th scope="col">Edita</th>
                            <th scope="col">Baja</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!--   <tr>
                               <th scope="row">January</th>
                               <td>85</td>
                               <td>$13,555.00</td>
                           </tr> -->
                        <%  List<Empleado> listaEmpleados = null;
                            EmpleadoDAO empleado = new EmpleadoDAO();
                            listaEmpleados = empleado.listarEmpleados();
                            if(listaEmpleados != null){
                                for (Empleado e : listaEmpleados) {
                                    String rutaE = "EmpleadoController?accion=editar&id_empleado=" + e.getId_empleado();
                                    String rutaB = "EmpleadoController?accion=baja&id_empleado=" + e.getId_empleado();%>
                        <tr>
                            <%String apellidoNombre = e.getApellido() + ", " + e.getNombre();%>
                            <td><%=apellidoNombre%></td>
                            <td><%=e.getUsuario()%></td>
                            <td><%=e.getPassword()%></td>
                            <%int id_empleado = e.getId_empleado();%>
                            <td>
                                <a class="text-success" href=<%=rutaE%>><img src="fotos/edit.png" alt="EDITAR"></a>
                            </td>
                            <td>
                                <a class="text-danger" href=<%=rutaB%>><img src="fotos/del.png" alt="BAJA"></a>
                            </td>
                        </tr>
                        <%}}%> <!--cierre del for -->


                    </tbody>
                </table>
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
