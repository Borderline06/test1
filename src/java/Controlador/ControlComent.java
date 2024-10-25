/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.dao.ComentariosDAO;
import Modelo.dto.Comentarios;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ControlComent") // Asegúrate de que esta URL coincide con tu llamada
public class ControlComent extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recibir los datos del formulario
        String comentarioTexto = request.getParameter("comentario");
        int calificacion = Integer.parseInt(request.getParameter("calificacion"));

        // Obtener el flor_id (puedes obtenerlo a partir de la URL o desde la sesión)
        int florId = Integer.parseInt(request.getParameter("flor_id")); // Asegúrate de pasar este valor desde el formulario o la URL
        
        // Obtener el user_id de la sesión (asumimos que está guardado cuando el usuario inicia sesión)
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        // Verificar si se pudo obtener el usuario de la sesión
        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/Vista/login.jsp");
            return; // Salir si no hay un usuario logueado
        }

        // Crear un nuevo objeto Comentarios con los datos recibidos
        Comentarios nuevoComentario = new Comentarios();
        nuevoComentario.setFlorId(florId);
        nuevoComentario.setUserId(userId);
        nuevoComentario.setComentario(comentarioTexto);
        nuevoComentario.setCalificacion(calificacion);

        // Usar el DAO para guardar el nuevo comentario en la base de datos
        ComentariosDAO dao = new ComentariosDAO();
        boolean comentarioGuardado = dao.save(nuevoComentario); // Asegúrate de tener el método save() en ComentariosDAO

        // Redirigir a la página correspondiente dependiendo del resultado
        if (comentarioGuardado) {
            // Si el comentario se guarda correctamente, redirige a una página de éxito
            response.sendRedirect(request.getContextPath() + "/Vista/DetallesDeProduc/detalle_Produc_Gira.jsp");
        } else {
            // Si falla, redirige a una página de error
            response.sendRedirect(request.getContextPath() + "/Vista/error.jsp");
        }
    }
}

