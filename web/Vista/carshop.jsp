<%-- 
    Document   : carshop
    Created on : 26 ago 2024, 20:33:38
    Author     : Joaquin
--%>

<%@page import="java.util.List"%>
<%@page import="Modelo.dto.Carrito"%>
<%@page import="Modelo.dao.CarritoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Carrito de Compras - El y Ella Detalles</title>
        <link rel="stylesheet" href="../style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="icon" href="../img/el y ella logo.jpeg">
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f5f5f5;
            }

            .container {
                max-width: 1200px;
            }

            .cart-items {
                background-color: white;
                border-radius: 8px;
                padding: 15px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                margin-bottom: 15px;
            }

            .cart-item {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-bottom: 15px;
            }

            .cart-item img {
                max-width: 60px;
                margin-right: 15px;
            }

            .item-details h6 {
                margin-bottom: 5px;
                font-weight: bold;
            }

            .item-quantity input {
                max-width: 60px;
            }

            .details-card {
                background-color: #e055a2;
                border-radius: 8px;
                color: white;
            }

            .details-card .profile-img {
                width: 100px;
                height: 100px;
                object-fit: cover;
            }

            .totals p {
                margin: 0;
            }

            button {
                background-color: #e055a2;
                border: none;
                padding: 10px 20px;
                border-radius: 50px;
                color: white;
                font-weight: bold;
                cursor: pointer;
            }
            button.btn.btn-primary.mt-3 {
                background-color: black; /* Cambia el color de fondo a negro */
                border: none; /* Elimina el borde */
                color: white; /* Asegúrate de que el texto siga siendo blanco */
            }

        </style>
    </head>

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
    </div>
</header>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-8">
                <h5><a href="AfterLogin.jsp">← Continuar comprando</a></h5>
                <h6 class="mb-3">Carrito de compras</h6>

                <%
                    Integer userId = (Integer) session.getAttribute("user_id");
                    double subtotal = 0;
                    double envio = 20.00;
                    double total = 0;

                    if (userId != null) {
                        CarritoDAO carritoDAO = new CarritoDAO();
                        List<Carrito> carritos = carritoDAO.getCarritosByUserId(userId);

                        if (carritos != null && !carritos.isEmpty()) {
                            for (Carrito carrito : carritos) {
                                subtotal += carrito.getPrecio() * carrito.getCantidad();
                            }
                            total = subtotal + envio; // Calculo total
                            session.setAttribute("montoTotal", total); // Almacena el total en la sesión
%>

                <p>Tienes <%= carritos.size()%> productos en tu carrito</p>
                <div class="cart-items">
                    <%
                        for (Carrito carrito : carritos) {
                    %>
                    <div class="cart-item d-flex align-items-center mb-3">
                        <div class="item-image">
                            <img src="../img/<%= carrito.getFlorId()%>.jpg" alt="Flor" class="img-fluid" style="width: 100px;">
                        </div>
                        <div class="item-details ms-3">
                            <h6 class="mb-1">Flor ID: <%= carrito.getFlorId()%></h6> <!-- Se muestra el ID de la flor en lugar del nombre -->
                            <p class="text-muted"><%= carrito.getCantidad()%> unidades</p>
                        </div>
                        <div class="item-quantity ms-3">
                            <form action="ActualizarCarrito" method="post">
                                <input type="hidden" name="idCarrito" value="<%= carrito.getIdCarrito()%>">
                                <input type="number" name="cantidad" value="<%= carrito.getCantidad()%>" class="form-control" style="width: 70px;">
                                <button type="submit" class="btn btn-sm btn-primary mt-1">Actualizar</button>
                            </form>
                        </div>
                        <div class="item-price ms-auto">
                            <p class="mb-0">S/<%= String.format("%.2f", carrito.getPrecio() * carrito.getCantidad())%></p>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <p>No tienes productos en tu carrito.</p>
                    <%
                        }
                    %>
                </div>

                <%
                    } else {
                        response.sendRedirect("login.jsp");
                    }
                %>
            </div>
            <div class="col-md-4">
                <div class="card details-card">
                    <div class="card-body text-center">
                        <img src="../img/el y ella logo sin fondo.png" alt="Perfil" class="rounded-circle profile-img">
                        <h5 class="mt-2"><%= session.getAttribute("nombre")%></h5>
                        <hr>
                        <div class="totals">
                            <div class="d-flex justify-content-between">
                                <p>Subtotal</p>
                                <p>S/<%= String.format("%.2f", subtotal)%></p>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p>Envío</p>
                                <p>S/<%= String.format("%.2f", envio)%></p>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p>Total</p>
                                <p>S/<%= String.format("%.2f", total)%></p>
                            </div>
                        </div>
                        <button class="btn btn-primary mt-3" onclick="confirmarCompra()">Realizar compra</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function confirmarCompra() {
            if (confirm('¿Estás seguro de que deseas realizar la compra?')) {
                window.location.href = 'payshop.jsp';
            }
        }
    </script>
</body>





<br>
<br>

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
</html>
