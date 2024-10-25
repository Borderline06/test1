<%-- 
    Document   : editarUsuario
    Created on : 20 sept 2024, 16:56:55
    Author     : Joaquin
--%>

<%@page import="Modelo.dto.Register"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    Register usuario = (Register) request.getAttribute("usuario");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Editar Usuario</title>
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                margin: 0;
                height: 100vh;
                background: url('img/banner_log.jpg') no-repeat center center fixed;
                background-size: cover;
                display: flex;
                justify-content: center;
                align-items: center;
                position: relative;
            }

            .body-overlay {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(255, 105, 180, 0.5);
                z-index: -1;
            }

            .form-container {
                display: flex;
                flex-direction: column;
                background-color: #fff;
                padding: 3rem;
                border-radius: 1rem;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                z-index: 1;
                width: 100%;
                max-width: 400px;
            }

            h2 {
                color: #f082e2; /* Nuevo color rosa para el texto */
                text-align: center;
                margin-bottom: 2rem;
            }

            .grupo-input {
                margin-bottom: 2rem;
                display: flex; /* Cambiado a flex */
                flex-direction: column; /* Alinear verticalmente */
                align-items: stretch; /* Alinear los inputs al 100% */
            }

            .grupo-input label {
                display: block;
                margin-bottom: 0.5rem;
                color: #333;
                font-size: 1.4rem;
            }

            .grupo-input input {
                width: 100%;
                padding: 1rem;
                border: 1px solid #ddd;
                border-radius: 0.5rem;
                font-size: 1.4rem;
                box-sizing: border-box; /* Asegurar que el padding no afecte el tamaño total */
            }

            .grupo-input input:focus {
                border-color: #d5006d; /* Nuevo color rosa para el enfoque */
                outline: none;
            }

            .btn-submit {
                width: 100%;
                padding: 1rem;
                background-color: #f082e2; /* Nuevo color rosa para el botón */
                color: #fff;
                border: none;
                border-radius: 0.5rem;
                cursor: pointer;
                font-size: 1.6rem;
                text-transform: uppercase;
                transition: background-color 0.3s ease;
            }

            .btn-submit:hover {
                background-color: #c51162; /* Rosa más oscuro */
            }
        </style>
    </head>
    <body>
        <div class="body-overlay"></div>
        <div class="form-container">
            <h2>Editar Usuario</h2>
            <form action="<%= request.getContextPath()%>/MainControler" method="post">
                <input type="hidden" name="action" value="actualizarUsuario">
                <input type="hidden" name="id" value="<%= usuario.getUserId()%>">

                <div class="grupo-input">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" value="<%= usuario.getNombre()%>" required>
                </div>

                <div class="grupo-input">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="<%= usuario.getEmail()%>" required>
                </div>

                <div class="grupo-input">
                    <label for="direccion">Dirección:</label>
                    <input type="text" id="direccion" name="direccion" value="<%= usuario.getDireccion()%>" required>
                </div>

                <div class="grupo-input">
                    <label for="telefono">Teléfono:</label>
                    <input type="text" id="telefono" name="telefono" value="<%= usuario.getTelefono()%>" required>
                </div>
                
                  <div class="grupo-input">
                <label for="contrasena">Contraseña:</label>
                <input type="password" id="contrasena" name="contrasena" value="<%= usuario.getContrasena()%>" required>
                <small>(Dejar vacío si no desea cambiarla)</small>
            </div>

                <input type="submit" value="Editar" class="btn-submit">
            </form>
        </div>
    </body>
</html>

