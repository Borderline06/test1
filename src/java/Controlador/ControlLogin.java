/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.dao.RegisterDAO;
import Modelo.dto.Register;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ControlLogin")

public class ControlLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Recibir parámetros del formulario
        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");

        // Usar el DAO para verificar el login
        RegisterDAO dao = new RegisterDAO();
        Register usuario = dao.login(email, contrasena);

// Verificar si las credenciales son correctas
        if (usuario != null) {
            // Guardar el user_id, email y teléfono en la sesión
            HttpSession session = request.getSession();
            // Guardar más atributos del usuario en la sesión
            session.setAttribute("user_id", usuario.getUserId());
            session.setAttribute("nombre", usuario.getNombre());
            session.setAttribute("email", usuario.getEmail());
            session.setAttribute("telefono", usuario.getTelefono());
            session.setAttribute("direccion", usuario.getDireccion());

            // Si el usuario tiene el ID 1, redirigir a Administrar.jsp
            if (usuario.getUserId() == 1) {
                response.sendRedirect(request.getContextPath() + "/Vista/Administrar.jsp");
            } else {
                // Si el login es exitoso pero no tiene ID 1, redirigir a AfterLogin.jsp
                response.sendRedirect(request.getContextPath() + "/Vista/AfterLogin.jsp");
            }
        } else {
            // Si falla, redirige de nuevo a login.jsp con un mensaje de error
            request.setAttribute("errorMessage", "Correo o contraseña incorrectos");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Vista/login.jsp");
            dispatcher.forward(request, response);
        }
    }
}
