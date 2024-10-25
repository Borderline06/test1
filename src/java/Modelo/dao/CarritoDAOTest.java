/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.dao;



/**
 *
 * @author Joaquin
 */
import Modelo.dto.Carrito;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CarritoDAOTest {

    // Declarar la conexión
    private Connection cnx;

    // Constructor que recibe la conexión
    public CarritoDAOTest(Connection connection) {
        this.cnx = connection;
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
                carrito.setIdCarrito(rs.getInt("carrito_id"));
                carrito.setFlorId(rs.getInt("flor_id"));
                carrito.setCantidad(rs.getInt("cantidad"));
                carrito.setPrecio(rs.getDouble("precio"));

                carritos.add(carrito);
            }
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return carritos;
    }
}



