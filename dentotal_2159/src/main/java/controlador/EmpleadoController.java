package controlador;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Empleado;
import modelo.EmpleadoDAO;

@WebServlet(name="EmpleadoController", urlPatterns={"/EmpleadoController"})
public class EmpleadoController extends HttpServlet {
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    
        EmpleadoDAO empleadoDao = new EmpleadoDAO();
        String accion;
        RequestDispatcher dispatcher = null;
        accion = request.getParameter("accion");
        if(accion == null || accion.isEmpty()){
            dispatcher = request.getRequestDispatcher("empleado.jsp");
        }
        else if(accion.equals("editar")){
            //traigo los datos del empleado a editar
            int id_empleado = Integer.parseInt(request.getParameter("id_empleado"));
            Empleado empleado = empleadoDao.leeEmpleado(id_empleado);
            HttpSession sesion = request.getSession();
            sesion.setAttribute("empleado", empleado);

            dispatcher = request.getRequestDispatcher("editar.jsp");
        }
        else if(accion.equals("actualizar")){
            int id_empleado =  Integer.parseInt(request.getParameter("id_empleado"));
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");

            Empleado empleado = new Empleado(id_empleado, nombre, apellido, usuario, password);
            empleadoDao.actualizaEmpleado(empleado);
            dispatcher = request.getRequestDispatcher("empleado.jsp");
            } 
        else if(accion.equals("baja")){
            int id_empleado = Integer.parseInt(request.getParameter("id_empleado"));
            empleadoDao.bajaEmpleado(id_empleado);
            dispatcher = request.getRequestDispatcher("empleado.jsp");
        }
        else if(accion.equals("alta")){
            dispatcher = request.getRequestDispatcher("alta.jsp");
        }
        else if(accion.equals("insert")){
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");
            Empleado empleado = new Empleado(0, nombre, apellido, usuario, password);
            empleadoDao.altaEmpleado(empleado);
            dispatcher = request.getRequestDispatcher("empleado.jsp");
        }
        else{
            dispatcher = request.getRequestDispatcher("empleado.jsp");
        }
        

    dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
       
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
