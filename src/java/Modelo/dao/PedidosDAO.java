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
import Modelo.dto.Pedidos;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PedidosDAO {

    private Connection cnx;

    public PedidosDAO() {
        cnx = new DBConexion().getConnection();
    }

    public Pedidos get(int id) {
        Pedidos pedido = null;
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT * FROM pedidos WHERE pedido_id = ?";
        try {
            ps = cnx.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                pedido = new Pedidos(
                        rs.getInt("pedido_id"),
                        rs.getInt("user_id"),
                        rs.getDouble("total"),
                        rs.getString("estado"),
                        rs.getDate("fecha_pedido") // Asegúrate de usar el nombre correcto de la columna
                );
            }
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return pedido;
    }

    // Método para actualizar un pedido existente
    public boolean update(Pedidos pedido) {
        String sql = "UPDATE pedidos SET user_id = ?, total = ?, estado = ? WHERE pedido_id = ?";
        try (PreparedStatement ps = cnx.prepareStatement(sql)) {
            ps.setInt(1, pedido.getUserId());
            ps.setDouble(2, pedido.getTotal());
            ps.setString(3, pedido.getEstado());
            ps.setInt(4, pedido.getPedidoId()); // Asignar el ID del pedido a actualizar
            ps.executeUpdate();
            return true; // Actualización exitosa
        } catch (SQLException ex) {
            System.out.println("Error al actualizar el pedido: " + ex.getMessage());
            ex.printStackTrace();
            return false;
        }
    }

    // Método para eliminar un pedido por ID
    public boolean eliminar(int id) {
        String sql = "DELETE FROM pedidos WHERE pedido_id = ?";
        try (PreparedStatement ps = cnx.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
            return true; // Eliminación exitosa
        } catch (SQLException ex) {
            System.out.println("Error al eliminar el pedido: " + ex.getMessage());
            ex.printStackTrace();
            return false;
        }
    }

    public List<Pedidos> getPedidosByUserId(int userId) {
        List<Pedidos> pedidos = new ArrayList<>();
        PreparedStatement ps;
        ResultSet rs;

        String sql = "SELECT pedido_id, total, estado, fecha_pedido "
                + "FROM pedidos "
                + "WHERE user_id = ?";

        try {
            ps = cnx.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Pedidos pedido = new Pedidos();
                pedido.setPedidoId(rs.getInt("pedido_id"));
                pedido.setUserId(userId);
                pedido.setTotal(rs.getDouble("total"));
                pedido.setEstado(rs.getString("estado"));
                pedido.setFechaPedido(rs.getDate("fecha_pedido")); // Asegúrate de tener este campo en tu clase `Pedidos`

                pedidos.add(pedido);
            }
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return pedidos;
    }

}
