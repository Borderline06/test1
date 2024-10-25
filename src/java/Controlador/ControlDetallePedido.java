/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

/**
 *
 * @author Joaquin
 */
import Modelo.dao.Detalle_PedidoDAO;
import Modelo.dto.Detalle_Pedido;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ControlDetallePedido", urlPatterns = {"/ControlDetallePedido"})
public class ControlDetallePedido extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pedidoIdStr = request.getParameter("pedidoId");
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        if (pedidoIdStr != null && userId != null) {
            try {
                int pedidoId = Integer.parseInt(pedidoIdStr);

                Detalle_PedidoDAO detallePedidoDAO = new Detalle_PedidoDAO();
                List<Detalle_Pedido> listaDetalles = detallePedidoDAO.getDetallePedidosByPedidoId(pedidoId, userId);

                // Verificar si se encontró al menos un detalle
                if (!listaDetalles.isEmpty()) {
                    request.setAttribute("listaDetalles", listaDetalles);
                } else {
                    request.setAttribute("mensajeError", "No se encontraron detalles para este pedido.");
                }

                request.getRequestDispatcher("/Vista/DetallesDePedidos/DetallePedidoRosa.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("AfterLogin.jsp");
            }
        } else {
            response.sendRedirect("AfterLogin.jsp");
        }
    }
}


    

