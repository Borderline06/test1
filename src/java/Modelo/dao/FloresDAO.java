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
import Modelo.dto.Flores;
import java.sql.*;

public class FloresDAO {

    private Connection cnx;

    public FloresDAO() {
        cnx = new DBConexion().getConnection();
    }

    public Flores get(int id) {
        Flores f = null;
        PreparedStatement ps;
        ResultSet rs;
        String cadSQL = "SELECT * FROM flores WHERE flor_id = ?";
        try {
            ps = cnx.prepareStatement(cadSQL);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                f = new Flores(
                        rs.getInt("flor_id"),
                        rs.getString("nombre"),
                        rs.getString("descripcion"),
                        rs.getDouble("precio"),
                        rs.getInt("stock"),
                        rs.getString("imagen_url")
                );
            }
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return f;
    }

    // Método para actualizar una flor existente
    public boolean update(Flores f) {
        String cadSQL = "UPDATE flores SET nombre = ?, descripcion = ?, precio = ?, stock = ?, imagen_url = ? WHERE flor_id = ?";
        try (PreparedStatement ps = cnx.prepareStatement(cadSQL)) {
            ps.setString(1, f.getNombre());
            ps.setString(2, f.getDescripcion());
            ps.setDouble(3, f.getPrecio());
            ps.setInt(4, f.getStock());
            ps.setString(5, f.getImagenUrl());
            ps.setInt(6, f.getFlorId());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error al actualizar flor: " + ex.getMessage());
            ex.printStackTrace();
            return false;
        }
    }

    // Método para eliminar una flor por ID
    public boolean eliminar(int id) {
        String cadSQL = "DELETE FROM flores WHERE flor_id = ?";
        try (PreparedStatement ps = cnx.prepareStatement(cadSQL)) {
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error al eliminar flor: " + ex.getMessage());
            ex.printStackTrace();
            return false;
        }
    }
    
    public boolean agregar(Flores f) {
    String cadSQL = "INSERT INTO flores (nombre, descripcion, precio, stock, imagen_url) VALUES (?, ?, ?, ?, ?)";
    try (PreparedStatement ps = cnx.prepareStatement(cadSQL)) {
        ps.setString(1, f.getNombre());
        ps.setString(2, f.getDescripcion());
        ps.setDouble(3, f.getPrecio());
        ps.setInt(4, f.getStock());
        ps.setString(5, f.getImagenUrl());
        ps.executeUpdate();
        return true;
    } catch (SQLException ex) {
        System.out.println("Error al agregar flor: " + ex.getMessage());
        ex.printStackTrace();
        return false;
    }
}

}
