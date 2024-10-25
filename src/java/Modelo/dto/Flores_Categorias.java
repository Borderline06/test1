/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.dto;

/**
 *
 * @author Joaquin
 */


public class Flores_Categorias {
    private int florId;
    private int categoriaId;
    private String florNombre;
    private String categoriaNombre;

    public Flores_Categorias(int florId, int categoriaId, String florNombre, String categoriaNombre) {
        this.florId = florId;
        this.categoriaId = categoriaId;
        this.florNombre = florNombre;
        this.categoriaNombre = categoriaNombre;
    }

    public int getFlorId() {
        return florId;
    }

    public int getCategoriaId() {
        return categoriaId;
    }

    public String getFlorNombre() {
        return florNombre;
    }

    public String getCategoriaNombre() {
        return categoriaNombre;
    }
}

