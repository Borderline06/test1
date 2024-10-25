<%-- 
    Document   : editarFlores
    Created on : 20 sept 2024, 17:51:35
    Author     : Joaquin
--%>

<%@page import="Modelo.dto.Flores"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    Flores flor = (Flores) request.getAttribute("flor");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Editar Flor</title>
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
                padding: 2rem; /* Ajustado para coincidir con agregarFlores.jsp */
                border-radius: 1rem;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                z-index: 1;
                width: 100%;
                max-width: 350px; /* Ajustado para coincidir con agregarFlores.jsp */
            }

            h2 {
                color: #f082e2;
                text-align: center;
                margin-bottom: 1.5rem;
                font-size: 1.8rem; /* Ajustado para coincidir con agregarFlores.jsp */
            }

            .grupo-input {
                margin-bottom: 1.5rem; /* Ajustado para coincidir con agregarFlores.jsp */
                display: flex;
                flex-direction: column;
                align-items: stretch;
            }

            .grupo-input label {
                display: block;
                margin-bottom: 0.5rem;
                color: #333;
                font-size: 1.2rem;
            }

            .grupo-input input {
                width: 100%;
                padding: 0.8rem;
                border: 1px solid #ddd;
                border-radius: 0.5rem;
                font-size: 1.2rem;
                box-sizing: border-box;
            }

            .grupo-input input:focus {
                border-color: #d5006d;
                outline: none;
            }

            .btn-submit {
                width: 100%;
                padding: 0.8rem;
                background-color: #f082e2;
                color: #fff;
                border: none;
                border-radius: 0.5rem;
                cursor: pointer;
                font-size: 1.4rem;
                text-transform: uppercase;
                transition: background-color 0.3s ease;
            }

            .btn-submit:hover {
                background-color: #c51162;
            }
        </style>
    </head>
    <body>
        <div class="body-overlay"></div>
        <div class="form-container">
            <h2>Editar Flor</h2>
            <form action="<%= request.getContextPath()%>/MainControler" method="post">
                <input type="hidden" name="action" value="actualizarFlor">
                <input type="hidden" name="id" value="<%= flor.getFlorId()%>">

                <div class="grupo-input">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" value="<%= flor.getNombre()%>" required>
                </div>

                <div class="grupo-input">
                    <label for="descripcion">Descripción:</label>
                    <input type="text" id="descripcion" name="descripcion" value="<%= flor.getDescripcion()%>" required>
                </div>

                <div class="grupo-input">
                    <label for="precio">Precio:</label>
                    <input type="text" id="precio" name="precio" value="<%= flor.getPrecio()%>" required>
                </div>

                <div class="grupo-input">
                    <label for="stock">Stock:</label>
                    <input type="text" id="stock" name="stock" value="<%= flor.getStock()%>" required>
                </div>

                <div class="grupo-input">
                    <label for="imagen_url">Subir Imagen:</label>
                    <input type="file" id="imagen_url" name="imagen_url" value="<%= flor.getImagenUrl()%>" required>
                </div>

                <input type="submit" value="Editar" class="btn-submit">
            </form>
        </div>
    </body>
</html>


