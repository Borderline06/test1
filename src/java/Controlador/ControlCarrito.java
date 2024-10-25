/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.dao.CarritoDAO;
import Modelo.dto.Carrito;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ControlCarrito") // Asegúrate de que esta URL coincide con tu llamada
public class ControlCarrito extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response); // Redirigir a doPost para manejar la acción de manera uniforme
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    HttpSession session = request.getSession();
    Integer userId = (Integer) session.getAttribute("user_id");

    // Verifica si el usuario está autenticado
    if (userId == null) {
        response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "No estás autorizado.");
        return;
    }

    String action = request.getParameter("action");
    
    // Depuración de la acción recibida
    System.out.println("Acción recibida: " + action);
    
    if ("agregar".equals(action)) {
        String florIdParam = request.getParameter("id_flor");
        String cantidadParam = request.getParameter("cantidad");
        String precioParam = request.getParameter("precio");

        // Mensajes de depuración para verificar los valores recibidos
        System.out.println("Flor ID recibido: " + florIdParam);  // Verifica el valor de florId
        System.out.println("Cantidad recibida: " + cantidadParam);  // Verifica el valor de cantidad
        System.out.println("Precio recibido: " + precioParam);  // Verifica el valor de precio

        // Validación de parámetros
        if (florIdParam != null && !florIdParam.isEmpty() &&
            cantidadParam != null && !cantidadParam.isEmpty() &&
            precioParam != null && !precioParam.isEmpty()) {
            
            try {
                // Mensajes antes de convertir los parámetros
                System.out.println("Convirtiendo parámetros...");
                int florId = Integer.parseInt(florIdParam);
                int cantidad = Integer.parseInt(cantidadParam);
                double precio = Double.parseDouble(precioParam);

                // Mensajes después de la conversión
                System.out.println("Flor ID: " + florId);
                System.out.println("Cantidad: " + cantidad);
                System.out.println("Precio: " + precio);

                // Crea un objeto Carrito y lo guarda en la base de datos
                Carrito carrito = new Carrito();
                carrito.setUserId(userId);  // Usar el user_id de la sesión
                carrito.setFlorId(florId);
                carrito.setCantidad(cantidad);
                carrito.setPrecio(precio);  // Asigna el precio al objeto carrito

                CarritoDAO carritoDAO = new CarritoDAO();
                boolean agregado = carritoDAO.save(carrito);

                if (agregado) {
                    // Redirige a la página del carrito
                    response.sendRedirect(request.getContextPath() + "/Vista/carshop.jsp");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo agregar el producto al carrito.");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                System.out.println("Error en la conversión de parámetros.");  // Mensaje de depuración en caso de error de conversión
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parámetros no válidos.");
            }
        } else {
            System.out.println("Faltan parámetros necesarios.");  // Depuración cuando faltan parámetros
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Faltan parámetros necesarios.");
        }
    }
}




}
