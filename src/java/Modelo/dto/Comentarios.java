/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.dto;

/**
 *
 * @author Joaquin
 */



public class Comentarios {
    private int comentarioId;
    private int florId;
    private int userId;
    private String comentario;
    private int calificacion;
     private String nombreFlor;
    private String nombreUsuario;

    public Comentarios() {}

    public Comentarios(int comentarioId, int florId, int userId, String comentario, int calificacion) {
        this.comentarioId = comentarioId;
        this.florId = florId;
        this.userId = userId;
        this.comentario = comentario;
        this.calificacion = calificacion;
    }

    public int getComentarioId() {
        return comentarioId;
    }

    public void setComentarioId(int comentarioId) {
        this.comentarioId = comentarioId;
    }

    public int getFlorId() {
        return florId;
    }

    public void setFlorId(int florId) {
        this.florId = florId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public int getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(int calificacion) {
        this.calificacion = calificacion;
    }

    public String getNombreFlor() {
        return nombreFlor;
    }

    public void setNombreFlor(String nombreFlor) {
        this.nombreFlor = nombreFlor;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }
    
}


