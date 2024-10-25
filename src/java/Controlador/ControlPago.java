/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

/**
 *
 * @author Joaquin
 */
import Modelo.dao.PagoDAO;
import Modelo.dto.Pago;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ControlPago")
public class ControlPago extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Double montoTotal = (Double) session.getAttribute("montoTotal");
        Integer userId = (Integer) session.getAttribute("user_id");

        if (montoTotal == null || userId == null) {
            response.sendRedirect("error.jsp");
            return;
        }

        // Obtener los datos del formulario
        String nombreCompleto = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");
        String direccionEnvio = request.getParameter("direccion");
        String ciudad = request.getParameter("ciudad");
        String estado = request.getParameter("estado");
        String codigoPostal = request.getParameter("codigo-postal");
        String numeroTarjeta = request.getParameter("tarjeta");
        String fechaExpiracion = request.getParameter("fecha-expiracion");
        String cvv = request.getParameter("cvv");

        if (nombreCompleto.isEmpty() || correo.isEmpty() || telefono.isEmpty()
                || direccionEnvio.isEmpty() || ciudad.isEmpty() || estado.isEmpty()
                || codigoPostal.isEmpty() || numeroTarjeta.isEmpty()
                || fechaExpiracion.isEmpty() || cvv.isEmpty()) {
            response.sendRedirect("error.jsp");
            return;
        }

        // Crear objeto Pago
        Pago pago = new Pago(0, userId, nombreCompleto, correo, telefono, direccionEnvio, ciudad, estado, codigoPostal, numeroTarjeta, fechaExpiracion, cvv, montoTotal);

        // Procesar pago y pedido en una única transacción
        PagoDAO pagoDAO = new PagoDAO();
        boolean exito = pagoDAO.procesarPagoYPedido(pago, userId, montoTotal);

        if (exito) {
            // Redirigir a la página de éxito
            response.sendRedirect(request.getContextPath() + "/Vista/Pedidos.jsp");
        } else {
            response.sendRedirect("errorPago.jsp");
        }
    }
}
