<%-- 
    Document   : Administrar.jsp
    Created on : 17 sept 2024, 18:25:02
    Author     : Joaquin
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Servicio.DBConexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Administración de Tablas</title>
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                display: flex;
                margin: 0;
                background-color: #fdfdfd;
            }
            /* Menú lateral */
            .sidebar {
                width: 250px;
                background-color: #ff69b4;
                color: white;
                height: 100vh;
                position: fixed;
                padding: 20px;
                box-shadow: 2px 0px 10px rgba(0, 0, 0, 0.1);
            }
            .sidebar h2 {
                color: white;
                margin-bottom: 20px;
            }
            .sidebar ul {
                list-style: none;
                padding: 0;
            }
            .sidebar ul li {
                margin-bottom: 15px;
            }
            .sidebar ul li a {
                color: white;
                text-decoration: none;
                font-size: 18px;
                display: block;
                cursor: pointer;
            }
            .sidebar ul li a:hover {
                background-color: #ff85c0;
                padding: 10px;
                border-radius: 5px;
            }
            /* Contenido principal */
            .content {
                margin-left: 250px;
                padding: 40px;
                width: calc(100% - 250px);
            }
            .content h1 {
                color: #ff69b4;
            }
            .table-container {
                display: none; /* Ocultar todas las tablas por defecto */
                margin-top: 20px;
                background-color: #fff;
                border-radius: 10px;
                padding: 20px;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            }
            .table-container.active {
                display: block; /* Mostrar solo la tabla activa */
            }
            .table-container table {
                width: 100%;
                border-collapse: collapse;
            }
            .table-container table, th, td {
                border: 1px solid #ff69b4;
            }
            th, td {
                padding: 15px;
                text-align: left;
            }
            th {
                background-color: #ff69b4;
                color: white;
            }
            td {
                background-color: #fff;
            }
            /* Estilo de botones */
            .btn {
                background-color: #ff85c0;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-right: 10px;
            }
            .btn:hover {
                background-color: #ff69b4;
            }
            /* Estilo de barra de búsqueda */
            .search-bar {
                display: flex;
                margin-bottom: 20px;
            }
            .search-bar input {
                width: 100%;
                padding: 10px;
                border: 2px solid #ff69b4;
                border-radius: 5px;
                margin-right: 10px;
            }
            .search-bar button {
                background-color: #ff69b4;
                border: none;
                color: white;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
            }
            .search-bar button:hover {
                background-color: #ff85c0;
            }
            /* Contenedor del logo animado */
            .logo-container {
                text-align: center;
                margin-top: 100px;
            }
            .logo-container img {
                max-width: 5000px; /* Logo más grande */
                animation: girarLogoY 3s linear infinite; /* Animación de rotación sobre el eje Y */
            }

            /* Animación de rotación sobre el eje Y */
            @keyframes girarLogoY {
                0% {
                    transform: rotateY(0deg);
                }
                100% {
                    transform: rotateY(360deg); /* Gira en su propio eje (Y) */
                }
            }
            .instrucciones {
                text-align: center;
                margin-top: 20px;
                font-size: 20px;
                color: #ff69b4;
                font-weight: bold;
            }


        </style>
        <script>
            function showTable(tablaId) {
                // Ocultar todas las tablas
                const tablas = document.querySelectorAll('.table-container');
                tablas.forEach(function (tabla) {
                    tabla.style.display = 'none';
                });
                // Ocultar el logo girando
                document.getElementById('logo-girando').style.display = 'none';

                // Ocultar las instrucciones
                document.querySelector('.instrucciones').style.display = 'none';

                // Mostrar la tabla seleccionada
                const tablaSeleccionada = document.getElementById(tablaId);
                if (tablaSeleccionada) {
                    tablaSeleccionada.style.display = 'block';
                }
            }
        </script>
    </head>
    <body>

        <div class="sidebar">
            <h2>Tablas</h2>
            <ul>
                <li><a onclick="showTable('usuarios-registrados')">Usuarios Registrados</a></li>
                <li><a onclick="showTable('flores-disponibles')">Flores Disponibles</a></li>
                <li><a onclick="showTable('carrito-compras')">Carrito de Compras</a></li>
                <li><a onclick="showTable('historial-pedidos')">Historial de Pedidos</a></li>
                <li><a onclick="showTable('detalles-pedidos')">Detalles de Pedidos</a></li>
                <li><a onclick="showTable('categorias')">Categorías</a></li>
                <li><a onclick="showTable('flores-categorias')">Relación entre flores y categorías</a></li>
                <li><a onclick="showTable('comentarios-usuarios')">Comentarios de usuarios</a></li>
                <li><a onclick="showTable('pagos-realizados')">Pagos realizados</a></li>
            </ul>
        </div>

        <div class="content">
            <center><h1>Administrar Tablas</h1></center>



            <!-- Barra de búsqueda -->
            <div class="search-bar">
                <input type="text" placeholder="Buscar...">
                <button>Buscar</button>
            </div>

            <!-- Logo girando al inicio -->
            <div class="logo-container" id="logo-girando">
                <img src="../img/el y ella logo sin fondo.png" alt="Logo de la Empresa">
            </div>

            <div class="instrucciones">
                <h1><p>Selecciona qué tabla quieres administrar</p></h1>
            </div>


            <!-- Listar la tabla 'register' (Usuarios registrados) -->
            <div id="usuarios-registrados" class="table-container">
                <h2>Usuarios Registrados</h2>
                <table border="1">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Email</th>
                        <th>Dirección</th>
                        <th>Teléfono</th>
                        <th>Contraseña</th> <!-- Nueva columna para la contraseña -->
                        <th>Acciones</th>
                    </tr>
                    <%
                        Connection cnx = new DBConexion().getConnection();
                        Statement stmt = cnx.createStatement();
                        // Consulta SQL modificada para incluir la columna 'password'
                        String sqlRegister = "SELECT user_id, nombre, email, direccion, telefono, contrasena FROM register";
                        ResultSet rsRegister = stmt.executeQuery(sqlRegister);

                        while (rsRegister.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rsRegister.getInt("user_id") + "</td>");
                            out.println("<td>" + rsRegister.getString("nombre") + "</td>");
                            out.println("<td>" + rsRegister.getString("email") + "</td>");
                            out.println("<td>" + rsRegister.getString("direccion") + "</td>");
                            out.println("<td>" + rsRegister.getString("telefono") + "</td>");
                            out.println("<td>" + rsRegister.getString("contrasena") + "</td>");
                            out.println("<td>"
                                    + "<a href='" + request.getContextPath() + "/MainControler?action=editarUsuario&id=" + rsRegister.getInt("user_id") + "' class='btn'>Editar</a>"
                                    + "<a href='" + request.getContextPath() + "/MainControler?action=eliminarUsuario&id=" + rsRegister.getInt("user_id") + "' class='btn'>Eliminar</a>"
                                    + "</td>");
                            out.println("</tr>");
                        }

                        rsRegister.close();
                    %>
                </table>
            </div>



            <!-- Listar la tabla 'flores' (Productos disponibles) -->
            <div id="flores-disponibles" class="table-container">
                <h2>Flores Disponibles</h2>
                <a href='<%= request.getContextPath()%>/MainControler?action=mostrarFormularioAgregarFlor' class='btn'>Agregar Flor</a>
                <br>
                <br>
                <table border="1">
                    <tr>
                        <th>ID Flor</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Imagen URL</th> <!-- Nueva columna para la imagen -->
                        <th>Acciones</th>
                    </tr>
                    <%
                        String sqlFlores = "SELECT flor_id, nombre, descripcion, precio, stock, imagen_url FROM flores"; // Incluye imagen_url
                        ResultSet rsFlores = stmt.executeQuery(sqlFlores);

                        while (rsFlores.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rsFlores.getInt("flor_id") + "</td>");
                            out.println("<td>" + rsFlores.getString("nombre") + "</td>");
                            out.println("<td>" + rsFlores.getString("descripcion") + "</td>");
                            out.println("<td>" + rsFlores.getDouble("precio") + "</td>");
                            out.println("<td>" + rsFlores.getInt("stock") + "</td>");
                            out.println("<td>" + rsFlores.getString("imagen_url") + "</td>"); // Mostrar la URL de la imagen
                            out.println("<td>"
                                    + "<a href='" + request.getContextPath() + "/MainControler?action=editarFlor&id=" + rsFlores.getInt("flor_id") + "' class='btn'>Editar</a>"
                                    + "<a href='" + request.getContextPath() + "/MainControler?action=eliminarFlor&id=" + rsFlores.getInt("flor_id") + "' class='btn'>Eliminar</a>"
                                    + "</td>");

                            out.println("</tr>");
                        }

                        rsFlores.close();
                    %>
                </table>
            </div>

            <!-- Listar la tabla 'carrito' (Productos en el carrito) -->
            <div id="carrito-compras" class="table-container">
                <h2>Carrito de Compras</h2>
                <table border="1">
                    <tr>
                        <th>ID Carrito</th>
                        <th>ID Usuario</th>
                        <th>ID Flor</th>
                        <th>Cantidad</th>
                        <th>Precio</th> <!-- Nueva columna para el precio -->
                        <th>Fecha Agregado</th>
                        <th>Acciones</th>
                    </tr>
                    <%
                        // Actualizar la consulta SQL para incluir el precio de la tabla 'flores'
                        String sqlCarrito = "SELECT ca.carrito_id, ca.user_id, ca.flor_id, ca.cantidad, f.precio, ca.fecha_agregado "
                                + "FROM carrito ca "
                                + "INNER JOIN flores f ON ca.flor_id = f.flor_id";

                        ResultSet rsCarrito = stmt.executeQuery(sqlCarrito);

                        while (rsCarrito.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rsCarrito.getInt("carrito_id") + "</td>");
                            out.println("<td>" + rsCarrito.getInt("user_id") + "</td>");
                            out.println("<td>" + rsCarrito.getInt("flor_id") + "</td>");
                            out.println("<td>" + rsCarrito.getInt("cantidad") + "</td>");
                            out.println("<td>" + rsCarrito.getDouble("precio") + "</td>"); // Mostrar el precio
                            out.println("<td>" + rsCarrito.getTimestamp("fecha_agregado") + "</td>");
                            out.println("<td><a href='editarCarrito.jsp?id=" + rsCarrito.getInt("carrito_id") + "' class='btn'>Editar</a>"
                                    + "<a href='eliminarCarrito.jsp?id=" + rsCarrito.getInt("carrito_id") + "' class='btn'>Eliminar</a></td>");
                            out.println("</tr>");
                        }

                        rsCarrito.close();
                    %>
                </table>
            </div>


            <!-- Listar la tabla 'pedidos' (Historial de pedidos) -->
            <div id="historial-pedidos" class="table-container">
                <h2>Historial de Pedidos</h2>
                <table border="1">
                    <tr>
                        <th>ID Pedido</th>
                        <th>ID Usuario</th>
                        <th>Total</th>
                        <th>Fecha Pedido</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                    <%
                        String sqlPedidos = "SELECT pedido_id, user_id, total, fecha_pedido, estado FROM pedidos";
                        ResultSet rsPedidos = stmt.executeQuery(sqlPedidos);

                        while (rsPedidos.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rsPedidos.getInt("pedido_id") + "</td>");
                            out.println("<td>" + rsPedidos.getInt("user_id") + "</td>");
                            out.println("<td>" + rsPedidos.getDouble("total") + "</td>");
                            out.println("<td>" + rsPedidos.getTimestamp("fecha_pedido") + "</td>");
                            out.println("<td>" + rsPedidos.getString("estado") + "</td>");
                            out.println("<td>"
                                    + "<a href='" + request.getContextPath() + "/MainControler?action=editarPedido&id=" + rsPedidos.getInt("pedido_id") + "' class='btn'>Editar</a> "
                                    + "<a href='" + request.getContextPath() + "/MainControler?action=eliminarPedido&id=" + rsPedidos.getInt("pedido_id") + "' class='btn'>Eliminar</a>"
                                    + "</td>");
                            out.println("</tr>");
                        }

                        rsPedidos.close();
                    %>
                </table>
            </div>

            <!-- Listar la tabla 'detalle_pedido' (Detalle de cada pedido) -->
            <div id="detalles-pedidos" class="table-container">
                <h2>Detalles de Pedidos</h2>
                <table border="1">
                    <tr>
                        <th>ID Detalle</th>
                        <th>ID Pedido</th>
                        <th>ID Flor</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                        <th>Acciones</th>
                    </tr>
                    <%
                        String sqlDetallePedido = "SELECT detalle_id, pedido_id, flor_id, cantidad, precio FROM detalle_pedido";
                        ResultSet rsDetallePedido = stmt.executeQuery(sqlDetallePedido);

                        while (rsDetallePedido.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rsDetallePedido.getInt("detalle_id") + "</td>");
                            out.println("<td>" + rsDetallePedido.getInt("pedido_id") + "</td>");
                            out.println("<td>" + rsDetallePedido.getInt("flor_id") + "</td>");
                            out.println("<td>" + rsDetallePedido.getInt("cantidad") + "</td>");
                            out.println("<td>" + rsDetallePedido.getDouble("precio") + "</td>");
                            out.println("<td><a href='editarDetallePedido.jsp?id=" + rsDetallePedido.getInt("detalle_id") + "' class='btn'>Editar</a>"
                                    + "<a href='eliminarDetallePedido.jsp?id=" + rsDetallePedido.getInt("detalle_id") + "' class='btn'>Eliminar</a></td>");
                            out.println("</tr>");
                        }

                        rsDetallePedido.close();
                    %>
                </table>
            </div>

            <!-- Listar la tabla 'categorias' -->
            <div id="categorias" class="table-container">
                <h2>Categorías</h2>
                <a href='agregarCategoria.jsp' class='btn'>Agregar Categoría</a>
                <br>
                <br>
                <table border="1">
                    <tr>
                        <th>ID Categoría</th>
                        <th>Nombre</th>
                        <th>Acciones</th>
                    </tr>
                    <%
                        String sqlCategorias = "SELECT categoria_id, nombre FROM categorias";
                        ResultSet rsCategorias = stmt.executeQuery(sqlCategorias);

                        while (rsCategorias.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rsCategorias.getInt("categoria_id") + "</td>");
                            out.println("<td>" + rsCategorias.getString("nombre") + "</td>");
                            out.println("<td><a href='editarCategoria.jsp?id=" + rsCategorias.getInt("categoria_id") + "' class='btn'>Editar</a>"
                                    + "<a href='eliminarCategoria.jsp?id=" + rsCategorias.getInt("categoria_id") + "' class='btn'>Eliminar</a></td>");
                            out.println("</tr>");
                        }

                        rsCategorias.close();
                    %>
                </table>
            </div>

            <!-- Puedes seguir con las demás tablas como flores_categorias, comentarios, pago, etc. -->
            <!-- Listar la tabla 'flores_categorias' (Relación entre flores y categorías) -->
            <div id="flores-categorias" class="table-container">
                <h2>Relación entre Flores y Categorías</h2>
                <table border="1">
                    <tr>
                        <th>ID Flor</th>
                        <th>ID Categoría</th>
                        <th>Acciones</th>
                    </tr>
                    <%
                        // Consulta para obtener las relaciones entre flores y categorías
                        String sqlFloresCategorias = "SELECT flor_id, categoria_id FROM flores_categorias";
                        ResultSet rsFloresCategorias = stmt.executeQuery(sqlFloresCategorias);

                        while (rsFloresCategorias.next()) {
                            int florId = rsFloresCategorias.getInt("flor_id");
                            int categoriaId = rsFloresCategorias.getInt("categoria_id");

                            out.println("<tr>");
                            out.println("<td>" + florId + "</td>");
                            out.println("<td>" + categoriaId + "</td>");
                            out.println("<td><a href='editarRelacionFlorCategoria.jsp?florId=" + florId + "&categoriaId=" + categoriaId + "' class='btn'>Editar</a>"
                                    + "<a href='eliminarRelacionFlorCategoria.jsp?florId=" + florId + "&categoriaId=" + categoriaId + "' class='btn'>Eliminar</a></td>");
                            out.println("</tr>");
                        }

                        rsFloresCategorias.close();
                    %>
                </table>
            </div>


            <!-- Listar la tabla 'comentarios' (Comentarios de los usuarios) -->
            <div id="comentarios-usuarios" class="table-container">
                <h2>Comentarios de Usuarios</h2>
                <table border="1">
                    <tr>
                        <th>ID Comentario</th>
                        <th>ID Usuario</th>
                        <th>ID Flor</th>
                        <th>Comentario</th>
                        <th>Calificacion</th>
                        <th>Fecha</th>
                        <th>Acciones</th>
                    </tr>
                    <%
                        String sqlComentarios = "SELECT comentario_id, user_id, flor_id, comentario, calificacion, fecha_comentario FROM comentarios";
                        ResultSet rsComentarios = stmt.executeQuery(sqlComentarios);

                        while (rsComentarios.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rsComentarios.getInt("comentario_id") + "</td>");
                            out.println("<td>" + rsComentarios.getInt("user_id") + "</td>");
                            out.println("<td>" + rsComentarios.getInt("flor_id") + "</td>");
                            out.println("<td>" + rsComentarios.getString("comentario") + "</td>");
                            out.println("<td>" + rsComentarios.getInt("calificacion") + "</td>"); // Mostrar la calificación
                            out.println("<td>" + rsComentarios.getTimestamp("fecha_comentario") + "</td>");
                            out.println("<td>"
                                    + "<a href='" + request.getContextPath() + "/MainControler?action=editarComentario&id=" + rsComentarios.getInt("comentario_id") + "' class='btn'>Editar</a>"
                                    + "<a href='" + request.getContextPath() + "/MainControler?action=eliminarComentario&id=" + rsComentarios.getInt("comentario_id") + "' class='btn'>Eliminar</a>"
                                    + "</td>");
                            out.println("</tr>");
                        }

                        rsComentarios.close();
                    %>
                </table>
            </div>

            <!-- Listar la tabla 'pago' (Pagos realizados por los usuarios) -->
            <div id="pagos-realizados" class="table-container">
                <h2>Pagos Realizados</h2>
                <table border="1">
                    <tr>
                        <th>ID Pago</th>
                        <th>ID Usuario</th>
                        <th>Nombre Completo</th>
                        <th>Correo</th>
                        <th>Teléfono</th>
                        <th>Dirección de Envío</th>
                        <th>Ciudad</th>
                        <th>Estado</th>
                        <th>Código Postal</th>
                        <th>Número de Tarjeta</th>
                        <th>Fecha de Expiración</th>
                        <th>CVV</th>
                        <th>Monto</th>
                        <th>Fecha Pago</th>
                        <th>Acciones</th>
                    </tr>
                    <%
                        String sqlPago = "SELECT * FROM pago"; // Asegúrate de que esta consulta devuelva todos los campos necesarios
                        ResultSet rsPago = stmt.executeQuery(sqlPago);

                        while (rsPago.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rsPago.getInt("pago_id") + "</td>");
                            out.println("<td>" + rsPago.getInt("user_id") + "</td>");
                            out.println("<td>" + rsPago.getString("nombre_completo") + "</td>");
                            out.println("<td>" + rsPago.getString("correo") + "</td>");
                            out.println("<td>" + rsPago.getString("telefono") + "</td>");
                            out.println("<td>" + rsPago.getString("direccion_envio") + "</td>");
                            out.println("<td>" + rsPago.getString("ciudad") + "</td>");
                            out.println("<td>" + rsPago.getString("estado") + "</td>");
                            out.println("<td>" + rsPago.getString("codigo_postal") + "</td>");
                            out.println("<td>" + rsPago.getString("numero_tarjeta") + "</td>");
                            out.println("<td>" + rsPago.getString("fecha_expiracion") + "</td>");
                            out.println("<td>" + rsPago.getString("cvv") + "</td>");
                            out.println("<td>" + rsPago.getDouble("monto_total") + "</td>");
                            out.println("<td>" + rsPago.getTimestamp("fecha_pago") + "</td>");
                            out.println("<td>"
                                    + "<a href='" + request.getContextPath() + "/MainControler?action=editarPago&id=" + rsPago.getInt("pago_id") + "' class='btn'>Editar</a>"
                                    + "<a href='" + request.getContextPath() + "/MainControler?action=eliminarPago&id=" + rsPago.getInt("pago_id") + "' class='btn' onclick=\"return confirm('¿Estás seguro de que deseas eliminar este pago?');\">Eliminar</a>"
                                    + "</td>");
                            out.println("</tr>");
                        }

                        rsPago.close();
                        stmt.close();
                        cnx.close();
                    %>
                </table>
            </div>


    </body>
</html>


