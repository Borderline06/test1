/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.dto;

import java.sql.Date;

public class Pedidos {
    private int pedidoId;
    private int userId;
    private double total;
    private String estado;
        private Date fechaPedido; // Añade este atributo

    

    public Pedidos() {}

     public Pedidos(int pedidoId, int userId, double total, String estado, Date fechaPedido) {
        this.pedidoId = pedidoId;
        this.userId = userId;
        this.total = total;
        this.estado = estado;
        this.fechaPedido = fechaPedido; // Asegúrate de inicializarlo
    }


    public int getPedidoId() {
        return pedidoId;
    }

    public void setPedidoId(int pedidoId) {
        this.pedidoId = pedidoId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
     public Date getFechaPedido() {
        return fechaPedido; // Añade este método
    }

    public void setFechaPedido(Date fechaPedido) {
        this.fechaPedido = fechaPedido; // Implementa este método correctamente
    }

   
}


