/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.dao;

/**
 *
 * @author Joaquin
 */


import Servicio.DBConexion;
import Modelo.dto.Categorias;
import java.sql.*;

public class CategoriasDAO {
    private Connection cnx;

    public CategoriasDAO() {
        cnx = new DBConexion().getConnection();
    }

    public Categorias get(int id) {
        Categorias categoria = null;
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT * FROM categorias WHERE categoria_id = ?";
        try {
            ps = cnx.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                categoria = new Categorias(
                    rs.getInt("categoria_id"),
                    rs.getString("nombre")
                );
            }
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return categoria;
    }
}

