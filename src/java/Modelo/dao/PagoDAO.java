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
import Modelo.dto.Pago;
import java.sql.*;

public class PagoDAO {

    private Connection cnx;

    public PagoDAO() {
        cnx = new DBConexion().getConnection();
    }

    public Pago get(int id) {
        Pago pago = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM pago WHERE pago_id = ?";
        try {
            ps = cnx.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                pago = new Pago(
                        rs.getInt("pago_id"),
                        rs.getInt("user_id"),
                        rs.getString("nombre_completo"),
                        rs.getString("correo"),
                        rs.getString("telefono"),
                        rs.getString("direccion_envio"),
                        rs.getString("ciudad"),
                        rs.getString("estado"),
                        rs.getString("codigo_postal"),
                        rs.getString("numero_tarjeta"),
                        rs.getString("fecha_expiracion"),
                        rs.getString("cvv"),
                        rs.getDouble("monto_total")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                // cnx no se cierra aquí, podría ser administrado en otra parte
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return pago;
    }

    // Método para realizar el pago y crear el pedido en una sola transacción
    public boolean procesarPagoYPedido(Pago pago, int userId, double total) {
        boolean resultado = false;
        PreparedStatement psPago = null;
        PreparedStatement psPedido = null;
        PreparedStatement psDetalle = null;
        PreparedStatement psEliminarCarrito = null;
        ResultSet rsPedidoId = null;

        String sqlPago = "INSERT INTO pago (user_id, nombre_completo, correo, telefono, direccion_envio, ciudad, estado, codigo_postal, numero_tarjeta, fecha_expiracion, cvv, monto_total) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String sqlPedido = "INSERT INTO pedidos (user_id, total, estado) VALUES (?, ?, 'pendiente')";
        String sqlDetalle = "INSERT INTO detalle_pedido (pedido_id, flor_id, cantidad, precio) VALUES (?, ?, ?, ?)";
        String sqlEliminarCarrito = "DELETE FROM carrito WHERE user_id = ?";

        try {
            // Iniciar transacción
            cnx.setAutoCommit(false);

            // 1. Insertar el pago
            psPago = cnx.prepareStatement(sqlPago);
            psPago.setInt(1, pago.getUserId());
            psPago.setString(2, pago.getNombreCompleto());
            psPago.setString(3, pago.getCorreo());
            psPago.setString(4, pago.getTelefono());
            psPago.setString(5, pago.getDireccionEnvio());
            psPago.setString(6, pago.getCiudad());
            psPago.setString(7, pago.getEstado());
            psPago.setString(8, pago.getCodigoPostal());
            psPago.setString(9, pago.getNumeroTarjeta());
            psPago.setString(10, pago.getFechaExpiracion());
            psPago.setString(11, pago.getCvv());
            psPago.setDouble(12, pago.getMontoTotal());
            psPago.executeUpdate();

            // 2. Insertar el pedido
            psPedido = cnx.prepareStatement(sqlPedido, Statement.RETURN_GENERATED_KEYS);
            psPedido.setInt(1, userId);
            psPedido.setDouble(2, total);
            psPedido.executeUpdate();
            rsPedidoId = psPedido.getGeneratedKeys();

            if (rsPedidoId.next()) {
                int pedidoId = rsPedidoId.getInt(1);

                // 3. Mover los productos del carrito a la tabla detalle_pedido
                String sqlCarrito = "SELECT flor_id, cantidad, precio FROM carrito WHERE user_id = ?";
                PreparedStatement psCarrito = cnx.prepareStatement(sqlCarrito);
                psCarrito.setInt(1, userId);
                ResultSet rsCarrito = psCarrito.executeQuery();

                while (rsCarrito.next()) {
                    int florId = rsCarrito.getInt("flor_id");
                    int cantidad = rsCarrito.getInt("cantidad");
                    double precio = rsCarrito.getDouble("precio");

                    psDetalle = cnx.prepareStatement(sqlDetalle);
                    psDetalle.setInt(1, pedidoId);
                    psDetalle.setInt(2, florId);
                    psDetalle.setInt(3, cantidad);
                    psDetalle.setDouble(4, precio);
                    psDetalle.executeUpdate();
                }

                // 4. Eliminar los productos del carrito
                psEliminarCarrito = cnx.prepareStatement(sqlEliminarCarrito);
                psEliminarCarrito.setInt(1, userId);
                psEliminarCarrito.executeUpdate();

                // Confirmar transacción
                cnx.commit();
                resultado = true;
            }

        } catch (SQLException ex) {
            try {
                cnx.rollback();  // Revertir la transacción en caso de error
            } catch (SQLException e) {
                e.printStackTrace();
            }
            ex.printStackTrace();
        } finally {
            try {
                if (rsPedidoId != null) {
                    rsPedidoId.close();
                }
                if (psPago != null) {
                    psPago.close();
                }
                if (psPedido != null) {
                    psPedido.close();
                }
                if (psDetalle != null) {
                    psDetalle.close();
                }
                if (psEliminarCarrito != null) {
                    psEliminarCarrito.close();
                }
                cnx.setAutoCommit(true);  // Restaurar el auto-commit
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return resultado;
    }

    // Método para actualizar un pago existente
    public boolean actualizar(Pago pago) {
        PreparedStatement ps = null;
        String sql = "UPDATE pago SET nombre_completo = ?, correo = ?, telefono = ?, direccion_envio = ?, ciudad = ?, estado = ?, codigo_postal = ?, numero_tarjeta = ?, fecha_expiracion = ?, cvv = ?, monto_total = ? WHERE pago_id = ?";
        try {
            ps = cnx.prepareStatement(sql);
            ps.setString(1, pago.getNombreCompleto());
            ps.setString(2, pago.getCorreo());
            ps.setString(3, pago.getTelefono());
            ps.setString(4, pago.getDireccionEnvio());
            ps.setString(5, pago.getCiudad());
            ps.setString(6, pago.getEstado());
            ps.setString(7, pago.getCodigoPostal());
            ps.setString(8, pago.getNumeroTarjeta());
            ps.setString(9, pago.getFechaExpiracion());
            ps.setString(10, pago.getCvv());
            ps.setDouble(11, pago.getMontoTotal());
            ps.setInt(12, pago.getPagoId());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    // Método para eliminar un pago por ID
    public boolean eliminar(int id) {
        PreparedStatement ps = null;
        String sql = "DELETE FROM pago WHERE pago_id = ?";
        try {
            ps = cnx.prepareStatement(sql);
            ps.setInt(1, id);

            int rowsDeleted = ps.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
