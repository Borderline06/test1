<%-- 
    Document   : detalle_Produc_Rosa
    Created on : 22 sept 2024, 12:50:06
    Author     : Joaquin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detalle del Producto - El y Ella Detalles</title>
        <link rel="stylesheet" href="../../style.css"> <!-- Tu archivo CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- FontAwesome -->
        <link rel="icon" href="../../img/el y ella logo.jpeg">
        <style>


            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }

            /* Estilos para el contenedor blanco */
            .content-wrapper {
                background-color: #fff;
                border: 2px solid #ff69b4; /* Borde rosa */
                border-radius: 15px; /* Bordes redondeados */
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Sombra para dar profundidad */
            }

            .product-page {
                display: flex;
                gap: 2rem;
            }

            .product-images {
                flex: 1;
                background-color: #fff; /* Fondo blanco */
                border: 2px solid #ff69b4; /* Borde rosa */
                border-radius: 15px; /* Bordes redondeados */
                padding: 20px; /* Espaciado interno */
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Sombra para darle profundidad */
                display: flex;
                flex-direction: column;
                align-items: center; /* Centrar contenido horizontalmente */
                gap: 1rem; /* Espacio entre la imagen principal y las miniaturas */
            }

            .main-image img {
                width: 60%; /* Reducido del 100% al 60% */
                border-radius: 10px;
                transition: 0.3s; /* Añadir una transición suave */
                align-items: center;
            }

            .other-variations {
                display: flex;
                gap: 1rem;
                margin-top: 10px;
            }

            .other-variations img {
                width: 80px;
                cursor: pointer;
                border: 1px solid #ddd;
                border-radius: 10px;
                transition: 0.3s; /* Transición suave para cuando se cambia de imagen */
            }

            .product-info {
                flex: 1;
            }

            .product-title {
                font-size: 2.2rem;
                color: var(--primary-color);
            }

            .product-code {
                color: #888;
                margin-top: 10px;
            }

            .product-price {
                font-size: 2rem;
                margin: 15px 0;
            }

            .current-price {
                color: var(--primary-color);
                font-weight: bold;
                margin-right: 10px;
            }

            .old-price {
                text-decoration: line-through;
                color: #888;
                margin-right: 10px;
            }

            .discount-badge {
                background-color: var(--primary-color);
                color: white;
                padding: 5px 10px;
                border-radius: 5px;
            }

            .product-rating .stars {
                color: gold;
            }

            .product-rating .reviews {
                color: #888;
                margin-left: 10px;
            }

            .product-description {
                margin: 20px 0;
                font-size: 1.2rem;
                color: #555;
            }

            .product-options {
                display: flex;
                align-items: center;
                gap: 1rem;
                margin-bottom: 20px;
            }

            .size-selector label {
                margin-right: 10px;
                font-size: 1.1rem;
            }

            .size-selector select {
                padding: 5px;
                border-radius: 5px;
                border: 1px solid #ddd;
            }

            .btn-add-to-cart {
                background-color: var(--primary-color);
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .btn-add-to-cart:hover {
                background-color: #000;
            }

            .product-tabs {
                margin-top: 30px;
            }

            .tabs {
                display: flex;
                gap: 1rem;
                border-bottom: 2px solid #ddd;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }

            .tab {
                cursor: pointer;
                padding: 10px 20px;
                border-radius: 5px 5px 0 0;
            }

            .tab.active {
                background-color: var(--primary-color);
                color: white;
            }

            .tab-content {
                background-color: #f9f9f9;
                padding: 20px;
                border-radius: 5px;
            }

            .tab-pane {
                display: none;
            }

            .tab-pane.active {
                display: block;
            }

            .recommended-products {
                text-align: center;
                margin: 40px 0;
            }

            .recommended-products h2 {
                font-size: 2rem;
                color: var(--primary-color);
                margin-bottom: 20px;
            }

            .carousel-container {
                position: relative;
                max-width: 100%;
                overflow: hidden;
                margin: 0 auto;
            }

            .carousel {
                display: flex;
                overflow: hidden;
            }

            .carousel-slide {
                display: flex;
                transition: transform 0.5s ease-in-out;
            }

            .carousel-slide img {
                max-width: 100%;
                border-radius: 10px;
                margin: 0 10px;
            }

            .carousel-button {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                background-color: var(--primary-color);
                color: white;
                border: none;
                padding: 10px;
                border-radius: 5px;
                cursor: pointer;
                z-index: 1;
            }

            .carousel-button.prev {
                left: 10px;
            }

            .carousel-button.next {
                right: 10px;
            }

            /* Estilo del contenedor de comentarios y reseñas */
            .container-reviews {
                margin: 40px 0;
                background-color: #fff;
                padding: 20px;
                border: 2px solid #ff69b4; /* Borde rosa */
                border-radius: 15px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Sombra */
                max-width: 800px;
                margin-left: auto;
                margin-right: auto;
            }

            .container-reviews h2 {
                font-size: 2rem;
                color: var(--primary-color);
                margin-bottom: 20px;
                text-align: center;
            }

            .review-form .form-group {
                margin-bottom: 15px;
            }

            .review-form label {
                font-size: 1.2rem;
                color: #555;
            }

            .review-form textarea {
                width: 100%;
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ddd;
                font-size: 1rem;
            }

            .star-rating {
                display: flex;
                justify-content: center;
                margin-bottom: 15px;
            }

            .star-rating input {
                display: none;
            }

            .star-rating label {
                font-size: 2rem;
                color: #ddd;
                cursor: pointer;
                transition: color 0.3s;
            }

            .star-rating input:checked ~ label,
            .star-rating label:hover,
            .star-rating label:hover ~ label {
                color: gold;
            }

            .btn-submit {
                background-color: var(--primary-color);
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                display: block;
                margin: 0 auto;
                font-size: 1.2rem;
            }

            .btn-submit:hover {
                background-color: #000;
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
                            <a href="../User.jsp"><i class="fa-solid fa-user"></i></a>
                            <a href="../carshop.jsp"><i class="fa-solid fa-basket-shopping"></i></a>
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
                            <li><a href="../Box Rosas.jsp">Rosas</a></li>
                            <li><a href="../Box Girasoles.jsp">Girasoles</a></li>
                            <li><a href="../Box Tulipanes.jsp">Tulipanes</a></li>
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

    <br>
    <br>

    <!-- Main Content -->
    <main class="main-content">
        <div class="container content-wrapper"> <!-- Contenedor blanco -->
            <div class="product-page">
                <!-- Product Image and Variations -->
                <div class="product-images">
                    <div class="main-image">
                        <center><img src="../../img/Box 3.jpg" alt="Producto Principal"></center>
                    </div>
                    <div class="other-variations">
                        <img src="../../img/Box 3.jpg" alt="Variación 1">
                        <img src="../../img/BoxRosa2.jpg" alt="Variación 2">
                        <img src="../../img/BoxRosa3.webp" alt="Variación 3">
                    </div>
                </div>

                <!-- Product Details -->
                <div class="product-info">
                    <h1 class="product-title">Caja de Rosas Gigante</h1>
                    <p class="product-code">Código del Producto: ROS123ABC45</p>
                    <div class="product-price">
                        <span class="current-price">S/120</span>
                    </div>
                    <div class="product-rating">
                        <span class="stars">★★★★★</span>
                        <span class="reviews">(25 reviews)</span>
                    </div>
                    <p class="product-description">
                        Caja Premium con 50 Rosas frescas de alta calidad <br>
                        Follaje natural y elegante <br>
                        Topper "Feliz Cumpleaños" o "Te Amo" <br>
                        Tarjeta personalizada con mensaje especial <br>
                        Box redondo de lujo, color blanco o negro <br>
                        Rosas disponibles en rojo, blanco y rosa
                    </p>

                    <!-- Size and Add to Cart -->
                    <div class="product-options">
                        <div class="size-selector">
                            <label for="size">Cantidad:</label>
                            <select id="size">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                            </select>
                        </div>
                        <button class="btn-add-to-cart">Añadir al carrito</button>
                    </div>

                    <div class="delivery-info">
                        <h2>Información de Entrega</h2>
                        <p>Realizamos entregas a nivel nacional con opciones de envío al día siguiente. Pedidos realizados antes de las 10:00 a.m. tienen entrega garantizada el mismo día.</p>

                        <h2>Políticas de Devoluciones</h2>
                        <p>Aceptamos devoluciones dentro de las primeras 48 horas después de la entrega. El producto debe mantenerse en su empaque original. Contacta a nuestro equipo para más información.</p>
                    </div>

                </div>
            </div>
        </div>
    </main>

    <br>

    <!-- Productos Recomendados -->
    <section class="recommended-products">
        <h2>Productos Recomendados</h2>
        <div class="carousel-container">
            <button class="carousel-button prev">&lt;</button>
            <div class="carousel">
                <div class="carousel-slide">
                    <img src="../../img/cafe-ingles.jpg" alt="Producto Recomendado 1">
                    <img src="../../img/cafe-ingles.jpg" alt="Producto Recomendado 2">
                    <img src="../../img/cafe-irish.jpg" alt="Producto Recomendado 3">
                    <img src="../../img/cafe-liqueurs.jpg" alt="Producto Recomendado 4">
                    <img src="../../img/cafe-liqueurs.jpg" alt="Producto Recomendado 5">
                    <img src="../../img/cafe-liqueurs.jpg" alt="Producto Recomendado 6">
                    <img src="../../img/cafe-viena.jpg" alt="Producto Recomendado 7">
                </div>
            </div>
            <button class="carousel-button next">&gt;</button>
        </div>
    </section>
    <br>
    <br>

    <!-- Sección de Comentarios y Reseñas -->
    <section class="container-reviews">
        <h2>Deja tu comentario y reseña</h2>
        <form action="${pageContext.request.contextPath}/ControlComent" method="POST" class="review-form">
            <div class="form-group">
                <label for="comentario">Comentario:</label>
                <textarea id="comentario" name="comentario" rows="4" placeholder="Escribe tu comentario..." required></textarea>
            </div>

            <div class="form-group">
                <label for="calificacion">Calificación:</label>
                <div class="star-rating">
                    <input type="hidden" name="flor_id" value="3">
                    <input type="radio" id="star5" name="calificacion" value="5"><label for="star5">★</label>
                    <input type="radio" id="star4" name="calificacion" value="4"><label for="star4">★</label>
                    <input type="radio" id="star3" name="calificacion" value="3"><label for="star3">★</label>
                    <input type="radio" id="star2" name="calificacion" value="2"><label for="star2">★</label>
                    <input type="radio" id="star1" name="calificacion" value="1"><label for="star1">★</label>
                </div>
            </div>

            <button type="submit" class="btn-submit">Enviar Comentario</button>
        </form>
    </section>

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
</body>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const mainImage = document.querySelector('.main-image img');
        const thumbnails = document.querySelectorAll('.other-variations img');

        thumbnails.forEach(thumbnail => {
            thumbnail.addEventListener('click', function () {
                mainImage.src = this.src;
            });
        });

        const prevButton = document.querySelector('.carousel-button.prev');
        const nextButton = document.querySelector('.carousel-button.next');
        const slides = document.querySelector('.carousel-slide');
        let index = 0;

        // Obtener el ancho del slide después de que las imágenes estén cargadas
        function updateSlideWidth() {
            const slideWidth = document.querySelector('.carousel-slide img').clientWidth;
            return slideWidth;
        }

        // Asegurarse de que el ancho del slide se calcula correctamente
        let slideWidth = updateSlideWidth();

        // Actualizar el ancho del slide al redimensionar la ventana
        window.addEventListener('resize', () => {
            slideWidth = updateSlideWidth();
            updateCarousel();
        });

        prevButton.addEventListener('click', () => {
            index = (index > 0) ? index - 1 : slides.children.length - 1;
            updateCarousel();
        });

        nextButton.addEventListener('click', () => {
            index = (index < slides.children.length - 1) ? index + 1 : 0;
            updateCarousel();
        });

        function updateCarousel() {
            console.log('Index:', index);
            console.log('Slide Width:', slideWidth);
            slides.style.transform = `translateX(-${index * slideWidth}px)`;
        }

        // Actualizar el carrusel en la carga inicial
        updateCarousel();
    });
</script>
</html>
