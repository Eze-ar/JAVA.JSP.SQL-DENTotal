package controlador;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Empleado;
import modelo.EmpleadoDAO;

@WebServlet(name = "UsuarioController", urlPatterns = {"/UsuarioController"})
public class UsuarioController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        
        EmpleadoDAO empleadoDao = new EmpleadoDAO();
        
        boolean autorizado = false;
        try {
            autorizado = empleadoDao.autorizaIngreso(usuario, password);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if (autorizado) {
            //estando autorizado el log in se obtiene la sesión asignando user/password
            HttpSession sesion = request.getSession(true); 
            sesion.setAttribute("usuario", usuario);
            sesion.setAttribute("password", password);
            List<Empleado> listaEmpleado = new ArrayList<Empleado>();

            try{
                listaEmpleado = empleadoDao.listarEmpleados();
            }
            catch (SQLException ex) {
                Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
            }

            if(listaEmpleado == null || listaEmpleado.isEmpty()){
                response.sendRedirect("alta.jsp");
            }
            else response.sendRedirect("empleado.jsp");
        }
        
        else response.sendRedirect("login.jsp"); //no está autorizado el ingreso, al login de nuevo 
   
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
