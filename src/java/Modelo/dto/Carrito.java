/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.dto;

/**
 *
 * @author Joaquin
 */

public class Carrito {
    private int idCarrito;
    private int userId;
    private int florId;
    private int cantidad;
     private double precio;

    public Carrito() {}

    public Carrito(int idCarrito, int userId, int florId, int cantidad, double precio) {
        this.idCarrito = idCarrito;
        this.userId = userId;
        this.florId = florId;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    public int getIdCarrito() {
        return idCarrito;
    }

    public void setIdCarrito(int idCarrito) {
        this.idCarrito = idCarrito;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getFlorId() {
        return florId;
    }

    public void setFlorId(int florId) {
        this.florId = florId;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
}

