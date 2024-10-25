<%-- 
    Document   : editarComents
    Created on : 22 sept 2024, 13:48:57
    Author     : Joaquin
--%>

<%@page import="Modelo.dto.Comentarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Comentarios comentario = (Comentarios) request.getAttribute("comentario");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Editar Comentario</title>
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
                color: #f082e2;
                text-align: center;
                margin-bottom: 2rem;
            }

            .grupo-input {
                margin-bottom: 2rem;
                display: flex;
                flex-direction: column;
                align-items: stretch;
            }

            .grupo-input label {
                display: block;
                margin-bottom: 0.5rem;
                color: #333;
                font-size: 1.4rem;
            }

            .grupo-input input, .grupo-input textarea {
                width: 100%;
                padding: 1rem;
                border: 1px solid #ddd;
                border-radius: 0.5rem;
                font-size: 1.4rem;
                box-sizing: border-box;
            }

            .grupo-input input:focus, .grupo-input textarea:focus {
                border-color: #d5006d;
                outline: none;
            }

            .btn-submit {
                width: 100%;
                padding: 1rem;
                background-color: #f082e2;
                color: #fff;
                border: none;
                border-radius: 0.5rem;
                cursor: pointer;
                font-size: 1.6rem;
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
            <h2>Editar Comentario</h2>
            <form action="<%= request.getContextPath()%>/MainControler" method="post">
                <input type="hidden" name="action" value="actualizarComentario">
                <input type="hidden" name="id" value="<%= comentario.getComentarioId()%>" />

                <div class="grupo-input">
                    <label for="flor_id">ID Flor:</label>
                    <input type="text" id="flor_id" name="flor_id" value="<%= comentario.getFlorId()%>" required />
                </div>

                <div class="grupo-input">
                    <label for="user_id">ID Usuario:</label>
                    <input type="text" id="user_id" name="user_id" value="<%= comentario.getUserId()%>" required />
                </div>

                <div class="grupo-input">
                    <label for="comentario">Comentario:</label>
                    <textarea id="comentario" name="comentario" required><%= comentario.getComentario()%></textarea>
                </div>

                <div class="grupo-input">
                    <label for="calificacion">Calificación:</label>
                    <input type="number" id="calificacion" name="calificacion" value="<%= comentario.getCalificacion()%>" required />
                </div>

                <input type="submit" value="Actualizar Comentario" class="btn-submit">
            </form>
        </div>
    </body>
</html>

