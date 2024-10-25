/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.dao;

import Servicio.DBConexion;
import Modelo.dto.Carrito;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarritoDAO {

    private Connection cnx;

    public CarritoDAO() {
        cnx = new DBConexion().getConnection();
    }

    public boolean save(Carrito carrito) {
        // Incluir el campo precio en la consulta SQL
        String sql = "INSERT INTO carrito (user_id, flor_id, cantidad, precio) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = cnx.prepareStatement(sql);
            ps.setInt(1, carrito.getUserId());
            ps.setInt(2, carrito.getFlorId());
            ps.setInt(3, carrito.getCantidad());
            ps.setDouble(4, carrito.getPrecio());  // Añadir el precio al PreparedStatement

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public Carrito get(int id) {
        Carrito c = null;
        PreparedStatement ps;
        ResultSet rs;

        // Consulta con INNER JOIN para obtener el precio de la flor
        String sql = "SELECT ca.idCarrito, ca.cantidad, "
                + "f.flor_id, f.nombre AS nombre_flor, f.precio, "
                + "u.user_id, u.nombre AS nombre_usuario "
                + "FROM carrito ca "
                + "INNER JOIN flores f ON ca.flor_id = f.flor_id "
                + "INNER JOIN usuarios u ON ca.user_id = u.user_id "
                + "WHERE ca.idCarrito = ?";

        try {
            ps = cnx.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Crea un nuevo objeto Carrito y añade los datos recuperados
                c = new Carrito();
                c.setIdCarrito(rs.getInt("idCarrito"));
                c.setFlorId(rs.getInt("flor_id"));  // flor_id como llave foránea
                c.setUserId(rs.getInt("user_id"));  // user_id como llave foránea
                c.setCantidad(rs.getInt("cantidad"));
                c.setPrecio(rs.getDouble("precio"));  // Agregar el precio de la flor
            }
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return c;
    }

    public List<Carrito> getCarritosByUserId(int userId) {
        List<Carrito> carritos = new ArrayList<>();
        PreparedStatement ps;
        ResultSet rs;

        String sql = "SELECT ca.carrito_id, ca.cantidad, "
                + "f.flor_id, f.precio "
                + "FROM carrito ca "
                + "INNER JOIN flores f ON ca.flor_id = f.flor_id "
                + "WHERE ca.user_id = ?";

        try {
            ps = cnx.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Carrito carrito = new Carrito();
                carrito.setIdCarrito(rs.getInt("carrito_id"));  // Actualiza el nombre de la columna aquí
                carrito.setFlorId(rs.getInt("flor_id"));
                carrito.setCantidad(rs.getInt("cantidad"));
                carrito.setPrecio(rs.getDouble("precio"));

                carritos.add(carrito);
            }
            rs.close();
        } catch (SQLException ex) {
        System.err.println("Error al obtener los carritos: " + ex.getMessage());
        }
        return carritos;
    }

}
