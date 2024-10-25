

<%-- 
    Document   : Pedidos
    Created on : 23 sept 2024, 13:51:07
    Author     : Joaquin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, Modelo.dao.PedidosDAO, Modelo.dto.Pedidos" %>
<%@page import="Modelo.dto.Pedidos"%>
<%@page import="Modelo.dao.PedidosDAO"%>
<!DOCTYPE html>
<html lang="es">
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mis Pedidos - El y Ella Detalles</title>
        <link rel="stylesheet" href="../style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="icon" href="../img/el y ella logo.jpeg">
        <style>
            body {
                background-color: #f5f5f5;
            }

            .container {
                max-width: 1200px;
            }

            .order-page {
                margin-top: 30px;
            }

            /* Estilo extendido para la sidebar */
            .sidebar {
                background-color: white;
                border-radius: 8px;
                padding: 20px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                height: 100%; /* Extiende la altura de la sidebar */
            }

            .sidebar ul {
                list-style-type: none;
                padding: 0;
            }

            .sidebar ul li {
                margin-bottom: 30px;
            }

            .sidebar ul li a {
                font-size: 12px;
                text-decoration: none;
                color: #333;
                font-weight: bold;
            }

            .sidebar ul li a:hover {
                color: #e055a2;
            }

            .order-list {
                background-color: white;
                border-radius: 8px;
                padding: 20px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            .order-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 15px;
            }

            .order-header h6 {
                font-weight: bold;
                color: #e055a2;
            }

            .order-item {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
            }

            .order-item img {
                max-width: 60px;
                margin-right: 15px;
            }

            .order-item-details h6 {
                margin: 0;
                font-weight: bold;
            }

            .order-item-details p {
                margin: 0;
                color: #666;
            }

            .order-total {
                font-weight: bold;
            }

            .order-actions button {
                background-color: #e055a2;
                border: none;
                padding: 5px 15px;
                border-radius: 50px;
                color: white;
                cursor: pointer;
            }

            .order-actions button:hover {
                background-color: #c04588;
            }

            /* Estilo para el botón Detalles del pedido */
            .order-header a {
                text-decoration: none;
                background-color: white;
                color: #e055a2;
                border: 2px solid #e055a2;
                padding: 8px 20px;
                border-radius: 8px;
                box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
                transition: 0.3s;
            }

            .order-header a:hover {
                box-shadow: none;
                background-color: #f0f0f0;
            }

            .filter-orders {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            .filter-orders select, .filter-orders input {
                border: 1px solid #ccc;
                padding: 5px;
                border-radius: 5px;
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
                        <a href="User.jsp"><i class="fa-solid fa-user"></i></a>
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
                        <li><a href="AfterLogin.jsp">Inicio</a></li>
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

        <div class="container order-page">
            <div class="row">
                <!-- Sidebar de navegación para Mi Cuenta -->
                <div class="col-md-3">
                    <div class="sidebar">
                        <ul>
                            <li><a href="#">General</a></li>
                            <li><a href="#">Pedidos</a></li>
                            <li><a href="#">Pago</a></li>
                            <li><a href="#">Reembolsos y devoluciones</a></li>
                            <li><a href="#">Valoraciones</a></li>
                            <li><a href="#">Ajustes</a></li>
                            <li><a href="#">Dirección de envío</a></li>
                        </ul>
                    </div>
                </div>

                <!-- Lista de pedidos -->
                <div class="col-md-9">
                    <%
                        // Obtener el user_id de la sesión
                        Integer userId = (Integer) session.getAttribute("user_id");

                        if (userId != null) {
                            // Llamar a PedidoDAO para obtener los pedidos del usuario
                            PedidosDAO pedidoDAO = new PedidosDAO();
                            List<Pedidos> listaPedidos = pedidoDAO.getPedidosByUserId(userId);

                            // Verificar si hay pedidos
                            if (listaPedidos != null && !listaPedidos.isEmpty()) {
                                for (Pedidos pedido : listaPedidos) {
                    %>

                    <!-- Generar HTML para cada pedido -->
                    <div class="order-list">
                        <div class="order-header">
                            <h6>Pedido realizado el: <%= pedido.getFechaPedido()%></h6>
                            <!-- Mostrar el pedido_id debajo de la fecha -->
                            <p class="pedido-id" style="display: none;">ID del Pedido: <%= pedido.getPedidoId()%></p>
                            <a href="${pageContext.request.contextPath}/ControlDetallePedido?pedidoId=<%= pedido.getPedidoId()%>">Detalles del pedido</a>
                        </div>
                        <div class="order-item">
                            <div class="d-flex">
                                <!-- Aquí podrías mostrar una imagen del producto o categoría -->
                                <img src="../img/el y ella logo sin fondo.png" alt="Producto">
                                <div class="order-item-details">
                                    <h6>Descripción del Pedido</h6>
                                </div>
                            </div>
                            <div class="order-total">
                                <p>Total: S/<%= pedido.getTotal()%></p>
                            </div>
                            <div class="order-actions">
                                <button>Borrar</button>
                            </div>
                        </div>
                    </div>

                    <%
                        }
                    } else {
                    %>
                    <p>No tienes pedidos.</p>
                    <%
                        }
                    } else {
                    %>
                    <p>Inicia sesión para ver tus pedidos.</p>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>

        <br><br>



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

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>


