package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    private String USERNAME = "root";
    private String PASSWORD = "root";
    private String HOST = "localhost";
    private String PORT = "3306";
    private String DATABASE = "desempeño_docentes";
    private String CLASSNAME = "com.mysql.cj.jdbc.Driver";
    private String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE + "?serverTimezone=UTC";

    private Connection con;

    public Conexion() throws SQLException {

        try {
            Class.forName(CLASSNAME);
            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.err.println("Error 1: " + e);
        } catch (SQLException e) {
            System.err.println("Error 2: " + e);
        }
    }

    public Connection getConexion() {
        return con;  //retornar el objeto que contiene la conexión
    }

///para verificar la conexión
    private static Connection conn;

    public static void main(String[] args) throws SQLException {
        Conexion c1 = new Conexion();
        Conexion.conn = c1.getConexion();

        if (conn != null) {
            System.out.println("Conexión exitosa.... ");
            System.out.println("--------------------");
        }

    }

}
