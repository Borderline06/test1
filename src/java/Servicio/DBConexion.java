/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servicio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Joaquin
 */
public class DBConexion {

    private static String DRIVER = "com.mysql.jdbc.Driver";
    private static String USER = "El y Ella Detalles";
    private static String PASSWORD = "LOA";
    private static String URL = "jdbc:mysql://localhost:3306/db_flores";

    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            System.err.println("ERROR EN EL DRIVER: " + e.getMessage());
        }
    }

    public Connection getConnection() {
        Connection con = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Conexión exitosa");
        } catch (SQLException e) {
            System.err.println("Error en la conexión: " + e.getMessage());
        }
        return con;
    }
}
