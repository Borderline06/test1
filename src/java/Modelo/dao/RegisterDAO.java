/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.dao;

/**
 *
 * @author Joaquin
 */
import Servicio.DBConexion;
import Modelo.dto.Register;
import java.sql.*;

public class RegisterDAO {

    private Connection cnx;

    public RegisterDAO() {
        cnx = new DBConexion().getConnection();
    }

    public boolean save(Register r) {
        String cadSQL = "INSERT INTO register (nombre, email, contrasena, direccion, telefono) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = cnx.prepareStatement(cadSQL)) { // try-with-resources para cerrar ps automáticamente
            ps.setString(1, r.getNombre());
            ps.setString(2, r.getEmail());
            ps.setString(3, r.getContrasena());
            ps.setString(4, r.getDireccion());
            ps.setString(5, r.getTelefono());
            ps.executeUpdate();
            return true; // Registro exitoso
        } catch (SQLException ex) {
            System.out.println("Error al registrar usuario: " + ex.getMessage());
            ex.printStackTrace();
            return false;
        }
    }

    // Método para verificar las credenciales del usuario
    public Register login(String email, String contrasena) {
        Register r = null;
        String sql = "SELECT * FROM register WHERE email = ? AND contrasena = ?";
        try (PreparedStatement ps = cnx.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, contrasena);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    r = new Register(
                            rs.getInt("user_id"),
                            rs.getString("nombre"),
                            rs.getString("email"),
                            rs.getString("contrasena"),
                            rs.getString("direccion"),
                            rs.getString("telefono")
                    );
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return r;
    }

    public Register get(int id) {
        Register r = null;
        PreparedStatement ps;
        ResultSet rs;
        String cadSQL = "SELECT * FROM register WHERE user_id = ?";
        try {
            ps = cnx.prepareStatement(cadSQL);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                r = new Register(
                        rs.getInt("user_id"),
                        rs.getString("nombre"),
                        rs.getString("email"),
                        rs.getString("contrasena"),
                        rs.getString("direccion"),
                        rs.getString("telefono")
                );
            }
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return r;
    }
    
     // Método para actualizar un usuario existente
    public boolean update(Register r) {
        String cadSQL = "UPDATE register SET nombre = ?, email = ?, contrasena = ?, direccion = ?, telefono = ? WHERE user_id = ?";
        try (PreparedStatement ps = cnx.prepareStatement(cadSQL)) {
            ps.setString(1, r.getNombre());
            ps.setString(2, r.getEmail());
            ps.setString(3, r.getContrasena());
            ps.setString(4, r.getDireccion());
            ps.setString(5, r.getTelefono());
            ps.setInt(6, r.getUserId()); // Asegúrate de tener el ID en el objeto Register
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error al actualizar usuario: " + ex.getMessage());
            ex.printStackTrace();
            return false;
        }
    }

    // Método para eliminar un usuario por ID
    public boolean eliminar(int id) {
        String cadSQL = "DELETE FROM register WHERE user_id = ?";
        try (PreparedStatement ps = cnx.prepareStatement(cadSQL)) {
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error al eliminar usuario: " + ex.getMessage());
            ex.printStackTrace();
            return false;
        }
    }

}
