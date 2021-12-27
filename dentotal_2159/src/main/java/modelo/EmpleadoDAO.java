package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO {

    Connection conexion;

    public EmpleadoDAO(){
        Conexion con = new Conexion();
        conexion = con.getConnection();
    }

    public List<Empleado> listarEmpleados() throws SQLException{
        PreparedStatement ps;
        ResultSet rs;
        List<Empleado> listaEmpleados = new ArrayList<Empleado>(); //escribir así: List<Empleado> lista = new ArrayList<>() da error
        try{
            ps = conexion.prepareStatement("SELECT * FROM empleado"); //puede ir el nombre de la tabla sin ``
            rs = ps.executeQuery();
            while(rs.next()){
                int id_empleado = rs.getInt("id_empleado"); //no me interesa el id
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String usuario = rs.getString("usuario");
                String password = rs.getString("password");
                
                Empleado empleado = new Empleado( id_empleado, nombre, apellido, usuario, password);
                /*
                Empleado empleado = new Empleado( nombre, apellido, 
                direccion, dni, nacionalidad, celular, email, cargo, 
                sueldo, usuario, password); 
                */
                listaEmpleados.add(empleado);
            }
            return listaEmpleados;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return null;
        }
    }


    public Empleado leeEmpleado(int _id_empleado){
        PreparedStatement ps;
        ResultSet rs;
        Empleado empleado = null;

        try{
            ps = conexion.prepareStatement("SELECT id_empleado, nombre, apellido, usuario, password FROM empleado WHERE id_empleado =?");
            ps.setInt(1, _id_empleado);
            rs = ps.executeQuery();

            while(rs.next()){
                int id_empleado = rs.getInt("id_empleado");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String usuario = rs.getString("usuario");
                String password = rs.getString("password");

                empleado = new Empleado( id_empleado, nombre, apellido, usuario, password); 
            }
            return empleado;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return null;
        }
    }


    public boolean altaEmpleado(Empleado empleado){
        PreparedStatement ps;
        try{
            ps = conexion.prepareStatement("INSERT INTO empleado(nombre, apellido, usuario, password) VALUES (?,?,?,?)");
            ps.setString(1, empleado.getNombre());
            ps.setString(2, empleado.getApellido());
            ps.setString(3, empleado.getUsuario());
            ps.setString(4, empleado.getPassword());
            ps.execute();
            return true;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return false;
        }

    }

    public boolean actualizaEmpleado(Empleado empleado){
        PreparedStatement ps;
        try{
            ps = conexion.prepareStatement("UPDATE empleado SET nombre=?, apellido=?, usuario=?, password=? WHERE id_empleado=?");
            ps.setString(1, empleado.getNombre());
            ps.setString(2, empleado.getApellido());
            ps.setString(3, empleado.getUsuario());
            ps.setString(4, empleado.getPassword());
            ps.setInt(5, empleado.getId_empleado());
            ps.execute();
            return true;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return false;
        }

    }

    public boolean bajaEmpleado(int _id_empleado){
        PreparedStatement ps;
        try{
            ps = conexion.prepareStatement("DELETE FROM empleado WHERE id_empleado=?");
            ps.setInt(1, _id_empleado);
            ps.execute();
            return true;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return false;
        }
    }

    public boolean autorizaIngreso(String usuario, String password) throws SQLException {
        List<Empleado> listaEmpleados = listarEmpleados();
        if(listaEmpleados == null || listaEmpleados.isEmpty()){ //cuando no tengo usuarios cargados en la BD entro con admin/2435
            if(usuario.equals("admin") && password.equals("2435"))
                return true;       
            else return false;
        }
        for(Empleado e : listaEmpleados){
            if(e.getUsuario().equals(usuario) && e.getPassword().equals(password))
                return true;
        }
        return false;
    }
}
