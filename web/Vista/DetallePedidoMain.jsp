<%-- 
    Document   : DetallePedidoMain
    Created on : 23 oct 2024, 14:17:59
    Author     : Joaquin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle del Pedido</title>
    </head>
    <body>
        <div class="container">
            <h1>Detalle del Pedido</h1>

            <c:if test="${not empty detalle}">
                <table>
                    <tr>
                        <th>ID Pedido</th>
                        <td>${detalle.pedidoId}</td>
                    </tr>
                    <tr>
                        <th>Cantidad</th>
                        <td>${detalle.cantidad}</td>
                    </tr>
                    <tr>
                        <th>Precio</th>
                        <td>${detalle.precio}</td>
                    </tr>
                    <tr>
                        <th>Fecha del Pedido</th>
                        <td>${detalle.pedido.fechaPedido}</td>
                    </tr>
                    <tr>
                        <th>Estado</th>
                        <td>${detalle.pedido.estado}</td>
                    </tr>
                    <tr>
                        <th>Teléfono</th>
                        <td>${detalle.pago.telefono}</td>
                    </tr>
                    <tr>
                        <th>Dirección de Envío</th>
                        <td>${detalle.pago.direccionEnvio}</td>
                    </tr>
                </table>
            </c:if>

            <c:if test="${empty detalle}">
                <p style="color: red;">No se encontró el detalle del pedido.</p>
            </c:if>

            <div style="text-align: center; margin-top: 20px;">
                <a href="AfterLogin.jsp">Volver al Inicio</a>
            </div>
        </div>
    </body>
</html>
