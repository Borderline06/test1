<%-- 
    Document   : register
    Created on : 26 ago 2024, 20:34:55
    Author     : Joaquin
--%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro</title>
        <link rel="stylesheet" href="../style.css">
        <link rel="icon" href="../img/el y ella logo.jpeg">
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                margin: 0;
                height: 100vh;
                background: url('../img/banner_log.jpg') no-repeat center center fixed;
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

            .btn-register {
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

            .btn-register:hover {
                background-color: #e055a2;
            }

            .login-link {
                text-align: center;
                margin-top: 1.5rem;
                font-size: 1.4rem;
                color: #333;
                cursor: pointer;
            }

            .contenedor-registro {
                display: flex;
                max-width: 800px;
                width: 100%;
                background-color: #ccc;
                border-radius: 1rem;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                position: relative;
                overflow: hidden;
                z-index: 1;
                /* Ajustar disposición */
                flex-direction: row-reverse; /* Mueve el cuadro de información a la derecha */
            }

            .cuadro-registro {
                background-color: #fff;
                padding: 2rem;
                border-radius: 1rem;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                width: 100%;
            }

            .cuadro-registro h2 {
                text-align: center;
                margin-bottom: 2rem;
            }

            .cuadro-info {
                background-color: #eb35d2;
                color: #fff;
                padding: 3rem;
                border-radius: 0 1rem 1rem 0;
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
        </style>
    </head>
    <body>
        <div class="body-overlay"></div>
        <div class="contenedor-registro">
            <div class="cuadro-info">
                <h2>¡Bienvenido al Registro!</h2>
                <p>Regístrate para ser parte de nuestra comunidad y disfrutar de ofertas exclusivas. Mantente actualizado con nuestras últimas novedades en arreglos florales y más.</p>
            </div>
            <div class="cuadro-registro">
                <h2>Registro</h2>
                <form action="${pageContext.request.contextPath}/ControlRegister" method="post">
                    <div class="grupo-input">
                        <label for="nombre">Nombre Completo</label>
                        <input type="text" id="nombre" name="nombre" placeholder="Ingresa tu nombre completo" required>
                    </div>
                    <div class="grupo-input">
                        <label for="email">Correo Electrónico</label>
                        <input type="email" id="email" name="email" placeholder="Ingresa tu correo electrónico" required>
                    </div>
                    <div class="grupo-input">
                        <label for="contrasena">Contraseña</label>
                        <input type="password" id="contrasena" name="contrasena" placeholder="Ingresa tu contraseña" required>
                    </div>
                    <div class="grupo-input">
                        <label for="direccion">Dirección</label>
                        <input type="text" id="direccion" name="direccion" placeholder="Ingresa tu dirección">
                    </div>
                    <div class="grupo-input">
                        <label for="telefono">Teléfono</label>
                        <input type="text" id="telefono" name="telefono" placeholder="Ingresa tu teléfono">
                    </div>
                    <button type="submit" class="btn-register" id="btn-register">Registrarse</button>
                    <p class="login-link">¿Ya tienes una cuenta? <a href="login.jsp">Inicia sesión</a></p>
                </form>
            </div>
        </div>
    </body>
</html>

