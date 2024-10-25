<%-- 
    Document   : register
    Created on : 26 ago 2024, 20:34:55
    Author     : Joaquin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>El y Ella Detalles</title>
    <link rel="stylesheet" href="style.css">
    <link rel="icon" href="img/el y ella logo.jpeg">
</head>
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
        background: rgba(255, 105, 180, 0.5); /* Sombreado rosa con opacidad */
        z-index: -1;
    }

    .contenedor-login {
        display: flex;
        max-width: 800px;
        width: 100%;
        background-color: #ccc;
        border-radius: 1rem;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        position: relative;
        overflow: hidden;
        z-index: 1; /* Asegura que el contenedor de login esté por encima del sombreado */
    }

    .cuadro-info {
        background-color: #eb35d2;
        color: #fff;
        padding: 3rem;
        border-radius: 1rem 0 0 1rem;
        width: 50%;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .cuadro-info h2 {
        font-size: 2.4rem;
        margin-bottom: 1rem;
    }

    .cuadro-info p {
        font-size: 1.6rem;
        margin-bottom: 2rem;
    }

    .btn-registro {
        background-color: transparent;
        color: #fff;
        border: 2px solid #fff;
        padding: 0.8rem 2rem;
        border-radius: 0.5rem;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .btn-registro:hover {
        background-color: #fff;
        color: #333;
    }

    .cuadro-login {
        background-color: #fff;
        padding: 3rem;
        border-radius: 0 1rem 1rem 0;
        width: 50%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        position: relative;
    }

    .cuadro-login h2 {
        color: var(--primary-color);
        margin-bottom: 2rem;
        font-weight: 600;
        text-align: center;
    }

    .grupo-input {
        margin-bottom: 2rem;
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
    }

    .grupo-input input:focus {
        border-color: var(--primary-color);
        outline: none;
    }

    .btn-login {
        width: 100%;
        padding: 1rem;
        background-color: var(--primary-color);
        color: #fff;
        border: none;
        border-radius: 0.5rem;
        cursor: pointer;
        font-size: 1.6rem;
        text-transform: uppercase;
        transition: background-color 0.3s ease;
    }

    .btn-login:hover {
        background-color: #e055a2;
    }

    .olvidar-contrasena {
        text-align: center;
        margin-top: 1.5rem;
        font-size: 1.4rem;
        color: #333;
        cursor: pointer;
    }
</style>
<body>
    <div class="body-overlay"></div>
    <div class="contenedor-login">
        <div class="cuadro-info">
            <h2>¿No tienes una cuenta?</h2>
            <p>¡Regístrate para acceder a ofertas exclusivas y descuentos!</p>
            <button class="btn-registro"onclick="window.location.href='register.jsp'">Regístrate</button>
        </div>
        <div class="cuadro-login">
            <h2>Iniciar sesión</h2>
            <form>
                <div class="grupo-input">
                    <label for="correo">Correo Electrónico</label>
                    <input type="email" id="correo" placeholder="Ingresa tu correo">
                </div>
                <div class="grupo-input">
                    <label for="contrasena">Contraseña</label>
                    <input type="password" id="contrasena" placeholder="Ingresa tu contraseña">
                </div>
                <button type="submit" class="btn-login" id="btn-login"><h5>Iniciar sesión</h5></button>
                <p class="olvidar-contrasena">¿Olvidaste tu contraseña?</p>
            </form>
        </div>
    </div>
    <script src="https://kit.fontawesome.com/74353e97ea.js" crossorigin="anonymous"></script>
    <script>
        document.querySelector('form').addEventListener('submit', function(event) {
            event.preventDefault(); // Previene el envío del formulario
            window.location.href = 'index.jsp'; // Redirige a la página deseada
        });
    </script>
</body>
</html>
