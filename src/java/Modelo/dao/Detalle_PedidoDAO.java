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
import Modelo.dto.Detalle_Pedido;
import Modelo.dto.Pago;
import Modelo.dto.Pedidos;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Detalle_PedidoDAO {

    Connection cnx;

    public Detalle_PedidoDAO() {
        cnx = new DBConexion().getConnection();
    }

    public Detalle_Pedido get(int id) {
        Detalle_Pedido detallePedido = null;
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT * FROM detalle_pedido WHERE detalle_id = ?";
        try {
            ps = cnx.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                detallePedido = new Detalle_Pedido(
                        rs.getInt("detalle_id"),
                        rs.getInt("pedido_id"),
                        rs.getInt("flor_id"),
                        rs.getInt("cantidad"),
                        rs.getDouble("precio")
                );
            }
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return detallePedido;
    }

   public List<Detalle_Pedido> getDetallePedidosByPedidoId(int pedidoId, int userId) {
    List<Detalle_Pedido> detallesPedidos = new ArrayList<>();
    String sql = "SELECT p.pedido_id, p.fecha_pedido, p.estado, "
               + "(SELECT pa.telefono FROM pago pa WHERE pa.user_id = p.user_id LIMIT 1) AS telefono, "
               + "(SELECT pa.direccion_envio FROM pago pa WHERE pa.user_id = p.user_id LIMIT 1) AS direccion_envio, "
               + "dp.flor_id, dp.cantidad, dp.precio "
               + "FROM pedidos p "
               + "INNER JOIN detalle_pedido dp ON p.pedido_id = dp.pedido_id "
               + "WHERE p.pedido_id = ?";

    try (PreparedStatement ps = cnx.prepareStatement(sql)) {
        ps.setInt(1, pedidoId);

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Detalle_Pedido detalle = new Detalle_Pedido();
                detalle.setPedidoId(rs.getInt("pedido_id"));
                detalle.setFlorId(rs.getInt("flor_id"));
                detalle.setCantidad(rs.getInt("cantidad"));
                detalle.setPrecio(rs.getDouble("precio"));

                Pedidos pedido = new Pedidos();
                pedido.setPedidoId(rs.getInt("pedido_id"));
                pedido.setFechaPedido(rs.getDate("fecha_pedido"));
                pedido.setEstado(rs.getString("estado"));

                Pago pago = new Pago();
                pago.setTelefono(rs.getString("telefono"));
                pago.setDireccionEnvio(rs.getString("direccion_envio"));

                detalle.setPedido(pedido);
                detalle.setPago(pago);

                detallesPedidos.add(detalle);
            }
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return detallesPedidos;
}





}
