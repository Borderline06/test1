<%-- 
    Document   : agregarFlores
    Created on : 20 sept 2024, 18:24:29
    Author     : Joaquin
--%>

<%@page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Flor</title>

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
            padding: 2rem; /* Reducir el padding */
            border-radius: 1rem;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            z-index: 1;
            width: 100%;
            max-width: 350px; /* Reducir el ancho máximo */
        }

        h2 {
            color: #f082e2; /* Nuevo color rosa para el texto */
            text-align: center;
            margin-bottom: 1.5rem; /* Reducir el margen */
            font-size: 1.8rem; /* Reducir el tamaño de la fuente */
        }

        .grupo-input {
            margin-bottom: 1.5rem; /* Reducir el margen */
            display: flex;
            flex-direction: column;
            align-items: stretch;
        }

        .grupo-input label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;
            font-size: 1.2rem; /* Reducir el tamaño de la fuente */
        }

        .grupo-input input,
        .grupo-input textarea {
            width: 100%;
            padding: 0.8rem; /* Reducir el padding */
            border: 1px solid #ddd;
            border-radius: 0.5rem;
            font-size: 1.2rem; /* Reducir el tamaño de la fuente */
            box-sizing: border-box;
        }

        .grupo-input input:focus,
        .grupo-input textarea:focus {
            border-color: #d5006d; /* Nuevo color rosa para el enfoque */
            outline: none;
        }

        .btn-submit {
            width: 100%;
            padding: 0.8rem; /* Reducir el padding */
            background-color: #f082e2; /* Nuevo color rosa para el botón */
            color: #fff;
            border: none;
            border-radius: 0.5rem;
            cursor: pointer;
            font-size: 1.4rem; /* Reducir el tamaño de la fuente */
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
        <h2>Agregar Flor</h2>
        <form action="<%= request.getContextPath()%>/MainControler" method="post">
            <input type="hidden" name="action" value="agregarFlor">

            <div class="grupo-input">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>
            </div>

            <div class="grupo-input">
                <label for="descripcion">Descripción:</label>
                <textarea id="descripcion" name="descripcion" required></textarea>
            </div>

            <div class="grupo-input">
                <label for="precio">Precio:</label>
                <input type="number" id="precio" name="precio" step="0.01" required>
            </div>

            <div class="grupo-input">
                <label for="stock">Stock:</label>
                <input type="number" id="stock" name="stock" required>
            </div>

            <div class="grupo-input">
                <label for="imagen_url">Imagen (sube desde tu dispositivo):</label>
                <input type="file" id="imagen_url" name="imagen_url" accept="image/*" required>
            </div>

            <input type="submit" value="Agregar" class="btn-submit">
        </form>
    </div>
</body>
</html>


