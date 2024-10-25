

<%@page import="java.util.List"%>
<%@page import="Modelo.dto.Pedidos"%>
<%@page import="Modelo.dao.PedidosDAO"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Perfil de Usuario - El y Ella Detalles</title>
        <link rel="stylesheet" href="../style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="icon" href="../img/el y ella logo.jpeg">
        <style>
            body {
                background-color: #f5f5f5;
            }

            .profile-container {
                max-width: 900px;
                margin: 0 auto;
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            .profile-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .profile-header img {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                object-fit: cover;
            }

            .profile-header h2 {
                font-size: 24px;
                color: #e055a2;
            }

            .profile-info {
                margin-top: 20px;
            }

            .profile-info h5 {
                font-size: 18px;
                color: #e055a2;
                font-weight: bold;
            }

            .profile-info p {
                margin: 5px 0;
            }


            .profile-buttons {
                display: flex;
                gap: 15px;
                margin-top: 20px;
            }

            .profile-edit-btn, .logout-btn {
                padding: 10px 20px;
                border: none;
                border-radius: 50px;
                cursor: pointer;
                font-weight: bold;
            }

            .profile-edit-btn {
                background-color: #e055a2;
                color: white;
            }

            .logout-btn {
                background-color: black;
                color: white;
            }

            .orders-section {
                margin-top: 30px;
            }

            .orders-section h3 {
                color: #e055a2;
                margin-bottom: 15px;
            }

            .order-item {
                background-color: white;
                padding: 15px;
                margin-bottom: 15px;
                border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .order-item h6 {
                margin: 0;
                color: #333;
            }

            .order-item p {
                margin: 0;
                color: #666;
            }

            .order-item button {
                background-color: #e055a2;
                border: none;
                color: white;
                padding: 8px 15px;
                border-radius: 50px;
                font-weight: bold;
            }
        </style>
    </head>

    <body>

        <!-- Header -->
        <header class="container-hero">

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
                            <a href="login.jsp"><i class="fa-solid fa-user"></i></a>
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
        </div>
    </header>

    <!-- Contenido principal -->
    <div class="profile-container mt-5">
        <div class="profile-header">
            <div class="user-details">
                <h2>Perfil de <%= session.getAttribute("nombre")%></h2> <!-- Muestra el nombre del usuario -->
                <p>Email: <%= session.getAttribute("email")%></p> <!-- Muestra el email del usuario -->
            </div>
            <div class="profile-picture">
                <img src="../img/el y ella logo sin fondo.png" alt="Perfil">
            </div>
        </div>

        <div class="profile-info">
            <h5>Información Personal</h5>
            <p>Nombre: <%= session.getAttribute("nombre")%></p> <!-- Muestra el nombre del usuario -->
            <p>Teléfono: <%= session.getAttribute("telefono")%></p> <!-- Muestra el teléfono del usuario -->
            <p>Dirección: <%= session.getAttribute("direccion")%></p> <!-- Muestra la dirección del usuario -->
        </div>
    


    <div class="profile-buttons">
        <button class="profile-edit-btn" data-bs-toggle="modal" data-bs-target="#editProfileModal">Editar Perfil</button>
        <button class="logout-btn" onclick="window.location.href = 'login.jsp'">Cerrar Sesión</button>
    </div>

   <div class="orders-section">
    <h3>Mis Órdenes</h3>

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
    <div class="order-item">
        <div class="order-info">
            <h6>Pedido #<%= pedido.getPedidoId() %></h6>
            <p>Fecha: <%= pedido.getFechaPedido() %></p>
            <p>Total: S/<%= pedido.getTotal() %></p>
        </div>
        <button onclick="window.location.href='Pedidos.jsp?id=<%= pedido.getPedidoId() %>'">Ver Detalles</button>
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

<!-- Modal para editar perfil -->
<div class="modal fade" id="editProfileModal" tabindex="-1" aria-labelledby="editProfileModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editProfileModalLabel">Cambiar Foto de Perfil</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label for="profileImage" class="form-label">Selecciona una nueva foto</label>
                        <input class="form-control" type="file" id="profileImage">
                    </div>
                    <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                </form>
            </div>
        </div>
    </div>
</div>
<br>
<br>

<!-- Footer -->
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
