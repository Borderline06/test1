<%-- 
    Document   : DetallePedidoRosa
    Created on : 23 sept 2024, 13:51:51
    Author     : Joaquin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detalle del Pedido</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            body {
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
            }

            .container-layout {
                display: flex;
            }

            .sidebar {
                background-color: #ffffff;
                padding: 20px;
                height: auto; /* Ajustamos la altura al contenido para que no toque el footer */
                border-right: 1px solid #e0e0e0;
                width: 200px;
                position: sticky; /* Sidebar pegajoso */
                top: 20px; /* No toca el header */
                align-self: flex-start; /* Alinea el sidebar al inicio */
                margin-left: 40px; /* Agrega un margen a la izquierda */
                border-radius: 10px; /* Bordes redondeados */
                min-height: 600px;


            }

            .sidebar a {
                display: block;
                padding: 10px;
                color: #333;
                text-decoration: none;
            }

            .sidebar a:hover {
                background-color: #e055a2;
                color: #fff;
            }

            .main-content {
                margin-left: 170x; /* Espacio para el sidebar */
                padding: 20px;
                flex-grow: 1; /* Permite que el contenido principal crezca */
                border-radius: 10px; /* Bordes redondeados */

            }

            .main-header {
                background-color: #ffffff;
                padding: 15px;
                margin-bottom: 20px;
                border-bottom: 1px solid #e0e0e0;
                display: flex;
                justify-content: space-between;
            }

            .main-header h2 {
                color: #333;
            }

            .order-info {
                background-color: #ffffff;
                padding: 20px;
                margin-bottom: 20px;
                border: 1px solid #e0e0e0;
                border-radius: 10px; /* Bordes redondeados */

            }

            .order-info h3 {
                color: #e055a2;
            }

            .order-details {
                margin-top: 20px;
            }

            .order-details table {
                width: 100%;
            }

            .order-details table th, .order-details table td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #e0e0e0;
            }

            .order-actions {
                text-align: right;
                margin-top: 20px;
            }

            .btn-custom {
                background-color: #e055a2;
                color: #fff;
            }

            footer {
                background-color: #fff;
                border-top: 1px solid #e0e0e0;
                padding: 20px;
            }

            .order-info-container {
                display: flex; /* Alinea horizontalmente los contenedores */
                justify-content: space-between; /* Distribuye los contenedores con espacio entre ellos */
                gap: 20px; /* Añade espacio entre los contenedores */
                margin-bottom: 20px; /* Espacio inferior para separación */
            }

            .order-info {
                flex: 1; /* Ocupa el espacio restante */
                background-color: #ffffff;
                padding: 40px;
                border: 1px solid #e0e0e0;
                border-radius: 10px;
                min-height: 300px; /* Ajusta según sea necesario */


            }

            .order-image-container {
                background-color: #ffffff;
                padding: 20px;
                border: 1px solid #e0e0e0;
                border-radius: 10px; /* Bordes redondeados */
                flex-basis: 30%; /* Ajusta este valor para hacer más pequeño el contenedor */
                max-width: 300px; /* O establece un ancho máximo */
            }


            .image-box {
                text-align: center; /* Centra la imagen */
            }

            .image-box img {
                width: 100%; /* Cambia el porcentaje para ajustar el tamaño (por ejemplo, 80%) */
                height: auto; /* Mantiene la proporción de la imagen */
                border-radius: 10px; /* Bordes redondeados */
            }
            .order-details p {
                margin: 10px 0; /* Espaciado vertical entre párrafos */
                line-height: 1.6; /* Mejora la legibilidad */
            }





        </style>
    </head>
    <body>

        <!-- Header -->
        <header>
            <div class="container-hero">
                <div class="container hero">
                    <div class="customer-support">
                        <i class="fa-solid fa-headset"></i>
                        <div class="content-customer-support">
                            <span class="text">Soporte al cliente</span>
                            <span class="number">+51 994 802 601</span>
                        </div>
                    </div>

                    <div class="container-logo">
                        <i class="fa-regular fa-flower-tulip"></i>
                        <h1 class="logo"><a href="/">El y Ella Detalles</a></h1>
                    </div>

                    <div class="container-user">
                        <a href="../User.jsp"><i class="fa-solid fa-user"></i></a>
                        <a href="carshop.jsp"><i class="fa-solid fa-basket-shopping"></i></a>
                        <div class="content-shopping-cart">
                            <span class="text">Carrito</span>
                            <span class="number">(0)</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-navbar">
                <nav class="navbar container">
                    <i class="fa-solid fa-bars"></i>
                    <ul class="menu">
                        <li><a href="../AfterLogin.jsp">Inicio</a></li>
                        <li><a href="Box Rosas.jsp">Rosas</a></li>
                        <li><a href="Box Girasoles.jsp">Girasoles</a></li>
                        <li><a href="Box Tulipanes.jsp">Tulipanes</a></li>
                        <li><a href="#">Más</a></li>
                        <li><a href="#">Blog</a></li>
                    </ul>

                    <form class="search-form">
                        <input type="search" placeholder="Buscar..." />
                        <button class="btn-search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </form>
                </nav>
            </div>
        </header>

        <br>

        <div class="container-layout">
            <div class="sidebar">
                <h3>Mi Cuenta</h3>
                <a href="#">General</a>
                <a href="#">Pedidos</a>
                <a href="#">Pago</a>
                <a href="#">Reembolsos y devoluciones</a>
                <a href="#">Valoraciones</a>
                <a href="#">Ajustes</a>
                <a href="#">Dirección de envío</a>
                <a href="#">Centro de mensajes</a>
                <a href="#">Centro de ayuda</a>
            </div>

             <div class="main-content">
            <div class="main-header">
                <h2>Detalle del Pedido</h2>
                <div>
                    <button class="btn btn-custom">Volver a comprar</button>
                    <button class="btn btn-outline-secondary">Rastrear pedido</button>
                </div>
            </div>
            
            <div class="order-info-container">
                <!-- Información del Pedido -->
                <div class="order-info">
                    <c:if test="${not empty listaDetalles}">
                        <h3>Pedido Finalizado</h3>
                        
                        <!-- Detalles generales del pedido -->
                        <c:set var="detalle" value="${listaDetalles[0]}" />
                        <p>Solicitud terminada. <strong>Pedido nº ${detalle.pedidoId}</strong></p>
                        <p>Pedido efectuado el: ${detalle.pedido.fechaPedido}</p>
                        <p>Método de pago: Tarjeta de crédito/débito</p>

                        <!-- Dirección de Envío -->
                        <div class="shipping-info">
                            <h4>Dirección de Envío</h4>
                            <p><strong>Nombre:</strong> Cliente</p>
                            <p><strong>Dirección:</strong> ${detalle.pago.direccionEnvio}</p>
                            <p><strong>Teléfono:</strong> ${detalle.pago.telefono}</p>
                        </div>

                        <!-- Detalles de productos -->
                        <div class="order-details">
                            <h4>Detalles del Pedido</h4>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Producto</th>
                                        <th>Cantidad</th>
                                        <th>Precio</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="detalle" items="${listaDetalles}">
                                        <tr>
                                            <td>Producto ID: ${detalle.florId}</td>
                                            <td>${detalle.cantidad}</td>
                                            <td>PEN ${detalle.precio}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>

                    <c:if test="${empty listaDetalles}">
                        <p style="color: red;">No se encontraron detalles para este pedido.</p>
                    </c:if>
                </div>

                <!-- Contenedor de la imagen -->
                <div class="order-image-container">
                    <!-- Imagen del producto -->
                </div>
            </div>

            <div class="order-actions">
                <button class="btn btn-custom">Volver a comprar</button>
                <button class="btn btn-outline-secondary">Ver solicitud</button>
                <button class="btn btn-outline-secondary">Información sobre el reembolso</button>
            </div>
        </div>
    </div>

        <footer class="footer">
            <div class="container container-footer">
                <div class="menu-footer">
                    <div class="contact-info">
                        <p class="title-footer">Información de Contacto</p>
                        <ul>
                            <li>
                                Dirección: 71 Pennington Lane Vernon Rockville, CT
                                06066
                            </li>
                            <li>Teléfono: +51 994 802 601</li>
                            <li>Fax: 55555300</li>
                            <li>EmaiL: baristas@support.com</li>
                        </ul>
                        <div class="social-icons">
                            <span class="facebook">
                                <i class="fa-brands fa-facebook-f"></i>
                            </span>
                            <span class="twitter">
                                <i class="fa-brands fa-twitter"></i>
                            </span>
                            <span class="youtube">
                                <i class="fa-brands fa-youtube"></i>
                            </span>
                            <span class="pinterest">
                                <i class="fa-brands fa-pinterest-p"></i>
                            </span>
                            <span class="instagram">
                                <i class="fa-brands fa-instagram"></i>
                            </span>
                        </div>
                    </div>

                    <div class="information">
                        <p class="title-footer">Información</p>
                        <ul>
                            <li><a href="#">Acerca de Nosotros</a></li>
                            <li><a href="#">Información Delivery</a></li>
                            <li><a href="#">Politicas de Privacidad</a></li>
                            <li><a href="#">Términos y condiciones</a></li>
                            <li><a href="#">Contactános</a></li>
                        </ul>
                    </div>

                    <div class="my-account">
                        <p class="title-footer">Mi cuenta</p>

                        <ul>
                            <li><a href="#">Mi cuenta</a></li>
                            <li><a href="#">Historial de ordenes</a></li>
                            <li><a href="#">Lista de deseos</a></li>
                            <li><a href="#">Boletín</a></li>
                            <li><a href="#">Reembolsos</a></li>
                        </ul>
                    </div>

                    <div class="newsletter">
                        <p class="title-footer">Boletín informativo</p>

                        <div class="content">
                            <p>
                                Suscríbete a nuestros boletines ahora y mantente al
                                día con nuevas colecciones y ofertas exclusivas.
                            </p>
                            <input type="email" placeholder="Ingresa el correo aquí...">
                            <button>Suscríbete</button>
                        </div>
                    </div>
                </div>

                <div class="copyright">
                    <p>

                    </p>

                    <img src="../img/payment.png" alt="Pagos">
                </div>
            </div>
        </footer>

    </body>
</html>

