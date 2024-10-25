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

@WebServlet("/ControlRegister")
public class ControlRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recibe los datos del formulario
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");

        // Crea un nuevo objeto Register con los datos recibidos
        Register nuevoUsuario = new Register();
        nuevoUsuario.setNombre(nombre);
        nuevoUsuario.setEmail(email);
        nuevoUsuario.setContrasena(contrasena);
        nuevoUsuario.setDireccion(direccion);
        nuevoUsuario.setTelefono(telefono);

        // Usa el DAO para guardar el nuevo usuario en la base de datos
        RegisterDAO dao = new RegisterDAO();
        boolean registrado = dao.save(nuevoUsuario); // Asegúrate de tener el método save() en RegisterDAO

        // Redirige a la página correspondiente dependiendo del resultado
        if (registrado) {
            // Si el registro es exitoso, redirige a una página de éxito
            response.sendRedirect(request.getContextPath() + "/Vista/login.jsp");
        } else {
            // Si falla, redirige a una página de error
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Vista/register.jsp");
            dispatcher.forward(request, response);
        }
    }
}

