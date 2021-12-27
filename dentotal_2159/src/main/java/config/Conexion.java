// Adrián Ezequiel Angió #2159

package config;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Conexion {

    public String driver = "com.mysql.cj.jdbc.Driver"; 
    public Connection getConnection(){
        Connection conexion = null;
        try {
            Class.forName(driver);
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/consultorio", "con", "1234");
        }
        catch(ClassNotFoundException | SQLException e){
            System.out.println(e.toString());
        }
        return conexion;
    }

/* //es sólo para probar
    public static void main(String[] args) throws SQLException {
        Connection conexion = null;
        Conexion con = new Conexion();
        conexion = con.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        ps = conexion.prepareStatement("SELECT * FROM empleado");
        rs = ps.executeQuery();
        while(rs.next()){
            int id_empleado = rs.getInt("id_empleado");
            String nombre = rs.getString("nombre");
            String apellido = rs.getString("apellido");
            String direccion = rs.getString("direccion");
            String dni = rs.getString("dni");
            Date fecha_nac = rs.getDate("fecha_nac");           
            String nacionalidad = rs.getString("nacionalidad");
            String celular = rs.getString("celular");
            String email = rs.getString("email");
            String cargo = rs.getString("cargo");
            Double sueldo = rs.getDouble("sueldo");    
            String usuario = rs.getString("usuario");
            String password = rs.getString("password");
    
            System.out.println("ID :" + id_empleado + " Nombre: " + nombre + 
            " Apellido: " + apellido + " Dirección: " + direccion +" DNI: " + dni +
            " Fecha Nacimiento: " + fecha_nac + " Nacionalidad: " + nacionalidad +
            " Celular: " + celular + " e-mail: " + email + " Cargo: " + cargo + 
            " Sueldo: " + sueldo + " Usuario: " + usuario + " Password: " + password);
      
        }
         
    }
*/

}

